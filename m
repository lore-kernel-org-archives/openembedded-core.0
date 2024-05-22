Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA78C25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 20:00:46 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.297.1716408036142722072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 13:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q+JDLiz0;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2454156db8bso2687977fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 13:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716408035; x=1717012835; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GK96bTcySBXJWrl0b4BEgVMpbpkk8ZeD8W1lF+BLqPI=;
        b=Q+JDLiz0L8gOeS8Xgueqhpi+ioAKkowSCuQ44LgBwP06mb7ko37KUhPCi+klUle1Ep
         PBzYcCmUC6njQocEvUC5H4PqM8eVoJmPZO43E8u79jctUUGIPY6djNi2LXEoYYF1DNgK
         rQ0e/LKWbwVObYrjkoJyVxlCHIrDETlmpyydBtxheR/ySNQ3GvrqfJdbE9e/GWZxEfKa
         S/BNEVCAl7tJO3hIwM4gUmjXgb4ENDXw5lOYcUMrYoIAM5ya0IfD3ZlRgga6B7+48kS0
         GqnZMkNPlApCNUkoAn5cvAByFHhh+YPpqX/mf20NJG1qGaspMWSBLRgHlboOhtr/01Tx
         Uoqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716408035; x=1717012835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GK96bTcySBXJWrl0b4BEgVMpbpkk8ZeD8W1lF+BLqPI=;
        b=smsJ8jmlupx7UqvTai5HrCJY9kTdiOdysRFt3JFZnrPk8wPvRCmbzjdeoQwOQu4lGS
         eSy9ISR1EprXIvilcOKWagpNaPTci48m1n7xVy5pbBC0QETNhpMcc6eaKzNobeAbdZYF
         irB/fKUtxg//QwYJDcg+jGK2xnl16F/C54+dHM9kTiisBk02Xgeoe2pbsUcvoC0yOX6u
         2EfgQ94QZCkS373IxZBLhpwM0WzG9Lvc2Y2lYCtRkMV5Da9j4nPCFa3LuxDtdXTLtwsj
         md2PKoaznNvIFsyt74oiWWfyD1t6MCDIJ1sPrjtu60LfNKHJSieOYowtF5L5pl1aT0bZ
         FpEQ==
X-Gm-Message-State: AOJu0Yzb1sCtZ3raRwiYtnfEXIDSanxc9miPHjLgI8qEm7cxaTCDOggN
	y3RroZ6bD6/xl2/6b6v4j6PGMXoTNWd0rT0QlZF5S/6N0KgziQLsJVbNwsK9CkQEPIdSLCn9PWO
	gKMuJeXtZXgn+ljtuYwIP81bdxR4t/RlSUsQ=
X-Google-Smtp-Source: AGHT+IGqlPmBYGwgBtzK2bYMCn4U11RMrTD3T/hvXo1GINxzMQ80T8DQ7IzjcwmCVUaYXUt9TcHpAReNqHy4gYf7I14=
X-Received: by 2002:a05:6870:8a29:b0:24c:6861:2224 with SMTP id
 586e51a60fabf-24c68d6dff0mr3474415fac.15.1716408035255; Wed, 22 May 2024
 13:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240522090350.2513076-1-martin@geanix.com> <20240522090350.2513076-2-martin@geanix.com>
In-Reply-To: <20240522090350.2513076-2-martin@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2024 13:00:09 -0700
Message-ID: <CAMKF1sqRHr44cQmZrt4O6qgThu6QmYz1acnLj1nXZ8Da=vOp8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] ofono: upgrade 2.4 -> 2.7
To: martin@geanix.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 20:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199766

lgtm

On Wed, May 22, 2024 at 2:04=E2=80=AFAM Martin Hundeb?ll via
lists.openembedded.org <martin=3Dgeanix.com@lists.openembedded.org>
wrote:
>
> Remove 0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch as
> TEMP_FAILURE_RETRY usage has been removed in upstream commit 765c6655
> ("treewide: Use L_TFR macro").
>
> Remove 0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
> as likely()/unlikely() has been removed in upstream commit dbbbebf9
> ("mbimmodem: Remove usage of likely and unlikely").
>
> Remove the do_configure:prepend() that purges the bundled ell directory,
> as it isn't needed when passing --enable-external-ell in EXTRA_OECONF.
>
> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> ---
>  ...tional-TEMP_FAILURE_RETRY-macro-copy.patch | 36 -------------------
>  ...ith-ell-0.39-by-restoring-unlikely-m.patch | 28 ---------------
>  .../ofono/{ofono_2.4.bb =3D> ofono_2.7.bb}      |  9 +----
>  3 files changed, 1 insertion(+), 72 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/ofono/ofono/0001-mbim-add-a=
n-optional-TEMP_FAILURE_RETRY-macro-copy.patch
>  delete mode 100644 meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-b=
uild-with-ell-0.39-by-restoring-unlikely-m.patch
>  rename meta/recipes-connectivity/ofono/{ofono_2.4.bb =3D> ofono_2.7.bb} =
(82%)
>
> diff --git a/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optio=
nal-TEMP_FAILURE_RETRY-macro-copy.patch b/meta/recipes-connectivity/ofono/o=
fono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
> deleted file mode 100644
> index 8a5a300adc..0000000000
> --- a/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEM=
P_FAILURE_RETRY-macro-copy.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 22b52db4842611ac31a356f023fc09595384e2ad Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 23 May 2019 18:11:22 -0700
> -Subject: [PATCH] mbim: add an optional TEMP_FAILURE_RETRY macro copy
> -
> -Fixes build on musl which does not provide this macro
> -
> -Upstream-Status: Submitted [https://lists.ofono.org/pipermail/ofono/2019=
-May/019370.html]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - drivers/mbimmodem/mbim-private.h | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/drivers/mbimmodem/mbim-private.h b/drivers/mbimmodem/mbim-p=
rivate.h
> -index e159235..51693ea 100644
> ---- a/drivers/mbimmodem/mbim-private.h
> -+++ b/drivers/mbimmodem/mbim-private.h
> -@@ -21,6 +21,15 @@
> -
> - #define align_len(len, boundary) (((len)+(boundary)-1) & ~((boundary)-1=
))
> -
> -+#ifndef TEMP_FAILURE_RETRY
> -+#define TEMP_FAILURE_RETRY(expression) ({     \
> -+  __typeof(expression) __result;              \
> -+  do {                                        \
> -+    __result =3D (expression);                  \
> -+  } while (__result =3D=3D -1 && errno =3D=3D EINTR); \
> -+  __result; })
> -+#endif
> -+
> - enum mbim_control_message {
> -       MBIM_OPEN_MSG =3D 0x1,
> -       MBIM_CLOSE_MSG =3D 0x2,
> ---
> -2.21.0
> -
> diff --git a/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-wi=
th-ell-0.39-by-restoring-unlikely-m.patch b/meta/recipes-connectivity/ofono=
/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
> deleted file mode 100644
> index 3655b3fd66..0000000000
> --- a/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-=
0.39-by-restoring-unlikely-m.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 76e4054801350ebd4a44057379431a33d460ad0f Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Wed, 21 Apr 2021 11:01:34 +0000
> -Subject: [PATCH] mbim: Fix build with ell-0.39 by restoring unlikely mac=
ro
> - from ell/util.h
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - drivers/mbimmodem/mbim-private.h | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/drivers/mbimmodem/mbim-private.h b/drivers/mbimmodem/mbim-p=
rivate.h
> -index 51693eae..d917312c 100644
> ---- a/drivers/mbimmodem/mbim-private.h
> -+++ b/drivers/mbimmodem/mbim-private.h
> -@@ -30,6 +30,10 @@
> -   __result; })
> - #endif
> -
> -+/* used to be part of ell/util.h before 0.39:
> -+   https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=3D2a68242=
1b06e41c45098217a686157f576847021 */
> -+#define unlikely(x) __builtin_expect(!!(x), 0)
> -+
> - enum mbim_control_message {
> -       MBIM_OPEN_MSG =3D 0x1,
> -       MBIM_CLOSE_MSG =3D 0x2,
> diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb b/meta/recipes-=
connectivity/ofono/ofono_2.7.bb
> similarity index 82%
> rename from meta/recipes-connectivity/ofono/ofono_2.4.bb
> rename to meta/recipes-connectivity/ofono/ofono_2.7.bb
> index 5e1e5f3b6a..bc1f3efd04 100644
> --- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
> +++ b/meta/recipes-connectivity/ofono/ofono_2.7.bb
> @@ -10,10 +10,8 @@ DEPENDS =3D "dbus glib-2.0 udev mobile-broadband-provi=
der-info ell"
>  SRC_URI =3D "\
>      ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>      file://ofono \
> -    file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch=
 \
> -    file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.pat=
ch \
>  "
> -SRC_URI[sha256sum] =3D "93580adc1afd1890dc516efb069de0c5cdfef014415256dd=
fb28ab172df2d11d"
> +SRC_URI[sha256sum] =3D "dabf6ef06b94beaad65253200abe3887046a4e722f4fe373=
c4264f357ae47ad3"
>
>  inherit autotools pkgconfig update-rc.d systemd gobject-introspection-da=
ta
>
> @@ -30,11 +28,6 @@ PACKAGECONFIG[bluez] =3D "--enable-bluetooth, --disabl=
e-bluetooth, bluez5"
>
>  EXTRA_OECONF +=3D "--enable-test --enable-external-ell"
>
> -do_configure:prepend() {
> -    bbnote "Removing bundled ell from ${S}/ell to prevent including it"
> -    rm -rf ${S}/ell
> -}
> -
>  do_install:append() {
>      install -d ${D}${sysconfdir}/init.d/
>      install -m 0755 ${UNPACKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199693): https://lists.openembedded.org/g/openembedde=
d-core/message/199693
> Mute This Topic: https://lists.openembedded.org/mt/106239535/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

