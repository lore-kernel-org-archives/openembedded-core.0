Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 93F3460B9B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 18:59:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Mar 2014 11:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,639,1389772800"; d="scan'208";a="497176502"
Received: from drewstep-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.61])
	by fmsmga002.fm.intel.com with ESMTP; 12 Mar 2014 11:59:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 18:59:28 +0000
Message-Id: <fdb298e70c73c5aa5d1303dc161b82b466152b53.1394650701.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394650701.git.paul.eggleton@linux.intel.com>
References: <cover.1394650701.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1394650701.git.paul.eggleton@linux.intel.com>
References: <cover.1394650701.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 1/1] lsbtest: fix comparison bashism
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
X-List-Received-Date: Wed, 12 Mar 2014 18:59:51 -0000

From: Stefan Stanacar <stefanx.stanacar@intel.com>

== is a bashism use = instead.

(Based on OE-Core master rev: c90d1047c41148cbd57f26b5a34563346602a71b)

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 2 +-
 meta/recipes-extended/lsb/lsbtest_1.0.bb      | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
index af1d61c..cea0199 100644
--- a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
+++ b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
@@ -272,7 +272,7 @@ then
 fi
 
 if ! `grep -F -q "noarch-suse" ${PLATFORM_FILE}`; then
-	if [ ${ARCH} == i686 ];then
+	if [ ${ARCH} = i686 ];then
 		echo "i486-suse" >> ${PLATFORM_FILE}
 		echo "i486-noarch" >> ${PLATFORM_FILE}
 		echo "i486-pc" >> ${PLATFORM_FILE}
diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
index 8973e09..84cb4f2 100644
--- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
@@ -19,15 +19,15 @@ do_install() {
 	install -d  ${D}/opt/lsb-test
 	install -m 0644 ${S}/packages_list ${D}/opt/lsb-test/packages_list
 	install -m 0644 ${S}/session ${D}/opt/lsb-test/session
-	if [ "${TARGET_ARCH}" == "i586" ];then
+	if [ "${TARGET_ARCH}" = "i586" ];then
 		sed -i -e 's/lsbarch/ia32/g' -e 's/targetarch/i486/g' ${D}/opt/lsb-test/packages_list
 		sed -i -e 's/targetarch/x86/g' ${D}/opt/lsb-test/session
 	fi
-	if [ "${TARGET_ARCH}" == "x86_64" ];then
+	if [ "${TARGET_ARCH}" = "x86_64" ];then
 		sed -i -e 's/lsbarch/amd64/g' -e 's/targetarch/x86_64/g' ${D}/opt/lsb-test/packages_list
 		sed -i -e 's/targetarch/x86-64/g' ${D}/opt/lsb-test/session
 	fi
-	if [ "${TARGET_ARCH}" == "powerpc" ];then
+	if [ "${TARGET_ARCH}" = "powerpc" ];then
 		sed -i -e 's/lsbarch/ppc32/g' -e 's/targetarch/ppc/g' ${D}/opt/lsb-test/packages_list
 		sed -i -e 's/targetarch/PPC32/g' ${D}/opt/lsb-test/session
 	fi
-- 
1.8.5.3


