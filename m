Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5199B783BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 09:47:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6O9lBdg026996
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 02:47:11 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 24 Jul 2017 02:47:11 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jul 2017 17:51:10 +0800
Message-ID: <7b37fa125f76c4288733b0adc7f8cc957c458128.1500889785.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1500889785.git.Qi.Chen@windriver.com>
References: <cover.1500889785.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] cups: upgrade to 2.2.4
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
X-List-Received-Date: Mon, 24 Jul 2017 09:47:10 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/{cups_2.2.3.bb => cups_2.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.2.3.bb => cups_2.2.4.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_2.2.3.bb b/meta/recipes-extended/cups/cups_2.2.4.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.2.3.bb
rename to meta/recipes-extended/cups/cups_2.2.4.bb
index 204d14d..ed94b67 100644
--- a/meta/recipes-extended/cups/cups_2.2.3.bb
+++ b/meta/recipes-extended/cups/cups_2.2.4.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
 
-SRC_URI[md5sum] = "006a8156680a516e43c59034e31df8bf"
-SRC_URI[sha256sum] = "66701fe15838f2c892052c913bde1ba106bbee2e0a953c955a62ecacce76885f"
+SRC_URI[md5sum] = "d26e5a0a574a69fe1d01079b2931fc49"
+SRC_URI[sha256sum] = "596d4db72651c335469ae5f37b0da72ac9f97d73e30838d787065f559dea98cc"
-- 
1.9.1


