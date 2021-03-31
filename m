Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.7411.1617200568029464615
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 07:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=voQgxzE0;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617200566; i=@fujitsu.com;
	bh=WfN6ak2L7iY0yIeMNBlMr2Mir1gwxhJlQapMaF5Wa0Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=voQgxzE0FESBgkd5OZ2EBAh3hFlt0xF8lQqLVTfxa2GPgeRhCO4e/kvCydt6qRSeB
	 EAiE5ZJ1ALNgLY///9ZsOsejRDQjbIlUI9Ci5qJzGqeiaFRpOX2Kfjzqwb/SRnzgHv
	 HJ8zRmRZ0s4gIZZntkEq4gRnG/H8qVjjSiM+3IJz1S32Hya30GAheunMccugid9Bc7
	 gvEmvG9z8LXmrtOfMND+zr8s2oEzqctXoPNZNUPes7MSeMW5qbbmeDYn4oUNZklATQ
	 bl3G6EWLmwzPcM0Z8JvUEVvS7VcyGxGb4nj3TlTJq6SdFcdUilqd2g5PbNFSUh/CnB
	 6Qr05Y+1rxQeQ==
Received: from [100.113.1.157] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id BA/C8-55623-6B584606; Wed, 31 Mar 2021 14:22:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRoru1NSX
  B4OZ6NYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePmx7MsBUvEKibO3sHewLhduIuRi0NIYCuT
  xK1N05ggnBOMEpsXT2PvYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv3vASoQFrCRmL
  vzEDGKzCKhKHGm9ygJi8wo4SczaPo8RxJYQUJCY8vA9M0RcUOLkzCcsEHMkJA6+eMEMUaMoMf
  tyMwuEXSXR+eE42wRG3llIWmYhaVnAyLSK0TKpKDM9oyQ3MTNH19DAQNfQ0FjXUNfIyEwvsUo
  3US+1VDc5Na+kKBEoq5dYXqxXXJmbnJOil5dasokRGGAphYyPdjCefv1B7xCjJAeTkijvI/uU
  BCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvAtagHKCRanpqRVpmTnAYIdJS3DwKInwegADXoi3u
  CAxtzgzHSJ1ilFRSpxXDSQhAJLIKM2Da4NF2CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwr
  wbQbbzZOaVwE1/BbSYCWjxlUeJIItLEhFSUg1M0fed7+7s/yB4bN7ZGQKGh9fEbDPpD1z0hvW
  oQt6rPUseHj88cc+z6vzsmXUC6w3TjyUU7rz5wcDvbTvj2ns3/7PJrtDkCak7t+zHqReZAXVW
  jsF1UXayRhF5nn+ftuUsvRrYpaFzq/KhmPurRVeOHcr4X6B781f3xXNryh5948p0/vFzlf3Sy
  w8WVUs7CQR7NDzl8ORZMnFq5iF2xS3yJfZTNv82jpuVm2r/9oxI7iLTJVuuXtoY2ZNtUbbr4t
  mSVWEC8496qRl/FS+e+fHQJmU+za8sRfVf14gVpk8za9x8/ZhcmrbaK453Umy2GiU/jNXq8h/
  /emJu+zxWPjeSY1ndVv6QqVpsMeHXqz7aKrEUZyQaajEXFScCAPQZXQArAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-228.messagelabs.com!1617200565!399778!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21712 invoked from network); 31 Mar 2021 14:22:45 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-23.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Mar 2021 14:22:45 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12VEMdB4031942
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 15:22:44 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 31 Mar 2021 15:22:37 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] cairo: upgrade 1.16.0 -> 1.17.4
Date: Wed, 31 Mar 2021 22:22:24 +0800
Message-ID: <1617200547-62088-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

CVE-2018-19876.patch
removed since it is included in 1.17.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cairo/cairo/CVE-2018-19876.patch          | 34 -------------------
 .../{cairo_1.16.0.bb => cairo_1.17.4.bb}      |  7 ++--
 2 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
 rename meta/recipes-graphics/cairo/{cairo_1.16.0.bb => cairo_1.17.4.bb} (94%)

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch b/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
deleted file mode 100644
index 4252a5663b..0000000000
--- a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-CVE: CVE-2018-19876
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Mon, 19 Nov 2018 12:33:07 +0100
-Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available in
- cairo_ft_apply_variations
-
-Fixes a crash when using freetype >= 2.9
----
- src/cairo-ft-font.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
-index 325dd61b4..981973f78 100644
---- a/src/cairo-ft-font.c
-+++ b/src/cairo-ft-font.c
-@@ -2393,7 +2393,11 @@ skip:
- done:
-         free (coords);
-         free (current_coords);
-+#if HAVE_FT_DONE_MM_VAR
-+        FT_Done_MM_Var (face->glyph->library, ft_mm_var);
-+#else
-         free (ft_mm_var);
-+#endif
-     }
- }
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.17.4.bb
similarity index 94%
rename from meta/recipes-graphics/cairo/cairo_1.16.0.bb
rename to meta/recipes-graphics/cairo/cairo_1.17.4.bb
index 68f993d7ca..e92540c49e 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.17.4.bb
@@ -22,15 +22,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
 DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
 
-SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
+SRC_URI = "https://cairographics.org/snapshots/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
-           file://CVE-2018-19876.patch \
            file://CVE-2019-6461.patch \
            file://CVE-2019-6462.patch \
           "
 
-SRC_URI[md5sum] = "f19e0353828269c22bd72e271243a552"
-SRC_URI[sha256sum] = "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331"
+SRC_URI[md5sum] = "bf9d0d324ecbd350d0e9308125fa4ce0"
+SRC_URI[sha256sum] = "74b24c1ed436bbe87499179a3b27c43f4143b8676d8ad237a6fa787401959705"
 
 inherit autotools pkgconfig upstream-version-is-even gtk-doc multilib_script
 
-- 
2.25.1

