Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03909C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 17:49:39 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.20655.1715881776177468310
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 10:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=doOVSOvb;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-23f02e15fd6so412046fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 10:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715881775; x=1716486575; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7KzMek+rR0O4hRFsfrM82ICJowh3WXAj23hhUw2jlE=;
        b=doOVSOvbR7/VvO7DRZJG8BnTOoKyA+s8jo5vqYZ0jj7a5+D0wKfOSEnFKehRzxlOr5
         Kmf72jxbUP2jRmh3HSj1Ux6BhvREV+cvd5B073VrsmGd8DoIN244Dijby7YrTE+mdvgB
         /cbSBQSOENvFRPewvCaacMu/wTKmD17GcoFCpAGEjR54f2EK5LVc0zH43bCjZTSARLW2
         h9t8OU6ap/idCOGVqxFb5PtCJCqS3SnrF1Chft8uJDdicYK3vLrEeYUUyt8gpUDqlu5T
         icvPB+ie116uG0b3r/+koWRHebJjzEjtSzKUwQJ/KDnbrE6DIl+EHxrI11CIgGNjQ+YO
         UVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715881775; x=1716486575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7KzMek+rR0O4hRFsfrM82ICJowh3WXAj23hhUw2jlE=;
        b=BqVy/zUybbouDCeNsiPlFhiX7CV3AIWmsR0DrL7SyDyQgr+zNgjJafWYa76X0u1FuB
         Ckj4Zfu01iPI7/TL309Ooa3U8kp8q9OiAB74C/oFBvJvoVKiTYmTwWbBZbNfMRzi2Rbv
         JjbB9U7gVvsGfadbqd78n6Y3PJiAo10pSGMkZ4ckODeBQ258bBo2L6FaKXx37HVy9BQ/
         qgdoUUu6unzlFrZ/2Q/D2mK7vubel5ipWTIFLnj3OYwhm4dLXhGHOJwKufJdxr1CUrpa
         ZfWlitmppyeLVIBWYULQEmE1pakqVfT9qc4YumKq2eZs5/oZA5ff48mhwKdN8m0KGmOl
         rSdw==
X-Gm-Message-State: AOJu0YzgiCofXgm7rEXKGfQecCFLj+IJ0PqWIYO8Ryifjafz++QAV/7u
	mLG7qr2vMTApTJIeZiydd6HHrb/PWROy10AYcx/D1/IGLCCB6xonrQ15AJMaBCDEQd7KRu5Umtk
	RCNTJu7wqmLISQ7hQVCouBgHuf/dJZrc5Uq+t1Q==
X-Google-Smtp-Source: AGHT+IFi3LwZOrB2rGJiDKFcRvIraG5euhVwSLj56ZHPQHGn1JBokyduoVbOJm3geLNZzd221yf9ew8gcO1s6r5SBR8=
X-Received: by 2002:a05:6870:7d87:b0:23b:e418:d967 with SMTP id
 586e51a60fabf-24172a4511cmr21758579fac.12.1715881775223; Thu, 16 May 2024
 10:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240516112640.2145789-1-alex.kanavin@gmail.com> <20240516112640.2145789-10-alex.kanavin@gmail.com>
In-Reply-To: <20240516112640.2145789-10-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 May 2024 10:49:08 -0700
Message-ID: <CAMKF1soJA5FODZij4DsDzGv7M_pnxo3jX5gaQaKiWJc9410WbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/13] iptables: remove unneeded 0002-iptables-xshared.h-add-missing-sys.types.h-include.patch
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 17:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199495

On Thu, May 16, 2024 at 4:27=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> Somewhere on the way it ceased to be necessary.

Thats due it being applied upstream [1] so mentioning that is perhaps
going to qualify this a bit more.

[1] https://git.netfilter.org/iptables/commit/iptables/xshared.h?id=3Df3193=
89525b066b7dc6d389c88f16a0df3b8f189

>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...ed.h-add-missing-sys.types.h-include.patch | 31 -------------------
>  .../iptables/iptables_1.8.10.bb               |  1 -
>  2 files changed, 32 deletions(-)
>  delete mode 100644 meta/recipes-extended/iptables/iptables/0002-iptables=
-xshared.h-add-missing-sys.types.h-include.patch
>
> diff --git a/meta/recipes-extended/iptables/iptables/0002-iptables-xshare=
d.h-add-missing-sys.types.h-include.patch b/meta/recipes-extended/iptables/=
iptables/0002-iptables-xshared.h-add-missing-sys.types.h-include.patch
> deleted file mode 100644
> index a190c7e8ae2..00000000000
> --- a/meta/recipes-extended/iptables/iptables/0002-iptables-xshared.h-add=
-missing-sys.types.h-include.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 465e3ef77f1763d225adc76220e43ee9bd73b178 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Tue, 17 May 2022 10:56:59 +0200
> -Subject: [PATCH] iptables/xshared.h: add missing sys.types.h include
> -
> -This resolves the build error under musl:
> -
> -| ../../../../../../../workspace/sources/iptables/iptables/xshared.h:83:=
56: error: unknown type name 'u_int16_t'; did you mean 'uint16_t'?
> -|    83 | set_option(unsigned int *options, unsigned int option, u_int16=
_t *invflg,
> -|       |                                                        ^~~~~~~=
~~
> -|       |                                                        uint16_=
t
> -
> -Upstream-Status: Submitted [via email to phil@nwl.cc]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> -
> ----
> - iptables/xshared.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/iptables/xshared.h b/iptables/xshared.h
> -index a200e0d..f543dbf 100644
> ---- a/iptables/xshared.h
> -+++ b/iptables/xshared.h
> -@@ -6,6 +6,7 @@
> - #include <stdint.h>
> - #include <netinet/in.h>
> - #include <net/if.h>
> -+#include <sys/types.h>
> - #include <linux/netfilter_arp/arp_tables.h>
> - #include <linux/netfilter_ipv4/ip_tables.h>
> - #include <linux/netfilter_ipv6/ip6_tables.h>
> diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/rec=
ipes-extended/iptables/iptables_1.8.10.bb
> index 5a878977425..cbd727b75df 100644
> --- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
> +++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "http://netfilter.org/projects/iptables/fil=
es/iptables-${PV}.tar.xz \
>             file://ip6tables.service \
>             file://ip6tables.rules \
>             file://0001-configure-Add-option-to-enable-disable-libnfnetli=
nk.patch \
> -           file://0002-iptables-xshared.h-add-missing-sys.types.h-includ=
e.patch \
>             file://0004-configure.ac-only-check-conntrack-when-libnfnetli=
nk-.patch \
>             "
>  SRC_URI[sha256sum] =3D "5cc255c189356e317d070755ce9371eb63a1b783c34498fb=
8c30264f3cc59c9c"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199477): https://lists.openembedded.org/g/openembedde=
d-core/message/199477
> Mute This Topic: https://lists.openembedded.org/mt/106132526/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

