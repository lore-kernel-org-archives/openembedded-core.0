Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4BCAC6204F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 17:01:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jun 2013 10:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,838,1363158000"; d="scan'208";a="347655793"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2013 10:02:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 10:01:51 -0700
Message-Id: <1370883711-23970-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] tar: don't mv tar for nativesdk
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
X-List-Received-Date: Mon, 10 Jun 2013 17:01:51 -0000

We move tar into /bin for target but it can stay in /usr/bin for nativesdk
this will also mean the paths are correct for the buildtools-tarball environment

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/tar/tar.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
index abeb8c1..358384a 100644
--- a/meta/recipes-extended/tar/tar.inc
+++ b/meta/recipes-extended/tar/tar.inc
@@ -11,6 +11,7 @@ inherit autotools gettext
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
 
 EXTRAINSTALL = "do_install_extra"
+EXTRAINSTALL_class-nativesdk = ""
 
 do_install () {
     autotools_do_install
-- 
1.8.1.4


