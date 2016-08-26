Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A67E76E70
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:29 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525553"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:29 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:21 +0300
Message-Id: <5db201f12ef32d17e0359009cf4de7d7a6707868.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/28] systemd: drop unused gtkdoc-related variable
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:29 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/systemd/systemd_230.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
index 374a197..ee2bb7b 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -42,8 +42,6 @@ SRC_URI_append_libc-uclibc = "\
 "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-GTKDOC_DOCDIR = "${S}/docs/"
-
 PACKAGECONFIG ??= "xz \
                    ldconfig \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-- 
2.9.3


