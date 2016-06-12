Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0436FFD8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 08:25:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5C8PHWD010056
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 01:25:17 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 01:25:17 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 01:25:04 -0700
Message-ID: <6c5b586b516a4a88b15a62e7037848964f26e1a2.1465719878.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465719878.git.liezhi.yang@windriver.com>
References: <cover.1465719878.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/11] file: 5.25 -> 5.27
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
X-List-Received-Date: Sun, 12 Jun 2016 08:25:20 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/file/{file_5.25.bb => file_5.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.25.bb => file_5.27.bb} (96%)

diff --git a/meta/recipes-devtools/file/file_5.25.bb b/meta/recipes-devtools/file/file_5.27.bb
similarity index 96%
rename from meta/recipes-devtools/file/file_5.25.bb
rename to meta/recipes-devtools/file/file_5.27.bb
index 68bad69..d1bbf6b 100644
--- a/meta/recipes-devtools/file/file_5.25.bb
+++ b/meta/recipes-devtools/file/file_5.27.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/file/file.git \
         file://host-file.patch \
         "
 
-SRCREV = "f45db89ddc91692b662fffbabbdafc7bc4c00f5e"
+SRCREV = "72da5ae78ed7b5ecbbe84c36ddb493f7907099bc"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.8.0


