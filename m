Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1STBR3-0000EN-SM
	for openembedded-core@lists.openembedded.org;
	Sat, 12 May 2012 14:28:33 +0200
Received: by wgbdr1 with SMTP id dr1so3006324wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 May 2012 05:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=EHdNRwpphB9gP6VZDF14Y9CWkl7IBH7LSxZFkkLRrj4=;
	b=q9KsCI1weth8Al83HWmmrsWbgikqO/b9QoKdWz+JN8sfjkbL+Le+S/JjvXsogx5LWY
	QKL7Uxeq6DHcY2QU1s9kSYt2JTv5g6TDK2xmdwt+1mbdiAvBdo98XNz7wpHOilXw8MtX
	w2WdizY5DRrsW4Dj1O7pce/MRdJxjqVkOiDj1I/AdhgKrHv9102gNXnFM18gBAgLUHeq
	8HSWXudHIPXaV0G3tbkJTIqpcqsI4BVXUVkv9j3Az9crjVx9gm7H1fmlOpBHiq8lc7fL
	GJq9bOzdW1rH4zMHhng4StJ9cxoALMjsaev+Y7dPIcBEgWuPrPbvNp2guEnTo+8+6JMQ
	i85Q==
Received: by 10.180.87.35 with SMTP id u3mr3937519wiz.11.1336825117668;
	Sat, 12 May 2012 05:18:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gd4sm29219481wib.6.2012.05.12.05.18.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 May 2012 05:18:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 May 2012 14:18:33 +0200
Message-Id: <1336825113-11352-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1239C828-67B1-41AF-8C84-5BD25CC36AED@dominion.thruhere.net>
References: <1239C828-67B1-41AF-8C84-5BD25CC36AED@dominion.thruhere.net>
Subject: [PATCHv3] xserver-xorg-lite: disable xmlto like full xserver-xorg does
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
X-List-Received-Date: Sat, 12 May 2012 12:28:34 -0000

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
1.7.8.6



