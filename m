Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RrtA1-0003dh-40
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 16:28:49 +0100
Received: by mail-pw0-f47.google.com with SMTP id a13so3212902pba.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 07:20:58 -0800 (PST)
Received: by 10.68.226.166 with SMTP id rt6mr16426828pbc.23.1327936857656;
	Mon, 30 Jan 2012 07:20:57 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id w4sm40437462pbf.4.2012.01.30.07.20.55
	(version=SSLv3 cipher=OTHER); Mon, 30 Jan 2012 07:20:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 07:20:39 -0800
Message-Id: <1327936840-13937-4-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1327936840-13937-1-git-send-email-steve@sakoman.com>
References: <1327936840-13937-1-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH 3/4] gnupg: add recipe for 2.0.18
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
X-List-Received-Date: Mon, 30 Jan 2012 15:28:49 -0000

GnuPG 2.0 is the new modularized version of GnuPG supporting OpenPGP and S/MIME

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/gnupg/gnupg_2.0.18.bb |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/gnupg/gnupg_2.0.18.bb

diff --git a/meta/recipes-extended/gnupg/gnupg_2.0.18.bb b/meta/recipes-extended/gnupg/gnupg_2.0.18.bb
new file mode 100644
index 0000000..c56f3d5
--- /dev/null
+++ b/meta/recipes-extended/gnupg/gnupg_2.0.18.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "gnupg - GNU privacy guard"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
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



