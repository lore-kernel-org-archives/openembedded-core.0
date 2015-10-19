Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8900C77060
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 16:33:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Oct 2015 09:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,702,1437462000"; d="scan'208";a="830461013"
Received: from ggwalsh-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.6.253])
	by fmsmga002.fm.intel.com with ESMTP; 19 Oct 2015 09:33:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 17:33:10 +0100
Message-Id: <c7981a0e9e39239e33a50e37985a81e47b53d2ae.1445272352.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1445272352.git.paul.eggleton@linux.intel.com>
References: <cover.1445272352.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1445272352.git.paul.eggleton@linux.intel.com>
References: <cover.1445272352.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v3 3/5] classes/populate_sdk_ext: add note to env setup script
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
X-List-Received-Date: Mon, 19 Oct 2015 16:33:22 -0000

Print a note at the end of the environment setup script pointing to
devtool.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 0feb3b2..060a44a 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -236,6 +236,8 @@ sdk_ext_postinst() {
 	# so put it at the end of $PATH.
 	echo "export PATH=\$PATH:$target_sdk_dir/sysroots/${SDK_SYS}/${bindir_nativesdk}" >> $env_setup_script
 
+	echo "printf 'SDK environment now set up; additionally you may now run devtool to perform development tasks.\nRun devtool --help for further details.\n'" >> $env_setup_script
+
 	# For now this is where uninative.bbclass expects the tarball
 	mv *-nativesdk-libc.tar.* $target_sdk_dir/`dirname ${oe_init_build_env_path}`
 
-- 
2.1.0


