Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16D0060291
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 06:24:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w696Ounp027651
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Jul 2018 23:24:57 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Sun, 8 Jul 2018 23:24:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jul 2018 14:34:56 +0800
Message-ID: <d04cdde9e9f81c6c3ba752443e612494dfbc3bea.1531118079.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1531118079.git.liezhi.yang@windriver.com>
References: <cover.1531118079.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dwarfsrcfiles: fix typo: debig -> debug
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
X-List-Received-Date: Mon, 09 Jul 2018 06:24:56 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb b/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
index c59a006..2c843a9 100644
--- a/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
+++ b/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
@@ -1,4 +1,4 @@
-SUMMARY = "A small utility for printing debig source file locations embedded in binaries"
+SUMMARY = "A small utility for printing debug source file locations embedded in binaries"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://../dwarfsrcfiles.c;md5=31483894e453a77acbb67847565f1b5c;beginline=1;endline=8"
 
-- 
2.7.4


