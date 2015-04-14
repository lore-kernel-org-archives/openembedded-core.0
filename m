Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 145E473D3C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:09:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3E994jV010540
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:09:04 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:09:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:09:00 -0700
Message-ID: <9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429002519.git.liezhi.yang@windriver.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] libepoxy: DEPENDS on virtual/mesa
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
X-List-Received-Date: Tue, 14 Apr 2015 09:09:03 -0000
Content-Type: text/plain

Fixed do_configure error:
configure: error: libX11 headers (libx11-dev) required to build with GLX support
and do_compile error:
../include/epoxy/egl_generated.h:10:29: fatal error: EGL/eglplatform.h: No such file or directory
 #include "EGL/eglplatform.h"

The dependencies form its README.md:
* automake
* libegl1-mesa-dev
* xutils-dev

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_1.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
index 4357331..50b9d2c 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
@@ -13,4 +13,4 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-DEPENDS = "util-macros"
+DEPENDS = "util-macros virtual/mesa"
-- 
1.7.9.5


