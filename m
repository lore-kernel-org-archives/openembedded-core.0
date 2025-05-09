Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E395BC3ABCB
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:56:50 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.6637.1746763004431426861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jAChg93c;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763004; x=1778299004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WjfE9dmLPQ9HLwqnig0+qdAmWQElmPSk94iMHWkGP4s=;
  b=jAChg93c/py1r42dKeyj9xADoA/sNBj/g/kpRCWK9XgrpQG6gvHJzEkQ
   WsCaP9R0QWTWHkkFhT0Tp1zko4AwVPpRd96I1qTd0rhQJIDRgdIRl4xeF
   979AZorwK/w8oFvjhwpOkdXLQ/7FgaGdCgVh2ENQ9jtZVaHEYrW4XeQdz
   aHqXzGW+fIAp21SI2b255KYWoSGwifpOasaS3gx2Oc9qKNqNUBnvoQwQ+
   DI/c9UXCXlLjNhujbla1lBEhyV3q+rli+v/wU/QP69TRR5ZeJi5jfF/MW
   4Rzjm4nP47puX4xFKaVhl1l5o4P/g2sUdd1O0DIMUPj/SjyGi0O41N2VK
   g==;
X-CSE-ConnectionGUID: 8ION6DOHSGarsBkgLmzz0A==
X-CSE-MsgGUID: xcSCYC+oRMy0ugJ2xBexfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="198066271"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="198066271"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:56:42 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E72C9C2266
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A4F1F9E18A
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:39 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 310351A009A;
	Fri,  9 May 2025 11:56:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/19] gstreamer1.0-plugins-bad: upgrade 1.26.0 -> 1.26.1
Date: Fri,  9 May 2025 11:56:05 +0800
Message-Id: <1746762980-12783-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216167

From: Wang Mingyu <wangmy@fujitsu.com>

0001-backport-libatomic-issue-patch.patch
removed since it's included in 1.26.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-backport-libatomic-issue-patch.patch | 41 -------------------
 ....bb => gstreamer1.0-plugins-bad_1.26.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-backport-libatomic-issue-patch.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.0.bb => gstreamer1.0-plugins-bad_1.26.1.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-backport-libatomic-issue-patch.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-backport-libatomic-issue-patch.patch
deleted file mode 100644
index 7ac605fb65..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-backport-libatomic-issue-patch.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f8c802aa778804f02b30a191cd3bcce285023076 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@fujitsu.com>
-Date: Wed, 2 Apr 2025 09:47:41 +0000
-Subject: [PATCH] backport libatomic issue patch
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8637/commits?commit_id=f2b5c0b6020b50f5173e449b45a6f7a7be31c48f]
-
-Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
----
- gst-libs/gst/cuda/meson.build | 15 ++++++---------
- 1 file changed, 6 insertions(+), 9 deletions(-)
-
-diff --git a/gst-libs/gst/cuda/meson.build b/gst-libs/gst/cuda/meson.build
-index 3a25244..50ae027 100644
---- a/gst-libs/gst/cuda/meson.build
-+++ b/gst-libs/gst/cuda/meson.build
-@@ -48,15 +48,12 @@ if host_system not in ['windows', 'linux']
-   subdir_done()
- endif
- 
--# Linux ARM would need -latomic for std::atomic<int64_t>
--if host_system == 'linux' and host_machine.cpu_family() in ['aarch64', 'arm']
--  libatomic_dep = cxx.find_library('atomic', required: get_option('cuda-nvmm'))
--  if not libatomic_dep.found()
--    subdir_done()
--  endif
--
--  gstcuda_platform_dep += [libatomic_dep]
--endif
-+# Check for libatomic for use of C11 atomics: some architectures need
-+# to link explicitly to this library.
-+# TODO: Once meson 1.7 is in use, this can be updated to
-+# dependency('atomic')
-+atomic_dep = cxx.find_library('atomic', required: false)
-+gstcuda_platform_dep += [atomic_dep]
- 
- cuda_win32_headers = [
-   'initguid.h',
--- 
-2.43.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb
index 2e409558d1..a68e9306a5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb
@@ -9,9 +9,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
-           file://0001-backport-libatomic-issue-patch.patch \
            "
-SRC_URI[sha256sum] = "f8287a84c5f66368a5a50da5f969994a02c47f20220ffe1ca3154193e65af216"
+SRC_URI[sha256sum] = "9b8415b1bb3726a499578fb39907952981716643f660215fe68628fbd8629197"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.43.0


