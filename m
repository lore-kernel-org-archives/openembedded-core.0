Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RVfBW-000767-VV
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 09:06:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAU7xo5w011492
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 23:59:50 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 29 Nov 2011 23:59:05 -0800
Message-ID: <4b27ade78ff28010687e1a50ee2ea108040dfd04.1322639391.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1322639391.git.xiaofeng.yan@windriver.com>
References: <cover.1322639391.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 30 Nov 2011 15:42:10 +0800
Date: Wed, 30 Nov 2011 15:55:50 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libx11-trim: Change checksum
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 08:06:31 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Correct checksum because checksum error for libx11-trim arise when compiling.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
index 7aed308..32d025f 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
@@ -14,7 +14,7 @@ SRC_URI += "file://x11_disable_makekeys.patch \
             file://makekeys_crosscompile.patch"
 
 
-SRC_URI[md5sum] = "f65c9c7ecbfb64c19dbd7927160d63fd"
-SRC_URI[sha256sum] = "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8324147c889a844"
+SRC_URI[md5sum] = "ed7c382cbf8c13425b6a66bcac0ca5d9"
+SRC_URI[sha256sum] = "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834599f5c654e6c840d"
 
 EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/ --disable-xcms "
-- 
1.7.0.4



