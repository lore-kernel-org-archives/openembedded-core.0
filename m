Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A64378CB7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:01:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6R810Ot017782
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 01:01:01 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 27 Jul 2018 01:01:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2018 16:04:32 +0800
Message-ID: <a0dd0ea83e5a6f45bb2caa13069296510dc8751f.1532669923.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1532669923.git.Qi.Chen@windriver.com>
References: <cover.1532669923.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] cups: upgrade 2.2.6 -> 2.2.8
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
X-List-Received-Date: Fri, 27 Jul 2018 08:01:00 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/{cups_2.2.6.bb => cups_2.2.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.2.6.bb => cups_2.2.8.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_2.2.6.bb b/meta/recipes-extended/cups/cups_2.2.8.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.2.6.bb
rename to meta/recipes-extended/cups/cups_2.2.8.bb
index 3aa934b..de1bd84 100644
--- a/meta/recipes-extended/cups/cups_2.2.6.bb
+++ b/meta/recipes-extended/cups/cups_2.2.8.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
 
-SRC_URI[md5sum] = "e91c26d8d97b5a1630a962f530f02192"
-SRC_URI[sha256sum] = "40385778c2b3bdf55030d1c999734e22774c79e3425d91339ce677825620169b"
+SRC_URI[md5sum] = "33150d08993a04c8e22176e93805a051"
+SRC_URI[sha256sum] = "3968fc1d26fc48727508db1c1380e36c6694ab90177fd6920aec5f6cc73af9e4"
-- 
1.9.1


