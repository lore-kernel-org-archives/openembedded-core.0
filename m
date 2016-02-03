Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0674977320
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 00:28:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 16:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,387,1449561600"; d="scan'208";a="904289193"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 16:28:58 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 18:30:27 -0600
Message-Id: <303985d3f402013c7c4a3355f19d48b1cef1c12f.1454459362.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
Subject: [PATCH v2 15/28] classes/populate_sdk_ext: Add OE_SDK_EXT_SILENT env variable
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
X-List-Received-Date: Wed, 03 Feb 2016 00:28:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <limon.anibal@gmail.com>

Sometimes we need to load environment without show help information
only useful when user is interacting with the SDK.

For example: For test extensible SDK.

Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 394c70c..7e20ce9 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -296,7 +296,7 @@ sdk_ext_postinst() {
 	# so put it at the end of $PATH.
 	echo "export PATH=\$PATH:$target_sdk_dir/sysroots/${SDK_SYS}/${bindir_nativesdk}" >> $env_setup_script
 
-	echo "printf 'SDK environment now set up; additionally you may now run devtool to perform development tasks.\nRun devtool --help for further details.\n'" >> $env_setup_script
+	echo "[ -z \$OE_SDK_EXT_SILENT ] && printf 'SDK environment now set up; additionally you may now run devtool to perform development tasks.\nRun devtool --help for further details.\n'" >> $env_setup_script
 
 	# Warn if trying to use external bitbake and the ext SDK together
 	echo "(which bitbake > /dev/null 2>&1 && echo 'WARNING: attempting to use the extensible SDK in an environment set up to run bitbake - this may lead to unexpected results. Please source this script in a new shell session instead.') || true" >> $env_setup_script
-- 
2.1.4


