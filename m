Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rsc6z-0007tn-VB
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 16:28:42 +0100
Received: by iaby12 with SMTP id y12so1856554iab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 07:20:46 -0800 (PST)
Received: by 10.42.131.129 with SMTP id z1mr8380848ics.53.1328109645932;
	Wed, 01 Feb 2012 07:20:45 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id xu6sm15087657igb.7.2012.02.01.07.20.44
	(version=SSLv3 cipher=OTHER); Wed, 01 Feb 2012 07:20:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 07:20:30 -0800
Message-Id: <1328109632-3300-2-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1328109632-3300-1-git-send-email-steve@sakoman.com>
References: <1328109632-3300-1-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v6 1/3] libksba: add 1.2.0 (initial recipe)
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
X-List-Received-Date: Wed, 01 Feb 2012 15:28:42 -0000

Libksba provides an easy API to create and parse X.509 and CMS related objects
and is required for gnupg

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 meta/recipes-support/libksba/libksba_1.2.0.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb

diff --git a/meta/recipes-support/libksba/libksba_1.2.0.bb b/meta/recipes-support/libksba/libksba_1.2.0.bb
new file mode 100644
index 0000000..6489cc5
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba_1.2.0.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Libksba provides an easy API to create and parse X.509 and CMS related objects."
+HOMEPAGE = "http://www.gnupg.org/related_software/libksba/"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+
+DEPENDS = "libgpg-error"
+
+inherit autotools binconfig
+
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${PN}/${PN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "e797f370b69b4dc776499d6a071ae137"
+SRC_URI[sha256sum] = "09afce65b03d027cbec10d21464f4f651cdfd269e38b404f83e48d3e2a3c934b"
-- 
1.7.1



