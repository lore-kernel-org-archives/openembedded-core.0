Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4D2CD65F11
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 20:07:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s52K6tDW021487 for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jun 2014 21:07:23 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3-935zx0i2gn
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 21:07:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s52K7LPS021526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jun 2014 21:07:23 +0100
Message-ID: <1401739633.12440.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jun 2014 21:07:13 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: oprofileui-server/oprofileui/pcmanfm: Add missing intltool-native DEPENDS
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
X-List-Received-Date: Mon, 02 Jun 2014 20:07:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These recipes all require intltool-native to build but were missing
a dependency on it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
index d80a0e8..eb3b78b 100644
--- a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
@@ -9,6 +9,8 @@ SRC_URI = "git://git.yoctoproject.org/oprofileui \
            file://init \
            file://oprofileui-server.service "
 
+DEPENDS += "intltool-native"
+
 EXTRA_OECONF += "--disable-client --enable-server"
 
 RDEPENDS_${PN} = "oprofile avahi-daemon"
diff --git a/meta/recipes-kernel/oprofile/oprofileui.inc b/meta/recipes-kernel/oprofile/oprofileui.inc
index 6d59e47..1dfd0c6 100644
--- a/meta/recipes-kernel/oprofile/oprofileui.inc
+++ b/meta/recipes-kernel/oprofile/oprofileui.inc
@@ -8,7 +8,7 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "glib-2.0 avahi"
+DEPENDS = "glib-2.0 avahi intltool-native"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
index fe25682..14c5cd5 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/gseal-gtk-compat.h;endline=21;md5=46922c8691f58d124f9420fe16149ce2"
 
 SECTION = "x11"
-DEPENDS = "gtk+ startup-notification libfm"
+DEPENDS = "gtk+ startup-notification libfm intltool-native"
 DEPENDS_append_poky = " libowl"
 
 



