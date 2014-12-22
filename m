Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3433B729A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 05:28:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBM5SV9Y006899
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 21:28:31 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 21 Dec 2014 21:28:31 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 21:28:26 -0800
Message-ID: <7ec1bc7bb6c04478dc4c382ae95bd4c6e8aad5c2.1419226071.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1419226071.git.liezhi.yang@windriver.com>
References: <cover.1419226071.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] rsync: upgrade to 3.1.1
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
X-List-Received-Date: Mon, 22 Dec 2014 05:28:31 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../rsync/{rsync_3.1.0.bb => rsync_3.1.1.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.1.0.bb => rsync_3.1.1.bb} (83%)

diff --git a/meta/recipes-devtools/rsync/rsync_3.1.0.bb b/meta/recipes-devtools/rsync/rsync_3.1.1.bb
similarity index 83%
rename from meta/recipes-devtools/rsync/rsync_3.1.0.bb
rename to meta/recipes-devtools/rsync/rsync_3.1.1.bb
index a4a5c10..5ff8ae8 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.0.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.1.bb
@@ -3,8 +3,8 @@ require rsync.inc
 
 SRC_URI += "file://acinclude.m4"
 
-SRC_URI[md5sum] = "3be148772a33224771a8d4d2a028b132"
-SRC_URI[sha256sum] = "81ca23f77fc9b957eb9845a6024f41af0ff0c619b7f38576887c63fa38e2394e"
+SRC_URI[md5sum] = "43bd6676f0b404326eee2d63be3cdcfe"
+SRC_URI[sha256sum] = "7de4364fcf5fe42f3bdb514417f1c40d10bbca896abe7e7f2c581c6ea08a2621"
 
 PACKAGECONFIG ??= "acl attr"
 PACKAGECONFIG[acl] = "--enable-acl-support,--disable-acl-support,acl,"
-- 
1.7.9.5


