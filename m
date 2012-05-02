Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPaFc-0007aT-Hm
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 16:09:52 +0200
Received: by eekc1 with SMTP id c1so156527eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 07:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WmC3dOsXsHc7LmRJRN4NN122YuxFJFJZUmAXbV4Gaks=;
	b=YvvcfsQzgoDd/xbxlKXUlguyhiXdXkwq5RFcKZONqyySTgx8eph4SwySTCF5dBBs4P
	+VQnkrKRfvczroE41GC68BemFsZpuqeI/rxVyDtpeS43x0QK4LjLY7khYZjFJwcVCtYo
	e2eBHi9D98hb3Dwt56RYGXfHGD1QnBWmp6WAshZn8Hx4A4cfUt8IsNGJEVb4r8QhX1Ih
	EBUf2rd/evOJuQAk/SRUgDWidSx1r7uCvgmOPwE7qQ/0PSWe4ASn9K2QSeDuwzwAq4Gn
	UR3QTE082TUi+jhVpN/Es4HdWOzrGoJdhO/t8n0ubXmqOp4KPpmIi188gTdKvj8UumvU
	Tu9A==
Received: by 10.204.133.200 with SMTP id g8mr8357004bkt.110.1335967208415;
	Wed, 02 May 2012 07:00:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gm18sm4074322bkc.7.2012.05.02.07.00.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 07:00:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 15:59:46 +0200
Message-Id: <2bc7c213e38da1b89b91c6cbf2812aef25c93ef2.1335967122.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335967122.git.Martin.Jansa@gmail.com>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335967122.git.Martin.Jansa@gmail.com>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] glib-2.0: upgrade to 2.32.2
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
X-List-Received-Date: Wed, 02 May 2012 14:09:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{glib-2.0_2.32.1.bb => glib-2.0_2.32.2.bb}     |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.32.1.bb => glib-2.0_2.32.2.bb} (92%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
similarity index 92%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.32.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
index a62c91a..f303cb4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
@@ -1,6 +1,5 @@
 require glib.inc
 
-PR = "r2"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -15,8 +14,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://glib-2.0_fix_for_x32.patch \
            file://nodbus.patch \
           "
-SRC_URI[md5sum] = "032c7cf9868c9aa186b490b155a41144"
-SRC_URI[sha256sum] = "484d5b7fc09f3fa398355adaf74b369768f5859866c299f229c99721990f8398"
+SRC_URI[md5sum] = "5bfdb6197afb90e4dbc7b1bb98f0eae0"
+SRC_URI[sha256sum] = "b1764abf00bac96e0e93e29fb9715ce75f3583579acac40648e18771d43d6136"
 
 SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.8.6



