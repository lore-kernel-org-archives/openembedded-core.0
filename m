Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E50C573D13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 07:41:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T7fBgZ024808
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 00:41:11 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 29 Jul 2015 00:40:54 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 15:34:16 +0800
Message-ID: <1438155256-3385-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] bjam-native: inhibit sysroot strip
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
X-List-Received-Date: Wed, 29 Jul 2015 07:41:15 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The bjam is already stripped by default. Fix warning:

  WARNING: File '.../tmp/sysroots/x86_64-linux/usr/bin/bjam' from \
  bjam-native was already stripped, this will prevent future debugging!

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-support/boost/bjam-native_1.58.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/boost/bjam-native_1.58.0.bb b/meta/recipes-support/boost/bjam-native_1.58.0.bb
index d85d1a9..e2e0611 100644
--- a/meta/recipes-support/boost/bjam-native_1.58.0.bb
+++ b/meta/recipes-support/boost/bjam-native_1.58.0.bb
@@ -5,6 +5,9 @@ SECTION = "devel"
 
 inherit native
 
+# bjam is already stripped, don't strip it again
+INHIBIT_SYSROOT_STRIP = "1"
+
 do_compile() {
     ./bootstrap.sh --with-toolset=gcc
 }
-- 
1.9.1


