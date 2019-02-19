Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 62DCE7C8C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 01:43:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1J1hrWg015889
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 17:43:53 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Mon, 18 Feb 2019 17:43:52 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2019 09:53:10 +0800
Message-ID: <12cf61103b21c56919c6252df81bc70c65d7f206.1550541019.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1550541019.git.Qi.Chen@windriver.com>
References: <cover.1550541019.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] cups: upgrade to 2.2.10
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
X-List-Received-Date: Tue, 19 Feb 2019 01:43:52 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/{cups_2.2.9.bb => cups_2.2.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.2.9.bb => cups_2.2.10.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_2.2.9.bb b/meta/recipes-extended/cups/cups_2.2.10.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.2.9.bb
rename to meta/recipes-extended/cups/cups_2.2.10.bb
index fcd96ef..490c84e 100644
--- a/meta/recipes-extended/cups/cups_2.2.9.bb
+++ b/meta/recipes-extended/cups/cups_2.2.10.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
 
-SRC_URI[md5sum] = "798e83bb1a240f5417a252903d83ae0c"
-SRC_URI[sha256sum] = "6d22d5da253b97643320da0bf95574acd85ff2abe3ec1a51d36093841d891156"
+SRC_URI[md5sum] = "3d22d747403ec5dcd0b66d1332564816"
+SRC_URI[sha256sum] = "77c8b2b3bb7fe8b5fbfffc307f2c817b2d7ec67b657f261a1dd1c61ab81205bb"
-- 
1.9.1


