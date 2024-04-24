Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AA4C19F53
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.11718.1713948177341535100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=slJjiDyQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948178; x=1745484178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=f0coNvHIi3qZpJyQey56PvfS+7bZVEq74s0VxPeHzTk=;
  b=slJjiDyQjJnJc4VVLLHjV6b464Cr4DJetf9Ciq0FRi7jaOAU36Au5lwd
   fFAKTy29uxuszgXrbyTrlbER+LwbHKKavRErEHBw5YCH/7yhmtx/y24wP
   rkEru84T1hlXOZxKO/dVU0HfrWfpj8XfMr5IDKBcb8KrnF0r1VHPiQ9eT
   Y9WowWHCxwffELyEWO0JruOXwmSzQJ8zcVsRMrrf72jb7VE+h4liZWavS
   x2hMZdcZuJXPUBCRQv4Gwl133eyNNVdzB0rq+/k2TpzCIVFufdiE+un1p
   V2Mds7mfAIhcQGW1MtsIMgUVgUJ0D895vNpfcnIICHM5sJ6RXX2Jg6yAQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="145017022"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="145017022"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:42:56 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EA40E8FBD
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 73B4CFD841
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 14B3C1EA822
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B0CCF1A000A;
	Wed, 24 Apr 2024 16:42:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/38] gdk-pixbuf: upgrade 2.42.10 -> 2.42.11
Date: Wed, 24 Apr 2024 16:42:00 +0800
Message-Id: <1713948152-13501-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10-4.804100-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/yY6MisxJraxHMVVFhl7NwvM0EE1cHlv0zHYW
	2eXId8+tljOU6zYcBrzPWDvaIc/b8zZg1dQoLUbWgvmNrsT46HJuchTq5J5u9KKs3HwKOdLa2d8
	mtRIRsUMkw8PwVHl/nwXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJRSLgSFq3TnjmyS5fP0Zp2SYpu
	G7kpoKR6ANl9QqNE6NuhsUugxdrYkhYREeQEM9STllFsU0CXSPaZATGA5/BXhyURnQQNo5iPhTW
	E9k4RmGMOWMz759+cn74dqkeIuo4eetKiFEROy9zfqlpbtmcWhqp573tpzEI9wu4etvAeWWa7bP
	g6zgbaUX0jceDJtHITKHYLsR4q0LHxPMjOKY7A8LbigRnpKlKSBuGJWwgxAra7leoU/OMhO9QAo
	60pwfRZMRNDxMcTKNw8UPrm83yk7Mdlr1Ouo747nWOMCPTUpmQ02h+9NqaLOukv7gMttysKCgh2
	DCl6U0OtvyD7aWimEv/p7nrh2EI4K+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198651

From: Wang Mingyu <wangmy@fujitsu.com>

0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
fatal-loader.patch
refreshed for 2.42.11

Changelog:
===========
- Disable fringe loaders by default
- Introspection fixes
- Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...uild-allow-a-subset-of-tests-in-cross-compile.patch | 10 +++++-----
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch           |  7 +++----
 .../{gdk-pixbuf_2.42.10.bb => gdk-pixbuf_2.42.11.bb}   |  2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.10.bb => gdk-pixbuf_2.42.11.bb} (98%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
index 7250fa3f62..3d685db774 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
@@ -1,4 +1,4 @@
-From 9d3b374e75692da3d1d05344a1693c85a3098f47 Mon Sep 17 00:00:00 2001
+From 4bfb696fd125f044e3df9f6983c4ad518d9552c7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 26 Jan 2023 20:29:46 +0100
 Subject: [PATCH] meson.build: allow (a subset of) tests in cross compile
@@ -19,10 +19,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 9 insertions(+), 7 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 8a16c8f..7c8b20f 100644
+index 78f3683..e0feaee 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -369,10 +369,10 @@ subdir('gdk-pixbuf')
+@@ -390,10 +390,10 @@ subdir('gdk-pixbuf')
  # i18n
  subdir('po')
  
@@ -37,7 +37,7 @@ index 8a16c8f..7c8b20f 100644
  endif
  
 diff --git a/tests/meson.build b/tests/meson.build
-index 28c2525..c45e765 100644
+index 78d0ad9..0c9e64e 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -4,7 +4,7 @@
@@ -49,7 +49,7 @@ index 28c2525..c45e765 100644
    # Resources; we cannot use gnome.compile_resources() here, because we need to
    # override the environment in order to use the utilities we just built instead
    # of the system ones
-@@ -166,9 +166,11 @@ endif
+@@ -172,9 +172,11 @@ endif
  test_deps = gdk_pixbuf_deps + [ gdkpixbuf_dep, ]
  test_args = [ '-k' ]
  test_env = environment()
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index 23c68a0923..80c93e2166 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -1,4 +1,4 @@
-From b511bd1efb43ffc49c753e309717a242ec686ef1 Mon Sep 17 00:00:00 2001
+From 9b4f5738f8ac30f393b6163dcc84757976683d9b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 1 Apr 2014 17:23:36 +0100
 Subject: [PATCH] gdk-pixbuf: add an option so that loader errors are fatal
@@ -8,13 +8,12 @@ non-zero if the loader had errors (missing libraries, generally).
 
 Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/144]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  gdk-pixbuf/queryloaders.c | 19 +++++++++++++++----
  1 file changed, 15 insertions(+), 4 deletions(-)
 
 diff --git a/gdk-pixbuf/queryloaders.c b/gdk-pixbuf/queryloaders.c
-index 1d39b44..2b00815 100644
+index baa9a5c..9b6fa89 100644
 --- a/gdk-pixbuf/queryloaders.c
 +++ b/gdk-pixbuf/queryloaders.c
 @@ -216,7 +216,7 @@ write_loader_info (GString *contents, const char *path, GdkPixbufFormat *info)
@@ -77,7 +76,7 @@ index 1d39b44..2b00815 100644
                  }
                  g_free (cwd);
          }
-@@ -490,5 +498,8 @@ int main (int argc, char **argv)
+@@ -492,5 +500,8 @@ int main (int argc, char **argv)
  
          g_free (pixbuf_libdir);
  
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
similarity index 98%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
index cca89a9059..ef0f23f8f7 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
@@ -22,7 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
            "
 
-SRC_URI[sha256sum] = "ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b"
+SRC_URI[sha256sum] = "49dcb402388708647e8c321d56b6fb30f21e51e515d0c5a942268d23052a2f00"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package
 
-- 
2.34.1


