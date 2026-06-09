Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E8ECD8C85
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:45:12 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74329.1780991111537171026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 00:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EP27Eldv;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490cdae130cso11918955e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 00:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780991110; x=1781595910; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbjVcd1hlj7iuvTKLvlfCxT6U1zozGy6ykPPYXb+MF8=;
        b=EP27EldvMGtKaDMCU35x3s831sLHep+yut3q0rJ14D5OUgKgRS5d0vxaaEAqsQfQGX
         k6FglaEZp2ypA4DlyCBxGO+jBAkD2tWLhXMzJyAE9+MeND77ZOAYKQRql8KezxM72wDS
         c4fuVNXF3V8CLAYMAyI70TXiaH2IivvulBNyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991110; x=1781595910;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbjVcd1hlj7iuvTKLvlfCxT6U1zozGy6ykPPYXb+MF8=;
        b=OrqQ7adUWd76qKBMtwtiBsgON51gJy3Bx51Am6gKTGxYUDH9snLbgDXc3oMeEEWy37
         nm0thJ6GahmYnj9wkQsglkNSJM1Iz0OBBjXWMQls6bh/5+eSYvQO/1XG9h+V0EfcrpM4
         8CvOUaE9JFZQaYwO9kz2/4MdxlX1pRpG+F+TEYSMklMktFlyOM+DSqXqGrXFl1i3vqwX
         NvKsm6kDCUDFf0nzp90XWAncc+jFEPtREm4aYL97OJcZ2+srkmHOWB0OUG7OF8OwdFPC
         eDdrdxfOvWPl30yUryDlb/8rgWCAbfkxuAiVexLC+hEF4cOEmSefmMYP8vGHtYnhpcHs
         09pA==
X-Forwarded-Encrypted: i=1; AFNElJ9dvj27qKaEASU85Yll1EEkcVOG6MjZEDE8IIfy0+9HIU7hZmqV98of1Wta0w02IB/5Z6yN1Fy9t5liP5RKkWke7w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzSksHGOeL175nv59ogYdPu6BujJOkUTPm/S1qnY4zp8Ik5A0P3
	wz9R7AST1NTdTUNpoHRnO98Wd0n3mXmZBzoPSJDklxrXdLhHBJV/NLi4SzB9vfvmjg==
X-Gm-Gg: Acq92OE3WV9AUZBYBx6inoBO8+invJkn+rscIRfaZUnG0NOx99vG2fA+FRX/CXDS7Rt
	hAju5d+iJU+T2EC/Ds9U1zvgXcwlSr+pQ28BaBtkFu4T50CTjJQMBtFHMfzhhJ/ubfadM/nbTq7
	RzrNxYGTl9e4i2BtK4uJJIA0DXAq9wXSU98OctdDvNhLS/W3FDh+Yj7+nrhuXwFy+WKYYRdKZut
	oASJaWB4MHaXIk31RgoPjbdLqhZZ0CBFucoXJQIL6TB8tWhnnGvXw+DMjYeVXO3TVZHpnjKUdSK
	RNKD0YgsZ3LDVjeOxp4Sz7mCD0t5ASYbNI81To1LiPdYyVpvwM0rJnWLPlV5+BNRsyRUsbW5CL1
	PyV1jmVMCtL1s2LzDH6aWkmGxqUXo+rC6hFk5AgRWGIXfONfwMGXEaOSaRE5V/3ePmtZeJSiK5V
	RicwV5eQalrWS8mzbP2wcencssJmNbniEK2rD4cLqoTMLY+2ZCHe1Kd1+DOXcn//OmnWIaRoLfJ
	zM964/qkF1QAfKRbjgrKZ8/rGrwiL8=
X-Received: by 2002:a05:600c:354a:b0:490:ba0a:1178 with SMTP id 5b1f17b1804b1-490c2616e16mr308372415e9.28.1780991109885;
        Tue, 09 Jun 2026 00:45:09 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm509423385e9.11.2026.06.09.00.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 00:45:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 09:45:08 +0200
Message-Id: <DJ4CNOCK804H.O6IBAE2MU9MH@smile.fr>
From: "Jeremy Rosen" <jeremy.rosen@smile.fr>
To: <prabhudasuvatala@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] [scarthgap] conf/machine: fix typos in ARM
 and x86 README files
X-Mailer: aerc 0.21.0
References: <20260601001057.18589-1-prabhudasuvatala@gmail.com>
In-Reply-To: <20260601001057.18589-1-prabhudasuvatala@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 07:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238270

Hello Prabhudasu

I could not find an equivalent patch for wrynose (though I did find one
for master)
Please submit to wrynose and ping this mail once this is done

thx a lot
J=C3=A9r=C3=A9my
On Mon Jun 1, 2026 at 2:10 AM CEST, Prabhudasu Vatala via lists.openembedde=
d.org wrote:
> Correct spelling errors in the machine include README documentation
> for both ARM and x86 architectures to improve clarity.
>
> ARM changes:
> - Fix TUNE_PKGACH -> TUNE_PKGARCH.
> - Fix "definiton" -> "definition".
> - Fix "Curently" -> "Currently".
> - Fix "specificed" -> "specified".
>
> x86 changes:
> - Fix "define" -> "defined".
> - Fix "to to" duplication.
>
> Signed-off-by: Prabhudasu Vatala <prabhudasuvatala@gmail.com>
> ---
>  meta/conf/machine/include/arm/README | 6 +++---
>  meta/conf/machine/include/x86/README | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/README b/meta/conf/machine/inc=
lude/arm/README
> index c5637798e6..bccbb1bdee 100644
> --- a/meta/conf/machine/include/arm/README
> +++ b/meta/conf/machine/include/arm/README
> @@ -10,7 +10,7 @@ of the existence of the "bigendian" feature in a given =
tune.
> =20
>  A small set of ARM specific variables have been defined to allow=20
>  TUNE_PKGARCH to be automatically defined.  Optimized tunings must NOT=20
> -change the definiton of TUNE_PKGARCH.  TUNE_PKGACH:tune-<tune> will be=
=20
> +change the definition of TUNE_PKGARCH.  TUNE_PKGARCH:tune-<tune> will be=
=20
>  ignored.  The format of the package arch is enforced by the TUNE_PKGARCH
>  default.  The format must be of the form:
>  <armversion>[t][e][hf][b][-vfp][-neon]
> @@ -22,14 +22,14 @@ ARMPKGARCH - This is the core package arch component =
specified by each
>  tuning.  This is the primary identifier of a tuning.  Usual values are:
>  arm, armv4, armv5, armv6, armv7a, etc.
> =20
> -ARMPKGSFX_THUMB - This is the thumb specific suffix.  Curently it is=20
> +ARMPKGSFX_THUMB - This is the thumb specific suffix.  Currently it is=20
>  defined in feature-arm-thumb.inc.
> =20
>  ARMPKGSFX_DSP - This is the DSP specific suffix.  Currently this is set=
=20
>  to 'e' when on armv5 and the dsp feature is enabled.
> =20
>  ARMPKGSFX_EABI - This is the eabi specific suffix.  There are currently=
=20
> -two defined ABIs specificed, standard EABI and Hard Float (VFP) EABI. =
=20
> +two defined ABIs specified, standard EABI and Hard Float (VFP) EABI. =20
>  When the callconvention-hard is enabled, "hf" is specified, otherwise it=
=20
>  is blank.
> =20
> diff --git a/meta/conf/machine/include/x86/README b/meta/conf/machine/inc=
lude/x86/README
> index 05aee533a7..f0a1882d81 100644
> --- a/meta/conf/machine/include/x86/README
> +++ b/meta/conf/machine/include/x86/README
> @@ -4,7 +4,7 @@
>  Most of the items for the X86 architectures are defined in the single
>  arch-x86 file.
> =20
> -Three ABIs are define, m32, mx32 and m64.
> +Three ABIs are defined, m32, mx32 and m64.
> =20
>  The following is the list of X86 specific variables:
> =20
> @@ -17,7 +17,7 @@ The TUNE_PKGARCH is defined as follows:
>  TUNE_PKGARCH =3D ${TUNE_PKGARCH:tune-${DEFAULTTUNE}}
> =20
>  The package architecture for 32-bit targets is historical and generally
> -set to to match the core compatible processor type, i.e. i386.
> +set to match the core compatible processor type, i.e. i386.
> =20
>  For 64-bit architectures, the architecture is expected to end in '_64'.
> =20


