Return-Path: <Sakib.Sajal@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4012D7E3BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 20:26:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4VKQHPU013718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 13:26:27 -0700
Received: from ssajal-HP-EliteBook-850-G3.wrs.com (128.224.140.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Fri, 31 May 2019 13:25:55 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 May 2019 16:25:50 -0400
Message-ID: <20190531202552.21421-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] bash: add big5hkscs gconv RDEPENDS needed by bash-ptest.
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
X-List-Received-Date: Fri, 31 May 2019 20:26:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

glob-test failed beacuse it could not convert big5hkscs
encoding to perform comparison.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
---
 meta/recipes-extended/bash/bash.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 1e4dc55d01..dbb803ddef 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -27,6 +27,7 @@ RDEPENDS_${PN}-ptest += "make coreutils perl"
 
 DEPENDS_append_libc-glibc = " virtual/libc-locale"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " \
+	glibc-gconv-big5hkscs \
 	glibc-gconv-iso8859-1 \
 	glibc-utils \
 	locale-base-de-de \
-- 
2.20.1


