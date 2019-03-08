Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6051C6BCA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 03:04:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,468,1544457600"; d="scan'208";a="56521509"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Mar 2019 11:04:35 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 14EAE4C8B027
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 11:04:12 +0800 (CST)
Received: from ubuntu.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 12 Mar 2019 11:04:42 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Mar 2019 03:59:02 -0800
Message-ID: <1552046342-45875-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 14EAE4C8B027.A7606
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] createrepo-c: fix for do_package_qa
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
X-List-Received-Date: Tue, 12 Mar 2019 03:04:35 -0000
Content-Type: text/plain

Fix the following QA Issue:

ERROR: nativesdk-createrepo-c-0.12.1-r0 do_package_qa: QA Issue: nativesdk-createrepo-c rdepends on nativesdk-python3-dev [dev-deps]
ERROR: nativesdk-createrepo-c-0.12.1-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/createrepo-c/createrepo-c_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
index 9aa8d2a..e11a783 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
@@ -33,3 +33,5 @@ do_install_append_class-nativesdk() {
                 RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm
         rm -rf ${D}/etc
 }
+
+INSANE_SKIP_${PN} += "dev-deps"
-- 
2.7.4




