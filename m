Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.6283.1599825130752430714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 04:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=R5QnGeHd;
 spf=pass (domain: burtonini.com, ip: 209.85.208.171, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f171.google.com with SMTP id a22so12130545ljp.13
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 04:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rt2/He4KsUsu7g0rbIuWNtwhpaM+sM0FeoEjai1RqJ8=;
        b=R5QnGeHdfRhu8oWcwu5dUmPsPB/mpv2bvSpgLLZ/G0+VUT3S1A7dvJxvCPhU+2wi1P
         BaU2n24dSEo0pWEfxeOcyKJB864x46G/QjXWE+yg9ZHnQ6S429pzF7jx/EseF9w/18Mz
         in1wJdHK5eEfVudMd7DCWsuUB/W0jV0b0puyJSwZXjOoaqo/W2RrnMQXv4958hbV/Jft
         R8CW3464jaOcq/R5Bwt/XleTCbxpNrCcq6hAgk7xcFD09iACHd1ZjvlNo3JFmzFRGJ6B
         Jh5PMekBDG6uRg3aNq0Wa+0ecjsQACAqKZTVfQcUd87Qzu0fmAx1/HV1yEUbgs1nR7Sn
         Id6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rt2/He4KsUsu7g0rbIuWNtwhpaM+sM0FeoEjai1RqJ8=;
        b=nCcSJULFHESEv3mY+ah1e64kngvDF2neXfowHDDgZ9k+7WpTi0fJO05KRc713Dd9n6
         gAkokj8rIHiY6xC6bd0GwSR210M3O/owFHoFCOmUI14Nvl3oWNs5KwXlY9XEiLU5FnFa
         QLEmRuuoNtaeZmcwLk/r0YKlUBIxkFAOhPEx7R41H/PA+z1x0BkFqDvKNg0aOXDt8KUZ
         r4HsEh4YTNjk3pjUTaajHMhjvONdiIP/+WOO2OtCN3NCWCXpBS0H1E2SY2SEnN0WB0Yp
         +1wQXGY6zTRTKJrBCS3bTJtzqfhch2mp7PVawcIiHASCmuDr9IYAoaKUP5A/99ToCY/l
         ip8g==
X-Gm-Message-State: AOAM5302qYE1OTi+0+t4ENGOWQcfIL79ZIc7EGpFK4zPxyVdJcY64VGi
	/fzBZYZJ0OaII1rqMyyO+t/KihajPjWBp8G5VLMsRov/C9UAR1W2
X-Google-Smtp-Source: ABdhPJzaJh9b0polToJx4iRfjb/zBHHYV8EnL2z2w04veIplVDv1CmHMixRMPZ7uryoj5wrufIRmtV5+JrIvgYAwjRQ=
X-Received: by 2002:a2e:b704:: with SMTP id j4mr660199ljo.329.1599825128659;
 Fri, 11 Sep 2020 04:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAFimOt4qqUBom3vGpgdquC61oao4gppraibinztAzY8FUB0vsA@mail.gmail.com>
In-Reply-To: <CAFimOt4qqUBom3vGpgdquC61oao4gppraibinztAzY8FUB0vsA@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 11 Sep 2020 12:51:57 +0100
Message-ID: <CAAnfSTuW_UQ0KCWd_zjEa9CJs8WKD4WLKkdf4H9y1fg3xHkapQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tcmode-default: Drop gcc-cross-initial, gcc-crosssdk-initial references
To: douglas.royds@taitradio.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Can you resend using git-send-email, as that patch has been corrupted.

Ross

On Fri, 11 Sep 2020 at 01:19, Douglas via lists.openembedded.org
<douglas.royds=taitradio.com@lists.openembedded.org> wrote:
>
> Further to 5b2fd1c724
>
> Also a few remaining references (DISTRO_PN_ALIAS, RECIPE_MAINTAINER).
>
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
> meta/conf/distro/include/distro_alias.inc | 4 ----
> meta/conf/distro/include/tcmode-default.inc | 2 --
> meta/conf/layer.conf | 2 +-
> 3 files changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/meta/conf/distro/include/distro_alias.inc
> b/meta/conf/distro/include/distro_alias.inc
> index 56055f7798..b4dfcfc5f5 100644
> --- a/meta/conf/distro/include/distro_alias.inc
> +++ b/meta/conf/distro/include/distro_alias.inc
> @@ -81,10 +81,6 @@ DISTRO_PN_ALIAS_pn-encodings =
> "Ubuntu=xfonts-encodings Mandriva=x11-font-encodi
> DISTRO_PN_ALIAS_pn-font-alias = "Fedora=xorg-x11-fonts-base
> Mandriva=x11-font-alias Meego=xorg-x11-fonts"
> DISTRO_PN_ALIAS_pn-font-util = "Meego=xorg-x11-font-utils
> Fedora=xorg-x11-font-utils Ubuntu=xfonts-utils Mandriva=x11-font-util
> Debian=xfonts-utils"
> DISTRO_PN_ALIAS_pn-formfactor = "OE-Core"
> -DISTRO_PN_ALIAS_pn-gcc-cross-initial = "OE-Core"
> -DISTRO_PN_ALIAS_pn-gcc-cross-initial-i586 = "OE-Core"
> -DISTRO_PN_ALIAS_pn-gcc-crosssdk-initial = "OE-Core"
> -DISTRO_PN_ALIAS_pn-gcc-crosssdk-initial-x86_64 = "OE-Core"
> DISTRO_PN_ALIAS_pn-gccmakedep = "Mandriva=gccmakedep Ubuntu=xutils-dev"
> DISTRO_PN_ALIAS_pn-gcc-runtime = "Ubuntu=gcc Fedora=gcc"
> DISTRO_PN_ALIAS_pn-gcc-sanitizers = "Ubuntu=gcc Fedora=gcc"
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index 1bc95ec675..50e8a20f35 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -30,9 +30,7 @@ LLVMVERSION ?= "10.0.1"
> PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
> PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
> -PREFERRED_VERSION_gcc-cross-initial-${TARGET_ARCH} ?= "${GCCVERSION}"
> PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
> PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=
> "${GCCVERSION}"
> PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
> PREFERRED_VERSION_gcc-sanitizers ?= "${GCCVERSION}"
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 1a01d02fef..38df0f3aff 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -91,7 +91,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
> # dependency incidentally. This improves determinism and avoids build
> # failures when people switch to external toolchains.
> SSTATE_EXCLUDEDEPS_SYSROOT += ".*->bison-native"
> -# Nothing needs to depend on libc-initial/gcc-cross-initial
> +# Nothing needs to depend on libc-initial
> # base-passwd/shadow-sysroot don't need their dependencies
> SSTATE_EXCLUDEDEPS_SYSROOT += "\
> .*->.*-initial.* \
>
> --
> 2.17.1
>
> --
> This Communication is Confidential. We only send and receive email on the
>
> basis of the terms set out at www.taitradio.com/email_disclaimer
> <http://www.taitradio.com/email_disclaimer>
> 
