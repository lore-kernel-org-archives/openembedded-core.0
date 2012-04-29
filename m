Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SObnv-0007YE-OR
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 23:37:15 +0200
Received: by wgbdr1 with SMTP id dr1so1901857wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 14:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=88g3HEH7FQsjKhDZ4wLI0wNc0FrJSA5mbu+HXiooB5E=;
	b=ZnWHAcqWu4I1wvHYsZRrXuo196Q/+80RWrfc+QwwrvPFi+uwNWa2Qw3P6IA754EEja
	Y/zwGnOz16na28S/4T/j4OEiNn3qEV3GSREgYFN3ECpRo0avlXiidsI2qvJ5lbnS8tvS
	oKeYDk58cCIKR+OKEK6sGyTxOej772knzRxVC4drfRnojEuWYH7jJHU59lO25V0O57a3
	FH5qagg3JkzdOQ7LxYWcqMrrm82jXPwD2A9VFQBy+L6fG9St8ZgFqmPQxAWFO7u/HTzP
	KcaQhLNpuPaMYl0/2NIGZEczcybuVgzXeWscTt7piU42CyH/Rfhpty/sVlAX7yHRUQnC
	mI5A==
Received: by 10.180.103.35 with SMTP id ft3mr13181991wib.0.1335734854811;
	Sun, 29 Apr 2012 14:27:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm37426438wiw.5.2012.04.29.14.27.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 14:27:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2012 23:27:17 +0200
Message-Id: <04d0111bb7f8f760a2108d0b26cc0e04aa5bfaad.1335734193.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335734193.git.Martin.Jansa@gmail.com>
References: <cover.1335734193.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335734193.git.Martin.Jansa@gmail.com>
References: <cover.1335734193.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] gobject-introspection: upgrade to 1.32.1
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
X-List-Received-Date: Sun, 29 Apr 2012 21:37:15 -0000

* simplify SRC_URI
* add COPYING to LIC_FILES_CHKSUM

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ..._1.31.20.bb => gobject-introspection_1.32.1.bb} |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/gnome/{gobject-introspection_1.31.20.bb => gobject-introspection_1.32.1.bb} (52%)

diff --git a/meta/recipes-gnome/gnome/gobject-introspection_1.31.20.bb b/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
similarity index 52%
rename from meta/recipes-gnome/gnome/gobject-introspection_1.31.20.bb
rename to meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
index beb96a6..f51e83e 100644
--- a/meta/recipes-gnome/gnome/gobject-introspection_1.31.20.bb
+++ b/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
@@ -3,16 +3,19 @@ DEPENDS = "glib-2.0 libffi python-native gobject-introspection-native"
 DEPENDS_virtclass-native = "glib-2.0-native libffi-native python-native bison-native flex-native"
 BBCLASSEXTEND = "native"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.31/gobject-introspection-1.31.20.tar.xz \
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SRC_URI = "\
+  ${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz \
   file://use-usr-bin-env-for-python.patch \
 "
 
-SRC_URI[md5sum] = "05d9ac99a5929d002867b86a2a69b8b5"
-SRC_URI[sha256sum] = "e1552884b642e7e5a56a175ae85bfdebfd16c29a7bbe4f6ca9cdf591e333f070"
+SRC_URI[md5sum] = "7bbdb696c37bb98aef5af02c4b8975e3"
+SRC_URI[sha256sum] = "44f3fb933f76e4728818cc360cb5f9e2edcbdf9bc8a8f9aded99b3e3ef5cb858"
 
 LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
-		    file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=90d577535a3898e1ae5dbf0ae3509a8c \
+                    file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 inherit autotools
 
-- 
1.7.8.6



