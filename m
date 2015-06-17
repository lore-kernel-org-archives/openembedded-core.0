Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6A4C73F7F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 07:25:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5H7PJjZ009772
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 00:25:19 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 17 Jun 2015 00:25:19 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jun 2015 15:17:53 +0800
Message-ID: <b62d3aef444f2957fd916847561e0d1b1e57a88c.1434525397.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1434525397.git.kai.kang@windriver.com>
References: <cover.1434525397.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/1] cups: upgrade from 2.0.2 to 2.0.3
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
X-List-Received-Date: Wed, 17 Jun 2015 07:25:19 -0000
Content-Type: text/plain

Upgrade cups from 2.0.2 to 2.0.3. In its release log, it fixes
CERT VU #810572/CVE-2015-1158/CVE-2015-1159.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/cups/{cups_2.0.2.bb => cups_2.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.0.2.bb => cups_2.0.3.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_2.0.2.bb b/meta/recipes-extended/cups/cups_2.0.3.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.0.2.bb
rename to meta/recipes-extended/cups/cups_2.0.3.bb
index 96c24cd..edff955 100644
--- a/meta/recipes-extended/cups/cups_2.0.2.bb
+++ b/meta/recipes-extended/cups/cups_2.0.3.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6c5a350596fba02754bd96eb6df3afd0"
 
-SRC_URI[md5sum] = "6e0ea72dbafcf5baaa1cf4178e71096d"
-SRC_URI[sha256sum] = "858720f76b66fd0441ae2a16f7cabd9554c8c64607e28ffacf16c36c53a3b18b"
+SRC_URI[md5sum] = "8d98b85edbdab7ab03739c9622f570e8"
+SRC_URI[sha256sum] = "bc3167048690a7379f29a37d9fbd2143cf0ca033b54eedd9333ddfc4ee258881"
-- 
1.9.1


