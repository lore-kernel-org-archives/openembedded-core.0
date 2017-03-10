Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 245156AC3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 05:15:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="16407340"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Mar 2017 13:15:36 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7E14C47C4E9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 13:15:32 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.100) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 10 Mar 2017 13:15:33 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Mar 2017 11:55:23 +0800
Message-ID: <1489118123-17850-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.100]
X-yoursite-MailScanner-ID: 7E14C47C4E9B.A7AA9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] pkgconfig: Fix QA issue when upgrade rpm from 5.4.16 to 5.4.17
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
X-List-Received-Date: Fri, 10 Mar 2017 05:15:44 -0000
Content-Type: text/plain

 pkgconfig : Fix QA issue

 When upgrade rpm from 5.4.16 to 5.4.17, a QA WARNING will show as below:
 WARNING: rpm-5.4.17-r0 do_package_qa: QA Issue: /usr/lib/pkgconfig/rpm.pc contained in package rpm-dev requires pkgconfig, but no providers found in RDEPENDS_rpm-dev? [file-rdeps]

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 422c5f3..2296e76 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -41,7 +41,7 @@ FILES_${PN} += "${datadir}/aclocal/pkg.m4"
 # When using the RPM generated automatic package dependencies, some packages
 # will end up requiring 'pkgconfig(pkg-config)'.  Allow this behavior by
 # specifying an appropriate provide.
-RPROVIDES_${PN} += "pkgconfig(pkg-config)"
+RPROVIDES_${PN} += "pkgconfig(pkg-config) pkgconfig"
 
 # Install a pkg-config-native wrapper that will use the native sysroot instead
 # of the MACHINE sysroot, for using pkg-config when building native tools.
-- 
2.7.4




