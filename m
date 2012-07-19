Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SrpY7-0003cR-P1
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 14:09:43 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2012 04:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="174221571"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.145])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2012 04:58:04 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 15:00:13 +0300
Message-Id: <1342699213-435-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Multilib build fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2012 12:09:44 -0000

1. STAGING_KERNEL_DIR was getting an invalid MLPREFIX. Fix this by forcing the expansion in multilib.conf.
2. Added multilib rule for 'perf'.
---
 meta/conf/multilib.conf |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index bb21815..6a89a53 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -6,6 +6,7 @@ MULTILIB_SAVE_VARNAME = "DEFAULTTUNE"
 
 MULTILIBS ??= "multilib:lib32"
 
+STAGING_KERNEL_DIR := "${STAGING_KERNEL_DIR}"
 STAGING_DIR_HOST = "${STAGING_DIR}/${MLPREFIX}${MACHINE}"
 STAGING_DIR_TARGET = "${STAGING_DIR}/${MLPREFIX}${MACHINE}"
 
@@ -512,6 +513,7 @@ BBCLASSEXTEND_append_pn-pax-utils = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-pciutils = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-pcmanfm = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-pcmciautils = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-perf = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-perl = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-pixman = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-pkgconfig = " ${MULTILIBS}"
-- 
1.7.9.5



