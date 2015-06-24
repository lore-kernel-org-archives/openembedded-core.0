Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 84FAD75ACF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 08:34:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O8YPFr005427
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 01:34:25 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 24 Jun 2015 01:34:24 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jun 2015 16:34:37 +0800
Message-ID: <e73c01fa56d1408ca13f4fcb8e7c6ea1e5580a37.1435134771.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1435134771.git.Qi.Chen@windriver.com>
References: <cover.1435134771.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] cups: upgrade to 2.1b1
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
X-List-Received-Date: Wed, 24 Jun 2015 08:34:25 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/{cups_2.0.2.bb => cups_2.1b1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.0.2.bb => cups_2.1b1.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_2.0.2.bb b/meta/recipes-extended/cups/cups_2.1b1.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.0.2.bb
rename to meta/recipes-extended/cups/cups_2.1b1.bb
index 96c24cd..cbf3506 100644
--- a/meta/recipes-extended/cups/cups_2.0.2.bb
+++ b/meta/recipes-extended/cups/cups_2.1b1.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6c5a350596fba02754bd96eb6df3afd0"
 
-SRC_URI[md5sum] = "6e0ea72dbafcf5baaa1cf4178e71096d"
-SRC_URI[sha256sum] = "858720f76b66fd0441ae2a16f7cabd9554c8c64607e28ffacf16c36c53a3b18b"
+SRC_URI[md5sum] = "12e37ca320f46467759e9440ffad07e9"
+SRC_URI[sha256sum] = "ffc7620e7dcd8412af3ff2c3da74c56d5dcbb335bf79b787bed039fe1918aee1"
-- 
1.9.1


