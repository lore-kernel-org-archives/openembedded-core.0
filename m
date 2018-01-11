Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB567887D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 05:46:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jan 2018 21:46:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,343,1511856000"; 
   d="scan'208";a="8890788"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 10 Jan 2018 21:46:54 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 13:41:15 +0800
Message-Id: <f45f817ce88dabb30c3cbb169d864925f25f25e7.1515648396.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1515648396.git.rebecca.swee.fun.chang@intel.com>
References: <cover.1515648396.git.rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 5/5] classes/populate_sdk_ext: support wic in eSDK
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
X-List-Received-Date: Thu, 11 Jan 2018 05:46:53 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

Make 'wic' image creation tool/command available in eSDK
environment. This would allow eSDK users to manipulate
images within eSDK environment.

[YOCTO #12177]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index eabc365..4f7100d 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -533,7 +533,7 @@ def get_sdk_required_utilities(buildtools_fn, d):
 
 install_tools() {
 	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}
-	scripts="devtool recipetool oe-find-native-sysroot runqemu*"
+	scripts="devtool recipetool oe-find-native-sysroot runqemu* wic"
 	for script in $scripts; do
 		for scriptfn in `find ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath} -maxdepth 1 -executable -name "$script"`; do
 			lnr ${scriptfn} ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/`basename $scriptfn`
-- 
2.7.4


