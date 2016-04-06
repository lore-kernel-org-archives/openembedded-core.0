Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 251D7771A6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 06:58:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u366wnRk028741
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Apr 2016 23:58:49 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Apr 2016 23:58:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Apr 2016 23:58:43 -0700
Message-ID: <18900eab63831af76a24664fa3c8a6db52831236.1459925867.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1459925867.git.liezhi.yang@windriver.com>
References: <cover.1459925867.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] clutter-gst-3.0: remove unused enable-tests.patch
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
X-List-Received-Date: Wed, 06 Apr 2016 06:58:49 -0000
Content-Type: text/plain

It was a backport patch from clutter-gst-1.8, now 3.0, so not needed any
more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../clutter/clutter-gst-3.0/enable-tests.patch     | 23 ----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0/enable-tests.patch

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0/enable-tests.patch b/meta/recipes-graphics/clutter/clutter-gst-3.0/enable-tests.patch
deleted file mode 100644
index b3aec39..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0/enable-tests.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Install example binary needed for core-image-clutter
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Imported from clutter-gst-1.8 package, git://git.openembedded.org/openembedded,
-commit ae28ee3f7a060b9e0d13154a84f2444a98490b5b, updated for clutter-gst 1.6
-
-Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
-
-Index: git/examples/Makefile.am
-===================================================================
---- git.orig/examples/Makefile.am	2011-01-31 10:14:23.000000000 +0800
-+++ git/examples/Makefile.am	2011-01-31 10:14:34.000000000 +0800
-@@ -1,6 +1,6 @@
- NULL = #
- 
--noinst_PROGRAMS = video-player video-sink video-sink-navigation
-+bin_PROGRAMS = video-player video-sink video-sink-navigation
- 
- INCLUDES = -I$(top_srcdir) \
- 	   $(MAINTAINER_CFLAGS) \
-- 
2.8.0


