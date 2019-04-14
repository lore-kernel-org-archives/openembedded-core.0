Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 773097D716
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 20:50:16 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id e5so12724896otk.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 13:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EFRqzAlU4rpaxO6xHelMFaoi1Zmpq2fiyPvG4qN3N+k=;
	b=ixxZat5bjOot7dINBA6CPL7QSAMuFwq78rVCPv8/oY5Z4pEz5vDJuAoQJlSdpU2Wf5
	lQ+TdI15V7dV4dnsKvsYQ3fqB62yTZYZ+BKBVmDwMUBLp2VkNPD4ygCAzoj69LpAVNbh
	7d2JIsLFtlfT/SiElBvaAtzhf3LbGCn0b8+f3ru7sMMZqGKnopQcGNiHTxAv6AFINRD+
	12eM8Rd0cBNvISXbxtZtgnyUNm5wk91pU1ZtQ4n3od5h8lH0/Ia6YVkZu9q46nx49bxm
	HuvfitGINJxriBuyit2aPHuUN5g4Qx4X9bzrIFjcbVP2wXWAVfyM7GiwwMMiy97EZlIH
	EEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EFRqzAlU4rpaxO6xHelMFaoi1Zmpq2fiyPvG4qN3N+k=;
	b=FOyUDZC4C6VYRLcET53KPPp8zHYqJZ4PkCrrToPx8vQxsCzWbhlI6j1kXd2jn89yUW
	C4ttOrE9zJG/jH+1B5cuSaqXMXb1aB/qWQrKCtpYNR0jnQi2xEBJIKHacwzMk5UBX/q4
	M9ji/P2SQyw2+3qDq24SY7/X8JeLPgoW0Rz0SCyqmGan91Ft5wH8HmmM+JN6yxVKEOMU
	qtY8Hzcd9kp+tN3UDRDkVnwqk8i5VfCa30giLQYjHeFG2wuQ+J43MLeAJ6EMGCZrJuT9
	vPTdnhaabECM2ALGC+VwSKoBLIizsfK0KBvT7vwBJXYRALUccY038l12/OcWfVtDjBu8
	phsQ==
X-Gm-Message-State: APjAAAVXhGdHC+5p8ute4o6nfmPKJgx7ic1/ltMDiNsFGAe/B9zZ1qNz
	inut2kCXfjUINGbCW6cIpzVd5OojXvFokCuY5+Y=
X-Google-Smtp-Source: APXvYqxC9MZXfmKDUi7JvRinHOAYBC4581NWZXYJ0y3XyBXRbaQzen0ZUcxtq5LT2ZncuoMn7VYXd22DVF5Ikfbxg/I=
X-Received: by 2002:a9d:62ca:: with SMTP id z10mr43045277otk.207.1555275017373;
	Sun, 14 Apr 2019 13:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <PSXP216MB02779B5E1647679FD48732E4DD2A0@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <PSXP216MB02779B5E1647679FD48732E4DD2A0@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 14 Apr 2019 22:50:01 +0200
Message-ID: <CANNYZj_a9LMBxngjFE8QU69UKwnWMUREjQPkpd-eQaC=CMswfg@mail.gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsoup: Upgrade from 2.64.2 to 2.66.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Apr 2019 20:50:16 -0000
Content-Type: text/plain; charset="UTF-8"

Why is a patch removed? That needs to be explained in the commit
message (unless it is an obvious backport which this isn't).

Alex

On Sun, 14 Apr 2019 at 22:10, Alistair Francis <alistair@alistair23.me> wrote:
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  ...no-introspection-when-cross-building.patch | 24 -------------------
>  ...up-2.4_2.64.2.bb => libsoup-2.4_2.66.1.bb} |  5 ++--
>  2 files changed, 2 insertions(+), 27 deletions(-)
>  delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
>  rename meta/recipes-support/libsoup/{libsoup-2.4_2.64.2.bb => libsoup-2.4_2.66.1.bb} (87%)
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
> deleted file mode 100644
> index 72b029a80b..0000000000
> --- a/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From 921888affe66953c92a08ae440e911b016b124be Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Fri, 15 Feb 2019 14:21:06 +0100
> -Subject: [PATCH] Do not enforce no-introspection when cross-building
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 5a92cda..cfb3520 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -262,7 +262,7 @@ enable_gnome = get_option('gnome') and host_machine.system() != 'windows'
> - #########################
> - # GObject introspection #
> - #########################
> --enable_introspection = get_option('introspection') and find_program('g-ir-scanner', required: false).found() and not meson.is_cross_build()
> -+enable_introspection = get_option('introspection') and find_program('g-ir-scanner', required: false).found()
> -
> - ############
> - # Vala API #
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.66.1.bb
> similarity index 87%
> rename from meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
> rename to meta/recipes-support/libsoup/libsoup-2.4_2.66.1.bb
> index b095397ec2..49f078a5de 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.66.1.bb
> @@ -10,10 +10,9 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native libpsl"
>  SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
>
>  SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
> -           file://0001-Do-not-enforce-no-introspection-when-cross-building.patch \
>             "
> -SRC_URI[md5sum] = "cac755dc6c6acd6e0c70007f547548f5"
> -SRC_URI[sha256sum] = "75ddc194a5b1d6f25033bb9d355f04bfe5c03e0e1c71ed0774104457b3a786c6"
> +SRC_URI[md5sum] = "5f04c09a06f6dbe4c4d3f003992145ce"
> +SRC_URI[sha256sum] = "4a2cb6c1174540af13661636035992c2b179dfcb39f4d3fa7bee3c7e355c43ff"
>
>  S = "${WORKDIR}/libsoup-${PV}"
>
> --
> 2.20.1
>

