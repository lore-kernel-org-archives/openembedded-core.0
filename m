Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rsc72-0007u0-JE
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 16:28:45 +0100
Received: by ggeq1 with SMTP id q1so655371gge.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 07:20:49 -0800 (PST)
Received: by 10.50.11.202 with SMTP id s10mr10495396igb.25.1328109648205;
	Wed, 01 Feb 2012 07:20:48 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id xu6sm15087657igb.7.2012.02.01.07.20.46
	(version=SSLv3 cipher=OTHER); Wed, 01 Feb 2012 07:20:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 07:20:31 -0800
Message-Id: <1328109632-3300-3-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1328109632-3300-1-git-send-email-steve@sakoman.com>
References: <1328109632-3300-1-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v6 2/3] gnupg: add 2.0.18 (initial recipe)
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
X-List-Received-Date: Wed, 01 Feb 2012 15:28:46 -0000

GnuPG 2.0 is the new modularized version of GnuPG supporting OpenPGP and S/MIME

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 meta/recipes-support/gnupg/gnupg_2.0.18.bb |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg_2.0.18.bb

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.18.bb b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
new file mode 100644
index 0000000..c1024c8
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "GNU privacy guard - a free PGP replacement (new v2.x)"
+HOMEPAGE = "http://www.gnupg.org/"
+LICENSE = "GPLv3 & LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
+                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
+
+DEPENDS = "pth libassuan libksba zlib bzip2 readline"
+
+inherit autotools gettext
+
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${PN}/${P}.tar.bz2"
+
+SRC_URI[md5sum] = "2f37e0722666a0fedbe4d9f9227ac4d7"
+SRC_URI[sha256sum] = "48aedd762ca443fb952a9e859efe3c66706d7c2c9c77c32dbdbac4fe962dae5b"
+
+EXTRA_OECONF = "--disable-ldap \
+		--with-zlib=${STAGING_LIBDIR}/.. \
+		--with-bzip2=${STAGING_LIBDIR}/.. \
+                --with-readline=${STAGING_LIBDIR}/.. \
+               "
+
+do_install_append() {
+	ln -sf gpg2 ${D}${bindir}/gpg
+}
-- 
1.7.1



