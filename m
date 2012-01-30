Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rruw3-0001t2-8i
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 18:22:31 +0100
Received: by dakf10 with SMTP id f10so3111489dak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 09:14:37 -0800 (PST)
Received: by 10.68.200.65 with SMTP id jq1mr43640580pbc.54.1327943677282;
	Mon, 30 Jan 2012 09:14:37 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id z5sm48521910pbc.5.2012.01.30.09.14.35
	(version=SSLv3 cipher=OTHER); Mon, 30 Jan 2012 09:14:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 09:14:23 -0800
Message-Id: <1327943665-16402-2-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1327943665-16402-1-git-send-email-steve@sakoman.com>
References: <1327943665-16402-1-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH v3 1/3] libksba: add recipe for 1.2.0
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
X-List-Received-Date: Mon, 30 Jan 2012 17:22:31 -0000

Libksba provides an easy API to create and parse X.509 and CMS related objects
and is required for gnupg

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libksba/libksba_1.2.0.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb

diff --git a/meta/recipes-support/libksba/libksba_1.2.0.bb b/meta/recipes-support/libksba/libksba_1.2.0.bb
new file mode 100644
index 0000000..876eedc
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba_1.2.0.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = " Libksba provides an easy API to create and parse X.509 and CMS related objects"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+
+inherit autotools binconfig
+
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${PN}/${PN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "e797f370b69b4dc776499d6a071ae137"
+SRC_URI[sha256sum] = "09afce65b03d027cbec10d21464f4f651cdfd269e38b404f83e48d3e2a3c934b"
-- 
1.7.1



