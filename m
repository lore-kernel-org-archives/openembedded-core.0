Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C1FCB6EFDF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 08:23:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 00:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,859,1384329600"; d="scan'208";a="476400706"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.197])
	by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2014 00:23:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 00:22:58 -0800
Message-Id: <cf0e00e6b461971018da7eb5d0369eac048ad15d.1392625337.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1392625337.git.sgw@linux.intel.com>
References: <cover.1392625337.git.sgw@linux.intel.com>
In-Reply-To: <cover.1392625337.git.sgw@linux.intel.com>
References: <cover.1392625337.git.sgw@linux.intel.com>
Subject: [PATCH 3/7] lsbinitscripts: Update to 9.52
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
X-List-Received-Date: Mon, 17 Feb 2014 08:23:03 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/lsb/lsbinitscripts_9.52.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.52.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.52.bb
index 11deae2..bc3e620 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.52.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.52.bb
@@ -6,7 +6,7 @@ DEPENDS = "popt glib-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.bz2/2453811ec27a781a77f309f356663d9e/initscripts-${PV}.tar.bz2 \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.52.tar.bz2/2453811ec27a781a77f309f356663d9e/initscripts-9.52.tar.bz2 \
            file://functions.patch \
           " 
 
-- 
1.8.3.1


