Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AC05C76B2C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 12:54:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 24 Aug 2015 05:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,737,1432623600"; d="scan'208";a="754330054"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 24 Aug 2015 05:54:07 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:55:50 +0300
Message-Id: <5df8d9ffd3ebf6bda04d99511007abe3c618bc09.1440420666.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b93e9e96bb37641bf112d201daeb837d04d50363.1440420666.git.jussi.kukkonen@intel.com>
References: <b93e9e96bb37641bf112d201daeb837d04d50363.1440420666.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1440420666.git.jussi.kukkonen@intel.com>
References: <cover.1440420666.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 2/3] lsbinitscripts: Upgrade 9.63 -> 9.64
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
X-List-Received-Date: Mon, 24 Aug 2015 12:54:08 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../lsb/{lsbinitscripts_9.63.bb => lsbinitscripts_9.64.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.63.bb => lsbinitscripts_9.64.bb} (81%)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.63.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.64.bb
similarity index 81%
rename from meta/recipes-extended/lsb/lsbinitscripts_9.63.bb
rename to meta/recipes-extended/lsb/lsbinitscripts_9.64.bb
index b937c15..6db667c 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.63.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.64.bb
@@ -6,13 +6,13 @@ DEPENDS = "popt glib-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.63.tar.bz2/1ae0f15e54a904ac30185548d43daa1c/initscripts-9.63.tar.bz2 \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.bz2/9cce2ae1009750e84be37c09a028757e/initscripts-${PV}.tar.bz2 \
            file://functions.patch \
            file://0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch \
           " 
 
-SRC_URI[md5sum] = "1ae0f15e54a904ac30185548d43daa1c"
-SRC_URI[sha256sum] = "39474c3a83e2e03077e27bf9418a4296651c421cf0ba7672e67fe2e3567b36e1"
+SRC_URI[md5sum] = "9cce2ae1009750e84be37c09a028757e"
+SRC_URI[sha256sum] = "48b59ce8157cfc58bbd4b1dfa58ad1087245761ae11c2033b66ae3864ea7e1cf"
 
 inherit update-alternatives
 
-- 
2.1.4


