Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 146ED60721
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:06:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 09 Mar 2016 07:06:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083901"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:42 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:02:10 +0200
Message-Id: <79d7f18eaf74c516cb624affce3624aee6d4cc3f.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 24/24] musl: disable building of gobject introspection data
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
X-List-Received-Date: Wed, 09 Mar 2016 15:06:44 -0000

When musl is in use, GLib binaries crash on assertion failures under qemu

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/tclibc-musl.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 1ddd58e..e6b10f9 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -25,3 +25,7 @@ LIBC_DEPENDENCIES = "\
     musl-dbg \
     musl-dev \
     "
+
+# GLib binaries trigger assertion failures and crash under qemu
+# when musl is in use
+DISTRO_FEATURES_BACKFILL_CONSIDERED += "gobject-introspection-data"
-- 
2.7.0


