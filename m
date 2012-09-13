Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TC6Us-00012n-Ku
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 12:18:10 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 13 Sep 2012 03:05:29 -0700
Received: by wgbdr1 with SMTP id dr1so1885535wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 03:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=sf1c1L11FAqprjrhlieQZPWzBBGKXpgm1CxWnF136/w=;
	b=oxucJD0lH7DwkwcsSSg3rqzyX7PWedEzMucfMOWp/y0Fm+eMKQANtvyLxXTFBip1jp
	tF4NFq1UAmoRL41VafwdT9hgpEDIHwvepfSiy0F9Ccxu56sGdIg6ka2BsiTENNLDZNrQ
	K3swQoHaW2AWN02elhLSq6BuxOV3fcs4jKXPBcCf9Z+AvPHcP+Kxoc/csxIKvjGBbGmk
	PPWsR9fyAtsHOYjNt02W181M1AXv/2Xw3gNuYULM+zuaWxL8TUrDiDMWeiank0W1MHYb
	xn3NW+mlPmTBCXjICBJ9yfKS4eCNtzgM1BEMw5+p1BssdOvHdVtRhu2xE2/5nIwQB1hG
	RPww==
Received: by 10.180.84.1 with SMTP id u1mr3718269wiy.15.1347530725156;
	Thu, 13 Sep 2012 03:05:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k2sm19344600wiz.7.2012.09.13.03.05.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Sep 2012 03:05:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 11:04:30 +0100
Message-Id: <1347530671-16622-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347530671-16622-1-git-send-email-ross.burton@intel.com>
References: <1347530671-16622-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnBnMNdhCjSeemXvzDAx7Kdrw0s/uZ+Xh//huhJT51WztJ56YcbuulrauzyCC1BdBlZeqTz
Subject: [PATCH 2/3] librsvg: remove spurious popt dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 10:18:10 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 364f6f2..6bb5fe2 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://rsvg.h;beginline=3;endline=24;md5=20b4113c4909bbf0d67e006778302bc6"
 
 SECTION = "x11/utils"
-DEPENDS = "gtk+ libcroco cairo libxml2 popt"
+DEPENDS = "gtk+ libcroco cairo libxml2"
 DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
 BBCLASSEXTEND = "native"
 
-PR = "r8"
+PR = "r9"
 
 inherit autotools pkgconfig gnome gtk-doc
 
-- 
1.7.10



