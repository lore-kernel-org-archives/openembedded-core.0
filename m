Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2126078850
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:00:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jan 2018 07:00:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,344,1511856000"; d="scan'208";a="192927012"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 11 Jan 2018 07:00:56 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 22:55:23 +0800
Message-Id: <344f8b1262d0e890bb7549f86fc2c9ee7091268f.1515681706.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1515681706.git.rebecca.swee.fun.chang@intel.com>
References: <cover.1515681706.git.rebecca.swee.fun.chang@intel.com>
Subject: [PATCHv2 5/5] classes/populate_sdk_ext: support wic in eSDK
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
X-List-Received-Date: Thu, 11 Jan 2018 15:00:55 -0000

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
index eabc365300a..4f7100dd7e1 100644
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
2.15.0


