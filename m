Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B880D77DB1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 06:01:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6I61arl018739
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 23:01:36 -0700
Received: from pek-ddu-u1642.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 17 Jul 2017 23:01:35 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jul 2017 14:01:28 +0800
Message-ID: <dd968ff528a0928627a3bb12b4b1e8d77a1ff829.1500357604.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1500357604.git.dengke.du@windriver.com>
References: <cover.1500357604.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] expat: upgrade to 2.2.2
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
X-List-Received-Date: Tue, 18 Jul 2017 06:01:35 -0000
Content-Type: text/plain

The expat 2.2.2:

    using getrandom syscall on linux 3.17+, so when we compiling expat-native
    on the kernel older than 3.17, that would be failed.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-core/expat/expat_2.2.1.bb | 5 -----
 meta/recipes-core/expat/expat_2.2.2.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat_2.2.1.bb
 create mode 100644 meta/recipes-core/expat/expat_2.2.2.bb

diff --git a/meta/recipes-core/expat/expat_2.2.1.bb b/meta/recipes-core/expat/expat_2.2.1.bb
deleted file mode 100644
index 47827c5..0000000
--- a/meta/recipes-core/expat/expat_2.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require expat.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
-
-SRC_URI[md5sum] = "d9c3baeab58774cefc2f04faf29f2cf8"
-SRC_URI[sha256sum] = "1868cadae4c82a018e361e2b2091de103cd820aaacb0d6cfa49bd2cd83978885"
diff --git a/meta/recipes-core/expat/expat_2.2.2.bb b/meta/recipes-core/expat/expat_2.2.2.bb
new file mode 100644
index 0000000..dfa014b
--- /dev/null
+++ b/meta/recipes-core/expat/expat_2.2.2.bb
@@ -0,0 +1,5 @@
+require expat.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
+
+SRC_URI[md5sum] = "1ede9a41223c78528b8c5d23e69a2667"
+SRC_URI[sha256sum] = "4376911fcf81a23ebd821bbabc26fd933f3ac74833f74924342c29aad2c86046"
-- 
2.7.4


