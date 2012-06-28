Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkMZi-0005pS-SC
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 23:48:31 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so3329310dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 14:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=yTVjqafP9aT9NZ3OFm0MwxUlrDIDu7vtPfBN9F7UDco=;
	b=GjyPNm77lyHOY66K9zPd6TzMvCK8pQjK9HhuIqGrZT+26gc4o03K3faS9uXQ4x8FaZ
	8JKNRxSwEk3IEbqmQANdv8shfcOcNTS+kyZmxfIXXRwpZ2y/GhmWlsEw3VOm8HPGUKKW
	EBSC9MV5R/gOrBnJcRVrrzoYcV/XIaGAfKuZf0tMoRq7LGhGTxZ0KD5LrNcrQFQkouwb
	g1CGlE//B0DZIyhGQmHtsHynDy0jdNsl2gAPdmfl6oapXzBEUASA9/FW8EDana4DO58I
	RpFHTLcfViXO6oxZGsdVfs5JETwNeZl6ECaUNZ7z45NsRMOq/RypOv4XmvSXkSYKMb+f
	Tm+w==
Received: by 10.68.237.103 with SMTP id vb7mr11364480pbc.38.1340919448342;
	Thu, 28 Jun 2012 14:37:28 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id os1sm3220209pbb.49.2012.06.28.14.37.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 14:37:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 14:36:57 -0700
Message-Id: <cc067e10de0fd1748ffd9d02125a52b58ea9f261.1340919157.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
References: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340919157.git.raj.khem@gmail.com>
References: <cover.1340919157.git.raj.khem@gmail.com>
Subject: [PATCH 11/11] glib-2.0: Add missing dependency on virtual/libiconv
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
X-List-Received-Date: Thu, 28 Jun 2012 21:48:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb |    2 +-
 meta/recipes-core/glib-2.0/glib.inc           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
index 6f89f56..08aa897 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r1"
+PR = "r2"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 1dbd538..e7d547a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
 
-DEPENDS = "glib-2.0-native gtk-doc-native zip"
+DEPENDS = "glib-2.0-native gtk-doc-native zip virtual/libiconv"
 DEPENDS_virtclass-native = "gtk-doc-native pkgconfig-native gettext-native"
 DEPENDS_virtclass-nativesdk = "libtool-nativesdk"
 PACKAGES =+ "${PN}-utils "
-- 
1.7.9.5



