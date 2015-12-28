Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E15D731B0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:15:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBS7FGl7013869
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:15:16 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:15:15 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:48 -0800
Message-ID: <6d0cf8ebde4eaa2c868dac8d0dac498c4210ec05.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 40/40] cairo: fix license for cairo-script-interpreter
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
X-List-Received-Date: Mon, 28 Dec 2015 07:15:15 -0000
Content-Type: text/plain

From: Andre McCurdy <armccurdy@gmail.com>

Without an explicit license, cairo-script-interpreter inherits
the default LICENSE and isn't packaged in builds which blacklist
GPLv3.

(From OE-Core master rev: cb8f84218b065fed88a8c36f3c78065e8ab726bf)

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/cairo/cairo.inc |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 1e45318..45651ba 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -9,11 +9,14 @@ Extension."
 HOMEPAGE = "http://cairographics.org"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
+
 LICENSE = "MPL-1 & LGPLv2.1 & GPLv3+"
 LICENSE_${PN} = "MPL-1 & LGPLv2.1"
 LICENSE_${PN}-dev = "MPL-1 & LGPLv2.1"
 LICENSE_${PN}-gobject = "MPL-1 & LGPLv2.1"
+LICENSE_${PN}-script-interpreter = "MPL-1 & LGPLv2.1"
 LICENSE_${PN}-perf-utils = "GPLv3+"
+
 X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
 
-- 
1.7.9.5


