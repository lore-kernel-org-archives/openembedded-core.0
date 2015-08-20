Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DD36976A88
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:37:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2015 04:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="752149070"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 20 Aug 2015 04:37:40 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:39:19 +0300
Message-Id: <7c60fe976611a7fea4255f4f2a37021af9deb954.1440070230.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3e2150ea28539ba5780188819fd16172c9b2e7d3.1440070230.git.jussi.kukkonen@intel.com>
References: <3e2150ea28539ba5780188819fd16172c9b2e7d3.1440070230.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1440070230.git.jussi.kukkonen@intel.com>
References: <cover.1440070230.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/3] lsbinitscripts: Upgrade 9.63 -> 9.64
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
X-List-Received-Date: Thu, 20 Aug 2015 11:37:48 -0000

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


