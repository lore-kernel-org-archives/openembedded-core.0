Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 00C09731F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 07:19:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B7JTpb026719
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 23:19:29 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Jan 2016 23:19:29 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Jan 2016 23:19:21 -0800
Message-ID: <e4a8c7223730547c587989b75bc3a7db00423f55.1452496745.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452496745.git.liezhi.yang@windriver.com>
References: <cover.1452496745.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] file: 5.24 -> 5.25
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
X-List-Received-Date: Mon, 11 Jan 2016 07:19:29 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../file/{file_5.24.bb => file_5.25.bb}            |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.24.bb => file_5.25.bb} (96%)

diff --git a/meta/recipes-devtools/file/file_5.24.bb b/meta/recipes-devtools/file/file_5.25.bb
similarity index 96%
rename from meta/recipes-devtools/file/file_5.24.bb
rename to meta/recipes-devtools/file/file_5.25.bb
index 39f185d..68bad69 100644
--- a/meta/recipes-devtools/file/file_5.24.bb
+++ b/meta/recipes-devtools/file/file_5.25.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/file/file.git \
         file://host-file.patch \
         "
 
-SRCREV = "3c0874be4d3232d672b20f513451a39cfd7c585a"
+SRCREV = "f45db89ddc91692b662fffbabbdafc7bc4c00f5e"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
1.7.9.5


