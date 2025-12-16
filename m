Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CF1D609AE
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 15:24:26 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25155.1765898657548437025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 07:24:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iQp+IA/U;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7cac8231d4eso3175052a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 07:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765898656; x=1766503456; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngVHUj4ESu1yYpAlyOUG6wMRYLf/xPocaejXohrcNSU=;
        b=iQp+IA/UO1UTCBaXLvzke/pDN/CY3TbzY4I1Mh+/QHbEmNB8upJpFqehLW3EmrceyS
         IRkrLj3Vty2uH9kRps6VcP3OvCDDB8B3axieJxSz3JVoOG4MKDnKlLpQXY3pgWLO5xrO
         R1vnF4Jjk8g2CWoUL568c1LmVH3GFSc5QIe53a8OVSUYRa48r+JInU7WtVM19V9NTmNO
         J7bPIZ0pD1GjAtItWGKFIC1TLvQ2Acu6pjvRml7Or3cO9tJdlHnYXlKnRhiG9YRB1jfA
         5u4EIUxiEqnem1/jn+SXGf6nJahdvaT/HXZubkJzR4P9WM7LPl7FhJxwgWziRPWe+9Hk
         hq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765898656; x=1766503456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngVHUj4ESu1yYpAlyOUG6wMRYLf/xPocaejXohrcNSU=;
        b=n7FfV3UB2ZAzPnrd0GaYNbh+zOvvEAKAaL7Eo7wi+FRL8OWEbeHi+wCrgkqxGac5N7
         4igMtHQnD21P50V2XKWRiFIYFClGypvhQPkGaoa4yyq1BgVz0I5mIK/sj1FAybSAw5NP
         Fp/tIJSjMMvO/XQhK7l9WGJQzNhMDMNtkV4j/V5LwSn5GdIXwnOqQfuDNPjnlFt2Q0mK
         Wu+je2JLVKNUFOJDHOhKimYkh6oN0id6NASiPCsw8zGnJLAmPm9F8euFKx7H6At6WP8V
         pAutAJ/iuDuw0TdduCuqjux2Is17XY4eXq3AZKnxOzoE0mL1++tqfyRbVDdnZ0SKZBcZ
         cNSQ==
X-Gm-Message-State: AOJu0Yy/uewwHjh9T/nMU6mZmzdqUQJz82+NzZrbGPsRpwGg3+jrfS4E
	yFRcpy7sWQssdsvaWIjlnm76lx7JWCZfblIu2I/R2QLY0iAp9GNFzawHduD92Hw5JIVWQEp31cf
	asVybpchaWRh1QJ3x0q1/oWmY7XIXOSI/x5mX
X-Gm-Gg: AY/fxX42GeQUxwKhKIBkAQVTcdHHSC0+3EArdgz5S1rv1phpbDXlaI9ewI2c5QfT29n
	3Axdz9xu32+cbt/Txv9QzhCO3Dy7kYC/fS8asNrL6Nn8HDFO2qhrW0P9EpHiz0oIps9rLR96kA1
	vceVaX5lwj/wiC80meG0hqaQANeUDK2EFgJTbHaMMVtkBWAIOyaCu3eAHfAOXNZBUfvoo3PZ8G+
	JEyqnTYm2jOOVWrKHNT6LLRorV7D1riGaH2z0pwJ8aM/Lv0uMru4XODECrYrCSiaHOf8RPRwjWy
	sF7XSrEk
X-Google-Smtp-Source: AGHT+IHvWOudKNMex+FIXjum2G7b+aa2XMm8DkvCgxZnLcBoWvp3Y3Z9mucz1DQJflUzeV1cXFK/jlfWq6GZD/VqJWY=
X-Received: by 2002:a05:6808:4f08:b0:43f:7e97:3983 with SMTP id
 5614622812f47-455ac9556d8mr5306354b6e.41.1765898656476; Tue, 16 Dec 2025
 07:24:16 -0800 (PST)
MIME-Version: 1.0
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com> <20251213095931.2571498-6-ankur.tyagi85@gmail.com>
In-Reply-To: <20251213095931.2571498-6-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 16 Dec 2025 20:54:05 +0530
X-Gm-Features: AQt7F2odGxNq4YKs3r8YPwB8R9Vymxl0NrI7icu6jPqK0cB7_r9x0C_s8w54jxY
Message-ID: <CADySD0FTCP_9_OEv+BHWOC1umqEH=ktX0FjKOHKNO-XRfujN_w@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 06/67] scdoc: Upgrade 1.11.3 -> 1.11.4
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227968

This patch doesn't bring any critical bug fix, hence can be dropped.

On Sat, Dec 13, 2025 at 3:29=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote:
>
> From: Alex Kiernan <alex.kiernan@gmail.com>
>
> Drop backport of 3667cce Makefile: drop -static
>
> Changes from 1.11.3:
>
>   Drew DeVault (4):
>       Makefile: drop -static
>       parse_preamble: remove useless branch
>       utf8_size: fix bug with array length
>       Update version to 1.11.4
>
>   Jason Lenz (2):
>       Fix unclosed indent at EOF
>       Fix make check permissions mask
>
>   Kirill Chibisov (1):
>       Emit \(ti and \(ha instead of ~ and ^
>
>   Nico Wagner (1):
>       Makefile: remove unnecessary path separator
>
>   Sertonix (1):
>       gmtime: handle failure
>
>   Viacheslav Kruglov (1):
>       Fix logical error in comparison with ULONG_MAX
>
>   elij (1):
>       strip indentation after a hard line break `++`
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> (cherry picked from commit d1a04bfb9506f00d658a58ac1671de57dfa487b8)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../scdoc/0001-Makefile-drop-static.patch     | 23 -------------------
>  .../{scdoc_1.11.3.bb =3D> scdoc_1.11.4.bb}      |  5 ++--
>  2 files changed, 2 insertions(+), 26 deletions(-)
>  delete mode 100644 meta/recipes-extended/scdoc/scdoc/0001-Makefile-drop-=
static.patch
>  rename meta/recipes-extended/scdoc/{scdoc_1.11.3.bb =3D> scdoc_1.11.4.bb=
} (82%)
>
> diff --git a/meta/recipes-extended/scdoc/scdoc/0001-Makefile-drop-static.=
patch b/meta/recipes-extended/scdoc/scdoc/0001-Makefile-drop-static.patch
> deleted file mode 100644
> index 631d06375b..0000000000
> --- a/meta/recipes-extended/scdoc/scdoc/0001-Makefile-drop-static.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -From 3667cced504bc40b176d4570d99a83fe67599f3a Mon Sep 17 00:00:00 2001
> -From: Drew DeVault <sir@cmpwn.com>
> -Date: Wed, 4 Sep 2024 10:07:46 +0200
> -Subject: [PATCH] Makefile: drop -static
> -
> -Upstream-Status: Backport [https://git.sr.ht/~sircmpwn/scdoc/commit/3667=
cced504bc40b176d4570d99a83fe67599f3a]
> -Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ----
> - Makefile | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 96ad48cd04a6..49f076aadd39 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -1,7 +1,6 @@
> - VERSION=3D1.11.3
> - CFLAGS?=3D-g
> - MAINFLAGS:=3D-DVERSION=3D'"$(VERSION)"' -Wall -Wextra -Werror -Wno-unus=
ed-parameter
> --LDFLAGS+=3D-static
> - INCLUDE+=3D-Iinclude
> - PREFIX?=3D/usr/local
> - BINDIR?=3D$(PREFIX)/bin
> diff --git a/meta/recipes-extended/scdoc/scdoc_1.11.3.bb b/meta/recipes-e=
xtended/scdoc/scdoc_1.11.4.bb
> similarity index 82%
> rename from meta/recipes-extended/scdoc/scdoc_1.11.3.bb
> rename to meta/recipes-extended/scdoc/scdoc_1.11.4.bb
> index 5f571c64dd..059150df46 100644
> --- a/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
> +++ b/meta/recipes-extended/scdoc/scdoc_1.11.4.bb
> @@ -6,9 +6,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D31752b4a8edd3f=
b9ddba1cb90fada74d"
>
>  DEPENDS =3D "scdoc-native"
>
> -SRC_URI =3D "git://git.sr.ht/~sircmpwn/scdoc;protocol=3Dhttps;branch=3Dm=
aster \
> -           file://0001-Makefile-drop-static.patch "
> -SRCREV =3D "0528bcb993cac6c412acd3ae2e09539e994c0a59"
> +SRC_URI =3D "git://git.sr.ht/~sircmpwn/scdoc;protocol=3Dhttps;branch=3Dm=
aster"
> +SRCREV =3D "70de0e5e5d3bc40134ee65c35f1631656199f4be"
>
>  do_install() {
>         oe_runmake 'DESTDIR=3D${D}' install

