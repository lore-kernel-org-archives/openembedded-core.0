Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Rng-0001GH-6p
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:45:40 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so2123662bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=5/sq5pAq7T7F1vp5A1u3zLkp417Nb7wcS8gvy2j0rpo=;
	b=LI6MUp66bvbFdC1my9w5+hTWKjdHjXc0hZxnA6b1oKw6pCEAY4fAC3Azk8crkgUvCt
	gQp6pA7EkpIXtxYq6KhnM1fCfVgY9zvxhwDGu1FoohlyRnhL61gXxKrpN/lP2uYp2gTC
	3l7DW8wv9537Uejaq1JNJ0FobcuTYRrNMGtj0=
Received: by 10.204.150.87 with SMTP id x23mr873360bkv.118.1316630423326;
	Wed, 21 Sep 2011 11:40:23 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t16sm5806554bkv.11.2011.09.21.11.40.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:40:22 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:39:53 +0400
Message-Id: <1316630404-10336-6-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 06/17] libgpg-error: drop common-lisp files
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
X-List-Received-Date: Wed, 21 Sep 2011 18:45:41 -0000

OE doesn't have common-lisp neither in oe-core, nor in org.oe.dev. Stop
this package from installing clisp-related files.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../libgpg-error/libgpg-error_1.10.bb              |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
index 6dea084..0c10b47 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 SECTION = "libs"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch"
@@ -23,3 +23,8 @@ FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${bindir}/*"
 
 inherit autotools binconfig pkgconfig gettext
+
+do_install_append() {
+	# we don't have common lisp in OE
+	rm -rf "${D}${datadir}/common-lisp/"
+}
-- 
1.7.2.5



