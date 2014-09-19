Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13D8E65CE7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 06:49:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8J6nXVH024668
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 23:49:33 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Sep 2014 23:49:33 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Sep 2014 14:49:38 +0800
Message-ID: <1411109378-27850-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 2/2] gnupg: add pinentry RDEPENDS
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
X-List-Received-Date: Fri, 19 Sep 2014 06:49:37 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

gnupg needs pinentry to run

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-support/gnupg/gnupg_2.0.26.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.26.bb b/meta/recipes-support/gnupg/gnupg_2.0.26.bb
index c460b7e..c7606eb 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.26.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.26.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
 
 DEPENDS = "${PTH} libassuan libksba zlib bzip2 readline libgcrypt"
+RDEPENDS_${PN} = "pinentry"
 PTH = "pth"
 PTH_libc-uclibc = "npth"
 
-- 
1.7.10.4


