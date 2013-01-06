Received: from mail-la0-f44.google.com ([209.85.215.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Ts0DE-0006mS-GZ
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 01:05:09 +0100
Received: by mail-la0-f44.google.com with SMTP id fr10so13959155lab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 15:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=e9AXO3IvzIZv/pF1PYjdVNybg/gR8+ND/09pEYMAPo8=;
	b=igfkIEnpMijzkWWvF4j4XLJUklODfSt87lzqsNxqtcC+5vL8pMH6y5SaeqPYbCxDO6
	/Q6P7QP+n9PEYDB+OyV1SQVEH8mlhuhwOL1V6b5HCcuI+kU3UvJW630iaYu89jRD7Z4m
	zywDXMk2I1ItEqttBb3eM3qW6tiwTLxB5LwgYRMYvd8cYqT/CsX0H5ZrzCB1cYzgQlLv
	RKADxsYDr2XS0VLIMlui7/K2Ryl+9MCzgyyghT9hffGjiRUNiRlfFpq/YMjG66OFopbr
	XH97ymfy2Oszr4vWAwcmWJDp9UcqIpTaKpQddqfjsYVq+LBo3kCoxW2hzVBuzrbs6xqA
	v4yQ==
X-Received: by 10.112.16.205 with SMTP id i13mr23106116lbd.45.1357516200081;
	Sun, 06 Jan 2013 15:50:00 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ns7sm20625750lab.5.2013.01.06.15.49.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 15:49:59 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrzyP-0001Pd-N0; Mon, 07 Jan 2013 01:49:49 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 01:49:32 +0200
Message-Id: <1357516181-5358-7-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357516181-5358-6-git-send-email-cazfi74@gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-6-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v2 06/15] glib-2.0: replace obsolete automake macros with working ones
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
X-List-Received-Date: Mon, 07 Jan 2013 00:05:09 -0000

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
index 0000000..e3b35bf
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch
@@ -0,0 +1,13 @@
+Upstream-Status: Accepted (https://bugzilla.gnome.org/show_bug.cgi?id=691011)
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



