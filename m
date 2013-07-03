Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 51E8E6A5C7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 22:26:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2013 15:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,991,1363158000"; d="scan'208";a="340154927"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.183])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2013 15:26:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 15:26:22 -0700
Message-Id: <00bec2da9d29234cce3b6c97076812ea400370fe.1372890071.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
In-Reply-To: <cover.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
Subject: [PATCH 1/8] packagegroup-core-basic: Only build libpam if it's enabled
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
X-List-Received-Date: Wed, 03 Jul 2013 22:26:29 -0000

util-linux will check for the exisitance of pam header files and change what is
built, so only build libpam when pam is enabled for DISTRO_FEATURES

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-basic.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index c73d173..03dabbf 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -104,7 +104,7 @@ RDEPENDS_packagegroup-core-multiuser = "\
     cracklib \
     gzip \
     libuser \
-    libpam \
+    ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
     shadow \
     sudo \
     "
-- 
1.8.1.4


