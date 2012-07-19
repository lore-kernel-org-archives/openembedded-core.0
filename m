Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVS-0000wg-QW
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:16 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:53 -0700
Received: by weyt11 with SMTP id t11so1708293wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=CQTm1ahlXYvHMqPo3j5FdUWtbBe7zbkMGfwoz32UMN0=;
	b=hgEA2v5kNGacQGXm/UGR9EuYQ4tV5YBNqMEcbvmW92IMn6dY/X1lkVrb1lry85xaQj
	ndvYytXpg2Zk9e+b8UHtlahlEn+Ro/h91w7oudSk1cw4jmGJ3wkP+TaDOL19UbgdCZio
	rWA99em3dTY/iuDxk0uqgK9TEJp3gwW7E61473PeR4ZRRWwo9kp1nnlg6v1EeUss7nLE
	8H3qsPGXuTEhCONrToPJBQsiQZ5qmoMceHD7OFnFlSUp/d3Tnc6dFTyO/SJ74vy/k5V2
	gFwua2iir2VUuwqNcirNqYFiFIZ1afYjfzDTTloUq5sN8ZupIg19VxL5248T263u4a/s
	xq/g==
Received: by 10.180.78.2 with SMTP id x2mr6127821wiw.10.1342714312169;
	Thu, 19 Jul 2012 09:11:52 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:11:01 +0100
Message-Id: <746f5e7bb9d52825258e1c4906ba7287ac901ea1.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmSzRlEwUDV96rutO+/rg+K2pwrdF8obKLvtolCQkKvDjduZ6ewzk5Jft3FxyVjte4VITAq
Subject: [PATCH 14/26] libart_lgpl: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:16 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb b/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
index d82ea19..d0bfe28 100644
--- a/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
+++ b/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Library of functions for 2D graphics"
 SECTION = "x11/gnome"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-PR = "r1"
+PR = "r2"
 
 ART_CONFIG = "${HOST_ARCH}/art_config.h"
 
@@ -14,7 +14,7 @@ SRC_URI = "${GNOME_MIRROR}/libart_lgpl/2.3/libart_lgpl-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "08559ff3c67fd95d57b0c5e91a6b4302"
 SRC_URI[sha256sum] = "fdc11e74c10fc9ffe4188537e2b370c0abacca7d89021d4d303afdf7fd7476fa"
 
-inherit autotools pkgconfig
+inherit autotools gtk-doc pkgconfig
 
 DEPENDS = ""
 
@@ -26,6 +26,3 @@ S = "${WORKDIR}/libart_lgpl-${PV}"
 do_configure_prepend() {
 	cp ${WORKDIR}/${ART_CONFIG} ${S}/art_config.h
 }
-
-EXTRA_OECONF = "--disable-gtk-doc"
-
-- 
1.7.10



