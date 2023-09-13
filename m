Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871A4EE0200
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 17:51:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.3750.1694627476514506700
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 10:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G2G+buAx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so28299f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 10:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694627475; x=1695232275; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca8nL6knTILz6VzgxFBC2/F4lw+pKh7GJF88SrFoV2s=;
        b=G2G+buAxGqd2sOT54UMj5/ZCpmxcaOKvbSjf+9kiNdcagrR0+IHz1LUX5MPG3zGNka
         DpdYS5iOVjplYQYqGY7LM55yYVaX0g/an3+vEC0oRBtKHF1YluNMJRmPVZjhC2Gfp3Sr
         t3+2xTtqnu1y5sicKx7gLLxCPPP4WDxBWVn/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694627475; x=1695232275;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ca8nL6knTILz6VzgxFBC2/F4lw+pKh7GJF88SrFoV2s=;
        b=kChb3JTmEhjvwDnWdT6inlY7aDuSCB9Qj8HsEJOCbFB49HmqhoF9f9REwUC4vyuVC0
         63mIMXoiylDxyeNrRvcyS2WqalaOAN5v41Og6O6R3pPTRCgHYkUIx1ylvUfb2BzHrBBM
         SDyztF2En9q6AB9p7I4iGmg5YOalkeqiPyN05uAoWRGThNxXP9s/JHvzlLPOuE2myknW
         LlYr5hr/CD0Hgso1YS7jAS3eqLE1k1Kem99DJt08YxxBk0MoPCQMZIbXp+/izFR1KZKg
         5Jma7dU84XQVCbmVv74BoYqa5rPRKbhwOSaUXp5uZm/P2ZqF85M2n4A3MkfnAx5YAQBR
         AXSw==
X-Gm-Message-State: AOJu0YwAs0oke6++n20q99h8vFyzTDlzjPSmpma4LQl1Vu8K4mS3aOA3
	TjxdWae/3iWQONgTwaGfpogyNw==
X-Google-Smtp-Source: AGHT+IF7aTcWgMoUdD6xrg+k5ZSmvTL+wYKMRf9wg5B7rG3QyQM+re9E4qW3vV63R+vaa88dTV85Wg==
X-Received: by 2002:adf:ef4f:0:b0:314:1313:c3d6 with SMTP id c15-20020adfef4f000000b003141313c3d6mr2939155wrp.33.1694627474795;
        Wed, 13 Sep 2023 10:51:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a8:4888:9029:4207? ([2001:8b0:aba:5f3c:2a8:4888:9029:4207])
        by smtp.gmail.com with ESMTPSA id b8-20020adff248000000b0031c5b380291sm16160094wrp.110.2023.09.13.10.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 10:51:14 -0700 (PDT)
Message-ID: <af8bff3af564cc95476c53924dc99f8b4064b60b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] iproute2: upgrade 6.4.0 -> 6.5.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2023 18:51:13 +0100
In-Reply-To: <1694597512-21432-1-git-send-email-wangmy@fujitsu.com>
References: <1694597512-21432-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 17:51:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187621

On Wed, 2023-09-13 at 17:31 +0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> 0001-bridge-mdb.c-include-limits.h.patch
> removed since it's included in 6.5.0
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../0001-bridge-mdb.c-include-limits.h.patch  | 41 -------------------
>  .../{iproute2_6.4.0.bb =3D> iproute2_6.5.0.bb}  |  3 +-
>  2 files changed, 1 insertion(+), 43 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-brid=
ge-mdb.c-include-limits.h.patch
>  rename meta/recipes-connectivity/iproute2/{iproute2_6.4.0.bb =3D> iprout=
e2_6.5.0.bb} (95%)
>=20
> diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.=
c-include-limits.h.patch b/meta/recipes-connectivity/iproute2/iproute2/0001=
-bridge-mdb.c-include-limits.h.patch
> deleted file mode 100644
> index f9a0e35d83..0000000000
> --- a/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-inclu=
de-limits.h.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From b13f04c0c685b6d2474aa7d97e191531f327bc45 Mon Sep 17 00:00:00 2001
> -From: Trevor Gamblin <tgamblin@baylibre.com>
> -Date: Thu, 20 Jul 2023 14:32:23 -0400
> -Subject: [PATCH] bridge/mdb.c: include limits.h
> -
> -Upstream-Status: Submitted
> -(https://lore.kernel.org/netdev/20230720203726.2316251-1-tgamblin@baylib=
re.com/)
> -
> -While building iproute2 6.4.0 with musl using Yocto Project, errors such
> -as the following were encountered:
> -
> -| mdb.c: In function 'mdb_parse_vni':
> -| mdb.c:666:47: error: 'ULONG_MAX' undeclared (first use in this functio=
n)
> -|   666 |         if ((endptr && *endptr) || vni_num =3D=3D ULONG_MAX)
> -|       |                                               ^~~~~~~~~
> -| mdb.c:666:47: note: 'ULONG_MAX' is defined in header '<limits.h>'; did=
 you forget to '#include <limits.h>'?
> -
> -Include limits.h in bridge/mdb.c to fix this issue. This change is based
> -on one in Alpine Linux, but the author there had no plans to submit:
> -https://git.alpinelinux.org/aports/commit/main/iproute2/include.patch?id=
=3Dbd46efb8a8da54948639cebcfa5b37bd608f1069
> -
> -Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ----
> - bridge/mdb.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/bridge/mdb.c b/bridge/mdb.c
> -index fbb4f704..18793458 100644
> ---- a/bridge/mdb.c
> -+++ b/bridge/mdb.c
> -@@ -15,6 +15,7 @@
> - #include <string.h>
> - #include <arpa/inet.h>
> - #include <netdb.h>
> -+#include <limits.h>
> -=20
> - #include "libnetlink.h"
> - #include "utils.h"
> ---=20
> -2.41.0
> -
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb b/meta/=
recipes-connectivity/iproute2/iproute2_6.5.0.bb
> similarity index 95%
> rename from meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
> rename to meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb
> index 32e2f8176b..db46c8317a 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb
> @@ -13,10 +13,9 @@ DEPENDS =3D "flex-native bison-native iptables libcap"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
>             file://0001-libc-compat.h-add-musl-workaround.patch \
> -           file://0001-bridge-mdb.c-include-limits.h.patch \
>             "
> =20
> -SRC_URI[sha256sum] =3D "4c51b8decbc7e4da159ffb066f590cfb93dbf9af7ff86b16=
47ce42b7c179a272"
> +SRC_URI[sha256sum] =3D "a70179085fa1b96d3c33b040c809b75e2b57563adc505a4a=
d05e2609df373463"
> =20
>  inherit update-alternatives bash-completion pkgconfig

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/7663/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5055/ste=
ps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/7811/step=
s/17/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/7811/step=
s/23/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/7811/step=
s/26/logs/stdio

Cheers,

Richard

