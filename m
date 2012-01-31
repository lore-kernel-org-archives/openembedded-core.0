Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RsHtT-0002Bz-SY
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 18:53:24 +0100
Received: by mail-iy0-f175.google.com with SMTP id y12so316610iab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 09:45:32 -0800 (PST)
Received: by 10.42.135.138 with SMTP id p10mr17751395ict.25.1328031931908;
	Tue, 31 Jan 2012 09:45:31 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id k3sm3697062igq.1.2012.01.31.09.45.29
	(version=SSLv3 cipher=OTHER); Tue, 31 Jan 2012 09:45:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2012 09:45:17 -0800
Message-Id: <1328031918-23871-3-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1328031918-23871-1-git-send-email-steve@sakoman.com>
References: <1328031918-23871-1-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v5 2/3] gnupg: add recipe for 2.0.18
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
X-List-Received-Date: Tue, 31 Jan 2012 17:53:24 -0000

GnuPG 2.0 is the new modularized version of GnuPG supporting OpenPGP and S/MIME

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnupg/gnupg_2.0.18.bb |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg_2.0.18.bb

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.18.bb b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
new file mode 100644
index 0000000..bdf6e3e
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "gnupg - GNU privacy guard"
+LICENSE = "GPLv3 & LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
+                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
+
+DEPENDS = "pth libassuan libksba zlib bzip2 readline"
+
+inherit autotools gettext
+
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "2f37e0722666a0fedbe4d9f9227ac4d7"
+SRC_URI[sha256sum] = "48aedd762ca443fb952a9e859efe3c66706d7c2c9c77c32dbdbac4fe962dae5b"
+
+S = "${WORKDIR}/gnupg-${PV}"
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



