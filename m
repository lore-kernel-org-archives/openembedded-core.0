Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1128E7869C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 06:58:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB16w5xY008757
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 22:58:06 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 30 Nov 2017 22:58:05 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Dec 2017 01:58:02 -0500
Message-ID: <43d0b786bf6dc1ae091ddb6c5c590880cadcc6fe.1512111404.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1512111404.git.dengke.du@windriver.com>
References: <cover.1512111404.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ltp: add runtime depends ltp-staticdev
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
X-List-Received-Date: Fri, 01 Dec 2017 06:58:05 -0000
Content-Type: text/plain

The test case nm01 depends on /opt/ltp/testcases/data/nm01/lib.a in
ltp-staticdev package.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20170929.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20170929.bb b/meta/recipes-extended/ltp/ltp_20170929.bb
index 93a59b3..6fd280c 100644
--- a/meta/recipes-extended/ltp/ltp_20170929.bb
+++ b/meta/recipes-extended/ltp/ltp_20170929.bb
@@ -108,6 +108,7 @@ RDEPENDS_${PN} = "\
 FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a /opt/ltp/testcases/data/nm01/lib.a"
 
 FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/*"
+RDEPENDES_${PN} += "${PN}-staticdev"
 
 # Avoid generated binaries stripping. Otherwise some of the ltp tests such as ldd01 & nm01 fails
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.8.1


