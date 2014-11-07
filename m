Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EE9C572054
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 16:17:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989824"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:42 -0800
Message-Id: <55ad9082f81095937fc45334c2a2553705c05b31.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 17/19] lsbinitscripts: Upgrade to 9.56.1
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:58 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../lsb/{lsbinitscripts_9.55.bb => lsbinitscripts_9.56.1.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.55.bb => lsbinitscripts_9.56.1.bb} (78%)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.55.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.56.1.bb
similarity index 78%
rename from meta/recipes-extended/lsb/lsbinitscripts_9.55.bb
rename to meta/recipes-extended/lsb/lsbinitscripts_9.56.1.bb
index 6ab52e3..cf3a863 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.55.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.56.1.bb
@@ -6,12 +6,12 @@ DEPENDS = "popt glib-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.55.tar.bz2/0672f648a9ee8607a2df65835c54f5e5/initscripts-9.55.tar.bz2 \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.56.1.tar.bz2/8ca2abb3877e8019a5e726c25501e8e3/initscripts-9.56.1.tar.bz2 \
            file://functions.patch \
           " 
 
-SRC_URI[md5sum] = "0672f648a9ee8607a2df65835c54f5e5"
-SRC_URI[sha256sum] = "546d4403a4efa3c4fa6de06a195013d4e64738799c2c779e56d900e7b232a9fa"
+SRC_URI[md5sum] = "8ca2abb3877e8019a5e726c25501e8e3"
+SRC_URI[sha256sum] = "e6fbe1daa5cbfc6fab12ccac2955bde0c16ec8d9fbdb9f7c6c33fadc81da6574"
 
 inherit update-alternatives
 
-- 
1.8.3.1


