Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RgdXa-0001sS-3Z
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 15:34:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Dec 2011 06:27:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="92902402"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 30 Dec 2011 06:27:21 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 22:33:12 +0800
Message-Id: <49153bb710a7cb68512127468c5e319e79231e39.1325252646.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
References: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
In-Reply-To: <cover.1325252645.git.shane.wang@intel.com>
References: <cover.1325252645.git.shane.wang@intel.com>
Subject: [PATCH 11/14] quota: upgrade to 4.00
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
X-List-Received-Date: Fri, 30 Dec 2011 14:34:38 -0000

The license change in rquota_server.c is the following two lines have been removed:
11a12,13
>  * Version: $Id: rquota_server.c,v 1.22 2010/01/05 16:04:57 jkar8572 Exp $
>  *

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../quota/{quota_4.00-pre1.bb => quota_4.00.bb}    |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/quota/{quota_4.00-pre1.bb => quota_4.00.bb} (78%)

diff --git a/meta/recipes-extended/quota/quota_4.00-pre1.bb b/meta/recipes-extended/quota/quota_4.00.bb
similarity index 78%
rename from meta/recipes-extended/quota/quota_4.00-pre1.bb
rename to meta/recipes-extended/quota/quota_4.00.bb
index 00cdd5e..6b04fd9 100644
--- a/meta/recipes-extended/quota/quota_4.00-pre1.bb
+++ b/meta/recipes-extended/quota/quota_4.00.bb
@@ -4,14 +4,14 @@ HOMEPAGE = "http://sourceforge.net/projects/linuxquota/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=18136&atid=118136"
 LICENSE = "BSD & GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://quota.c;beginline=1;endline=33;md5=331c7d77744bfe0ad24027f0651028ec \
-                    file://rquota_server.c;beginline=1;endline=20;md5=d509328bb71c3438b9c737774b4132a2 \
+                    file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ef9d66e8a968ecffd2d9df648fa8ada2"
-SRC_URI[sha256sum] = "181a9b90b10bbffaaf9a18e7fef96a5752ab20f7b72d81c472166ab32e415994"
+SRC_URI[md5sum] = "975f587ff761a60ac25dbe6c00865925"
+SRC_URI[sha256sum] = "eb2b045f58b98299edc568b8607b95b10735b4a131fa5196f41c89b51fb409ba"
 
 S = ${WORKDIR}/quota-tools
 
-- 
1.7.6



