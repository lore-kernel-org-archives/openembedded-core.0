Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.18812.1593298316331852527
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2020 15:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hZpxAVOn;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id dm19so3399593edb.13
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 15:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2mcZm0KYtp4eJy2uqTeaK6pVHQ6rMBCN1q4WJMcMZaE=;
        b=hZpxAVOn3MqGt/hSqoI4WoUECH4+Jr2aJERugEGNXglWDxGAk//atMgkgkBiaRFgm6
         X8x4sWuUjKQ0s8qAAbQOMuK1A/t4343V3dd4Kg12ztas0Z9nTmHskEHnJro2ISuvBm89
         /PYM060yNbvqEvtpowaaQwmYkD4P0RDyvJYkBNXlGvsxkcR4k52CGwsuoOzo/LbNWukj
         tVpuUB3E/AGeQvTcZ+uwzqn0e1y6JABlewQ+OBiPZnFzdwQUJ7oEcgUsQ2JuL2E6U4Cs
         k16MRtVq9K+vNBePMESnsJbtpf7QZbxe5WcSt/QgeimQwr2KDW1ThciBzL1xTjHTN/XU
         +i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2mcZm0KYtp4eJy2uqTeaK6pVHQ6rMBCN1q4WJMcMZaE=;
        b=jl4b1B03J81xg+ji6djE4/A2OrNzYBcCIeduaslQtKylcsHdqnbLsmto3rP8Xt2UR7
         hrx4elzPm6PQVqyDBqhY2coBuwjlHyhK4J34Zq8e+MJIQNkEu/Pk2KHhPCw2w+1ybWTD
         SvX2fxcGH7l75OCfbg3HD6s7WezOBbcoa2ilHsN2YaTC6ti8SutfrsBVSNAtmFfE5OdN
         VFmjPvdzXFcSUU+GzfjllY7OSnolvHjOb1GjFKCK3icKSwYNG9DR96N8KGSHNUiOmx0m
         ZN/hK6Tap43wATMAAttP9qRVW2OqmkZrENaHuh2KY32yUTBtNBZyKCadSW58ftAhB5Dy
         AZig==
X-Gm-Message-State: AOAM531xE9+8Pdyk6Yof7hEbpPE2YcZ7JEdbzUH5oUGFGCHJeRJeILDV
	cIKVKQrfeZ7SirF4u65BKk8=
X-Google-Smtp-Source: ABdhPJwVGOrSzyJhmgAHk7ogVvHCnWimBley1+xLzjZKMl3XB+/bXw8NHbFYKlS/U0jhQlIeRVgABg==
X-Received: by 2002:a50:fe0d:: with SMTP id f13mr10616219edt.204.1593298314624;
        Sat, 27 Jun 2020 15:51:54 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from Saturn.fritz.box ([81.221.228.86])
        by smtp.gmail.com with ESMTPSA id x16sm15612880edl.82.2020.06.27.15.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 15:51:54 -0700 (PDT)
Message-ID: <1593298313.4316.22.camel@gmail.com>
Subject: Re: [[OE-core][Patch] cogl-1.0: : don't require eglmesaext.h
From: "Max Krummenacher" <max.oss.09@gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Max
	Krummenacher <max.krummenacher@toradex.com>
Date: Sun, 28 Jun 2020 00:51:53 +0200
In-Reply-To: <CAHtQpK7RAB30qS=kRbsqEc48-_rvUCCHEMRgPJCdcpTY-A5C5g@mail.gmail.com>
References: <20200627113417.25595-1-max.krummenacher@toradex.com>
	 <CAHtQpK7RAB30qS=kRbsqEc48-_rvUCCHEMRgPJCdcpTY-A5C5g@mail.gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Resent from correct email address. Sorry for the noise.

Hello Andrey


Am Samstag, den 27.06.2020, 21:31 +0200 schrieb Andrey Zhizhikin:
> Hello Max,
> 
> On Sat, Jun 27, 2020 at 1:35 PM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > 
> > Starting with 1.22.8 cogl code unconditionally includes eglmesaext.h.
> > Change configure.ac so that eglmesaext.h is only included if it actually
> > exists.
> > 
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > 
> 
> This patch fails to build with following errors in do_configure:
> 
> > checking for wayland-egl >= 1.0.0 wayland-client >= 1.0.0... yes
> > checking EGL/egl.h usability... no
> > checking EGL/egl.h presence... no
> > checking for EGL/egl.h... no
> > configure: error: Unable to locate required EGL headers
> > WARNING: exit code 1 from a shell command.

I tested with a (relatively) clean meta-freescale installation, master branch.
I built an i.MX 6 based machine with use-mainline-bsp and an i.MX6 and i.MX8MM based machine with
use-nxp-bsp. 
For me the use-mainline-bsp build unsurprisingly succeeded without and with the patch. The two
builds with use-nxp-bsp failed before the patch in do_compile because eglmesaext.h is missing, but
succeeded with the patch applied.

What was your exact configuration and build target?
Do the headers exist in your build?
  .../work/<pkg-arch>/cogl-1.0/1.22.8-r0/recipe-sysroot/usr/include/
Any hint in the configure log output?
  .../work/<pkg-arch>/cogl-1.0/1.22.8-r0/build/config.log

Max

buildhistroy/images/colibri_imx6/glibc/core-image-weston/build-id.txt

colibri-imx6: core-image-weston configured for fslc-xwayland 3.2-snapshot-20200627

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-fslc-linux-gnueabi"
MACHINE              = "colibri-imx6"
DISTRO               = "fslc-xwayland"
DISTRO_VERSION       = "3.2-snapshot-20200627"
TUNE_FEATURES        = "arm vfp cortexa9 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            = "master:3e96efc4dd87f74ba807692feab5d3750e7e9e30"
-> that is my patch on top of poky, master:5951cbcabe29e8520876c7646b578c12d6c20950
meta-oe              
meta-multimedia      
meta-python          = "HEAD:e9e823d1a03eec5874346ed0c87e29c376195476"
meta-freescale       = "master:be4bd4650170a5e9c38875809be440daa65aa0aa"
meta-freescale-3rdparty = "master:13c782bfe40c921034944d6680bd27517a580598"
meta-freescale-distro = "HEAD:eb60ca80e81e07909920889fcdd03649934c4896"
