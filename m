Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1SrJyw-00009g-Jz
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 04:27:18 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6I2Fvhr020216
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 19:15:57 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.163) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 17 Jul 2012 19:15:57 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jul 2012 10:15:56 +0800
Message-ID: <1342577756-11891-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] slang: add header to patch
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
X-List-Received-Date: Wed, 18 Jul 2012 02:27:19 -0000
Content-Type: text/plain

From: Roy.Li <rongqing.li@windriver.com>

Add description, Signed-off-by and Upstream-Status to
change-char-type-to-signed-char-in-macros.patch

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 ...change-char-type-to-signed-char-in-macros.patch |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch b/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch
index 18dea13..2ea1ffd 100644
--- a/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch
+++ b/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch
@@ -1,3 +1,19 @@
+slang: change char type to signed char in macros
+
+C language has 3 distinct char types:
+         char
+         unsigned char
+         signed char
+A char has the same range of values as signed char on X86,
+but same as unsigned char on ARM which made Slang's typecast()
+and array_sort() unable to work for char value on ARM, since
+Slang is assuming "char" as "signed char".
+
+Now we change "char" as "signed char" explicitly in
+util/mkslarith2.sl, and use it to regenerate src/slarith2.inc
+
+Upstream-Status: Submitted
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 ---
  src/slarith2.inc       |   72 ++++++++++++++++++++++++-------------------------
  src/util/mkslarith2.sl |    2 -
-- 
1.7.4.1



