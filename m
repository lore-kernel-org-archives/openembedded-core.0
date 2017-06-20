Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 91DC36E668
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 13:09:44 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 06:09:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="117107308"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 20 Jun 2017 06:09:44 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 16:06:55 +0300
Message-Id: <20170620130656.14006-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] libdnf: update to 0.9.1
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
X-List-Received-Date: Tue, 20 Jun 2017 13:09:44 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/libdnf/libdnf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libdnf/libdnf_git.bb b/meta/recipes-devtools/libdnf/libdnf_git.bb
index 2acbd89659a..adc8c686d06 100644
--- a/meta/recipes-devtools/libdnf/libdnf_git.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_git.bb
@@ -10,8 +10,8 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            "
 
-PV = "0.8.1"
-SRCREV = "233287f4f80e24a917d5f6a26967f54080ffa255"
+PV = "0.9.1"
+SRCREV = "d5ecb17c0fde4f99c6a80e6f162510465b8d28f9"
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


