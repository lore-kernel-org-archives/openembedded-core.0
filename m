Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 328646FF0E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 20:55:09 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id x3so50116841pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 13:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=/44h/tfdyPbrFrHtxx+9e/GCd2kQAwkN8LoPNAdlquo=;
	b=n6K+eXL8OtpGcNRJ9MvyYBcSQXcKwvVSPwoNeJzzfiyXbBhZgucSXlYZ9Vgoexeq6W
	PkNRwudAXKNqYp7eghil0n274VZF9gXkc8SWhjByhg6S5OI5BXV3SwwED4cdxQcGuqWy
	QLgM2fmq3/CcPTAIiYk6KoD9Gh/D5fRRNvFOzBreSHSZqY+4YkpjJIA4B7+j2xLZz52B
	w5UQvVAhnFmN6qbixsrQgC76n1SemJeBQoLb2iQf9BAmG9a+Jxl7YW1qH/Q9jDeRRPeR
	KJX3B5UAz4I6bp8URJjWuIFBjfb75OGpXFzHG1z029ksmOcGKwIzw+fKMAnyezAmKPqz
	X4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=/44h/tfdyPbrFrHtxx+9e/GCd2kQAwkN8LoPNAdlquo=;
	b=CYbjHKVSQRqJpigaGWH8hZlxoVitKYkYOWBXIK9L6n1GrW7Q4a0cQlGoFA+wx5CYcG
	C2Z6VkWT+NAAlypWiSsz5daVBPX8mE5aTEnIztMonJ1TIp6RilaJY0PHKm8M0/XfoLz9
	6VweOuZk24liav72ZxtnW0y06EGsqY6BkXjX62apAK2lGJ0Gn7UaaimHnYeY2pexM216
	0SsYUjI1HSHDh0i2u+0pIkJYCFbQZh2BrVxREE6xvmMu80wNZu9LE8loBZ/kom3yUS6X
	KTCXgS1Uy0dDKIfeENNe9gk6d5Vw2gZ1JhRcQQG9yAinr4PZoWA8d4n7pg48bBqpHCSA
	YwCQ==
X-Gm-Message-State: AD7BkJJV2khXvQ1FCytP8ovzHX3YLqKbHVNMdN1f++FiGDhhlf8FtAY0rNnk17bf1HBKWg==
X-Received: by 10.98.15.145 with SMTP id 17mr32766042pfp.19.1457988910520;
	Mon, 14 Mar 2016 13:55:10 -0700 (PDT)
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com.
	[209.85.220.41]) by smtp.gmail.com with ESMTPSA id
	v7sm34179758pfa.80.2016.03.14.13.55.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Mar 2016 13:55:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f41.google.com with SMTP id td3so137546963pab.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 13:55:08 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.235.9 with SMTP id ui9mr40979539pac.135.1457988908642;
	Mon, 14 Mar 2016 13:55:08 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Mon, 14 Mar 2016 13:55:08 -0700 (PDT)
In-Reply-To: <CAJTo0Lbx5YajNU5fcRkn1sk43LW1tCLm7p1WxCM=fQqTYo=zWA@mail.gmail.com>
References: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
	<CAJTo0LaVVaY9gmtzp7tq=77GBj+rCzGBC+2K1CnOoXEk8XCwBw@mail.gmail.com>
	<CAP9ODKq2CDKAxXijkEQH75vV6QKakt2HCSXHOU-HhZ0tCCnzwg@mail.gmail.com>
	<CAJTo0LYfwrc+wteB+ez6gqZbXgM8dJO6PKrB+vf0S6+ANC7ggQ@mail.gmail.com>
	<CAP9ODKopJb0SusuYNubJz9oEMjJUDLyRBjNWDjeFD+tw0iYS3g@mail.gmail.com>
	<CAJTo0Lbx5YajNU5fcRkn1sk43LW1tCLm7p1WxCM=fQqTYo=zWA@mail.gmail.com>
Date: Mon, 14 Mar 2016 17:55:08 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp=+6F6dMDryHOtNcMsmBL3VqHpNwioxpi3AtoxQ3ji9A@mail.gmail.com>
Message-ID: <CAP9ODKp=+6F6dMDryHOtNcMsmBL3VqHpNwioxpi3AtoxQ3ji9A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
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
X-List-Received-Date: Mon, 14 Mar 2016 20:55:11 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 14, 2016 at 5:46 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 14 March 2016 at 20:43, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> Well, with this it is harder to know if what works on native will work
>> on nativesdk. I don't like this behavior.
>
> Again, native and nativesdk *are* different.  Just because a native recipe
> builds doesn't mean a nativesdk one will, and their intended uses are
> entirely different.

I know it however up to now we could know that native and nativesdk
might respect DISTRO_FEATURES and be in sync. Now this is not truth
anymore.

I can live with that but this is not optimal in my point of view.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

