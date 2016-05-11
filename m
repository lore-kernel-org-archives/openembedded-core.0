Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC8F605BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 07:53:42 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id x201so55025950oif.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 00:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YFLZz/ibVOYv9NHIku5N61i9gdSAfYZteBODuGsGhvw=;
	b=CO1aO9KQhwnaSasXiZ4TZWDwBThiBM16m3vgeD7JFDGCtnsMBFPXs6TGENC9sd64nB
	9MOHCpg50IKUwPjBQt4ctskeVrM5W3ebwR3GuGHfbxo3ZybVr2fJlN1ejNCO2MDeHtH/
	vJJjFAQwqhrqbXpgU04li/p7r1nnYKrL/OE7063/1WGIMAVVSMua/kCKByDQxLA56zfD
	dx7OV2PE2xq4N96sXbsRE2W5Cvbh0KWlC7onTIQtaTyslPZ0Fa/6joSeSXchNH4zSWPp
	v59e/szUzmxcu2bwV552DNcLrQn6AtTNcDtaW3HBIzAfyDu50/cXQUgreY2bL4lslour
	uTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YFLZz/ibVOYv9NHIku5N61i9gdSAfYZteBODuGsGhvw=;
	b=C4zKRKp5tvqCZ0X0Y7lUzBRxpZkToRHC10gkewUXpHtzDYl4xU3bbXD6nHTd5p1Gif
	RAd+VxiswoNQye0ne0WoJ6Ru+FReQ7MUjhFrfvDhkUaGq+GdDtmmZFL6s9oxHOuyNoCa
	nGThLeMRW2xNwKzx3kPqdUYfS2IgyGPOL9z9OpZDK675Wb3jFtExb9m4hXqe39E3Lpua
	HvTPDQ/49J2k3nEWHBDP/jtyFM6pH1bbfOvMyjAVKSpWUEArupgdOZPfAZKnd7Ni/4k9
	cp2qE5dxx6mzCtw8iwSDAFq+lpqLydAWPNqg0fC3hX1dQfJR28/T0iL/jmQEufA0EEUx
	LrvA==
X-Gm-Message-State: AOPr4FXdeq2FIj2A+s4Dze7GstiKwbc2d7yCyfMNZBtW5tv8knA68HYRTfkdKnTXUaBdf5QjeXbWLE5TUCbtZn+z
X-Received: by 10.157.33.130 with SMTP id s2mr1113579otb.120.1462953222350;
	Wed, 11 May 2016 00:53:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Wed, 11 May 2016 00:53:12 -0700 (PDT)
In-Reply-To: <0ef7c0f30456cc242de331b273b92c1dfe835350.1462935990.git.liezhi.yang@windriver.com>
References: <cover.1462935990.git.liezhi.yang@windriver.com>
	<0ef7c0f30456cc242de331b273b92c1dfe835350.1462935990.git.liezhi.yang@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 11 May 2016 10:53:12 +0300
Message-ID: <CAHiDW_ESd2Zju37mQAmXx8Xkj3kgE9YtCReXFGK2kWGi5HatyQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] glew: Correct version in autotooling patches
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
X-List-Received-Date: Wed, 11 May 2016 07:53:43 -0000
Content-Type: text/plain; charset=UTF-8

On 11 May 2016 at 06:07, Robert Yang <liezhi.yang@windriver.com> wrote:
> From: Martyn Welch <martyn.welch@collabora.co.uk>
>
> The additional autotooling patched into glew claims the version is 1.9.0
> whilst we are building 1.12.0. The version in the autotooling is used to
> set the version number in the pkgconfig file, this results in the
> configuration of packages which depend on glew > 1.9.0 failing.
>
> This patch updates the version number used in the patches to match that of
> the version being built.

This patch was made obsolete in February when Ross modified the recipe
(and upgraded to 1.13) or am I missing something here?

Jussi

> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
> ---
>  meta/recipes-graphics/glew/glew/autotools.patch           | 4 ++--
>  meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/glew/glew/autotools.patch b/meta/recipes-graphics/glew/glew/autotools.patch
> index 7dfe087..81a1343 100644
> --- a/meta/recipes-graphics/glew/glew/autotools.patch
> +++ b/meta/recipes-graphics/glew/glew/autotools.patch
> @@ -20,7 +20,7 @@ Index: glew/configure.ac
>  +# Process this file with autoconf to produce a configure script.
>  +
>  +AC_PREREQ([2.62])
> -+AC_INIT([glew], [1.9.0], [BUG-REPORT-ADDRESS])
> ++AC_INIT([glew], [1.12.0], [BUG-REPORT-ADDRESS])
>  +AC_CONFIG_SRCDIR([src/glew.c])
>  +AC_CONFIG_HEADERS([config.h])
>  +AM_INIT_AUTOMAKE([-Wall -Werror foreign])
> @@ -77,7 +77,7 @@ Index: glew/configure.ac
>  +# for now we use the same version as the package, but that should be avoided
>  +# in the future
>  +
> -+AC_SUBST([LIBGLEW_SO_VERSION], [1:9:0])
> ++AC_SUBST([LIBGLEW_SO_VERSION], [1:12:0])
>  +
>  +AC_CONFIG_FILES([Makefile
>  +                 include/Makefile
> diff --git a/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch b/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
> index 70a99ae..baab9ff 100644
> --- a/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
> +++ b/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
> @@ -20,7 +20,7 @@ Index: glew-1.11.0/configure.ac
>  ===================================================================
>  --- glew-1.11.0.orig/configure.ac
>  +++ glew-1.11.0/configure.ac
> -@@ -66,5 +66,6 @@ AC_SUBST([LIBGLEW_SO_VERSION], [1:9:0])
> +@@ -66,5 +66,6 @@ AC_SUBST([LIBGLEW_SO_VERSION], [1:12:0])
>
>   AC_CONFIG_FILES([Makefile
>                    include/Makefile
> --
> 2.8.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

