Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 255927608F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 05:57:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4E5vSh9017391
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2018 22:57:28 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 13 May 2018 22:57:27 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 May 2018 13:59:21 +0800
Message-ID: <efb51f38d9adad4dd15b440352dbd1afe2cd107f.1526277424.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1526277424.git.Qi.Chen@windriver.com>
References: <cover.1526277424.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] gawk: upgrade to 4.2.1
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
X-List-Received-Date: Mon, 14 May 2018 05:57:27 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/gawk/{gawk_4.2.0.bb => gawk_4.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/gawk/{gawk_4.2.0.bb => gawk_4.2.1.bb} (89%)

diff --git a/meta/recipes-extended/gawk/gawk_4.2.0.bb b/meta/recipes-extended/gawk/gawk_4.2.1.bb
similarity index 89%
rename from meta/recipes-extended/gawk/gawk_4.2.0.bb
rename to meta/recipes-extended/gawk/gawk_4.2.1.bb
index 27f79a2..6b99357 100644
--- a/meta/recipes-extended/gawk/gawk_4.2.0.bb
+++ b/meta/recipes-extended/gawk/gawk_4.2.1.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "0b598c31bc703d66082bd958d4189980"
-SRC_URI[sha256sum] = "c88046c6e8396ee548bcb941e16def809b7b55b60a1044b5dd254094f347c7d9"
+SRC_URI[md5sum] = "0256724a0af50cb83ac92f833488673d"
+SRC_URI[sha256sum] = "2b23d51503b2df9a41aa6fddc6002ad7ebf2a386ac19dc1b6be0dd48b0acf6db"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
1.9.1


