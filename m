Received: from mail-la0-f49.google.com ([209.85.215.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqrlO-0000dE-CI
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 21:51:45 +0100
Received: by mail-la0-f49.google.com with SMTP id fk20so8452008lab.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 12:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=PACKXZypFyeAHRDzFBrKkdJaI8wvmZF7ai7wZYh/Y38=;
	b=o818Lp5zJ/sqlXxj8oQZOyVBbx3cB6fNrsqrTj7jKVhEqV5p1QD4sqy3yi6P7AvrWn
	kFoAxj/axwy84POQtCTU6wjukuhkJJ2gj7oGTVveXtPAXPHhFulkZPI5ZqIl9q/yij2s
	ZunJ/3HTTc7UKn1PCkBgdAPDBOYCP8QGX8Vraug1AOG9PA1+CITiyXuCXhl+NagyUVRu
	m7ZjrKE5nXj6dnTcLPs/dBXmN5aLzRSmkj8OmZMqsXpAp26YE6LiZCfUdSa/0ehu16y+
	D26NUorb2pOy6dxq3Xk1/5q+OcnFCUZVT1ksXXtRCwZaEDLXBf29g3jvFe9zJLHTQxDM
	xD+g==
X-Received: by 10.112.98.232 with SMTP id el8mr8531756lbb.121.1357245398065;
	Thu, 03 Jan 2013 12:36:38 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id v6sm17331793lbf.11.2013.01.03.12.36.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:36:37 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqrWk-0002EM-Hk; Thu, 03 Jan 2013 22:36:34 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 22:36:22 +0200
Message-Id: <1357245391-11055-7-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357245391-11055-6-git-send-email-cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-5-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-6-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 06/15] glib-2.0: replace obsolete automake macros with working ones
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
X-List-Received-Date: Thu, 03 Jan 2013 20:51:45 -0000

Add obsolete-automake-macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../glib-2.0/glib-2.0/obsolete_automake_macros.patch      |   13 +++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb             |    3 ++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch b/meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch
new file mode 100644
index 0000000..3e1f24a
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch
@@ -0,0 +1,13 @@
+Upstream-status: Submitted (https://bugzilla.gnome.org/show_bug.cgi?id=691011)
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



