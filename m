Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E54DCED60A
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:47 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.9170.1728452975624109127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q7UECWeE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452977; x=1759988977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GHPr1yS6+HRR/mV2DNF9V3W6QbPEQzmrLkZnIXCFyOQ=;
  b=q7UECWeEtSfD460oI3ZPHxwlJ1+J6QFj/XJpZxEEPxwp7hS4kPzKPjm4
   DU4pJ4PfeUmtbEGfGVq0JG72M1g07fYWfIGE4URyro6uQ7kgzL694I0Ms
   4kHTZwb8BzVRwD3oKueajo4Q56YTEMzW5dzAo41xHCYV6DOUt/EXXv3FT
   4AAD/gdxnpMsYQqAMFL23y9z44ThNC8Ibq6PjbVqXkDMX9NYdbES5xyYE
   Dykt+nKMC9Sy6mb1gowLxRjpvojHJ6koFs0zeQXJcqL/FKFAXIo+EhwoN
   0kg8EEMUTNvg+bH7AWmUF3NEyZfn3jDVI0yBFg7T6dHIMuyOKaGSpvCfB
   w==;
X-CSE-ConnectionGUID: YevbH70KQTqesXuDmo7u8g==
X-CSE-MsgGUID: STOctVXOQNGSecjGJc7aMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="176428857"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="176428857"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:35 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B754D7ADB
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E074ED5409
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E7D82007AA9F
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1BF951A000A;
	Wed,  9 Oct 2024 13:49:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/26] gtk4: upgrade 4.16.1 -> 4.16.3
Date: Wed,  9 Oct 2024 13:48:55 +0800
Message-Id: <1728452955-25051-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--2.735200-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytHpEd1UrzmFZmj
	18Axvjh0VWDscq6Sk6IR5Kqw8H4KuBeiahjHbAoOuLt50vtxBA4yhLY8urUHvpMO9zw5LuS4F6O
	OkTiGnXstZT/5LwCE7SIHu9kzTbO1v6perBgQquN448Ap117RgcasJhDgVSnqxuolijDY9YD7pZ
	fCNUN5NepQ4rsHyTSjxiiH+oQX+1Uu+/ZxS0sr+z9B1SHosSXQwTlc9CcHMZerwqxtE531VBWz3
	jZitQjNjtNFKLg6bv1IwYLI7vs59vWzx4I556Jg71Wx2uUbPLd9LQinZ4QefIWH8POvJNOWicIR
	or6615hXKaQsz6vtVMZW5ai5WKlyWRZG3msbzl2KBNsEpDt5U8/e0j2QGLbW3kICOYJY4EzSj51
	trn7nkluG18FWBm//5aZhDZ2Wl8HzrjGkbEajdiGk/0cOO3+5/r/b+dmSKFo6AH9/PcRd1xUpPR
	4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205316

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* GtkScrolledWindow
- Fix criticals in size allocation code
* GtkFileChooser
- Fix a crash in the portal code
* GtkPicture
 - Avoid unnecessary resizes
* GtkVideo
 - Make dmabufs work without GL
* Accessibility:
 - Always realized non-widget accessibles
* Wayland:
 - Improve settings portal handling
 - Improve fallback for cursor themes
 - Sync default values for settings with schema defaults
 - Be more careful with mimetypes during DND or copy-paste
* GtkLabel:
 - Fix centered text in RTL
* Gsk:
 - Speed up some Vulkan operations
 - Improve startup speed by avoiding initialization
   of GL and Vulkan in most cases
 - Reduce critials at startup to warnings
 - Fix a crash on startup with some Vulkan drivers
 - Fix a big texture leak in NGL
* Gdk:
 - Speed up memory format conversions
* Tools:
- builder-tool: Improve conversion of boxes
* Translation updates:
 Brazilian Portuguese
 Galician
 Swedish
 Bulgarian
 Catalan
 Chinese (China)
 Georgian
 German
 Hebrew
 Indonesian
 Persian
 Polish
 Portuguese
 Slovenian
 Spanish
 Turkish
 Ukrainian

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gtk+/{gtk4_4.16.1.bb => gtk4_4.16.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.16.1.bb => gtk4_4.16.3.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb b/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.16.1.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.16.3.bb
index 30b2b16a6f..b8dce36c0d 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb
@@ -38,7 +38,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "926a1eabd481f9bfa25538f95016fdfcfaf963b2f90b40ae69e90def5499215c"
+SRC_URI[sha256sum] = "2ec53e07d18c9f003b39e4a6a838054d9259e048b6c4c05d80c0d05aa721d944"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.34.1


