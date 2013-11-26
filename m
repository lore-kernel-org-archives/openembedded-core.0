Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ECF2E6DD6C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:42:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Nov 2013 06:42:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,775,1378882800"; d="scan'208";a="440218516"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.39])
	by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2013 06:42:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 14:41:53 +0000
Message-Id: <550510c51769fa36d9eee1401887abe3689cfaab.1385476873.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1385476873.git.paul.eggleton@linux.intel.com>
References: <cover.1385476873.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1385476873.git.paul.eggleton@linux.intel.com>
References: <cover.1385476873.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/7] alsa-utils-alsaconf: tidy up path setting
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
X-List-Received-Date: Tue, 26 Nov 2013 14:42:08 -0000

* Set FILESEXTRAPATHS instead of FILESPATH
* Don't set THISDIR, it's already set by base.bbclass

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.27.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.27.2.bb
index a3fa1d0..cacc37c 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.27.2.bb
@@ -1,7 +1,6 @@
 require alsa-utils_${PV}.bb
 
-THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
-FILESPATH =. "${@base_set_filespath(["${THISDIR}/alsa-utils"], d)}:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/alsa-utils:"
 
 PACKAGES = "${PN}"
 RDEPENDS_${PN} += "bash"
-- 
1.8.1.2


