Return-Path: <kimoto@ohnolab.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661E4C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 22:50:32 +0000 (UTC)
Received: from tk2-229-24410.vs.sakura.ne.jp (tk2-229-24410.vs.sakura.ne.jp [160.16.107.164])
 by mx.groups.io with SMTP id smtpd.web10.564.1686610228770346691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 15:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: ohnolab.org, ip: 160.16.107.164, mailfrom: kimoto@ohnolab.org)
Received: from localhost (115.91.30.125.dy.iij4u.or.jp [125.30.91.115])
	by tk2-229-24410.vs.sakura.ne.jp (Postfix) with ESMTPA id 74ACB18207
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 07:50:26 +0900 (JST)
Date: Tue, 13 Jun 2023 07:50:26 +0900 (JST)
Message-Id: <20230613.075026.1966738183818033649.kimoto@ohnolab.org>
To: openembedded-core@lists.openembedded.org
Subject: Xwayland needs dependency to libtirpc
From: Masahiko KIMOTO <kimoto@ohnolab.org>
X-fingerprint: DA 63 E3 AD 3F 30 98 05  EB CF 3C 06 2D FF 07 7F
X-PGP-Public-Key: http://www.ohnolab.org/~kimoto/kimoto.pubkey.asc
X-URL: http://www.ohnolab.org/~kimoto/
X-Mailer: Mew version 6.9 on Emacs 28.2
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
 boundary="--Next_Part(Tue_Jun_13_07_50_26_2023_074)--"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 22:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182686

----Next_Part(Tue_Jun_13_07_50_26_2023_074)--
Content-Type: Text/Plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit

Hi all, I'm new to this list.

On kirkstone branch, xwayland needs DEPENDS to libtirpc.

As I checked, newer than kirkstone master branch, needs to add it to DEPENDS,
as like to kirkstone.

A small patch for kirkstone is attached in this mail.

Regards,

----------------------------------------------------------------------
木本 雅彦 /  Masahiko Kimoto, Ph.D.
E-mail: kimoto@ohnolab.org        URL: http://www.ohnolab.org/~kimoto


----Next_Part(Tue_Jun_13_07_50_26_2023_074)--
Content-Type: Text/X-Patch; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="kirkstone.xwayland.patch"

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 6919ba421b..dac0ae1fa2 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy libxcvt"
+DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy libxcvt libtirpc"
 
 OPENGL_PKGCONFIGS = "glx glamor dri3"
 PACKAGECONFIG ??= "${XORG_CRYPTO} \

----Next_Part(Tue_Jun_13_07_50_26_2023_074)----

