Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B4D0E70982
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 22:54:55 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2014 15:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,768,1400050800"; d="scan'208";a="463358292"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.12.249])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2014 15:54:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jul 2014 15:54:47 -0700
Message-Id: <5dc93ae3e8b68ff11f5af316e7615449aaedbb40.1406760824.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1406760824.git.sgw@linux.intel.com>
References: <cover.1406760824.git.sgw@linux.intel.com>
In-Reply-To: <cover.1406760824.git.sgw@linux.intel.com>
References: <cover.1406760824.git.sgw@linux.intel.com>
Subject: [PATCH 2/4] lsbinitscripts: Upgrade to 9.55
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
X-List-Received-Date: Wed, 30 Jul 2014 22:54:59 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../lsb/{lsbinitscripts_9.54.bb => lsbinitscripts_9.55.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.54.bb => lsbinitscripts_9.55.bb} (78%)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.54.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.55.bb
similarity index 78%
rename from meta/recipes-extended/lsb/lsbinitscripts_9.54.bb
rename to meta/recipes-extended/lsb/lsbinitscripts_9.55.bb
index 29ec702..6ab52e3 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.54.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.55.bb
@@ -6,12 +6,12 @@ DEPENDS = "popt glib-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.54.tar.bz2/cf63862785d224394053f081865eb853/initscripts-9.54.tar.bz2 \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.55.tar.bz2/0672f648a9ee8607a2df65835c54f5e5/initscripts-9.55.tar.bz2 \
            file://functions.patch \
           " 
 
-SRC_URI[md5sum] = "cf63862785d224394053f081865eb853"
-SRC_URI[sha256sum] = "686a9aa4d265fc26f134163b2ceb02d421b72c49d97197c285f39087753b0b19"
+SRC_URI[md5sum] = "0672f648a9ee8607a2df65835c54f5e5"
+SRC_URI[sha256sum] = "546d4403a4efa3c4fa6de06a195013d4e64738799c2c779e56d900e7b232a9fa"
 
 inherit update-alternatives
 
-- 
1.8.3.1


