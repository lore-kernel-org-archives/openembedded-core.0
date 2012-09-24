Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TG1ZL-0001dn-Pt
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 07:51:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8O5cBv7025249
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Sep 2012 22:38:11 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Sun, 23 Sep 2012 22:38:11 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Sep 2012 13:38:14 +0800
Message-ID: <b82c09a955d0739373a0a12f8b537ad23077d327.1348455571.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1348455571.git.kai.kang@windriver.com>
References: <cover.1348455571.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.159]
Subject: [PATCH 1/1] lsbtest: update list file
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
X-List-Received-Date: Mon, 24 Sep 2012 05:51:00 -0000
Content-Type: text/plain

Update the lsbtest's list file that we can download the latest
sub-packages of LSB suite 4.1.0 and then run the test with them.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest/packages_list |   46 +++++++++++-----------
 meta/recipes-extended/lsb/lsbtest_1.0.bb        |    2 +-
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/packages_list b/meta/recipes-extended/lsb/lsbtest/packages_list
index 9285ed9..c3172e0 100644
--- a/meta/recipes-extended/lsb/lsbtest/packages_list
+++ b/meta/recipes-extended/lsb/lsbtest/packages_list
@@ -3,42 +3,42 @@ LSB_ARCH="lsbarch"
 
 BASE_PACKAGES_LIST="lsb-setup-4.1.0-1.noarch.rpm"
 
-RUNTIME_BASE_PACKAGES_LIST="lsb-dist-checker-4.1.0.1-2.targetarch.rpm \
-	lsb-tet3-lite-3.7-15.lsb4.targetarch.rpm \
-	lsb-tet3-lite-devel-3.7-15.lsb4.targetarch.rpm \
-	lsb-xvfb-1.2.0-19.targetarch.rpm \
+RUNTIME_BASE_PACKAGES_LIST="lsb-dist-checker-4.1.0.10-2.targetarch.rpm \
+	lsb-tet3-lite-3.7-23.lsb4.targetarch.rpm \
+	lsb-tet3-lite-devel-3.7-23.lsb4.targetarch.rpm \
+	lsb-xvfb-1.2.0-21.targetarch.rpm \
 	"
 
-RUNTIME_PACKAGES_LIST="lsb-cmdchk-4.1.0-1.targetarch.rpm \
-	lsb-libchk-4.1.0-1.targetarch.rpm \
+RUNTIME_PACKAGES_LIST="lsb-cmdchk-4.1.4-2.targetarch.rpm \
+	lsb-libchk-4.1.4-2.targetarch.rpm \
 	lsb-qm-2.2-8.lsb4.targetarch.rpm \
-	lsb-task-dist-testkit-4.1.0-1.noarch.rpm \
-	lsb-test-core-4.1.0-1.targetarch.rpm \
+	lsb-task-dist-testkit-4.1.2-1.noarch.rpm \
+	lsb-test-core-4.1.12-2.targetarch.rpm \
 	lsb-test-cpp-t2c-4.1.0-1.targetarch.rpm \
-	lsb-test-desktop-4.1.0-2.targetarch.rpm \
-	lsb-test-desktop-t2c-4.1.0-1.targetarch.rpm \
-	lsb-test-libstdcpp-4.1.0-13.lsb4.targetarch.rpm \
-	lsb-test-olver-core-4.1.0-1.targetarch.rpm \
-	lsb-test-perl-4.1.0-1.noarch.rpm \
-	lsb-test-printing-4.1.0-1.targetarch.rpm \
-	lsb-test-python-4.1.1-2.targetarch.rpm \
-	lsb-test-qt3-azov-4.1.0-1.targetarch.rpm \
-	lsb-test-qt4-azov-4.1.0-1.targetarch.rpm \
-	lsb-test-xts5-5.1.5-38.lsb4.targetarch.rpm \
+	lsb-test-desktop-4.1.7-1.targetarch.rpm \
+	lsb-test-desktop-t2c-4.1.2-2.targetarch.rpm \
+	lsb-test-libstdcpp-4.1.0-18.lsb4.targetarch.rpm \
+	lsb-test-olver-core-4.1.3-7.targetarch.rpm \
+	lsb-test-perl-4.1.6-2.noarch.rpm \
+	lsb-test-printing-4.1.2-1.targetarch.rpm \
+	lsb-test-python-4.1.5-1.targetarch.rpm \
+	lsb-test-qt3-azov-4.1.1-3.targetarch.rpm \
+	lsb-test-qt4-azov-4.1.2-1.targetarch.rpm \
+	lsb-test-xts5-5.1.5-42.lsb4.targetarch.rpm \
 	lsb-test-alsa-t2c-4.1.0-1.targetarch.rpm \
-	lsb-test-core-t2c-4.1.0-1.targetarch.rpm \
+	lsb-test-core-t2c-4.1.2-3.targetarch.rpm \
 	lsb-test-xml2-azov-4.1.0-1.targetarch.rpm \
 	"
 
 APP_PACKAGES_LIST="lsb-python-2.4.6-5.lsb4.targetarch.rpm \
-	lsb-apache-2.2.14-3.lsb4.targetarch.rpm \
+	lsb-apache-2.2.14-5.lsb4.targetarch.rpm \
 	lsb-tcl-8.5.7-6.lsb4.targetarch.rpm \
 	lsb-expect-5.43.0-11.lsb4.targetarch.rpm \
 	lsb-groff-1.20.1-5.lsb4.targetarch.rpm \
 	lsb-raptor-1.4.19-3.lsb4.targetarch.rpm \
-	lsb-xpdf-1.01-10.lsb4.targetarch.rpm \
-	lsb-samba-3.4.3-5.lsb4.targetarch.rpm \
-	lsb-rsync-3.0.6-3.lsb4.targetarch.rpm \
+	lsb-xpdf-1.01-12.lsb4.targetarch.rpm \
+	lsb-samba-3.4.3-7.lsb4.targetarch.rpm \
+	lsb-rsync-3.0.6-4.lsb4.targetarch.rpm \
 	"
 
 APP_TESTFILES_LIST="expect-tests.tar \
diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
index 5ebea53..3dcfc0d 100644
--- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "automate test for lsb"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://LSB_Test.sh;beginline=3;endline=16;md5=7063bb54b04719df0716b513447f4fc0"
 
-- 
1.7.5.4



