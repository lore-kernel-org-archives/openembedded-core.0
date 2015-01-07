Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9365071440
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 15:02:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t07F29Gv027093
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jan 2015 07:02:09 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 07:02:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Jan 2015 07:02:05 -0800
Message-ID: <4fb6473dffd06b05e84daf87d75832a329200cb6.1420642796.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1420642796.git.liezhi.yang@windriver.com>
References: <cover.1420642796.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] file: upgrade to 5.22
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
X-List-Received-Date: Wed, 07 Jan 2015 15:02:10 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../file/{file_5.21.bb => file_5.22.bb}            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/file/{file_5.21.bb => file_5.22.bb} (86%)

diff --git a/meta/recipes-devtools/file/file_5.21.bb b/meta/recipes-devtools/file/file_5.22.bb
similarity index 86%
rename from meta/recipes-devtools/file/file_5.21.bb
rename to meta/recipes-devtools/file/file_5.22.bb
index 702ea87..9c6bb38 100644
--- a/meta/recipes-devtools/file/file_5.21.bb
+++ b/meta/recipes-devtools/file/file_5.22.bb
@@ -15,8 +15,8 @@ SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
            file://debian-742262.patch \
           "
 
-SRC_URI[md5sum] = "549fe96e09041eabece9de2bb28ef923"
-SRC_URI[sha256sum] = "1a48741d3923c4cc73267109b8a396c0ce3aebe004181f3efb1b0a228d230bb6"
+SRC_URI[md5sum] = "8fb13e5259fe447e02c4a37bc7225add"
+SRC_URI[sha256sum] = "c4e3a8e44cb888c5e4b476e738503e37fb9de3b25a38c143e214bfc12109fc0b"
 
 inherit autotools
 
-- 
1.7.9.5


