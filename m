Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.9627.1614585858535352180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 00:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xd25aBpz;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id x124so15710234qkc.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 00:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5G8fYEpSa6wCQl9tvPq/HBjUoTMGKP/SPz8zBv8vcy8=;
        b=Xd25aBpzHL9f6jbZKrcXRi/iZdJqeMw3r3JyjLI09EIYMWxN10NTFWxR7nFzwDrHtv
         MClm1vqtMwSIx62nvoMozsGCgFAlaMb5w6PHUvMI28IHzwAjsy98xebqwSK0fCsjAA8q
         rs1f7/Df/HDTAWp0gcIsaEP2R+G/Xq7p2uTtiYgE9CiDS2Np4VJ6RkuCT2Cw60jDUyZN
         1VZScytaXoF+5apePd9zmuJIikNKFXdIsNNmm6hCegnwrV8AvjMRP3mEmbBXP+J73IRr
         wldjk3LXsceqWPlEEq9M2WTiZj9g0A5zEGsGcUOJ92cgh7yme/HWSo+vRxQOcAVwuEpR
         rVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5G8fYEpSa6wCQl9tvPq/HBjUoTMGKP/SPz8zBv8vcy8=;
        b=AF/Rxaa7+ZoqdDZTh+y80oWjv24Vc6JdnSUzE08/l5mlYprtZ+W+VOr8p87qfBjY9G
         C1aS5FpscrlReoK8lPOPLiLMu8/DdQvPtddFGep1hkxGI1bHGi6xdBFljdozj4hbe/xv
         dlvA+QyhFjW54Og7u0u/FTskFiAQ7NgrESuRgM9sBzPU+1+4didtRot7LEXGntlxm29t
         7zIJyugjI65W1rGKEBf2beRFRKgaMSzocMdhIf19sHYmI/qtHiV2ywNudwnaQefR+snQ
         rYpe9NzS+wWB3qr/jxlpCniP3kXWzgjd5/bMj4meRhdH8nNpE9bVCltcOkVnSa53Jw1S
         Z9IA==
X-Gm-Message-State: AOAM532nFsMhsyUXkOpVqW/JPM/RHXuRrKKdanIiuUhU/1i2ToilFanJ
	p+DU4vkIs3wvuTyU9zk8baak78M4ShFtaQ0dj+w=
X-Google-Smtp-Source: ABdhPJwI/SOaYGXJndlFEG/oUpx5OW7lJUOlmB32Lo5VoJDvg99QsoJGY1qvai24raiMQmIzI8vDpZTSXpTtsNtvX5E=
X-Received: by 2002:a05:620a:124f:: with SMTP id a15mr10393077qkl.125.1614585857402;
 Mon, 01 Mar 2021 00:04:17 -0800 (PST)
MIME-Version: 1.0
References: <20210228153702.498275-1-alex.kanavin@gmail.com> <20210228153702.498275-11-alex.kanavin@gmail.com>
In-Reply-To: <20210228153702.498275-11-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 1 Mar 2021 00:03:51 -0800
Message-ID: <CAMKF1sqm_E3Yc46E9D6+hFo3KWEhJ1n8hY02Dn9YY0yixZiDUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/24] perl: update 5.32.0 -> 5.32.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

seeing few failures

https://errors.yoctoproject.org/Errors/Build/117607/

On Sun, Feb 28, 2021 at 7:37 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Drop perl-cross-makefile.patch as it is merged upstream.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../perl/files/perl-cross-makefile.patch      | 29 -------------------
>  .../perl/{perl_5.32.0.bb => perl_5.32.1.bb}   |  7 ++---
>  2 files changed, 3 insertions(+), 33 deletions(-)
>  delete mode 100644 meta/recipes-devtools/perl/files/perl-cross-makefile.patch
>  rename meta/recipes-devtools/perl/{perl_5.32.0.bb => perl_5.32.1.bb} (98%)
>
> diff --git a/meta/recipes-devtools/perl/files/perl-cross-makefile.patch b/meta/recipes-devtools/perl/files/perl-cross-makefile.patch
> deleted file mode 100644
> index 5d3f998200..0000000000
> --- a/meta/recipes-devtools/perl/files/perl-cross-makefile.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Makefile: Avoid continual rebuilds of miniperl and associated races
> -
> -In the Yocto Project, when we run "make install" we notice miniperl
> -rebuilding multiple times. Usually this is harmless however sometimes
> -race issues occur such as miniperl not being executable.
> -
> -The issue is that crosspatch is a phony target so it always rebuilds.
> -Adding this as a dependency of miniperl means miniperl always rebuilds
> -too.
> -
> -Avoid this by injecting a direct dependency avoiding the phony target.
> -miniperl is then only rebuilt when its input changes as desired.
> -
> -Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
> -Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/95]
> -
> -Index: perl-5.32.0/Makefile
> -===================================================================
> ---- perl-5.32.0.orig/Makefile
> -+++ perl-5.32.0/Makefile
> -@@ -56,7 +56,7 @@ crosspatch: $(CROSSPATCHED)
> -
> - # A minor fix for buildroot, force crosspatching when running "make perl modules"
> - # instead of "make all".
> --miniperlmain$O: crosspatch
> -+miniperlmain$O: $(CROSSPATCHED)
> -
> - # Original versions are not saved anymore; patch generally takes care of this,
> - # and if that fails, reaching for the source tarball is the safest option.
> diff --git a/meta/recipes-devtools/perl/perl_5.32.0.bb b/meta/recipes-devtools/perl/perl_5.32.1.bb
> similarity index 98%
> rename from meta/recipes-devtools/perl/perl_5.32.0.bb
> rename to meta/recipes-devtools/perl/perl_5.32.1.bb
> index 7d88c65322..1fafc0a8c9 100644
> --- a/meta/recipes-devtools/perl/perl_5.32.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.32.1.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
>
>
>  SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
> -           https://github.com/arsv/perl-cross/releases/download/1.3.4/perl-cross-1.3.4.tar.gz;name=perl-cross \
> +           https://github.com/arsv/perl-cross/releases/download/1.3.5/perl-cross-1.3.5.tar.gz;name=perl-cross \
>             file://perl-rdepends.txt \
>             file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
>             file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
> @@ -21,7 +21,6 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
>             file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
>             file://0002-Constant-Fix-up-shebang.patch \
>             file://determinism.patch  \
> -           file://perl-cross-makefile.patch \
>             "
>  SRC_URI_append_class-native = " \
>             file://perl-configpm-switch.patch \
> @@ -30,8 +29,8 @@ SRC_URI_append_class-target = " \
>             file://encodefix.patch \
>  "
>
> -SRC_URI[perl.sha256sum] = "efeb1ce1f10824190ad1cadbcccf6fdb8a5d37007d0100d2d9ae5f2b5900c0b4"
> -SRC_URI[perl-cross.sha256sum] = "755aa0ca8141a942188a269564f86c3c82349f82c346ed5c992495d7f35138ba"
> +SRC_URI[perl.sha256sum] = "03b693901cd8ae807231b1787798cf1f2e0b8a56218d07b7da44f784a7caeb2c"
> +SRC_URI[perl-cross.sha256sum] = "91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25"
>
>  S = "${WORKDIR}/perl-${PV}"
>
> --
> 2.29.2
>
>
> 
>
