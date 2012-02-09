Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RvPOn-0007uI-16
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 09:30:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q198MWhr014734
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2012 00:22:32 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 9 Feb 2012 00:22:32 -0800
Message-ID: <fb577ec153d082e1f377ef5d5de3ff5caaa4eb34.1328774359.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1328774359.git.xiaofeng.yan@windriver.com>
References: <cover.1328774359.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 9 Feb 2012 15:40:00 +0800
Date: Thu, 9 Feb 2012 16:05:14 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libx11-1.4.4: Add patch "makekeys_crosscompile.patch"
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
X-List-Received-Date: Thu, 09 Feb 2012 08:30:37 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add patch "makekeys_crosscompile.patch" to libx11-1.4.4 for fixing
bug 1970.

[YOCTO #1970]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
index ee1d919..0428ff5 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
@@ -1,7 +1,7 @@
 require libx11.inc
 inherit gettext
 
-PR = "r1"
+PR = "r2"
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -15,6 +15,7 @@ DEPENDS += "util-macros xtrans libxdmcp libxau \
 SRC_URI += " file://keysymdef_include.patch \
              file://x11_disable_makekeys.patch \
              file://0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch \
+             file://makekeys_crosscompile.patch \
              "
 
 SRC_URI[md5sum] = "ed7c382cbf8c13425b6a66bcac0ca5d9"
-- 
1.7.0.4



