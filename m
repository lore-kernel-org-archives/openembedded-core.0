Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 583D865C87
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 08:55:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA78ttVu000592
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Nov 2014 00:55:55 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Fri, 7 Nov 2014 00:55:54 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 16:51:11 +0800
Message-ID: <bd7ee7f8b4812ddb4afde9a378ed135ad7d4cde9.1415350038.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415350038.git.kai.kang@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen.kooi@linaro.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 06/24] glibc-locale.inc: add aarch64 to BINARY_LOCALE_ARCHES
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
X-List-Received-Date: Fri, 07 Nov 2014 08:55:58 -0000
Content-Type: text/plain

Add aarch64 to var BINARY_LOCALE_ARCHES. In libc-packages.class, it is
used to work with other vars to check and add cross-localedef-native as
a dependecy correctly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index d472605..df6d073 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -23,7 +23,7 @@ ENABLE_BINARY_LOCALE_GENERATION_pn-nativesdk-glibc-locale = "0"
 
 #enable locale generation on these arches
 # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
-BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips mips64"
+BINARY_LOCALE_ARCHES ?= "arm.* aarch64 i[3-6]86 x86_64 powerpc mips mips64"
 
 # set "1" to use cross-localedef for locale generation
 # set "0" for qemu emulation of native localedef for locale generation
-- 
1.9.1


