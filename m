Received: from mail-lb0-f173.google.com ([209.85.217.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsTfH-0000qm-7N
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 08:32:05 +0100
Received: by mail-lb0-f173.google.com with SMTP id c1so150533lbg.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 23:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=YB39Xth9cLOtKG7vpnJWniXBox3LjVCiIL96fBdCU/8=;
	b=PStk0OZZ3X45TRkCUoi3iujKJdhpncLKxdbk5wLfA966vqXnUaiEjAEtLS7DUg2BdU
	DTyF/1MKu1T/+K6oBL6Q0A8ev2/44PAGU35oL4v++rFDYV8BjtYVHWspF7Y+zxJVPxpB
	W8UvaRTcJ15LFuU88Imvg3vL1CuDydxhANYlIeFzok+VOh96jfWmr0ahjuj5e5s/YHN0
	+Jx9Dm4B6Q5z181HCpXZ5sXjEff+KRH5eqDOyGMHFviJJb+bZ4h+MVuLHQB+azRpyb4G
	f15uBSd6C/RsTvIYx6X4SFGi8JB0+nXIu3vL5x6UD5wLreEdGwXxGcKA3hSfZ5DZgw+P
	o2XA==
X-Received: by 10.112.101.7 with SMTP id fc7mr15335164lbb.56.1357629412815;
	Mon, 07 Jan 2013 23:16:52 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id to7sm20174073lab.13.2013.01.07.23.16.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 23:16:51 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsTQV-0005km-3P; Tue, 08 Jan 2013 09:16:47 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 09:16:41 +0200
Message-Id: <1357629404-22020-10-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357629404-22020-9-git-send-email-cazfi74@gmail.com>
References: <1357629404-22020-1-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-2-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-3-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-4-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-5-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-6-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-7-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-8-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-9-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v3 09/12] libid3tag: replace obsolete automake macros with working ones
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
X-List-Received-Date: Tue, 08 Jan 2013 07:32:16 -0000

Add obsolete_automake_macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libid3tag/libid3tag/obsolete_automake_macros.patch   |   14 ++++++++++++++
 meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb   |    6 ++++--
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch b/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
new file mode 100644
index 0000000..8a04b54
--- /dev/null
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Submitted [https://sourceforge.net/tracker/?func=detail&aid=3599280&group_id=12349&atid=112349]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libid3tag-0.15.1b/configure.ac libid3tag-0.15.1b/configure.ac
+--- libid3tag-0.15.1b/configure.ac	2004-01-24 01:22:46.000000000 +0200
++++ libid3tag-0.15.1b/configure.ac	2013-01-03 06:41:02.734835014 +0200
+@@ -28,7 +28,7 @@
+
+ AM_INIT_AUTOMAKE
+
+-AM_CONFIG_HEADER([config.h])
++AC_CONFIG_HEADERS([config.h])
+
+ dnl System type.
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index dbcf2da..d81f58b 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -7,10 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 			file://version.h;beginline=1;endline=8;md5=86ac68b67f054b7afde9e149bbc3fe63"
 SECTION = "libs"
 DEPENDS = "zlib gperf-native"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libid3tag-${PV}.tar.gz \
-           file://addpkgconfig.patch"
+           file://addpkgconfig.patch \
+           file://obsolete_automake_macros.patch \
+"
 
 SRC_URI[md5sum] = "e5808ad997ba32c498803822078748c3"
 SRC_URI[sha256sum] = "63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151"
-- 
1.7.10.4



