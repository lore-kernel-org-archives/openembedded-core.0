Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5A5B6AE79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 02:30:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5Q2UsR2005501
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 19:30:54 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 25 Jun 2013 19:30:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jun 2013 10:30:49 +0800
Message-ID: <9331be978f20347418fd44382179a105280ed7d8.1372212772.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372212772.git.hongxu.jia@windriver.com>
References: <cover.1372212772.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] lsbtest: sync test suite packages version
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
X-List-Received-Date: Wed, 26 Jun 2013 02:30:53 -0000
Content-Type: text/plain

Update file packages_list after sync test suite packages version with
upstream.
Check date: Jun 25, 2013

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest/packages_list | 38 ++++++++++++-------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/packages_list b/meta/recipes-extended/lsb/lsbtest/packages_list
index dc3c002..99f83c1 100644
--- a/meta/recipes-extended/lsb/lsbtest/packages_list
+++ b/meta/recipes-extended/lsb/lsbtest/packages_list
@@ -3,42 +3,42 @@ LSB_ARCH="lsbarch"
 
 BASE_PACKAGES_LIST="lsb-setup-4.1.0-1.noarch.rpm"
 
-RUNTIME_BASE_PACKAGES_LIST="lsb-dist-checker-4.1.0.11-1.targetarch.rpm \
+RUNTIME_BASE_PACKAGES_LIST="lsb-dist-checker-4.1.0.12-1.targetarch.rpm \
 	lsb-tet3-lite-3.7-23.lsb4.targetarch.rpm \
 	lsb-tet3-lite-devel-3.7-23.lsb4.targetarch.rpm \
 	lsb-xvfb-1.2.0-21.targetarch.rpm \
 	"
 
-RUNTIME_PACKAGES_LIST="lsb-cmdchk-4.1.4-3.targetarch.rpm \
-	lsb-libchk-4.1.4-3.targetarch.rpm \
+RUNTIME_PACKAGES_LIST="lsb-cmdchk-4.1.4-5.targetarch.rpm \
+	lsb-libchk-4.1.4-5.targetarch.rpm \
 	lsb-qm-2.2-8.lsb4.targetarch.rpm \
-	lsb-task-dist-testkit-4.1.3-1.noarch.rpm \
-	lsb-test-core-4.1.12-2.targetarch.rpm \
+	lsb-task-dist-testkit-4.1.9-1.noarch.rpm \
+	lsb-test-core-4.1.15-1.targetarch.rpm \
 	lsb-test-cpp-t2c-4.1.0-1.targetarch.rpm \
-	lsb-test-desktop-4.1.7-1.targetarch.rpm \
-	lsb-test-desktop-t2c-4.1.2-2.targetarch.rpm \
+	lsb-test-desktop-4.1.9-1.targetarch.rpm \
+	lsb-test-desktop-t2c-4.1.3-3.targetarch.rpm \
 	lsb-test-libstdcpp-4.1.0-18.lsb4.targetarch.rpm \
 	lsb-test-olver-core-4.1.4-1.targetarch.rpm \
-	lsb-test-perl-4.1.6-2.noarch.rpm \
+	lsb-test-perl-4.1.8-1.noarch.rpm \
 	lsb-test-printing-4.1.2-1.targetarch.rpm \
 	lsb-test-python-4.1.5-1.targetarch.rpm \
 	lsb-test-qt3-azov-4.1.1-3.targetarch.rpm \
-	lsb-test-qt4-azov-4.1.2-1.targetarch.rpm \
-	lsb-test-xts5-5.1.5-42.lsb4.targetarch.rpm \
+	lsb-test-qt4-azov-4.1.3-1.targetarch.rpm \
+	lsb-test-xts5-5.1.5-45.lsb4.targetarch.rpm \
 	lsb-test-alsa-t2c-4.1.0-1.targetarch.rpm \
 	lsb-test-core-t2c-4.1.2-3.targetarch.rpm \
 	lsb-test-xml2-azov-4.1.0-1.targetarch.rpm \
 	"
 
-APP_PACKAGES_LIST="lsb-python-2.4.6-5.lsb4.targetarch.rpm \
-	lsb-apache-2.2.14-5.lsb4.targetarch.rpm \
-	lsb-tcl-8.5.7-6.lsb4.targetarch.rpm \
-	lsb-expect-5.43.0-11.lsb4.targetarch.rpm \
-	lsb-groff-1.20.1-5.lsb4.targetarch.rpm \
-	lsb-raptor-1.4.19-3.lsb4.targetarch.rpm \
-	lsb-xpdf-1.01-12.lsb4.targetarch.rpm \
-	lsb-samba-3.4.3-7.lsb4.targetarch.rpm \
-	lsb-rsync-3.0.6-4.lsb4.targetarch.rpm \
+APP_PACKAGES_LIST="lsb-python-2.4.6-7.lsb4.targetarch.rpm \
+	lsb-apache-2.2.14-8.lsb4.targetarch.rpm \
+	lsb-tcl-8.5.7-8.lsb4.targetarch.rpm \
+	lsb-expect-5.43.0-13.lsb4.targetarch.rpm \
+	lsb-groff-1.20.1-7.lsb4.targetarch.rpm \
+	lsb-raptor-1.4.19-5.lsb4.targetarch.rpm \
+	lsb-xpdf-1.01-14.lsb4.targetarch.rpm \
+	lsb-samba-3.4.3-9.lsb4.targetarch.rpm \
+	lsb-rsync-3.0.6-6.lsb4.targetarch.rpm \
 	"
 
 APP_TESTFILES_LIST="expect-tests.tar \
-- 
1.8.1.2


