Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.8243.1611038795825494015
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: XKqHP5xwi0CFbyNwV4SbYeftah3uBogd0/pmwg6NT5v6YgOoAwbjvQYpj+mkS87vZiX4avKrpo
 ZoLsgN5oQezA==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035626"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035626"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:15 -0800
IronPort-SDR: tm2HxC8Z1EKAd+REUQoaoNE9dMYBR99zwAwGGZ1zpQxd1oUFeiDKfsIsavsGmhjO7D9NjD2zcx
 8nPrCuBA39RA==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441662"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:14 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/30] libepoxy: upgrade 1.5.4 -> 1.5.5
Date: Tue, 19 Jan 2021 14:45:36 +0800
Message-Id: <20210119064552.115692-14-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-dispatch_common.h-define-also-EGL_NO_X11.patch  | 9 +++++----
 .../libepoxy/{libepoxy_1.5.4.bb => libepoxy_1.5.5.bb}    | 3 +--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.5.4.bb => libepoxy_1.5.5.bb} (89%)

diff --git a/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch b/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
index 7262945181..971a3f54e0 100644
--- a/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
+++ b/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
@@ -1,4 +1,4 @@
-From 6f15cc28d17cfdd86f5974f06ad97b8afedd5627 Mon Sep 17 00:00:00 2001
+From 7211120d1e2f059d900f3379b9790484dbcf7761 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 25 Oct 2019 11:09:34 +0000
 Subject: [PATCH] dispatch_common.h: define also EGL_NO_X11
@@ -8,16 +8,17 @@ https://github.com/mesa3d/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Upstream-Status: Pending
+
 ---
  src/dispatch_common.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/dispatch_common.h b/src/dispatch_common.h
-index dcb3a35..c206253 100644
+index a136943..448c9b1 100644
 --- a/src/dispatch_common.h
 +++ b/src/dispatch_common.h
-@@ -52,6 +52,7 @@
-  * should do the same
+@@ -55,6 +55,7 @@
+  * as EGL_NO_X11
   */
  #  define MESA_EGL_NO_X11_HEADERS 1
 +#  define EGL_NO_X11 1
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb
similarity index 89%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb
index 6646ef79fe..a404fe2852 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb
@@ -12,8 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
            "
-SRC_URI[md5sum] = "00f47ad447321f9dc59f85bc1c9d0467"
-SRC_URI[sha256sum] = "0bd2cc681dfeffdef739cb29913f8c3caa47a88a451fd2bc6e606c02997289d2"
+SRC_URI[sha256sum] = "261663db21bcc1cc232b07ea683252ee6992982276536924271535875f5b0556"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
 inherit meson pkgconfig features_check
-- 
2.29.2

