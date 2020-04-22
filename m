Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.87.1587556990592476277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 05:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,414,1580745600"; 
   d="scan'208";a="89494642"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Apr 2020 20:03:21 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id CEF3F4BCC887
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 19:52:43 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Apr 2020 20:03:19 +0800
Received: from localhost.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 22 Apr 2020 20:03:26 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] xorgproto: upgrade 2019.2 -> 2020.1
Date: Wed, 22 Apr 2020 13:02:58 -0700
Message-ID: <20200422200258.84579-4-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422200258.84579-1-wangmy@cn.fujitsu.com>
References: <20200422200258.84579-1-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: CEF3F4BCC887.A6F96
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

legacy.patch
removed since it is included in 2020.1

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xorg-proto/xorgproto/legacy.patch         | 97 -------------------
 ...orgproto_2019.2.bb => xorgproto_2020.1.bb} |  7 +-
 2 files changed, 3 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-proto/xorgproto/legacy.patch
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2019.2.bb => xorgproto_2020.1.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto/legacy.patch b/meta/recipes-graphics/xorg-proto/xorgproto/legacy.patch
deleted file mode 100644
index e25db04b9c..0000000000
--- a/meta/recipes-graphics/xorg-proto/xorgproto/legacy.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-These headers should be legacy to ensure autotools/meson intall the same files.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/proto/xorgproto/merge_requests/12]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/include/X11/extensions/meson.build b/include/X11/extensions/meson.build
-index 1d85cf8..d1ac281 100644
---- a/include/X11/extensions/meson.build
-+++ b/include/X11/extensions/meson.build
-@@ -65,8 +65,6 @@ install_headers(
-     'xf86dga.h',
-     'xf86dgaproto.h',
-     'xf86dgastr.h',
--    'xf86misc.h',
--    'xf86mscstr.h',
-     'xf86vm.h',
-     'xf86vmproto.h',
-     'xf86vmstr.h',
-@@ -85,13 +83,6 @@ install_headers(
-     'xtestext1const.h',
-     'xtestext1proto.h',
-     'xtestproto.h',
--    'xtrapbits.h',
--    'xtrapddmi.h',
--    'xtrapdi.h',
--    'xtrapemacros.h',
--    'xtraplib.h',
--    'xtraplibp.h',
--    'xtrapproto.h',
-     'Xv.h',
-     'XvMC.h',
-     'XvMCproto.h',
-@@ -113,7 +104,16 @@ if get_option('legacy') == true
-         'windowswmstr.h',
-         'xcalibrateproto.h',
-         'xcalibratewire.h',
-+        'xtrapbits.h',
-+        'xtrapddmi.h',
-+        'xtrapdi.h',
-+        'xtrapemacros.h',
-+        'xtraplib.h',
-+        'xtraplibp.h',
-+        'xtrapproto.h',
-         'Xeviestr.h',
-+        'xf86misc.h',
-+        'xf86mscstr.h',
-         'xf86rush.h',
-         'xf86rushstr.h',
-         'XKBgeom.h',
-diff --git a/include/X11/meson.build b/include/X11/meson.build
-index 1c33c64..a4b022e 100644
---- a/include/X11/meson.build
-+++ b/include/X11/meson.build
-@@ -59,4 +59,6 @@ install_headers(
- subdir('dri')
- subdir('extensions')
- subdir('fonts')
--subdir('PM')
-+if get_option('legacy') == true
-+    subdir('PM')
-+endif
-diff --git a/meson.build b/meson.build
-index cfbaa2c..68e622a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -42,18 +42,15 @@ pcs = [
-         ['renderproto',         '0.11.1'],
-         ['resourceproto',       '1.2.0'],
-         ['scrnsaverproto',      '1.2.2'],
--        ['trapproto',           '3.4.3'],
-         ['videoproto',          '2.3.3'],
-         ['xcmiscproto',         '1.2.2'],
-         ['xextproto',           '7.3.0'],
-         ['xf86bigfontproto',    '1.2.0'],
-         ['xf86dgaproto',        '2.1'],
-         ['xf86driproto',        '2.1.1'],
--        ['xf86miscproto',       '0.9.3'],
-         ['xf86vidmodeproto',    '2.3.1'],
-         ['xineramaproto',       '1.2.1'],
-         ['xproto',              '7.0.32'],
--        ['xproxymngproto',      '1.0.3'],
- ]
- 
- foreach pc : pcs
-@@ -78,9 +75,12 @@ if get_option('legacy') == true
-         ['fontcacheproto', '0.1.3'],
-         ['lg3dproto', '5.0'],
-         ['printproto', '1.0.5'],
-+        ['trapproto', '3.4.3'],
-         ['windowswmproto', '1.0.4'],
-         ['xcalibrateproto', '0.1.0'],
-+        ['xf86miscproto', '0.9.3'],
-         ['xf86rushproto', '1.2.2'],
-+        ['xproxymngproto', '1.0.3'],
-     ]
-     foreach pc : legacy_pcs
-         pkg.generate(
diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2019.2.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2019.2.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb
index c0785ccd64..c71bc9038f 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2019.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb
@@ -9,10 +9,9 @@ SECTION = "x11/libs"
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=b9e051107d5628966739a0b2e9b32676"
 
-SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.bz2 \
-           file://legacy.patch"
-SRC_URI[md5sum] = "a02dcaff48b4141b949ac99dfc344d86"
-SRC_URI[sha256sum] = "46ecd0156c561d41e8aa87ce79340910cdf38373b759e737fcbba5df508e7b8e"
+SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.bz2"
+SRC_URI[md5sum] = "c29f4fa78f53b52b3efdc71ebd9506b6"
+SRC_URI[sha256sum] = "54a153f139035a376c075845dd058049177212da94d7a9707cf9468367b699d2"
 
 inherit meson
 
-- 
2.17.1



