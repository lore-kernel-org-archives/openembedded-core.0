Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4613E758B6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 14:52:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t59Eq2N7012275
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 07:52:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 07:52:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 07:51:56 -0700
Message-ID: <2b973ab7375b7421be8c84ef83e567dec99cd88e.1433842738.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433842738.git.liezhi.yang@windriver.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/12] yasm: 1.2.0 -> 1.3.0
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
X-List-Received-Date: Tue, 09 Jun 2015 14:52:06 -0000
Content-Type: text/plain

Its LIC_FILES_CHKSUM changes because the COPYING's year updates, the
content is the same.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/yasm/yasm_1.2.0.bb |   13 -------------
 meta/recipes-devtools/yasm/yasm_1.3.0.bb |   14 ++++++++++++++
 2 files changed, 14 insertions(+), 13 deletions(-)
 delete mode 100644 meta/recipes-devtools/yasm/yasm_1.2.0.bb
 create mode 100644 meta/recipes-devtools/yasm/yasm_1.3.0.bb

diff --git a/meta/recipes-devtools/yasm/yasm_1.2.0.bb b/meta/recipes-devtools/yasm/yasm_1.2.0.bb
deleted file mode 100644
index cc7459b..0000000
--- a/meta/recipes-devtools/yasm/yasm_1.2.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
-LICENSE = "BSD"
-HOMEPAGE = "http://www.tortall.net/projects/yasm/"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=26c9f3d11f88911950f9ff62189d3d4f"
-
-SRC_URI = "http://www.tortall.net/projects/yasm/releases/yasm-${PV}.tar.gz"
-SRC_URI[md5sum] = "4cfc0686cf5350dd1305c4d905eb55a6"
-SRC_URI[sha256sum] = "768ffab457b90a20a6d895c39749adb547c1b7cb5c108e84b151a838a23ccf31"
-
-inherit autotools gettext
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/yasm/yasm_1.3.0.bb b/meta/recipes-devtools/yasm/yasm_1.3.0.bb
new file mode 100644
index 0000000..78702ed
--- /dev/null
+++ b/meta/recipes-devtools/yasm/yasm_1.3.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
+LICENSE = "BSD"
+HOMEPAGE = "http://www.tortall.net/projects/yasm/"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a12d8903508fb6bfd49d8d82c6170dd9"
+
+SRC_URI = "http://www.tortall.net/projects/yasm/releases/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "fc9e586751ff789b34b1f21d572d96af"
+SRC_URI[sha256sum] = "3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f"
+
+inherit autotools gettext
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


