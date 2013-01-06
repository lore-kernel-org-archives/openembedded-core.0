Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Ts0DI-0006nU-9d
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 01:05:12 +0100
Received: by mail-la0-f48.google.com with SMTP id ej20so14008675lab.35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 15:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=JGrEeeLweXruR8jCnOS7hgwJ+S5k/3ojQFXkY0EJ2G0=;
	b=cgB0eTo+KU1Wom8Xye1RoukZ7XrzkKuX8c5+3xgWtjD5VA8KTtpCOjnnNqlCyp0GqE
	1QVnF67gj6k6GKzNGa2nBUrwWfG7+3BubMUlY2Alt1IejcdFlqLHdgPsedkmxgC8bAi9
	RebryH/4coDT9eqRmcax1zso4EDcJ8qzfcrw61QInHbdhwYjKFxxE8/s3YoYUE9bRNq4
	wqNFZ//sH3EJnhcpPCrd5eXfIBXYB7monOZPsaF1qn0Aq2KmUSef0rDyvXCKwzLeSspu
	tQuPgnkoqwVF0gyqT2vOYmXZqpzUzlryo+mDi6/w1Lbod/9DNIWym2MtQn8nIykSaECq
	L/Sw==
X-Received: by 10.112.49.102 with SMTP id t6mr22986438lbn.60.1357516203905;
	Sun, 06 Jan 2013 15:50:03 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id fb1sm20239970lbb.15.2013.01.06.15.49.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 15:50:02 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrzyX-0001QI-KC; Mon, 07 Jan 2013 01:49:57 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 01:49:40 +0200
Message-Id: <1357516181-5358-15-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357516181-5358-14-git-send-email-cazfi74@gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-6-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-7-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-8-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-9-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-10-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-11-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-12-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-13-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-14-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v2 14/15] libtasn1: remove help2man dependency
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
X-List-Received-Date: Mon, 07 Jan 2013 00:05:12 -0000

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



