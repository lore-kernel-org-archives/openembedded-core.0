Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C41BEB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 19:47:12 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.278.1689882423408023947
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 12:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IxCLIR6j;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fb41682472so1863198e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 12:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689882421; x=1690487221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7PK91dv/ml+qciGkKCBnqh9BapIACCFDGz0DQyKONxQ=;
        b=IxCLIR6jhjqofDJZcNLDP+WkNulXE0CqeEjVoXsfkOVGW+hbjiLtVkWby4aeWhbYOo
         FrXlAsAh9DsmD7d7qD5Bg3GyPnR1nNtqyHac+rcOttPY0dk3AICpiWtKbsptjaF5fQUt
         jwULMRDotZmlQwNP0gwSZXGX4OKA/inIvEE2OyLZBRz78ISUgO0y3+Ya9CjtQno6LI+j
         99YIt+V2LAEwq5caVRXInQTbTCaiNkNJP32auz6sWeqhuanF9Wm01h6QXzQE5G3B86aX
         ig4YxwadfhlOOfAX3/MX00iwTmi8fdom8qzKF7TS7huRFqWDuGtDAWMyFj+TYbuzLWiE
         j+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689882421; x=1690487221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PK91dv/ml+qciGkKCBnqh9BapIACCFDGz0DQyKONxQ=;
        b=CmiBmnyeuvOfUe3CNHcqzK68T7WPdJtFmxVFh5WwycscjmD+DCOijBc/WCnpKoNlAk
         6nBqQxydFGDJ85qByi4UWXNlcwAzFcMFHyjAAu/a2/ak5EsO2vRHy24C0nfW4JOSq6hw
         Ba+5hwDpICyxAU+lqsfvs8y6HGMcz9+Boh0KAkG6jYNS6uOrjLiOOfI0jnxj1xWfu8jm
         aO6jzlayXKRG7K20xKy6VUyEPLF4mqT72bjL5vxixuX5YYr2rY8VDG+haS7pY1KjudOh
         eFVIZcP7Evbo8v9d/Z0RrgMpdzRmnm2/efmG6mc4xLHYXJ5hIBLkBztKfT84xXfvwtfG
         xa2Q==
X-Gm-Message-State: ABy/qLbO8J7vkEOsct9PnZ7m8R8Hu+38BiX0n5uZMKmExG2hXrRmw2Jf
	QktA5XYy18HDFwAqZY2XRjtbMGII6rP/hFLx9Ig=
X-Google-Smtp-Source: APBJJlE9aGQQQPswllEJj0n+ig3IskA7wj+IlICVSe4Su4vBKOzMv2rS+Mergqzm1oLo/V8vjSQMdru9XsvuDSUW7zM=
X-Received: by 2002:a19:7418:0:b0:4f7:3ee8:eede with SMTP id
 v24-20020a197418000000b004f73ee8eedemr2764370lfe.61.1689882421397; Thu, 20
 Jul 2023 12:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230720192620.1853222-1-tgamblin@baylibre.com>
In-Reply-To: <20230720192620.1853222-1-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Jul 2023 21:46:50 +0200
Message-ID: <CANNYZj91P7JLE_Gk0pGi6sJqZDfXo28SFw1W7e1faLTYP=6ZRQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] iproute2: upgrade 6.3.0 -> 6.4.0
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 19:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184657

Please do not add Pending patches, if they're not actually pending
anything. You should submit upstream ahead of submitting to oe-core.

Alex

On Thu, 20 Jul 2023 at 21:26, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
> Changelog: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/log/
>
> Added a patch for including limits.h with musl builds, or else
> we get failures such as:
>
> | mdb.c: In function 'mdb_parse_vni':
> | mdb.c:666:47: error: 'ULONG_MAX' undeclared (first use in this function)
> |   666 |         if ((endptr && *endptr) || vni_num == ULONG_MAX)
> |       |                                               ^~~~~~~~~
> | mdb.c:666:47: note: 'ULONG_MAX' is defined in header '<limits.h>'; did you forget to '#include <limits.h>'?
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../0001-bridge-mdb.c-include-limits.h.patch  | 31 +++++++++++++++++++
>  .../{iproute2_6.3.0.bb => iproute2_6.4.0.bb}  |  3 +-
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
>  rename meta/recipes-connectivity/iproute2/{iproute2_6.3.0.bb => iproute2_6.4.0.bb} (95%)
>
> diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
> new file mode 100644
> index 0000000000..0330163ae5
> --- /dev/null
> +++ b/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
> @@ -0,0 +1,31 @@
> +From 3d6fee6b55992d185f3af4f254b86ea1ac11acfe Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Thu, 20 Jul 2023 14:32:23 -0400
> +Subject: [PATCH] bridge/mdb.c: include limits.h
> +
> +Upstream-Status: Pending
> +
> +Based on
> +https://git.alpinelinux.org/aports/commit/main/iproute2/include.patch?id=bd46efb8a8da54948639cebcfa5b37bd608f1069,
> +but the author has no plans to submit it upstream.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + bridge/mdb.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/bridge/mdb.c b/bridge/mdb.c
> +index fbb4f704..18793458 100644
> +--- a/bridge/mdb.c
> ++++ b/bridge/mdb.c
> +@@ -15,6 +15,7 @@
> + #include <string.h>
> + #include <arpa/inet.h>
> + #include <netdb.h>
> ++#include <limits.h>
> +
> + #include "libnetlink.h"
> + #include "utils.h"
> +--
> +2.41.0
> +
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
> similarity index 95%
> rename from meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb
> rename to meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
> index 892fa854da..32e2f8176b 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
> @@ -13,9 +13,10 @@ DEPENDS = "flex-native bison-native iptables libcap"
>
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
>             file://0001-libc-compat.h-add-musl-workaround.patch \
> +           file://0001-bridge-mdb.c-include-limits.h.patch \
>             "
>
> -SRC_URI[sha256sum] = "dfb2a98db96e7a653cffc6693335a1a466e29a34b6ac528be48f35e1d2766732"
> +SRC_URI[sha256sum] = "4c51b8decbc7e4da159ffb066f590cfb93dbf9af7ff86b1647ce42b7c179a272"
>
>  inherit update-alternatives bash-completion pkgconfig
>
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184656): https://lists.openembedded.org/g/openembedded-core/message/184656
> Mute This Topic: https://lists.openembedded.org/mt/100263035/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

