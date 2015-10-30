Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0FB75D4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 23:07:18 +0000 (UTC)
Received: by obcqt19 with SMTP id qt19so56041298obc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 16:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kSouYzIQl9Demp3Gijq8w/lixzZvLU3fCK7alTDOwiA=;
	b=NSuMMiU5+E22Nn5Lo9yBXP0vEXWdH1wN7e8Yb6zuWv64zoDoKER+ggiVTRqAu2m7tj
	8igKLVIcKFLkjgB9WTXiCOZ82XxYdLGAoD7iXRpVCPFHv/E1Mw4CLJnhLKcwBadbYihG
	noq/n2x7lu66GA4lnpraH33l1cOKzRGIFA1voqYtyifgmC9u9Somk3wmwBDNFkH9nWfA
	PAZzUGIkLjTBrbvVgA/7JE5TY2MVpM3Hs3pWLw0F8BvjOnn3EFnlt4k03gduc/lbOYzJ
	BG8vzZ7Iwf+uNfjabEZHq/9lZZqjyEb4835LzEZkfn+StujrhTp1DLJx174p+LMOXykp
	X7Xw==
X-Received: by 10.60.69.65 with SMTP id c1mr7417966oeu.38.1446246438004;
	Fri, 30 Oct 2015 16:07:18 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p3sm3730009oei.9.2015.10.30.16.07.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Oct 2015 16:07:17 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Oct 2015 16:07:10 -0700
Message-Id: <1446246430-15984-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] cairo: fix license for cairo-script-interpreter
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
X-List-Received-Date: Fri, 30 Oct 2015 23:07:23 -0000

Without an explicit license, cairo-script-interpreter inherits
the default LICENSE and isn't packaged in builds which blacklist
GPLv3.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/cairo/cairo.inc | 3 +++
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
1.9.1


