Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4946011C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 07:35:21 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id e5so35975993qtr.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 23:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B/jn7hcXCl5K44hB9aCPIDZlfdWC7SZDnwL4Z8eOCTk=;
	b=N5fYgazIfJx3pEOltgfbwZM8bTVmtl/gxhpm4qvTQY73xS7Qw8rMaXzuVajLBo85Wm
	fM6rvrCbDIrWiBK1OKhltOD4cs7Za/bB6DPngR2jC+veUvlxcvV3TeaJ8f2tBy9yVZ2d
	yBvBnLvzjEddsBeMloH5offY6t1pUGhH2lqFPeV7rx6h1/IZeTp6K05P7uae0/1NK+1M
	W5uKXOcRSKgwhjN5E0+0/bmrUplcpABI+3Wy87V4VvbLMYUd8SpW7TccqJdw50WhVqvu
	+e388/R6TMMI4r9X+JPwkPdlcfOPqe8+vxM9/T9g/MSjmWkj+sOErh72W47maq9t5NPG
	HjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B/jn7hcXCl5K44hB9aCPIDZlfdWC7SZDnwL4Z8eOCTk=;
	b=JYu4SPSizZ8ocqvSUlAQpFY5eXMA/R1Cxklw7OquTX84ozMFXyMJrh2yDxWCvtien2
	V37STEkssBbunH8bvJfZLT5H0sjrSpAj2quH+wrM2urA5ib9nWXE+gwAgtVTSFPVlxt7
	f+/PYsFG3jI6h4SN7zReUbsrY4crEyUD++g39nuha9gzYvv/EBXz+XeZjjG5m5VlV+5Y
	dbJjEK2ZzWDYuUpgcPi9fzZjgtQnf8WH1qzlIQFtvBQ4O1Y2PL2nPGrekkWO42SXKvqU
	DChlf097xs2Tfz0fQd9xsyCwo1o7ullVNGD91yFT99V180njuFxVpGyD+4rO3GrvtHMT
	aLKg==
X-Gm-Message-State: AJcUukdCWbpYvKiHXJ7/GIEd/BTA1bpqwbxXjhP9+XcmRPK5CecIg7mk
	PvOfNHNkIesz8CG+XIwmeU4zNyK9Ftm2W4vUuOo=
X-Google-Smtp-Source: AFSGD/XEy5ofZUDgmEJT+k2DQOCZjDKOm9DmU9Mm7WIj29Js6Xi0Sd+vRFDMztJr5zTlUBHaeXGWeCCLYZTzBC2Ki6k=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr46016828qtk.253.1546500921837;
	Wed, 02 Jan 2019 23:35:21 -0800 (PST)
MIME-Version: 1.0
References: <20190103071008.5065-1-raj.khem@gmail.com>
	<CA+chaQdzAnqqXEmzbwS_3Mayq_9vZ1nQMFvQ1_xhWkD4WiUaag@mail.gmail.com>
In-Reply-To: <CA+chaQdzAnqqXEmzbwS_3Mayq_9vZ1nQMFvQ1_xhWkD4WiUaag@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Jan 2019 23:34:55 -0800
Message-ID: <CAMKF1sr714=RKoHYAqspvgt3uw=8gtQ2V5Eo_REkbedxBd8Bbg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] feature-arm-thumb.inc: Do not tie generating thumb ISA to -march
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
X-List-Received-Date: Thu, 03 Jan 2019 07:35:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 2, 2019 at 11:27 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> I think this will include it not only in -march parameter but also in TUNE_PKGARCH.
> So the packages built with and without thumb ISA will have the same file name and package feed which is wrong.
>

I did ponder over it before following the approach I took, but I think
you have to point to maintain separate feeds for thumb and arm ISA
generated packages.
I think since we do not support OABI and EABI demands interwork, so
using 't' unconditionally in -march is a workable approach too.

> It should probably be fixed only when adding march to TUNE_CCARGS:
> meta/conf/machine/include/arm/arch-armv4.inc:TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4${ARMPKGSFX_THUMB}', '', d)}"
> meta/conf/machine/include/arm/arch-armv5.inc:TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}', '', d)}"
> meta/conf/machine/include/arm/arch-armv6.inc:TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=armv6', '', d)}"
> meta/conf/machine/include/arm/arch-armv7a.inc:TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=armv7-a', '', d)}"
> meta/conf/machine/include/arm/arch-armv7ve.inc:TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
>
>
> On Thu, Jan 3, 2019 at 8:10 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> -march=armv5't'e means that CPU can execute thumb ISA, we do not need to
>> tie this to exclusively generating thumb ISA, this change means that
>> when we have thumb in tune features then it can use 't' in -march
>> options irrespective of ISA being thumb or arm.
>>
>> This fixes derivative of armv5 tunes and paves way for gcc9 where e.g.
>> armv5e is dropped and minimum arch supported is armv5te
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/conf/machine/include/arm/feature-arm-thumb.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
>> index 0b47ccad02..36bda6c67a 100644
>> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
>> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
>> @@ -24,7 +24,7 @@ python () {
>>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
>>
>>  # Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
>> -ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT') == 'thumb' else ''}"
>> +ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d)}"
>>
>>  # what about armv7m devices which don't support -marm (e.g. Cortex-M3)?
>>  TARGET_CC_KERNEL_ARCH += "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '-mno-thumb-interwork -marm', '', d)}"
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

