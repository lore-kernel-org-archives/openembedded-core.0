Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32279CD11DC
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:54 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7947.1711413465753686993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y0st2E21;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413465; x=1742949465;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SNbEQdSTZABlIVhGlwFZwqiwwFxvtZBrAuylTXEilG8=;
  b=Y0st2E21z0Csl99+2kzgZ+wslLUUgD4Vy63Nzh/rfErEJS8JENoDu81m
   ZLBNuFi9br3hkaiT/OMFYDzQ4b0lNR5Wu7dfj3F/CjzDq3nKiMbGFS+ic
   nXO/Y6tocQmPuyVEeNfzT3sPRlYtiksN4TIyBnNNRHmLDav9FJd8hovTm
   IKSaj71E1FGj/PCIe8cyIRHL4uAJIfYp1IPe28wc66HaM16Xik1osLhnA
   tUOHL0Rh46v3e2QWTWkIRCWqoS/0DgBR3p9eVioHgq4q5zmNVg8DSQ5yM
   D0UWAL0FyoYBk88UUeartrGigtRiWBDgEPcs0TFHMMyjNDPT/3ejixZ2z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="153607421"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="153607421"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:43 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 48623C21A3
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F450B3C99
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EA27A20097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 94E831A006D;
	Tue, 26 Mar 2024 08:37:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 32/34] vala: upgrade 0.56.15 -> 0.56.16
Date: Tue, 26 Mar 2024 08:34:50 +0800
Message-Id: <1711413292-3025-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--6.191700-10.000000
X-TMASE-MatchedRID: kfHlHSjlGDOjz0nOeth/yTo39wOA02LhQRlUSJjs8Z/9wRnyxuPjhF2U
	8mWN/+HoQT9vzU+7XYRuPZotjZgpNcOY7UMlS7FZA9lly13c/gEJlr1xKkE5uaShvRjfn4cU6+f
	8731wcoUILxoCYZ47qepe9co8GDkGZWMJGq5h2T4ReM8i8p3vgFK6+0HOVoSoNS9A3X1uuOBmeC
	LE2iu14AP6HuDcBX9qJW5y++JuLp2g8Wz8Kwv+n51U1lojafr/70GLyvzOg0wa81GEaPvT+nW2F
	wk1AVWLWMDF0fU26oYfOFn5hP1oL1Cxgcr0MiwG71Wx2uUbPLdC4sa7AidY08EguqiGeZ5Jo8WM
	kQWv6iUoTQl7wNH8PhjW9SH0EaRJ3QfwsVk0Ubv+efAnnZBiL8z+Ba7+nv3ul6jUbh4rnYAu2ek
	KysGdeE1agh49Zz6DMhuC4fW6JeZ+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197521

From: Wang Mingyu <wangmy@fujitsu.com>

0001-gtk4-Preserve-compatibility-with-4.14.patch
removed since it's included in 0.56.16

Changelog:
============
* Various improvements and bug fixes:
 - girparser: Recognize usage of time_t and don't rely on given GIR type
 - girparser: Recognize usage of off_t and don't rely on given GIR type
* Bindings:
 - gio-2.0: Restore ApplicationCommandLine.print*_literal() to not require 2.80
 - gmodule-2.0: Do not mark `Module.open` as deprecated
 - gtk4: Preserve compatibility with < 4.14 [#1531]
 - Regenerate for GIR-based bindings to pick up time_t fix (long vs time_t)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tk4-Preserve-compatibility-with-4.14.patch | 39 -------------------
 .../vala/{vala_0.56.15.bb => vala_0.56.16.bb} |  7 +---
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch
 rename meta/recipes-devtools/vala/{vala_0.56.15.bb => vala_0.56.16.bb} (92%)

diff --git a/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch b/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch
deleted file mode 100644
index 161474086e..0000000000
--- a/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 17349020fb95454d06f827fd555b05248f10a370 Mon Sep 17 00:00:00 2001
-From: Rico Tzschichholz <ricotz@ubuntu.com>
-Date: Thu, 7 Mar 2024 17:56:05 +0100
-Subject: [PATCH] gtk4: Preserve compatibility with < 4.14
-
-Don't prefer new accessor methods for Calendar.day/month/year
-
-Fixes https://gitlab.gnome.org/GNOME/vala/issues/1531
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/vala/-/commit/e0c4ea8c4a0bbf859b5341a7465b395892789d9e]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- vapi/gtk4.vapi                 | 3 +++
- vapi/metadata/Gtk-4.0.metadata | 5 +++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/vapi/gtk4.vapi b/vapi/gtk4.vapi
-index 49f8b2078..51ecea27d 100644
---- a/vapi/gtk4.vapi
-+++ b/vapi/gtk4.vapi
-@@ -7350,11 +7350,14 @@ namespace Gtk {
- 		[Version (since = "4.14")]
- 		public void set_year (int year);
- 		public void unmark_day (uint day);
-+		[NoAccessorMethod]
- 		public int day { get; set; }
-+		[NoAccessorMethod]
- 		public int month { get; set; }
- 		public bool show_day_names { get; set; }
- 		public bool show_heading { get; set; }
- 		public bool show_week_numbers { get; set; }
-+		[NoAccessorMethod]
- 		public int year { get; set; }
- 		public signal void day_selected ();
- 		public signal void next_month ();
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/vala/vala_0.56.15.bb b/meta/recipes-devtools/vala/vala_0.56.16.bb
similarity index 92%
rename from meta/recipes-devtools/vala/vala_0.56.15.bb
rename to meta/recipes-devtools/vala/vala_0.56.16.bb
index 915ddd8e4d..1c8e4fc673 100644
--- a/meta/recipes-devtools/vala/vala_0.56.15.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.16.bb
@@ -18,11 +18,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = " \
-	http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz \
-	file://0001-gtk4-Preserve-compatibility-with-4.14.patch \
-"
-SRC_URI[sha256sum] = "535b6452ed310fd5fb5c7dd6794b6213dac3b48e645e5bff3173741ec2cb3f2b"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
+SRC_URI[sha256sum] = "05487b5600f5d2f09e66a753cccd8f39c1bff9f148aea1b7774d505b9c8bca9b"
 
 inherit autotools pkgconfig upstream-version-is-even
 
-- 
2.34.1


