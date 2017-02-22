Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCB272F9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 03:13:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1M3DPt9012777
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 19:13:26 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 21 Feb 2017 19:13:24 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2017 11:13:42 +0800
Message-ID: <488854891716fbc54361cb6ab23ad4ede23479f4.1487733094.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1487733094.git.Qi.Chen@windriver.com>
References: <cover.1487733094.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/4] cups: upgrade to 2.2.2
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
X-List-Received-Date: Wed, 22 Feb 2017 03:13:25 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/{cups_2.2.1.bb => cups_2.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.2.1.bb => cups_2.2.2.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_2.2.1.bb b/meta/recipes-extended/cups/cups_2.2.2.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.2.1.bb
rename to meta/recipes-extended/cups/cups_2.2.2.bb
index 7c5e776..5174c30 100644
--- a/meta/recipes-extended/cups/cups_2.2.1.bb
+++ b/meta/recipes-extended/cups/cups_2.2.2.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
 
-SRC_URI[md5sum] = "a94da2a1e9dbdccb4f3836a38a431931"
-SRC_URI[sha256sum] = "83b8730aa977cc055e7410df6a3a682548994c113994ca630a16513017e419d5"
+SRC_URI[md5sum] = "036f6bda6202ae3e280ac00c710b5ca4"
+SRC_URI[sha256sum] = "f589bb7d5d1dc3aa0915d7cf2b808571ef2e1530cd1a6ebe76ae8f9f4994e4f6"
-- 
1.9.1


