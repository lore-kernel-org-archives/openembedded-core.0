Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsTfF-0000qf-IY
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 08:32:05 +0100
Received: by mail-la0-f47.google.com with SMTP id fh20so99015lab.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 23:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=e4eHNl+wGrDU6pZoSw0TFcz52PTTwWCTqZ4eHfSWIzQ=;
	b=RN/BlnIIM35ZuBAaRYbkjSGAPQSjsbVcBR+eEjIb9vTpRzb6NDXgmTcXOMXfmpuqPI
	/HPYBwI+7kY8sCseySsju6I2QoApwQoG79x4SfpRmsV1Jw1Y1w3y+xnek6qYk9R2jEI1
	tV7IZ7Rp8kL8QyPo5+ysE9FrB3Rn91YrXZXEyC0YDDx2UeChVzT0Pwp2BBShUs2FHAeL
	SHS2DAJksj05YDezIWLUy5uoT0Wc1Fp45WTnzFXNlduFQ3AEnhcv2XcJq4Bw5WNFp9sL
	XsMSJ2IhQreRz/4ntru7CZqQJ7iby/0CG0weOTD+kl+JlNhmerulOXdFcckG+Kma6Ywn
	8uZg==
X-Received: by 10.152.111.72 with SMTP id ig8mr60067964lab.1.1357629411366;
	Mon, 07 Jan 2013 23:16:51 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id
	hc20sm23979391lab.11.2013.01.07.23.16.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 23:16:48 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsTQU-0005kN-GM; Tue, 08 Jan 2013 09:16:46 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 09:16:36 +0200
Message-Id: <1357629404-22020-5-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357629404-22020-4-git-send-email-cazfi74@gmail.com>
References: <1357629404-22020-1-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-2-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-3-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-4-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v3 04/12] glib-2.0: replace obsolete automake macros with working ones
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
 .../glib-2.0/glib-2.0/obsolete_automake_macros.patch      |   13 +++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb             |    3 ++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch b/meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch
new file mode 100644
index 0000000..2fc4e75
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch
@@ -0,0 +1,13 @@
+Upstream-Status: Accepted [https://bugzilla.gnome.org/show_bug.cgi?id=691011]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd glib-2.34.3/configure.ac glib-2.34.3/configure.ac
+--- glib-2.34.3/configure.ac	2012-11-26 19:10:04.000000000 +0200
++++ glib-2.34.3/configure.ac	2013-01-02 15:49:27.832183712 +0200
+@@ -291,7 +291,6 @@
+ AM_CONDITIONAL(HAVE_CXX, [test "$CXX" != ""])
+ AC_LANG_RESTORE
+
+-AM_PROG_CC_STDC
+ AM_PROG_CC_C_O
+ AC_PROG_INSTALL
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
index 9854585..e1d44e2 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -12,6 +12,7 @@ SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]
 SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://configure-libtool.patch \
            file://glib-2.0_fix_for_x32.patch \
+           file://obsolete_automake_macros.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
           "
-- 
1.7.10.4



