Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SV44z-0006OM-6a
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 19:01:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 May 2012 09:51:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144478151"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.96])
	by azsmga001.ch.intel.com with ESMTP; 17 May 2012 09:51:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 19:51:14 +0300
Message-Id: <25d9e571490c77ca67d4f7224e37ba0349deb0c1.1337273095.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/12] xserver-xorg-lite: disable xmlto like full xserver-xorg does
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
X-List-Received-Date: Thu, 17 May 2012 17:01:33 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* xmlto-native is unusable (see YOCTO #2416
  xmlto/xsltproc stylesheets cannot be found even when they are installed in sysroot)

* fails like this:
| make[2]: Entering directory `/OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xserver-xorg-lite/xserver-xorg-lite-2_1.11.2-r2/xorg-server-1.11.2/doc'
| /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/xmlto   xhtml-nochunks Xserver-spec.xml
| /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/xmlto   xhtml-nochunks Xinput.xml
| xmlto: /OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xserver-xorg-lite/xserver-xorg-lite-2_1.11.2-r2/xorg-server-1.11.2/doc/Xinput.xml does not validate (status 3)
| xmlto: Fix document syntax or use --skip-validation option
| /OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xserver-xorg-lite/xserver-xorg-lite-2_1.11.2-r2/xorg-server-1.11.2/doc/Xinput.xml:3: warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd"
|                    "http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd">
|                                                                             ^
| /OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xserver-xorg-lite/xserver-xorg-lite-2_1.11.2-r2/xorg-server-1.11.2/doc/Xinput.xml:40: parser error : Entity 'ldquo' not defined
| btaining a copy of this software and associated documentation files (the &ldquo;
|                                                                                ^
| /OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xserver-xorg-lite/xserver-xorg-lite-2_1.11.2-r2/xorg-server-1.11.2/doc/Xinput.xml:40: parser error : Entity 'rdquo' not defined
|  of this software and associated documentation files (the &ldquo;Software&rdquo;
|                                                                                ^
| /OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xserver-xorg-lite/xserver-xorg-lite-2_1.11.2-r2/xorg-server-1.11.2/doc/Xinput.xml:42: parser error : Entity 'ldquo' not defined
| btaining a copy of this software and associated documentation files (the &ldquo;
|                                                                                ^
| /OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xserver-xorg-lite/xserver-xorg-lite-2_1.11.2-r2/xorg-server-1.11.2/doc/Xinput.xml:42: parser error : Entity 'rdquo' not defined
|  of this software and associated documentation files (the &ldquo;Software&rdquo;
|                                                                                ^
| warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd"
| validity error : Could not load the external subset "http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd"
| Document /OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xserver-xorg-lite/xserver-xorg-lite-2_1.11.2-r2/xorg-server-1.11.2/doc/Xinput.xml does not validate
| xmlto: /OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xserver-xorg-lite/xserver-xorg-lite-2_1.11.2-r2/xorg-server-1.11.2/doc/Xserver-spec.xml does not validate (status 3)
| xmlto: Fix document syntax or use --skip-validation option
| make[2]: *** [Xinput.html] Error 13
| make[2]: *** Waiting for unfinished jobs....
| /OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xserver-xorg-lite/xserver-xorg-lite-2_1.11.2-r2/xorg-server-1.11.2/doc/Xserver-spec.xml:4: warning: failed to load external entity "/xserver/doc/xml/xserver.ent"
|  <!ENTITY % defs SYSTEM "/xserver/doc/xml/xserver.ent"> %defs;
|                                                               ^
| Entity: line 1:
|  %defs;
|        ^

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-lite.inc             |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index 6a86af4..fc41568 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -7,5 +7,5 @@ SRC_URI += "file://crosscompile.patch \
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
-PR = "r2"
+PR = "r3"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
index 57615f5..02db5bf 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
@@ -4,4 +4,5 @@ EXTRA_OECONF += "\
                  --disable-dri \
                  --disable-glx \
                  --disable-dga \
+                 --without-xmlto \
 "
-- 
1.7.7.6



