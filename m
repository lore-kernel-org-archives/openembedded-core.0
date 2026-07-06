Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72D5C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 21:33:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.161739.1783373603397951537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 14:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RTa0f6Dm;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c486f012so14882975e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 14:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783373602; x=1783978402; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4KoHxKcHc6eG4djXTqXftriTp+Xqv95k6HsC0Y654RU=;
        b=RTa0f6DmeX8RpPcZW0SivMxQlXg2RstX4i2q1w/bpzCUb1NSui/h645l6qmUjN6sCA
         bfRYpKJ5WODznGqSeQ86SSbjCpGebhvwPxquYuSFH/oliDTTBVx32+0QFux7GYrXOn25
         reH9Wsg+4i4DrHj+3oXS2vfxHLsea0bcBt0iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373602; x=1783978402;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KoHxKcHc6eG4djXTqXftriTp+Xqv95k6HsC0Y654RU=;
        b=CQ92Gj3LfRJNLu4DjQe8OioVLarZRdNweWSBRD0YhXKOhN9H/z5aPz5U7twEwJZIzN
         rksN+SxbqrBOPlH/H0z3xeyYGpHGOgjVpjgh7qZVIkM2eWMQWyn5p+h0vaQatKJQpVyl
         p0rH/lVsUd7AIb4skBjv77ZSSWAq2X39Movu8d2P8fup98XLKBqZZyacQ9BatVTEwvOr
         JRoMbwoPtTueQXWTtB/WM19jBrLeMF+2hUndbBdmZoej29zSQmz9wmycY6vpO5faKi4k
         jlkQmHsMoNehOste+hZEXQbo4RjmjQwMb1YJI1q/MZgMy/pVFXxw9ZgVGfEPchsWLTh8
         4eyg==
X-Forwarded-Encrypted: i=1; AHgh+RoujLPxAaeAjj5RV7DqC/noJaMt0QNHCSBiLbPtoNZ8ao15cFBfLUSoL6PHac0e8Xkbm+4bSweY95jhh14g/Mjgig==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyPV6G9hw/2P/dCS1bvxe0Au0GsBStytAcr4eDbB854deqssRwg
	NVQgcHLzW06i2HmpWubrhjtp8tqkry2Lm/J2J9utDfNL7XmLK7gj64zJ/HtOQx2MaGo=
X-Gm-Gg: AfdE7clM/bw/TZXFVkVbA20Gb7ZZ5Y0zmmyuKtn4VSYPfEzXljaZVbNxCGfN7YUMKXK
	zF4DsTUo0nhoWWkVRMdMxIN5gYbAJyg6AUO29xuWwTCYDf9N4gFb86uKOJebQ0y8HJLeYcLMKF/
	p9DB5XMYqND75rbg7QPYk733AyCCDvat5qwJBFs7wJFy9Yz/QYFz16ZNECq+ro+wuL8t60ktOkD
	eOv/1bNxtZRcn6p32LWdotBPLVT+7j07eq4MqZ/naAab15kIGl3R7YQVWLJDe9KuQTKbt6QucEE
	x5dd/WDlrG49tSnU0LRLoCGxMDU991fa39BxxyGjJh8c7wiRqDT8R2udhbO/9RntqwqI36znHbA
	HLuzO4Wvw0XzNXR175nsj6Yg13UWvzBMQ9mDYjSPO4xzMqGPRN+VhC3fpEQBtEmK54/09eOo4Nt
	mNTtsT2aPxgsDftY7h2fzp/VakhOIspB6JAMeahcnEX1eOd3M5qTsSUiPBLC1AKDZZqo9Cfpsz/
	fyW
X-Received: by 2002:a05:600c:3153:b0:493:dad1:e46a with SMTP id 5b1f17b1804b1-493df08f7ccmr25225255e9.21.1783373601527;
        Mon, 06 Jul 2026 14:33:21 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d905sm28136054f8f.2.2026.07.06.14.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 14:33:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 23:33:20 +0200
Message-Id: <DJRT6I1TY4RN.7XFZ0925KYBS@smile.fr>
Subject: Re: [scarthgap][PATCH v2] libgcrypt: upgrade 1.10.3 -> 1.10.4
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Hongxu Jia" <hongxu.jia@windriver.com>
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260706210232.794171-1-jakubszczudlo40@gmail.com>
In-Reply-To: <20260706210232.794171-1-jakubszczudlo40@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 21:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240342

Hello,

On Mon Jul 6, 2026 at 11:02 PM CEST, Jakub Szczudlo wrote:
> Release notes are here:
> https://dev.gnupg.org/T8233.html
> Update contains fix for CVE-2026-41989 and patch that need to be updated =
to
> correct setting compile flags in new version.
>
> Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
> ---
> v2:
>  - Added new patch to fix building error with '-O2' in sysroot path for l=
ibgcrypt 1.10.4, patch
>    was taken from wrynose and backported.
>
>  ...ilding-error-with-O2-in-sysroot-path.patch | 64 -------------------
>  ...ilding-error-with-O2-in-sysroot-path.patch | 49 ++++++++++++++
>  ...ibgcrypt_1.10.3.bb =3D> libgcrypt_1.10.4.bb} |  4 +-
>  3 files changed, 51 insertions(+), 66 deletions(-)
>  delete mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-buildin=
g-error-with-O2-in-sysroot-path.patch
>  create mode 100644 meta/recipes-support/libgcrypt/files/0002-libgcrypt-f=
ix-building-error-with-O2-in-sysroot-path.patch
>  rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.3.bb =3D> libgcryp=
t_1.10.4.bb} (92%)
>
> diff --git a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error=
-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0001-=
Fix-building-error-with-O2-in-sysroot-path.patch
> deleted file mode 100644
> index dee4969f35..0000000000
> --- a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O=
2-in-sysroot-path.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From b99952adc6ee611641709610d2e4dc90ba9acf37 Mon Sep 17 00:00:00 2001
> -From: "simit.ghane" <simit.ghane@lge.com>
> -Date: Tue, 7 May 2024 14:09:03 +0530
> -Subject: [PATCH] Fix building error with '-O2' in sysroot path
> -
> -* cipher/Makefile.am (o_flag_munging): Tweak the sed script.
> -* random/Makefile.am (o_flag_munging): Ditto.
> ---
> -
> -Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
> -respectively when compiling cipher and random in the filesystem
> -paths as well if they happen to contain '-O2' or '-Ofast
> -
> -If we are cross compiling libgcrypt and sysroot contains such
> -characters, we would
> -get compile errors because the sysroot path has been modified.
> -
> -Fix this by adding blank spaces and tabs before the original matching
> -pattern in the sed command.
> -
> -Signed-off-by: simit.ghane <simit.ghane@lge.com>
> -
> -ChangeLog entries added by wk
> -
> -Note that there is also the configure option --disable-O-flag-munging;
> -see the README.
> -
> -Upstream-Status: Backport [https://dev.gnupg.org/rCb99952adc6ee611641709=
610d2e4dc90ba9acf37 https://dev.gnupg.org/rC5afadba008918d651afefb842ae123c=
c18454c74]
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - cipher/Makefile.am | 2 +-
> - random/Makefile.am | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/cipher/Makefile.am b/cipher/Makefile.am
> -index 2c39586e..a914ed2b 100644
> ---- a/cipher/Makefile.am
> -+++ b/cipher/Makefile.am
> -@@ -168,7 +168,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
> -=20
> -=20
> - if ENABLE_O_FLAG_MUNGING
> --o_flag_munging =3D sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast=
/-O1/g'
> -+o_flag_munging =3D sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g=
' -e 's/[[:blank:]]-Ofast/ -O1 /g'
> - else
> - o_flag_munging =3D cat
> - endif
> -diff --git a/random/Makefile.am b/random/Makefile.am
> -index 0c935a05..340df38a 100644
> ---- a/random/Makefile.am
> -+++ b/random/Makefile.am
> -@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-bas=
e-user.h
> -=20
> - # The rndjent module needs to be compiled without optimization.  */
> - if ENABLE_O_FLAG_MUNGING
> --o_flag_munging =3D sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-Ofas=
t/-O0/g'
> -+o_flag_munging =3D sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /g=
' -e 's/[[:blank:]]-Ofast/ -O0 /g'
> - else
> - o_flag_munging =3D cat
> - endif
> ---=20
> -2.44.1
> -
> diff --git a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-buil=
ding-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/f=
iles/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
> new file mode 100644
> index 0000000000..d1b82ec11e
> --- /dev/null
> +++ b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-er=
ror-with-O2-in-sysroot-path.patch
> @@ -0,0 +1,49 @@
> +From e96df0c82e086bf348753d2d0fa37fa6191b4b14 Mon Sep 17 00:00:00 2001
> +From: "simit.ghane" <simit.ghane@lge.com>
> +Date: Tue, 11 Jun 2024 07:22:28 +0530
> +Subject: [PATCH] random:cipher: handle substitution in sed command

Can you name the patch file something related to its title? Here name
and title are really different and this is confusing.

> +
> +Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3D=
libgcrypt.git;a=3Dcommit;h=3De96df0c82e086bf348753d2d0fa37fa6191b4b14]

The URL does not work for me.
You can use the official mirror:
https://github.com/gpg/libgcrypt/commit/e96df0c82e086bf348753d2d0fa37fa6191=
b4b14

> +
> +* cipher/Makefile.am (o_flag_munging): Add 'g' flag for first sed
> +expression.
> +* random/Makefile.am (o_flag_munging): Likewise.
> +--
> +
> +It was there earlier and accidentally removed from
> +Makefile.am of cipher and random
> +
> +Signed-off-by: simit.ghane <simit.ghane@lge.com>
> +[jk: add changelog to commit message]
> +Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>

This patch needs your signed-off-by.
> +---
> + cipher/Makefile.am | 2 +-
> + random/Makefile.am | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/cipher/Makefile.am b/cipher/Makefile.am
> +index ea9014cc98..149c9f2101 100644
> +--- a/cipher/Makefile.am
> ++++ b/cipher/Makefile.am
> +@@ -169,7 +169,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
> +=20
> +=20
> + if ENABLE_O_FLAG_MUNGING
> +-o_flag_munging =3D sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /'=
 -e 's/[[:blank:]]-Ofast/ -O1 /g'
> ++o_flag_munging =3D sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g=
' -e 's/[[:blank:]]-Ofast/ -O1 /g'
> + else
> + o_flag_munging =3D cat
> + endif
> +diff --git a/random/Makefile.am b/random/Makefile.am
> +index c7100ef8b8..a42e430649 100644
> +--- a/random/Makefile.am
> ++++ b/random/Makefile.am
> +@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-bas=
e-user.h
> +=20
> + # The rndjent module needs to be compiled without optimization.  */
> + if ENABLE_O_FLAG_MUNGING
> +-o_flag_munging =3D sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O0 /'=
 -e 's/[[:blank:]]-Ofast/ -O0 /g'
> ++o_flag_munging =3D sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O0 /g=
' -e 's/[[:blank:]]-Ofast/ -O0 /g'
> + else
> + o_flag_munging =3D cat
> + endif
> diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/re=
cipes-support/libgcrypt/libgcrypt_1.10.4.bb
> similarity index 92%
> rename from meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
> rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
> index 3d49d586bb..a887dc355e 100644
> --- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
> +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
> @@ -25,9 +25,9 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.=
tar.bz2 \
>             file://no-native-gpg-error.patch \
>             file://no-bench-slope.patch \
>             file://run-ptest \
> -           file://0001-Fix-building-error-with-O2-in-sysroot-path.patch =
\
> +           file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-p=
ath.patch \
>             "
> -SRC_URI[sha256sum] =3D "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60a=
f2a9eadc2a3272aa"
> +SRC_URI[sha256sum] =3D "d6d2f835a79711ceba54b53d1081d388d24fb0341d79a268=
a6557e12908a90a0"
> =20
>  BINCONFIG =3D "${bindir}/libgcrypt-config"
> =20

Regards,
--=20
Yoann Congal
Smile ECS


