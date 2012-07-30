Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1Svm9H-00068f-PJ
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 11:20:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6U98kCc004872
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 02:08:47 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.163) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 30 Jul 2012 02:08:46 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jul 2012 17:08:46 +0800
Message-ID: <1343639326-29842-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] slang: change char type to signed char in macros
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2012 09:20:24 -0000
Content-Type: text/plain

From: Roy.Li <rongqing.li@windriver.com>

[YOCTO 2726]

The patch of converting char type to signed char is only applied to arm,
in fact it should be applied to powerpc too since powerpc has the same
assumption for char type. To x86 and mips, this patch has not impact.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-extended/slang/slang_2.2.4.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index 7082611..e7d804c 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -10,7 +10,7 @@ to recode S-Lang procedures in C if you need to."
 HOMEPAGE = "http://www.jedsoft.org/slang/"
 SECTION = "libs"
 DEPENDS = "pcre"
-PR = "r10"
+PR = "r11"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
@@ -20,7 +20,7 @@ SRC_URI = "ftp://space.mit.edu/pub/davis/slang/v2.2/slang-${PV}.tar.bz2 \
            file://rpathfix.patch \
            file://fix-check-pcre.patch \
           "
-SRC_URI_append_arm = " file://change-char-type-to-signed-char-in-macros.patch"
+SRC_URI_append = " file://change-char-type-to-signed-char-in-macros.patch"
 
 inherit autotools
 
-- 
1.7.4.1



