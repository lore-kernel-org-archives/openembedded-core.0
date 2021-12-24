Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3394FC433F5
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 05:53:29 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.42600.1640325208107284338
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 21:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eRgXEfQB;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id a1so6856745qtx.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 21:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MWwNyc1ylONHnb2KzS7WlWXCPyKpi99ITzeagxM9v3w=;
        b=eRgXEfQBUiF4YD+rb+gd6d0f+q7MsYaFtqIyCM5uS8D630+C3R3MvpuOD/SiZ4j44g
         y/SErNfPW/E2l0GmA0oTTmbKYHZwyw0ENtWdLvWXHNQakz4Xx1BrwDWcbN7Gqj79iJXg
         uHkdiPC1VtCt7nFvuuHZaliI3BWH/RvHMcAQDmsUDnnDq+n+ZcyGcNFhsqBcaXFDOwhr
         Z8qNsD9SgoaUf+QmPACGNDoPTXMizGEpp51jD1E7MsFjD+ZhdZcaPvH/DryR39orz0am
         Tcdy9X4BmHF+P0GsacLCsEZzBGxWOLk1rG1s4yLX4FLJIisR/35sq3V31pCFXXw1mMFW
         qwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MWwNyc1ylONHnb2KzS7WlWXCPyKpi99ITzeagxM9v3w=;
        b=7vnW8K6VPRhAYIC4R/2YOE/biECziUzm7uOfGMT1PMuP1iK44II00mUTSBPtGHSHwC
         QJ/109Jnw48w+9wWUJf9YAmeQzuEKH1VVSlVP4lkyr6Qn3a28McMqP4HifMEt/jRg6B6
         EDpxJrBRLPr9NeH0c1wFPiy4Gf1wgoirTUU+vWT8MByNScBTD7z5G5JUPNwT/Mki+lg2
         vhglMcAGxtBznYR0rT5fywzdqzGNqew+gBGS0kTK4D9LxPyxr1MgGeWMUvpeek00HCLM
         w5ErIKHDuxivjEqQQIxpqj2njA9WsdtIAU9xx5YI/Bt22IScqzJJpPJ6ZOUq0vSnJB8T
         zM8A==
X-Gm-Message-State: AOAM530o+DrlV3ZgE4WdPhBk03F92KECUr6kwtWZYbWFoTyHiMbq+GcS
	4mFEl81vtUdawHT6AoM2DBNiwWTJJbaxvsyIX3aukyxHBGI=
X-Google-Smtp-Source: 
 ABdhPJy34o4wuURsHsZK2rFFcqa/tQlaBUQOHBvs98fFEGq/ueu1hUMgPPeRfF5avBMXQb6b3pmIh5VnnXIhnNjzHR4=
X-Received: by 2002:ac8:7f4d:: with SMTP id g13mr4517021qtk.215.1640325207170;
 Thu, 23 Dec 2021 21:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20211223103617.4172-1-pkj@axis.com>
In-Reply-To: <20211223103617.4172-1-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Dec 2021 21:53:01 -0800
Message-ID: 
 <CAMKF1so10sJ0T3GkdxgPLObrArFbw2F=Opqfbt=76KCz=FhT5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.bbclass: Add support for specifying a
 suffix for debug files
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Dec 2021 05:53:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159994

On Thu, Dec 23, 2021 at 2:36 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> The suffix is added to the names of all files with debug symbols
> produced by split_and_strip_files(). It can be used to make the debug
> files produced by one recipe unique to avoid them conflicting with
> identically named debug files produced by another recipe. This may be
> needed since while the target files may be split in multiple packages,
> the debug files for one recipe are all in one package.
>

can you point to an example recipe clash ?

> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/package.bbclass | 11 +++++++++++
>  meta/conf/documentation.conf |  1 +
>  2 files changed, 12 insertions(+)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 09cd376f4a..3df1edd4a8 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -62,6 +62,14 @@ PACKAGE_DEPENDS += "rpm-native dwarfsrcfiles-native"
>  # tools at rootfs build time.
>  PACKAGE_WRITE_DEPS ??= ""
>
> +# This suffix is added to the names of all files with debug symbols produced by
> +# split_and_strip_files(). It can be used to make the debug files produced by
> +# one recipe unique to avoid them conflicting with identically named debug files
> +# produced by another recipe. This may be needed since while the target files
> +# may be split in multiple packages, the debug files for one recipe are all in
> +# one package.
> +PACKAGE_DEBUG_FILE_SUFFIX ??= ""
> +
>  def legitimize_package_name(s):
>      """
>      Make sure package names are legitimate strings
> @@ -1117,6 +1125,9 @@ python split_and_strip_files () {
>          debugstaticlibdir = ""
>          debugsrcdir = "/usr/src/debug"
>
> +    debugappend += d.getVar('PACKAGE_DEBUG_FILE_SUFFIX')
> +    debugstaticappend += d.getVar('PACKAGE_DEBUG_FILE_SUFFIX')
> +
>      #
>      # First lets figure out all of the files we may have to process ... do this only once!
>      #
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index f63f4b223a..ad49410249 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -311,6 +311,7 @@ PACKAGE_ARCH[doc] = "The architecture of the resulting package or packages."
>  PACKAGE_ARCHS[doc] = "A list of architectures compatible with the given target in order of priority."
>  PACKAGE_BEFORE_PN[doc] = "Enables easily adding packages to PACKAGES before ${PN} so that the packages can pick up files that would normally be included in the default package."
>  PACKAGE_CLASSES[doc] = "This variable specifies the package manager to use when packaging data. It is set in the conf/local.conf file in the Build Directory."
> +PACKAGE_DEBUG_FILE_SUFFIX[doc] = "This suffix is added to the names of all files with debug symbols in the dbg package."
>  PACKAGE_EXCLUDE[doc] = "Packages to exclude from the installation. If a listed package is required, an error is generated."
>  PACKAGE_EXTRA_ARCHS[doc] = "Specifies the list of architectures compatible with the device CPU. This variable is useful when you build for several different devices that use miscellaneous processors."
>  PACKAGE_INSTALL[doc] = "List of the packages to be installed into the image. The variable is generally not user-defined and uses IMAGE_INSTALL as part of the list."
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159974): https://lists.openembedded.org/g/openembedded-core/message/159974
> Mute This Topic: https://lists.openembedded.org/mt/87915927/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

