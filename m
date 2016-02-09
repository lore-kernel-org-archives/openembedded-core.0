Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9FCF5731A6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 15:22:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Feb 2016 07:22:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,421,1449561600"; d="scan'208";a="880455538"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 09 Feb 2016 07:22:27 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	rongqing.li@windriver.com
Date: Tue,  9 Feb 2016 17:27:28 +0200
Message-Id: <3a3e85c9b61e21014b680607f722ba2a884349e8.1455031114.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455031114.git.jussi.kukkonen@intel.com>
References: <cover.1455031114.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] openssh: Fix regex that sets sftp-server path for tests
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
X-List-Received-Date: Tue, 09 Feb 2016 15:22:29 -0000

[YOCTO #9049]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
index 9c62d78..3b5e28a 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
@@ -125,7 +125,7 @@ do_install_append () {
 }
 
 do_install_ptest () {
-	sed -i -e "s|^SFTPSERVER=.*|SFTPSERVER=${libdir}/${PN}/sftp-server|" regress/test-exec.sh
+	sed -i -e "s|^SFTPSERVER=.*|SFTPSERVER=${libexecdir}/sftp-server|" regress/test-exec.sh
 	cp -r regress ${D}${PTEST_PATH}
 }
 
-- 
2.1.4


