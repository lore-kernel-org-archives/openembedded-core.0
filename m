Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 16FFF6C248
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 07:41:59 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id o125so19217391qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 23:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CBmMXhkPiDhgC8qQXuDBPwITy4rGEgBb4g6jn71pvsY=;
	b=TOfUdoHthc5Go8IpUzpi/gkUPBYv0L06N90685uaJiXkWbi2WoSvRRgauxPgb4vfMu
	8yE45sV0d1GrBlGYJCSo6UT6Z8qRppojQXL8Wqsoe0yThgd2fjTONzC7kOwW8SEqGvoe
	7crOhaIXVfs05wGpov7jCFAjZ9eOe4VNvU2O+Y3OcDJZyaD5r3tSznqAxz2ek8O7PuAs
	18CD86DxMQwHwg0F8d4c+La9M8B1fj95hpnO/iNR5dFoJCvKkK5pqLhqzXyfx0gX/fJ8
	iUC/vq6t58YGMsGPdwPw74snnYSM/0iffs7rszgezVvdvFsoqc6fMpxlYT9mp+mEDnGB
	sRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CBmMXhkPiDhgC8qQXuDBPwITy4rGEgBb4g6jn71pvsY=;
	b=pIFKwOfS87ICkjmNaLHZbtclrQ4/l09G0WvlpMp+1S95QnSQdWwSe6ESGVVavybpCZ
	QQkY3ugQf/SEEf3WW5/sDx72bgyImPoXCg2ZbFdJWycB2MzrffkPItRM4dTyB0CoR51u
	dWM7RlCsh8LwYRtZKBeufabbakpJWQJ7mU1E/jyxdGxOSbqOkj1cdVznk5UOrO3w2Kky
	9mIOWkoeJB6f3R+Sqg1YQJ/gpm7EcFuE1vMU3AYo8oJSXWzZrdT7cvyloByrGHCwakH+
	tE+B9s+sqy1GxvGeUIzNao0xr6EdRj6OTIvIlbn8CUQLPogrGDWJmEzCbrvnARcoH4wR
	nNjw==
X-Gm-Message-State: AJcUuke5Tw+cIaZLhs2Zyg/CBkuInGu/s3BGxwzHX8pCgoSbTy+94NKN
	bHAuIjYAng71nIDMAb5cnZVWsa+bk6bF8rEAhiQ=
X-Google-Smtp-Source: ALg8bN4bReOAleI04N8uohSlJQp7KsQs2kZUe62lP73xa/U9bR4s6WpMjDcTk/kNW1PZFNM4Os6c1kDVgRNyFZFsp9E=
X-Received: by 2002:a37:a80a:: with SMTP id r10mr44637913qke.2.1546501319857; 
	Wed, 02 Jan 2019 23:41:59 -0800 (PST)
MIME-Version: 1.0
References: <20190103071008.5065-1-raj.khem@gmail.com>
	<CA+chaQdzAnqqXEmzbwS_3Mayq_9vZ1nQMFvQ1_xhWkD4WiUaag@mail.gmail.com>
	<CAMKF1sr714=RKoHYAqspvgt3uw=8gtQ2V5Eo_REkbedxBd8Bbg@mail.gmail.com>
In-Reply-To: <CAMKF1sr714=RKoHYAqspvgt3uw=8gtQ2V5Eo_REkbedxBd8Bbg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Jan 2019 23:41:33 -0800
Message-ID: <CAMKF1spe9jWDzAigqPpKkmyPyFmEcPhVkx7g98op+=Jfo67uyg@mail.gmail.com>
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
X-List-Received-Date: Thu, 03 Jan 2019 07:41:59 -0000
Content-Type: text/plain; charset="UTF-8"

sent a v2 which i am testing

On Wed, Jan 2, 2019 at 11:34 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Jan 2, 2019 at 11:27 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > I think this will include it not only in -march parameter but also in TUNE_PKGARCH.
> > So the packages built with and without thumb ISA will have the same file name and package feed which is wrong.
> >
>
> I did ponder over it before following the approach I took, but I think
> you have to point to maintain separate feeds for thumb and arm ISA
> generated packages.
> I think since we do not support OABI and EABI demands interwork, so
> using 't' unconditionally in -march is a workable approach too.
>
> > It should probably be fixed only when adding march to TUNE_CCARGS:
> > meta/conf/machine/include/arm/arch-armv4.inc:TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4${ARMPKGSFX_THUMB}', '', d)}"
> > meta/conf/machine/include/arm/arch-armv5.inc:TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}', '', d)}"
> > meta/conf/machine/include/arm/arch-armv6.inc:TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=armv6', '', d)}"
> > meta/conf/machine/include/arm/arch-armv7a.inc:TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=armv7-a', '', d)}"
> > meta/conf/machine/include/arm/arch-armv7ve.inc:TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
> >
> >
> > On Thu, Jan 3, 2019 at 8:10 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> -march=armv5't'e means that CPU can execute thumb ISA, we do not need to
> >> tie this to exclusively generating thumb ISA, this change means that
> >> when we have thumb in tune features then it can use 't' in -march
> >> options irrespective of ISA being thumb or arm.
> >>
> >> This fixes derivative of armv5 tunes and paves way for gcc9 where e.g.
> >> armv5e is dropped and minimum arch supported is armv5te
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta/conf/machine/include/arm/feature-arm-thumb.inc | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> >> index 0b47ccad02..36bda6c67a 100644
> >> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> >> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> >> @@ -24,7 +24,7 @@ python () {
> >>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
> >>
> >>  # Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
> >> -ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT') == 'thumb' else ''}"
> >> +ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d)}"
> >>
> >>  # what about armv7m devices which don't support -marm (e.g. Cortex-M3)?
> >>  TARGET_CC_KERNEL_ARCH += "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '-mno-thumb-interwork -marm', '', d)}"
> >> --
> >> 2.20.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

