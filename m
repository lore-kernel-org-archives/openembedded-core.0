Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rrt9z-0003dh-Qa
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 16:28:48 +0100
Received: by pbaa13 with SMTP id a13so3212902pba.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 07:20:54 -0800 (PST)
Received: by 10.68.141.111 with SMTP id rn15mr42187665pbb.76.1327936853530;
	Mon, 30 Jan 2012 07:20:53 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id w4sm40437462pbf.4.2012.01.30.07.20.51
	(version=SSLv3 cipher=OTHER); Mon, 30 Jan 2012 07:20:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 07:20:37 -0800
Message-Id: <1327936840-13937-2-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1327936840-13937-1-git-send-email-steve@sakoman.com>
References: <1327936840-13937-1-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH 1/4] libassuan: add recipe for 2.0.3
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
X-List-Received-Date: Mon, 30 Jan 2012 15:28:48 -0000

Libassuan is the IPC library used by some GnuPG related software

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/gnupg/libassuan_2.0.3.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/gnupg/libassuan_2.0.3.bb

diff --git a/meta/recipes-extended/gnupg/libassuan_2.0.3.bb b/meta/recipes-extended/gnupg/libassuan_2.0.3.bb
new file mode 100644
index 0000000..ac34869
--- /dev/null
+++ b/meta/recipes-extended/gnupg/libassuan_2.0.3.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Libassuan is the IPC library used by some GnuPG related software"
+LICENSE = "GPLv3+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
+                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+inherit autotools binconfig
+
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${PN}/${PN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "179d1918325fdb928c7bd90b8a514fc7"
+SRC_URI[sha256sum] = "bad5682374c76bcc0abb1a7a34c9557af6874a477500748e64a7d3def79cac1b"
-- 
1.7.1



