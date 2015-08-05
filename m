Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6912C60125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 08:02:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7582h1l022275
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Aug 2015 01:02:43 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 5 Aug 2015 01:02:43 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Aug 2015 16:02:49 +0800
Message-ID: <a7cf19b72a628de9a40cb8b11933dd5c659e2223.1438761716.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1438761716.git.Qi.Chen@windriver.com>
References: <cover.1438761716.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] cups: upgrade to 2.0.4
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
X-List-Received-Date: Wed, 05 Aug 2015 08:02:45 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/{cups_2.0.3.bb => cups_2.0.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.0.3.bb => cups_2.0.4.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_2.0.3.bb b/meta/recipes-extended/cups/cups_2.0.4.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.0.3.bb
rename to meta/recipes-extended/cups/cups_2.0.4.bb
index edff955..bad73b3 100644
--- a/meta/recipes-extended/cups/cups_2.0.3.bb
+++ b/meta/recipes-extended/cups/cups_2.0.4.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6c5a350596fba02754bd96eb6df3afd0"
 
-SRC_URI[md5sum] = "8d98b85edbdab7ab03739c9622f570e8"
-SRC_URI[sha256sum] = "bc3167048690a7379f29a37d9fbd2143cf0ca033b54eedd9333ddfc4ee258881"
+SRC_URI[md5sum] = "f5c847d9a4fac6c4c66fb0526a7afaae"
+SRC_URI[sha256sum] = "e1d5e68d9f24faca317aeaebc164c34102813bc0f1d69c00b3a59b49c49f4abd"
-- 
1.9.1


