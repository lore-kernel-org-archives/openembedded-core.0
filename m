Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id EA21F60119
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 08:21:18 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id z126so65518702wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2016 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fyn8tj4H34uYNtUgHv70oG59+L078WJLkN71705EYzk=;
	b=WJZmWfRgyaCfHf0lPqdh0yHCfhnDgtF+IzKgidEF9j3c9zLuPtTrdLkCcYY5Ywrh56
	+JBaaQApTk93G/7gFVeywdHEL73CaeOoNc22CXA8V6Js/O7oNJYxFzxjV/kc823mLcXc
	wF8vQTzJ1EraZL2WB67U9/xD65L9q7jgvnUDLgSJp+DeRTuiLrqO4/8x7apoX+60UCA5
	WoCb4q53GCf7oGavG87JoHzYM4bTibaU20fyk5BETtdhBQctgK1NYZH9GhTS5xRBk2qp
	ImP3WVZAPPo3QOveL4nyOmVJxkoPnP8s55NYcsf09/+JMormXIarBNyfAGIepk3b561M
	3kFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fyn8tj4H34uYNtUgHv70oG59+L078WJLkN71705EYzk=;
	b=ZiBx1NAZtPBQ36nY4v9TBzoAPOtRn0xUPIDW98rWzdrGFzsMBFtcRj+QYLFAHPf8im
	GLW/+RtEmJhumWFp6GJorP2dj/ZM+LC6bA6jDfA8BClgvoQqtChfZ/qQR0JqDwqqPY5K
	iFEHSF6ON71xQ9GU4JkSvnkz3B5spWt4yJVwSGooEl2vNlBb/jXGCfoP+FwCNNKFIIEK
	5YvNWzNO038bO00mHIVZ5SXe4flb8jX2vljY97TrSE2gxUUDi48hXLZ7yIpynNeVMnYJ
	PcfGuzvQZyZxeKeSMO2GF+0w89sn/JYuqvL6uhLFN1skQJ9lozpbfNlGTP06BeBGY/Ww
	hvfg==
X-Gm-Message-State: ALyK8tK7zYFtoUSQMuGKNr5+EKpVmOOV4NJ61iuZw5zYE54qv9qUZNeGXxszZpUTgQ6JxGlVQZus8F+YLyVoiQ==
X-Received: by 10.194.90.81 with SMTP id bu17mr9439752wjb.43.1467706878156;
	Tue, 05 Jul 2016 01:21:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.47.69 with HTTP; Tue, 5 Jul 2016 01:21:17 -0700 (PDT)
In-Reply-To: <CAJTo0LZjsiwdv6QB1SdDmyxtTvByjyiend_uSnXFQ_tRi8HwcA@mail.gmail.com>
References: <CAJ86T=XCwABdHj0rXHFsfK9pLndsKGQYv8R2=jOh4tz_9HmeAQ@mail.gmail.com>
	<CAJTo0LZjsiwdv6QB1SdDmyxtTvByjyiend_uSnXFQ_tRi8HwcA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 5 Jul 2016 01:21:17 -0700
Message-ID: <CAJ86T=UTXq=aPkTRV1U+aN71KO3hCyz+fsT45=Mbm8ALZvPmiA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Automatically creating tar files for bin_package.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jul 2016 08:21:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 4, 2016 at 8:58 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 4 July 2016 at 16:00, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Say I have a proprietary library which only I can build from source
>> and I have a conventional recipe which builds it within OE. I would
>> now like to create a tar file of the library and headers etc, plus a
>> companion recipe based on bin_package.bbclass to allow others to make
>> use of the library in their OE builds. ie the situation described
>> here:
>>
>> http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.html#packaging-externally-produced-binaries
>>
>> Is there a recommended way to create the tar file to support that?
>> e.g. a class which automatically creates a deployable tar file of a
>> recipe's ${D} directory?
>
> You *may* be able to use package_tar in the recipe in some way to achieve
> this.

It only seems to support creating tar files after packages have been
split ( ie individual tar files for each subdirectory under
${WORKDIR}/packages-split ). I don't think it's going to be directly
useful for creating a tar file of ${D}.

> Ross

