Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AFBDF722AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 06:48:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAS6mftv024101
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 22:48:42 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 27 Nov 2014 22:48:41 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Nov 2014 01:48:37 -0500
Message-ID: <4e0e64527a030fda96c7ef062e45dc0de2ea1194.1417157206.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1417157206.git.jackie.huang@windriver.com>
References: <cover.1417157206.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] Revert "qt4*.bbclass: disable build qt on mips64 with 64 bits userspace"
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
X-List-Received-Date: Fri, 28 Nov 2014 06:48:46 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This reverts commit 17890ebd637da0b3bf78804002d8b4f0ace078d2.

qt4 is upgraded to 4.8.6 and this is fixed by:
c889b40 qt webkit: add support for MIPS64 platforms

so revert the commit.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/qt4e.bbclass   |    3 ---
 meta/classes/qt4x11.bbclass |    3 ---
 2 files changed, 6 deletions(-)

diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
index 850bb6a..13b1050 100644
--- a/meta/classes/qt4e.bbclass
+++ b/meta/classes/qt4e.bbclass
@@ -19,6 +19,3 @@ EXTRA_QMAKEVARS_PRE += " QT_LIBINFIX=${QT_LIBINFIX} "
 
 # Qt4 uses atomic instructions not supported in thumb mode
 ARM_INSTRUCTION_SET = "arm"
-
-# Qt4 could NOT be built on MIPS64 with 64 bits userspace
-COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
diff --git a/meta/classes/qt4x11.bbclass b/meta/classes/qt4x11.bbclass
index 65d196a..b06e15d 100644
--- a/meta/classes/qt4x11.bbclass
+++ b/meta/classes/qt4x11.bbclass
@@ -9,6 +9,3 @@ QT_LIBINFIX = ""
 
 # Qt4 uses atomic instructions not supported in thumb mode
 ARM_INSTRUCTION_SET = "arm"
-
-# Qt4 could NOT be built on MIPS64 with 64 bits userspace
-COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
-- 
1.7.9.5


