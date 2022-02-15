Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752ECC433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 08:06:38 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web11.7020.1644912397603815718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 00:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PPSe5GlH;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id g15so9423592uap.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 00:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x9GBzmSyT8QHAbhNKfNInDOc6BLHYjeCbcZi12eZHoY=;
        b=PPSe5GlHik1W0BkYE/kLAWDG2IqN4QQ996WtNV2HxGesXKPMBEfA1c39sRD3WunaUs
         6vCekEiq1L0v08imVIa/mK7hBdH6dSUiFAYex9gWnm0iq5xtHeRt8klkGPMEEY7wJPzd
         zDQgTezsiIEK/fmyzrkqdjvYaApGSB85Wa7LOGur4O70YiPVMa4aTwkMex90aedNwYFq
         5/NVqHmLAxoFd43uvG4LF2xdwkTAG7QOx8c0uD2yKqBjuxUU+5kz6rVDlFY2fI8GhE7/
         hxmGNkkISGwebUDOpdn530aAXRfDMf3KAbEL073rDfzvMI7CLVafnijeLOkuljbntKfH
         JsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x9GBzmSyT8QHAbhNKfNInDOc6BLHYjeCbcZi12eZHoY=;
        b=cCDpktyi/60KHCNRYcC7g8VU9x0OmtOosB0QEnv1LxLg7+tOeNvFwCe1XGRK0pj5oy
         nyl8Jk8VhOZpQvBhiAoIz/E3f1cx+yRL8c2IltGScGZSsRkO9e9hXHyfL9pp3rxDmF2X
         ggWG/SiFHJ8FnBlFqXxc4950ip0cHGv1L3oQPNVlNj51B+CRNeOoO+zC8chQqOypyv0P
         vPzz8KoPG25oJ77NLt4JOMIqoH27xGSuc+AMJZce6A/rX+XDFx8hB0OVIQPSVSR/zZNW
         /krbFE1w8rukpwx2LnU63fY3DJTm43Oe1Dwd4MCemcDadCIG14FaTKOTor2KLEv+8SWV
         sdwQ==
X-Gm-Message-State: AOAM533Yv+Q1ubZi1BiUrR3OgnO1gMUcxbhRC4V3oeVmbk1cX6T13wlm
	77crF4sG/sRBVnafvfU2kRXCu3uqWup12HMigCc=
X-Google-Smtp-Source: 
 ABdhPJxszw27ntpP8gVgDo58BcnmfSr7SkhTKqxa5bwhjN+rK6idHkbalHAAbZSLIq5WRcjCwelSMy18IU/UtiqlsZA=
X-Received: by 2002:a05:6130:329:: with SMTP id
 ay41mr1069544uab.89.1644912396622;
 Tue, 15 Feb 2022 00:06:36 -0800 (PST)
MIME-Version: 1.0
References: <1644882876-4535-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1644882876-4535-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Feb 2022 09:06:25 +0100
Message-ID: 
 <CANNYZj8bsrsoVQOEZKt9-zL7TDGn7_jhd97vTQx51urrH2yhww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libhandy: upgrade 1.5.0 -> 1.5.90
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 08:06:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161742

I think this is a pre-release, and so cannot be taken. Upstream regex
needs to be set to exclude 9\d+ perhaps, can you do it? Here's how
it's set in other recipes:

Here's how it's done in fontconfig recipe, for example:
UPSTREAM_CHECK_REGEX = "fontconfig-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"

Alex

On Tue, 15 Feb 2022 at 00:54, wangmy <wangmy@fujitsu.com> wrote:
>
> 0001-Add-private-headers.patch
> removed since it's included in 1.5.90.
>
> Changelog:
> =========
> - Documentation
>   - Port to gi-docgen
>   - Use "Since: 1.0" for pre-1.0 symbols
>   - Various cleanups and consistency updates
> - Demo
>   - Fix keyboard navigation
>   - Don't make rows containing buttons activatable
>   - Set minimum width on the view switcher window
> - HdyCarousel
>   - Properly remove mouse wheel timer
> - HdyClamp
>   - Fix measuring
> - HdyKeypad
>   - Fix keyboard navigation
> - HdyStyleManager
>   - Properly reset animations after style changes
> - HdySwipeTracker
>   - Fix a runtime warning
> - HdyTabView
>   - Propagate Alt+[0-9] when trying to switch to the selected tab
> - HdyViewSwitcher
>   - Properly center button labels
> - Build and CI cleanups
> - Remove unused distro packaging
> - Translation updates:
>   - Czech
>   - Romanian
>   - Slovenian
>   - Spanish
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libhandy/0001-Add-private-headers.patch   | 37 -------------------
>  .../{libhandy_1.5.0.bb => libhandy_1.5.90.bb} |  6 +--
>  2 files changed, 2 insertions(+), 41 deletions(-)
>  delete mode 100644 meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
>  rename meta/recipes-gnome/libhandy/{libhandy_1.5.0.bb => libhandy_1.5.90.bb} (88%)
>
> diff --git a/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch b/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
> deleted file mode 100644
> index 7b2a512738..0000000000
> --- a/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From e7c3e8fa00f6a68b2e0629db5ee115e641ea710e Mon Sep 17 00:00:00 2001
> -From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Wed, 8 Dec 2021 07:35:52 +0000
> -Subject: [PATCH] Add private headers
> -
> -After the commit(8157ecc Separate public and private enums) introduced,
> -there comes a race as below:
> - | In file included from ../git/src/hdy-settings.c:11:
> - | ../git/src/hdy-settings-private.h:16:10: fatal error: hdy-enums-private.h: No such file or directory
> - |    16 | #include "hdy-enums-private.h"
> -
> -So also add private headers like private sources to libhandy_sources to
> -fix the issue.
> -
> -Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libhandy/-/merge_requests/796]
> -
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - src/meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/meson.build b/src/meson.build
> -index d087323..6f11f27 100644
> ---- a/src/meson.build
> -+++ b/src/meson.build
> -@@ -64,7 +64,7 @@ hdy_private_enums = gnome.mkenums('hdy-enums-private',
> - )
> -
> - libhandy_public_sources += [hdy_public_enums[0]]
> --libhandy_private_sources += [hdy_private_enums[0]]
> -+libhandy_private_sources += hdy_private_enums
> - libhandy_generated_headers += [hdy_public_enums[1]]
> -
> - src_headers = [
> ---
> -2.32.0
> -
> diff --git a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.5.90.bb
> similarity index 88%
> rename from meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
> rename to meta/recipes-gnome/libhandy/libhandy_1.5.90.bb
> index 605ef2b5fa..cb8abcee73 100644
> --- a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
> +++ b/meta/recipes-gnome/libhandy/libhandy_1.5.90.bb
> @@ -9,10 +9,8 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
> -SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master \
> -           file://0001-Add-private-headers.patch \
> -"
> -SRCREV = "8fa8306a79215fc6ebf2483145da98bf9b2495ab"
> +SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=main"
> +SRCREV = "c09c1503237dc719d91b52182fc4ab632cc390ad"
>  S = "${WORKDIR}/git"
>
>  GIR_MESON_ENABLE_FLAG = 'enabled'
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161735): https://lists.openembedded.org/g/openembedded-core/message/161735
> Mute This Topic: https://lists.openembedded.org/mt/89150438/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

