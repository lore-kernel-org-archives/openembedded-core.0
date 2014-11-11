Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7364865DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 01:47:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAB1lZVY012855
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 17:47:35 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 10 Nov 2014 17:47:34 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Nov 2014 09:43:29 +0800
Message-ID: <0a9066cd4e072e09c5263c7c669b7bf89ff88edf.1415670170.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415670170.git.Chong.Lu@windriver.com>
References: <cover.1415670170.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] nss: Upgrade to 3.17.2
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
X-List-Received-Date: Tue, 11 Nov 2014 01:47:38 -0000
Content-Type: text/plain

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/nss/nss_3.17.2.bb | 8 ++++++++
 meta/recipes-support/nss/nss_3.17.bb   | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-support/nss/nss_3.17.2.bb
 delete mode 100644 meta/recipes-support/nss/nss_3.17.bb

diff --git a/meta/recipes-support/nss/nss_3.17.2.bb b/meta/recipes-support/nss/nss_3.17.2.bb
new file mode 100644
index 0000000..039406f
--- /dev/null
+++ b/meta/recipes-support/nss/nss_3.17.2.bb
@@ -0,0 +1,8 @@
+require nss.inc
+
+SRC_URI += "\
+    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_2_RTM/src/${BPN}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "d3edb6f6c3688b2fde67ec9c9a8c1214"
+SRC_URI[sha256sum] = "134929e44e44b968a4883f4ee513a71ae45d55b486cee41ee8e26c3cc84dab8b"
diff --git a/meta/recipes-support/nss/nss_3.17.bb b/meta/recipes-support/nss/nss_3.17.bb
deleted file mode 100644
index 804783f..0000000
--- a/meta/recipes-support/nss/nss_3.17.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require nss.inc
-
-SRC_URI += "\
-    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_RTM/src/${BPN}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "081dd99afa12af589c09e2d7cb5f5c6d"
-SRC_URI[sha256sum] = "3b1abcd8f89211dda2cc739bfa76552d080f7ea80482ef2727b006548a7f0c81"
-- 
1.9.1


