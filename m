Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 26F3272F96
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 15:58:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 08:58:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,312,1496127600"; d="scan'208";a="1168367181"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jul 2017 08:57:41 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 08:57:36 -0700
Message-Id: <20170705155736.9329-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] ovmf: add SUMMARY and fix HOMEPAGE url
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
X-List-Received-Date: Wed, 05 Jul 2017 15:58:10 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 28f0cde1d9..d3f84246da 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -1,5 +1,7 @@
-DESCRIPTION = "OVMF - UEFI firmware for Qemu and KVM"
-HOMEPAGE = "http://sourceforge.net/apps/mediawiki/tianocore/index.php?title=OVMF"
+SUMMARY = "OVMF - UEFI firmware for Qemu and KVM"
+DESCRIPTION = "OVMF is an EDK II based project to enable UEFI support for \
+Virtual Machines. OVMF contains sample UEFI firmware for QEMU and KVM"
+HOMEPAGE = "https://github.com/tianocore/tianocore.github.io/wiki/OVMF"
 LICENSE = "BSD"
 LICENSE_class-target = "${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'BSD & OpenSSL', 'BSD', d)}"
 LIC_FILES_CHKSUM = "file://OvmfPkg/License.txt;md5=343dc88e82ff33d042074f62050c3496"
-- 
2.12.0


