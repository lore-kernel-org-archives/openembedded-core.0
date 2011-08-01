Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Qnr1n-0006cC-0l
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 13:51:23 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Aug 2011 04:46:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,299,1309762800"; d="scan'208";a="36618499"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.157])
	by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2011 04:46:47 -0700
From: Yu Ke <ke.yu@intel.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 19:54:25 +0800
Message-Id: <f598d89680b56218a1f0c50844b1e6823c7baca9.1312199543.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1312199543.git.ke.yu@intel.com>
References: <cover.1312199543.git.ke.yu@intel.com>
Subject: [PATCH 1/1] package_rpm.bbclass: fix one typo
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
X-List-Received-Date: Mon, 01 Aug 2011 11:51:23 -0000

fix the MLPREFIX referrence typo which cause multilib rpm
do_rootfs failure

CC: Mark Hatle <mark.hatle@windriver.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/classes/package_rpm.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 0377100..ded744b 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -248,7 +248,7 @@ package_install_internal_rpm () {
 			echo "Processing $pkg..."
 
 			archvar=base_package_archs
-			ml_pkg=$(echo ${pkg} | sed "s,$^{MLPREFIX}\(.*\),\1,")
+			ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
 			if [ "${ml_pkg}" != "${pkg}" ]; then
 				archvar=ml_package_archs
 			fi
-- 
1.7.0.4



