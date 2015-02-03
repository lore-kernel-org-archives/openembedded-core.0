Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 174D96E6BE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 18:35:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Feb 2015 10:28:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,514,1418112000"; d="scan'208";a="672175779"
Received: from lzavalam-mobl.amr.corp.intel.com (HELO
	swold-mobl5.amr.corp.intel.com) ([10.252.252.168])
	by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2015 10:34:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Feb 2015 10:34:29 -0800
Message-Id: <26dc7ad03668b69f0e10417dcaedf00cd55aa121.1422988163.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1422988163.git.sgw@linux.intel.com>
References: <cover.1422988163.git.sgw@linux.intel.com>
In-Reply-To: <cover.1422988163.git.sgw@linux.intel.com>
References: <cover.1422988163.git.sgw@linux.intel.com>
Subject: [PATCH 3/6] lsbinitscripts: Upgrade to 9.61
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
X-List-Received-Date: Tue, 03 Feb 2015 18:35:02 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../lsb/{lsbinitscripts_9.60.bb => lsbinitscripts_9.61.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.60.bb => lsbinitscripts_9.61.bb} (80%)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.60.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.61.bb
similarity index 80%
rename from meta/recipes-extended/lsb/lsbinitscripts_9.60.bb
rename to meta/recipes-extended/lsb/lsbinitscripts_9.61.bb
index f67eff7..65eb9f4 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.60.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.61.bb
@@ -6,12 +6,12 @@ DEPENDS = "popt glib-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.60.tar.bz2/5c9cd83e4e04257fef3ffd8e549b7f81/initscripts-9.60.tar.bz2 \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.61.tar.bz2/892006be882b41f680109cb7336949d1/initscripts-9.61.tar.bz2 \
            file://functions.patch \
           " 
 
-SRC_URI[md5sum] = "5c9cd83e4e04257fef3ffd8e549b7f81"
-SRC_URI[sha256sum] = "254508884ceeef22e24f4e8b051bb51958ae8252bd7b02cd2b7bcce3fb453dc2"
+SRC_URI[md5sum] = "892006be882b41f680109cb7336949d1"
+SRC_URI[sha256sum] = "fb090d3fc48adbc0bb5835090e7eb5f1aa7e33d39537523d017a604527a59653"
 
 inherit update-alternatives
 
-- 
2.1.0


