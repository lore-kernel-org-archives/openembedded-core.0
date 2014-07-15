Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA8F705B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:19:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6FEJhb6012725
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:19:43 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:19:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:19:13 -0700
Message-ID: <3b8abb7ee6d0bc4750d5ad55790cd75902798c4c.1405433828.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405433828.git.liezhi.yang@windriver.com>
References: <cover.1405433828.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 18/38] lsbtest: add bash to RDEPENDS_lsbtest
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
X-List-Received-Date: Tue, 15 Jul 2014 14:19:43 -0000
Content-Type: text/plain

Bash scripts:
lsbtest/usr/bin/LSB_Test.sh

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest_1.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
index f61251e..5a59285 100644
--- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "file://LSB_Test.sh \
 		   file://packages_list \
 		   file://session \
 		   "
-RDEPENDS_${PN} = "rpm"
+RDEPENDS_${PN} = "rpm bash"
 
 S = "${WORKDIR}"
 
-- 
1.7.9.5


