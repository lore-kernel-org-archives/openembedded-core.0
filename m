Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E27E96F8F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 02:13:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2K2Djrv006346
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 19:13:45 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 19 Mar 2014 19:13:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Mar 2014 10:19:03 +0800
Message-ID: <7d03205d64c8f7933a1a9cdb22174496ebda29bf.1395281861.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1395281861.git.liezhi.yang@windriver.com>
References: <cover.1395281861.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] file: upgrade from 5.16 to 5.17
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
X-List-Received-Date: Thu, 20 Mar 2014 02:13:46 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/file/{file_5.16.bb => file_5.17.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/file/{file_5.16.bb => file_5.17.bb} (86%)

diff --git a/meta/recipes-devtools/file/file_5.16.bb b/meta/recipes-devtools/file/file_5.17.bb
similarity index 86%
rename from meta/recipes-devtools/file/file_5.16.bb
rename to meta/recipes-devtools/file/file_5.17.bb
index 46dbf88..4ed0820 100644
--- a/meta/recipes-devtools/file/file_5.16.bb
+++ b/meta/recipes-devtools/file/file_5.17.bb
@@ -15,8 +15,8 @@ SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
            file://dump \
            file://filesystems"
 
-SRC_URI[md5sum] = "359c0cf41c3d438d17b4d293f3b950dc"
-SRC_URI[sha256sum] = "48bcac7726c37a8a0bc7ffa16b58993575657dd7b382039380fb3b74ab389261"
+SRC_URI[md5sum] = "e19c47e069ced7b01ccb4db402cc01d3"
+SRC_URI[sha256sum] = "3feb97141b387b64da30aee485852925312c0e74219380a5ed451f14a90c83ca"
 
 inherit autotools
 
-- 
1.8.3.1


