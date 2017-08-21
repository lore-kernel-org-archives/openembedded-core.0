Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 146BB78340
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 08:00:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L80iQe019561
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 01:00:44 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 01:00:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 01:00:39 -0700
Message-ID: <573173ac500ba0fd2e4889b4c52b02c810d960a8.1503302375.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1503302375.git.liezhi.yang@windriver.com>
References: <cover.1503302375.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] tcl: 8.6.6 -> 0.8.7
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
X-List-Received-Date: Mon, 21 Aug 2017 08:00:44 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/tcltk/{tcl_8.6.6.bb => tcl_8.6.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.6.bb => tcl_8.6.7.bb} (95%)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.6.bb b/meta/recipes-devtools/tcltk/tcl_8.6.7.bb
similarity index 95%
rename from meta/recipes-devtools/tcltk/tcl_8.6.6.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.7.bb
index 5cecf65..d00d2dc 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.6.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.7.bb
@@ -24,8 +24,8 @@ SRC_URI = "${BASE_SRC_URI} \
            file://alter-includedir.patch \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "5193aea8107839a79df8ac709552ecb7"
-SRC_URI[sha256sum] = "a265409781e4b3edcc4ef822533071b34c3dc6790b893963809b9fe221befe07"
+SRC_URI[md5sum] = "5673aaf45b5de5d8dd80bb3daaeb8838"
+SRC_URI[sha256sum] = "7c6b8f84e37332423cfe5bae503440d88450da8cc1243496249faa5268026ba5"
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
-- 
2.10.2


