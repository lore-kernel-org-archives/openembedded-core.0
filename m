Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrT-0004lf-ON
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:40 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752287"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:12 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:15 -0800
Message-Id: <68042743407089acdfe048e91821e59a6ace05ec.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 089/113] quota: upgrade to 4.00
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:41 -0000

From: Shane Wang <shane.wang@intel.com>

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
1.7.6.4



