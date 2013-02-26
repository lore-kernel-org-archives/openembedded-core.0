Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UAGMm-00080p-8b
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 09:58:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q8g8Bi018563
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 00:42:08 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Tue, 26 Feb 2013 00:42:07 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 16:43:38 +0800
Message-ID: <856b0c61e27c606f02ea564096d09c707105fc44.1361867877.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1361867877.git.kai.kang@windriver.com>
References: <cover.1361867877.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] lsbtest: sync test suite packages version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 08:58:49 -0000
Content-Type: text/plain

Update file packages_list after sync test suite packages version with
upstream.
Check date: Feb 20, 2103

Bump up PR.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest/packages_list |   10 +++++-----
 meta/recipes-extended/lsb/lsbtest_1.0.bb        |    2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/packages_list b/meta/recipes-extended/lsb/lsbtest/packages_list
index c3172e0..dc3c002 100644
--- a/meta/recipes-extended/lsb/lsbtest/packages_list
+++ b/meta/recipes-extended/lsb/lsbtest/packages_list
@@ -3,22 +3,22 @@ LSB_ARCH="lsbarch"
 
 BASE_PACKAGES_LIST="lsb-setup-4.1.0-1.noarch.rpm"
 
-RUNTIME_BASE_PACKAGES_LIST="lsb-dist-checker-4.1.0.10-2.targetarch.rpm \
+RUNTIME_BASE_PACKAGES_LIST="lsb-dist-checker-4.1.0.11-1.targetarch.rpm \
 	lsb-tet3-lite-3.7-23.lsb4.targetarch.rpm \
 	lsb-tet3-lite-devel-3.7-23.lsb4.targetarch.rpm \
 	lsb-xvfb-1.2.0-21.targetarch.rpm \
 	"
 
-RUNTIME_PACKAGES_LIST="lsb-cmdchk-4.1.4-2.targetarch.rpm \
-	lsb-libchk-4.1.4-2.targetarch.rpm \
+RUNTIME_PACKAGES_LIST="lsb-cmdchk-4.1.4-3.targetarch.rpm \
+	lsb-libchk-4.1.4-3.targetarch.rpm \
 	lsb-qm-2.2-8.lsb4.targetarch.rpm \
-	lsb-task-dist-testkit-4.1.2-1.noarch.rpm \
+	lsb-task-dist-testkit-4.1.3-1.noarch.rpm \
 	lsb-test-core-4.1.12-2.targetarch.rpm \
 	lsb-test-cpp-t2c-4.1.0-1.targetarch.rpm \
 	lsb-test-desktop-4.1.7-1.targetarch.rpm \
 	lsb-test-desktop-t2c-4.1.2-2.targetarch.rpm \
 	lsb-test-libstdcpp-4.1.0-18.lsb4.targetarch.rpm \
-	lsb-test-olver-core-4.1.3-7.targetarch.rpm \
+	lsb-test-olver-core-4.1.4-1.targetarch.rpm \
 	lsb-test-perl-4.1.6-2.noarch.rpm \
 	lsb-test-printing-4.1.2-1.targetarch.rpm \
 	lsb-test-python-4.1.5-1.targetarch.rpm \
diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
index 3dcfc0d..8973e09 100644
--- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "automate test for lsb"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
-PR = "r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://LSB_Test.sh;beginline=3;endline=16;md5=7063bb54b04719df0716b513447f4fc0"
 
-- 
1.7.5.4



