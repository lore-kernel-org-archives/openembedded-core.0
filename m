Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVr-00025t-0L
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:39 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:12:16 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so1873962wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=MnAegNxyT89BCWXgwEH1IJfiPvntDBpNK8gGbpoq2HA=;
	b=TSJ0GVLmY5D8QShvDL3HLcKInlMaB4AkURYZIWk85SEyMhiHX13XACn4IqudHncDNc
	uy+0xwhN1mYk3T3QlisupOqYTelnBhBWi9zaUV5YoIA0AhUp///5WSAvwOxFpLaHhbjl
	KYAnn3mJDAr08QvDcHxWAEENZTsz/vFgQytU2u5KgZwDuUWxWcQBW/qTi2dXsGrtOPCY
	qxALdYUv/UvC0yIy8O6z08qtSWHPAHrxa9oJXwUggeMV6Q+bXImDuv8qcBmP0r7S1cot
	CphZrARKQWlDDp+C6KISULbVvVFRY3oes3pYl/04X3xJ1B8B2z9NGtDecPeJ3YdixUpp
	yFUw==
Received: by 10.216.95.74 with SMTP id o52mr1462869wef.123.1342714326202;
	Thu, 19 Jul 2012 09:12:06 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.12.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:12:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:11:12 +0100
Message-Id: <d80d95e269f0faab654665dcf45c7295e9ce88c4.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmE2BwRYDciHW0NYDoQRhtxDNNLBuSGykdKFQsWZeqfrhjX3wZ7MQbCPRBQEhDXdhkClNIm
Subject: [PATCH 25/26] vte: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:40 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/vte/vte.inc       |    4 ++--
 meta/recipes-support/vte/vte_0.28.2.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 7971673..9fe7956 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -4,11 +4,11 @@ LICENSE = "LGPLv2.1+"
 DEPENDS = " glib-2.0 gtk+ intltool-native ncurses"
 RDEPENDS_libvte = "vte-termcap"
 
-inherit gnome
+inherit gnome gtk-doc
 
 SRC_URI += "file://introspection.patch"
 
-EXTRA_OECONF = "--disable-gtk-doc --disable-python --disable-introspection"
+EXTRA_OECONF = "--disable-python --disable-introspection"
 
 PACKAGES =+ "libvte vte-termcap"
 FILES_libvte = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
index 6111ccf..2cb1871 100644
--- a/meta/recipes-support/vte/vte_0.28.2.bb
+++ b/meta/recipes-support/vte/vte_0.28.2.bb
@@ -2,7 +2,7 @@ require vte.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI[archive.md5sum] = "f07a4bf943194f94b7f142db8f7f36dc"
 SRC_URI[archive.sha256sum] = "8d04e202b617373dfb47689e5e628febe2c58840b34cccc4af4feb88c48df903"
-- 
1.7.10



