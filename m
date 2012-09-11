Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBS-0001kd-Rk
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:43 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:18:53 -0700
Received: by wgbdr1 with SMTP id dr1so617841wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=1vie6UZNWMFWtTrZ5x52cdDyJNgDubkUt8tKgKEh8MM=;
	b=SyNc+0GAYgBHSVlxwOzEiY3ZKlkXqrsZ9ud3+alkEj4slTvzH3lYVipqH4fIQ+k4Zg
	FPkiKO8Y2c8jw9m6MGAKp83ukDB78oLsnFIit0WmEflQ9ze7gNOqhiti4xP9MGapKJwa
	BTQGXqt+eZJJCDt0NthuwUpFp1/yXrvuMf4J9F5GCOBy4ie7UVZU4VypPlTn8V4f+UJr
	XnJwFFeVRsYSK6AhRhfgDhSzUk14gIf1Pchib7KWab0KccdKnSDFD6H2JfPzT/+DmLx4
	F6XbGVFOyXo96+u32ybVyom2yjgBppnbornZoX75qsSuOmbTE2DLXE3KvgRo0RRXkd7o
	LprA==
Received: by 10.216.132.25 with SMTP id n25mr9939856wei.25.1347391139218;
	Tue, 11 Sep 2012 12:18:59 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.18.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:18:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:17:52 +0100
Message-Id: <1347391088-30390-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlCKmrN12tUhkemnR/4p1LnbxBUrZyKTfQEIZtZhxQNEO5DIJ7o7aObAqAkpT4evkJEg0bC
Subject: [RFC 02/18] libx11-diet: you can't disable XCB anymore, so don't try
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
X-List-Received-Date: Tue, 11 Sep 2012 19:31:43 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index ed5a890..d821744 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -1,11 +1,11 @@
 require libx11.inc
 
-DESCRIPTION += " Support for XCB, UDC, XCMS and XLOCALE is disabled in \
+DESCRIPTION += " Support for UDC, XCMS and XLOCALE is disabled in \
 this version."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://x11_disable_makekeys.patch \
             file://X18NCMSstubs.diff \
@@ -20,11 +20,11 @@ RPROVIDES_${PN}-locale = "libx11-locale"
 SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
 SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
 
-DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
+DEPENDS += "libxcb bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
 
 FILESDIR = "${@os.path.dirname(d.getVar('FILE', True))}/libx11"
 
-EXTRA_OECONF += "--without-xcb --disable-udc --disable-xcms --disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
+EXTRA_OECONF += "--disable-udc --disable-xcms --disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
 CFLAGS += "-D_GNU_SOURCE"
 
-- 
1.7.10



