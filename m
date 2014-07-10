Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id E83BC65D5F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 09:00:11 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id j107so7290072qga.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 02:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ptYqQAQJH20ys1EIKjP8ucVc1eYRyN+Vz32dwTZzB4Q=;
	b=BryP2g0cw8Rpj7ox/EkoD6C7qul2HemikBkIstDM8N6ky1XIuQbg4KHn2U/Ldrya4D
	VWYJuf4rB68IoN7qPFTbp1Fl3Xa8ks6S8oxreJ4U7RqwAe40SZW0l1XV87b499qgRZU6
	JRIWcGqMIbDwCbGPTeXI99pQ0pn+Xr3a73JTHpMElInTH3Px+u28Ue9WrISp4f/1WKLO
	6LuJZ0tBiD3W1bm+l/CY28jYJuScedazGjpsy4ttfLKMvoZCivAguZfLhJ/YhffRyY0X
	269O+qjrkCvRs3DWuafuVEQioyk4Mkmlinhn9dSe/xwTyW9CS/qSizFTQCaM2PU+UF3n
	Fnbg==
X-Gm-Message-State: ALoCoQnkcFMtj9x050Mu22/WJtlZ7bIUHwWpVVBStcmTHdTfL5xlKWFbqRKQndWlpBDm2j4ofTv1
X-Received: by 10.140.89.197 with SMTP id v63mr73871947qgd.71.1404982812364;
	Thu, 10 Jul 2014 02:00:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Thu, 10 Jul 2014 01:59:52 -0700 (PDT)
In-Reply-To: <1404939006.15985.62.camel@ted>
References: <cover.1404930808.git.roxana.ciobanu@intel.com>
	<478fc5d6fb31718ce9531eca7b6f626a1412c0c3.1404930808.git.roxana.ciobanu@intel.com>
	<1404939006.15985.62.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Jul 2014 09:59:52 +0100
Message-ID: <CAJTo0LY2h_kEr43hoYSE039e5pvEU49FTH_Un8DJQHDKu0T5Vg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] latencytop: fix mount error
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
X-List-Received-Date: Thu, 10 Jul 2014 09:00:15 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2014 21:50, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2014-07-09 at 21:52 +0300, Roxana Ciobanu wrote:
>> Added a check to ensure debugfs is not mounted before trying
>> to mount it, because sysfs.sh already mounts it.

Using stat() you should be able to identify if /debug is a mount
point, which will avoid the shell tests.

Ross

