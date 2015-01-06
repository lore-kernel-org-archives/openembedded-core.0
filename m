Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E07A7728C3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 15:42:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jan 2015 07:42:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="508183837"
Received: from unknown (HELO localhost.intel.com) ([10.252.252.96])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2015 07:36:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 07:42:17 -0800
Message-Id: <3469bdcad4fe50102cd2cd239af30366093608ad.1420558836.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
Subject: [PATCH 07/12] lsbinitscripts: Upgrade to 9.60
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
X-List-Received-Date: Tue, 06 Jan 2015 15:42:36 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../lsb/{lsbinitscripts_9.56.1.bb => lsbinitscripts_9.60.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.56.1.bb => lsbinitscripts_9.60.bb} (78%)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.56.1.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.60.bb
similarity index 78%
rename from meta/recipes-extended/lsb/lsbinitscripts_9.56.1.bb
rename to meta/recipes-extended/lsb/lsbinitscripts_9.60.bb
index cf3a863..1490582 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.56.1.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.60.bb
@@ -6,12 +6,12 @@ DEPENDS = "popt glib-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.56.1.tar.bz2/8ca2abb3877e8019a5e726c25501e8e3/initscripts-9.56.1.tar.bz2 \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.60.tar.bz2/5c9cd83e4e04257fef3ffd8e549b7f81/initscripts-9.60.tar.bz2 \
            file://functions.patch \
           " 
 
-SRC_URI[md5sum] = "8ca2abb3877e8019a5e726c25501e8e3"
-SRC_URI[sha256sum] = "e6fbe1daa5cbfc6fab12ccac2955bde0c16ec8d9fbdb9f7c6c33fadc81da6574"
+SRC_URI[md5sum] = "5c9cd83e4e04257fef3ffd8e549b7f81"
+SRC_URI[sha256sum] = "254508884ceeef22e24f4e8b051bb51958ae8252bd7b02cd2b7bcce3fb453dc2"
 
 inherit update-alternatives
 
-- 
2.1.0


