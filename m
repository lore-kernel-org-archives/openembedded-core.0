Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqrlS-0000dT-2p
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 21:51:46 +0100
Received: by mail-la0-f41.google.com with SMTP id em20so8665227lab.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 12:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=JGrEeeLweXruR8jCnOS7hgwJ+S5k/3ojQFXkY0EJ2G0=;
	b=Hxv32clyz1x8H56xa9NMU1e9k+JyNKHE3rG9+IwLvg1Eg9RRdQiCtR2ABaXylwYfFi
	nZz+VRXFJR8upgov6zoxoDy7wb0QQMdvwOBsKc6C7VXxhpie6rJRb0DVkypgtjlJ6nYl
	o5kVKEgDRBCL2eBykcax204OT7+/CQq55hKKj7FKvowNheko+cS5mj7sgWrr4iMg+JIb
	5q3nx5sRNpOKNWkXRAWWjwAz87zDxOnAWJAgCD/uD2yXIN1Gmu/pdX4nofN0wSiyDtlP
	ynjHmS49uKTIchPukiiTcBbv78x/DIHEReFsNz7EGAHH3uffg+q1zVIGdbhphrnm0KQ1
	16Og==
X-Received: by 10.112.50.205 with SMTP id e13mr20464609lbo.57.1357245402004;
	Thu, 03 Jan 2013 12:36:42 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ft8sm18773071lab.9.2013.01.03.12.36.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:36:41 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqrWl-0002GV-KV; Thu, 03 Jan 2013 22:36:35 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 22:36:30 +0200
Message-Id: <1357245391-11055-15-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357245391-11055-14-git-send-email-cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-5-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-6-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-7-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-8-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-9-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-10-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-11-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-12-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-13-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-14-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 14/15] libtasn1: remove help2man dependency
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
X-List-Received-Date: Thu, 03 Jan 2013 20:51:46 -0000

Remove manpage creation. It wasn't working because of help2man
missing when libtasn1 is being built. This attempt to create
manpages without help2man turns from no-op to hard error with
automake-1.13.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../gnutls/libtasn1/dont-depend-on-help2man.patch        |   14 ++++++++++++++
 meta/recipes-support/gnutls/libtasn1_2.14.bb             |    3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/dont-depend-on-help2man.patch

diff --git a/meta/recipes-support/gnutls/libtasn1/dont-depend-on-help2man.patch b/meta/recipes-support/gnutls/libtasn1/dont-depend-on-help2man.patch
new file mode 100644
index 0000000..2ac89f3
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/dont-depend-on-help2man.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Inappropriate
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libtasn1-2.14/doc/Makefile.am libtasn1-2.14/doc/Makefile.am
+--- libtasn1-2.14/doc/Makefile.am	2012-09-24 15:08:42.000000000 +0300
++++ libtasn1-2.14/doc/Makefile.am	2013-01-03 07:35:26.702763403 +0200
+@@ -31,7 +31,7 @@
+ AM_MAKEINFOHTMLFLAGS = $(AM_MAKEINFOFLAGS) \
+	--no-split --number-sections --css-include=texinfo.css
+
+-dist_man_MANS = $(gdoc_MANS) asn1Parser.1 asn1Coding.1 asn1Decoding.1
++dist_man_MANS = $(gdoc_MANS)
+
+ HELP2MAN_OPTS = --info-page libtasn1
diff --git a/meta/recipes-support/gnutls/libtasn1_2.14.bb b/meta/recipes-support/gnutls/libtasn1_2.14.bb
index 3f49bfa..68d5ddf 100644
--- a/meta/recipes-support/gnutls/libtasn1_2.14.bb
+++ b/meta/recipes-support/gnutls/libtasn1_2.14.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://libtasn1_fix_for_automake_1.12.patch \
+           file://dont-depend-on-help2man.patch \
            "
 
 SRC_URI[md5sum] = "a08c5936f9672da9b05691785499bcc3"
-- 
1.7.10.4



