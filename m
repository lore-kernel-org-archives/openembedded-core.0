Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9A5F260125
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 10:39:26 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b201so28967280wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2016 03:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=laoL7tufYpyYweoSwNE2YJYoNptZEkI3rLaqW4Sc+5Q=;
	b=QOaE6+N1bomqEie1qUlPDJ30GVYLSaOkQVNFH+deRkFp+8EMjcmrPbBVvSLFiZfS2a
	Kt75kJ2jo1nHOzfJ3jTcRmJNWF1+gcy5tcb7msN6AkoZS/6sHWwPijVWqsGMCd7w905s
	1ryEgSURdaXEZ2ck8u0UtEqLKDr0MAlcA9RpEBrd4yLhvdn5Q4lN+vU/YtykLZNlEAQw
	eybRBga6qRb2fTEMFheDgDLvyzB6MCEEnaKuxA7y6cSzsG/LVXhGGnfVR2CTaVj/0vPb
	XGx+C3inZB5F3bPrAqVLkTzyc7aE5eY6eIufQCqC16pZ+aVnxDUEmDDRo2d2F7PSD2FI
	yGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=laoL7tufYpyYweoSwNE2YJYoNptZEkI3rLaqW4Sc+5Q=;
	b=D4jRkMV1yMjDdjxOVStN6Kt2lRgCLe5iRySZpWZYAV3049mpyZlhNrT/F5MTaMVlVH
	bbtc3FzD5GpDWBkjrn037nHUYg1+qjTaaH+K/og+vf94xU/fUyjmG4TkE2pMPUjRWEqD
	zbQCXjVdQFx07gffn4zXUHh9JsqbSwKtnnV22NQcIPbXMbW3dhqSD4rMbKLN3x43ZU5t
	Krd5dfzj13uog8lIrnzgrovRn5LpEKie7WvsCBDjHoMmgenwDebYoLygCd37l9f0vUzy
	zejCDIgt3no6XXHkPumQSHeZCWQTVsHqvZ3h4AqH7V2qWXLtc4pXeDdnF6sCmroCiCWz
	F8rQ==
X-Gm-Message-State: AA6/9RlQ2U7aEju47HSc8YPJyNI/4AAns407mmp3dJuGBQjIJ78YiBQp77AO9boZPG9Fwfbwr39E6VZhPj2OgQ==
X-Received: by 10.28.168.214 with SMTP id r205mr27989249wme.93.1475836767512; 
	Fri, 07 Oct 2016 03:39:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.164.89 with HTTP; Fri, 7 Oct 2016 03:39:07 -0700 (PDT)
In-Reply-To: <33e1a0be-3fb1-acd6-04c8-bf31eeb69b08@jp.fujitsu.com>
References: <41bbea13-30ce-4d55-441c-ffdbb0f863f1@jp.fujitsu.com>
	<1475757767.3146.12.camel@linux.intel.com>
	<354af725-27e7-ba35-2a45-514151904c32@jp.fujitsu.com>
	<CAD4b0_K4r+kUfUVAtcTSf--aJbUnbYttmRfvQdMGCiAikyo10w@mail.gmail.com>
	<33e1a0be-3fb1-acd6-04c8-bf31eeb69b08@jp.fujitsu.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Fri, 7 Oct 2016 12:39:07 +0200
Message-ID: <CAD4b0_+as+h2gm4PTPrThqjDR3qzN7SW51Uni11iBZtPwKphNw@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: rpm: Recover RPM4 to OE-core
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
X-List-Received-Date: Fri, 07 Oct 2016 10:39:29 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 7, 2016 at 11:52 AM, Fan Xin <fan.xin@jp.fujitsu.com> wrote:
> Hi Maciej,
>
>> BTW. do you recall the rationale behind abandoning zypper in 1.4? I'm
>> curious about the motivation for using smart given its Python
>> dependency.
>>
>
> The reason to drop Zypper is Zypper has too much components and brings huge
> potential support issues described in [1].
>
> The maintainer of Yum is actively hostile toward RPM5. This is the reason
> why YP do not select YUM.
>
> In [2], Smart is small and compact. And dependency of smart is small (python
> and rpm).
>
> The dnf forks from Yum and dependent of hawkey, librepo, libcomps, libsolv.
> If according to the same raionale, smart is still the proper choice.
>
> The relationship is complicated among rpm4, rpm5, dnf, yum, smart and
> OE-core. And thing is changing makes it harder to figure out this issue.
>
> Best Regards,
>
> Fan
>
> [1] https://lists.yoctoproject.org/pipermail/yocto/2012-October/010384.html
> [2]
> http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100582.html
>
Thanks. This has been an interesting read.

-- 
Maciej Borzecki
RnDity

