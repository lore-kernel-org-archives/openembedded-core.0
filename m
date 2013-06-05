Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1AC6041D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 22:57:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jun 2013 15:57:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,809,1363158000"; d="scan'208";a="348768692"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.19])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2013 15:57:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2013 15:57:15 -0700
Message-Id: <1370473035-22756-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] self-hosted: Add libssp libraries to packagegroup/image
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
X-List-Received-Date: Wed, 05 Jun 2013 22:57:15 -0000

These libraries are needed to ensure when the -fstack-protector flags
are used the compile will complete and not fail due to missing libraries

[YOCTO #4586]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 6dcc44a..ed73617 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -75,6 +75,9 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     intltool \
     ldd \
     less \
+    libssp \
+    libssp-dev \
+    libssp-staticdev \
     libstdc++ \
     libstdc++-dev \
     libtool \
-- 
1.7.10.4


