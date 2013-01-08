Received: from mail-lb0-f181.google.com ([209.85.217.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsU3D-0001it-Gl
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 08:56:51 +0100
Received: by mail-lb0-f181.google.com with SMTP id ge1so157370lbb.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 23:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=2zEGdgMt0WFQwQyUCbo/610IWwap0jYPvS2rjhieMEs=;
	b=mGl18D7pH4h5EPH+ikoVi3E80/E4RWnk+j7Bf+/QhpEVd9NISaOPyD9zDkW9nU062e
	dpTLUhfLWJD3IA7LBkhgJGGrpB8fRJuitVRswLTL2XvY4Xp51IZWYlbHwbBIeNrLXuy7
	US0ODdjDliWgz1vphaGlpizFaoYNbHJaDbH37uB0rNDS+1vHTKLjgN0/kb6F7471HlNI
	rVg+gAdHOqdQQ87KiY1pxdF6zc/yBOV9Ky+ExXSasm04akbm5rcynTdhZW6FznPq3+JA
	Xapa0XNf51LhK6UVy1yyD6vGtrqb0Yseo1Vx0cUnCn1yBWUe6IScjVOa2QCdiA49OrqI
	GKlg==
X-Received: by 10.112.99.197 with SMTP id es5mr22809870lbb.30.1357630897248;
	Mon, 07 Jan 2013 23:41:37 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id to7sm20190344lab.13.2013.01.07.23.41.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 23:41:36 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsTQV-0005l1-EF; Tue, 08 Jan 2013 09:16:47 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 09:16:44 +0200
Message-Id: <1357629404-22020-13-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357629404-22020-12-git-send-email-cazfi74@gmail.com>
References: <1357629404-22020-1-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-2-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-3-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-4-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-5-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-6-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-7-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-8-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-9-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-10-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-11-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-12-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v3 12/12] flac: replace obsolete automake macros with working ones
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
X-List-Received-Date: Tue, 08 Jan 2013 07:56:54 -0000

Add obsolete_automake_macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../flac/flac-1.2.1/obsolete_automake_macros.patch       |   14 ++++++++++++++
 meta/recipes-multimedia/flac/flac_1.2.1.bb               |    6 ++++--
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/obsolete_automake_macros.patch

diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/obsolete_automake_macros.patch b/meta/recipes-multimedia/flac/flac-1.2.1/obsolete_automake_macros.patch
new file mode 100644
index 0000000..aa060a4
--- /dev/null
+++ b/meta/recipes-multimedia/flac/flac-1.2.1/obsolete_automake_macros.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Backport [https://sourceforge.net/p/flac/support-requests/146/]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd flac-1.2.1/configure.in flac-1.2.1/configure.in
+--- flac-1.2.1/configure.in	2007-09-13 18:48:42.000000000 +0300
++++ flac-1.2.1/configure.in	2013-01-03 08:20:07.454704587 +0200
+@@ -44,7 +44,7 @@
+ AC_CHECK_SIZEOF(void*,0)
+
+ #@@@ new name is AC_CONFIG_HEADERS
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ AC_C_BIGENDIAN
diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb b/meta/recipes-multimedia/flac/flac_1.2.1.bb
index 903de6d..7fd7a03 100644
--- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
+++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
@@ -14,14 +14,16 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
                     file://include/FLAC/all.h;beginline=64;endline=69;md5=64474f2b22e9e77b28d8b8b25c983a48"
 DEPENDS = "libogg"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/flac/flac-${PV}.tar.gz \
            file://disable-xmms-plugin.patch \
            file://flac-gcc43-fixes.patch \
            file://xmms.m4 \
            file://0001-No-AltiVec-on-SPE.patch \
-           file://asm-pic.patch"
+           file://asm-pic.patch \
+           file://obsolete_automake_macros.patch \
+"
 
 SRC_URI[md5sum] = "153c8b15a54da428d1f0fadc756c22c7"
 SRC_URI[sha256sum] = "9635a44bceb478bbf2ee8a785cf6986fba525afb5fad1fd4bba73cf71f2d3edf"
-- 
1.7.10.4



