Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm04.jp.fujitsu.com (mgwkm04.jp.fujitsu.com [202.219.69.171])
	by mail.openembedded.org (Postfix) with ESMTP id 81EFB60589
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:43:55 +0000 (UTC)
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by
	mgwkm04.jp.fujitsu.com with smtp
	id 2773_61f1_c13ace14_3c50_49b0_851a_763482364488;
	Thu, 10 Dec 2015 14:43:55 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
	(g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
	by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id CAEECAC031C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 14:43:54 +0900 (JST)
Received: from G01JPEXCHKW18.g01.fujitsu.local
	(G01JPEXCHKW18.g01.fujitsu.local [10.0.194.57])
	by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	2A1BB6924F8 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 14:43:54 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHKW18.g01.fujitsu.local (10.0.194.57) with Microsoft SMTP
	Server id 14.3.266.1; Thu, 10 Dec 2015 14:43:52 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Dec 2015 14:44:57 +0900
Message-ID: <1449726297-20673-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] cups: upgrade to 2.1.2
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
X-List-Received-Date: Thu, 10 Dec 2015 05:43:56 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-extended/cups/{cups_2.0.4.bb => cups_2.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.0.4.bb => cups_2.1.2.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_2.0.4.bb b/meta/recipes-extended/cups/cups_2.1.2.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.0.4.bb
rename to meta/recipes-extended/cups/cups_2.1.2.bb
index bad73b3..0c1e75d 100644
--- a/meta/recipes-extended/cups/cups_2.0.4.bb
+++ b/meta/recipes-extended/cups/cups_2.1.2.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6c5a350596fba02754bd96eb6df3afd0"
 
-SRC_URI[md5sum] = "f5c847d9a4fac6c4c66fb0526a7afaae"
-SRC_URI[sha256sum] = "e1d5e68d9f24faca317aeaebc164c34102813bc0f1d69c00b3a59b49c49f4abd"
+SRC_URI[md5sum] = "b3ba0ca676d56857bbd9b182ef4b14b3"
+SRC_URI[sha256sum] = "bab0ca3ba80eae48319b3a6b19a5b14fad5ce230f30151a0cfa4c0271df281ad"
-- 
1.8.4.2


