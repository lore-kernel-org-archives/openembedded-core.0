Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83F547850B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 02:10:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA92As6D014573
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Nov 2017 18:10:54 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 8 Nov 2017 18:10:53 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Nov 2017 10:12:13 +0800
Message-ID: <821dcfdb6d9ca14cdbc80e4023ff8f09fe6a7d0b.1510193452.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1510193452.git.Qi.Chen@windriver.com>
References: <cover.1510193452.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] cups: upgrade to 2.2.6
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
X-List-Received-Date: Thu, 09 Nov 2017 02:10:52 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/{cups_2.2.4.bb => cups_2.2.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.2.4.bb => cups_2.2.6.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_2.2.4.bb b/meta/recipes-extended/cups/cups_2.2.6.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.2.4.bb
rename to meta/recipes-extended/cups/cups_2.2.6.bb
index ed94b67..3aa934b 100644
--- a/meta/recipes-extended/cups/cups_2.2.4.bb
+++ b/meta/recipes-extended/cups/cups_2.2.6.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
 
-SRC_URI[md5sum] = "d26e5a0a574a69fe1d01079b2931fc49"
-SRC_URI[sha256sum] = "596d4db72651c335469ae5f37b0da72ac9f97d73e30838d787065f559dea98cc"
+SRC_URI[md5sum] = "e91c26d8d97b5a1630a962f530f02192"
+SRC_URI[sha256sum] = "40385778c2b3bdf55030d1c999734e22774c79e3425d91339ce677825620169b"
-- 
1.9.1


