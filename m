Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E092060E33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 03:35:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBU3Z7pa018264
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 19:35:07 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 29 Dec 2013 19:35:06 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 29 Dec 2013 22:34:50 -0500
Message-ID: <7cfb256b5643c0fe657fc9407c46eec17c9b78a9.1388369850.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1388369850.git.liezhi.yang@windriver.com>
References: <cover.1388369850.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/14] flac: remove unrecognised options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Dec 2013 03:35:07 -0000
Content-Type: text/plain

Remove --disable-id3libtest and --without-id3lib which had been removed
from flac for many years, here is the log from flac:

  commit e31d9eb05cb82bd5f9cab1e6ad5295ddad22bcab
  Author: Josh Coalson <jcoalson@users.sourceforce.net>
  Date:   Tue Sep 28 00:23:57 2004 +0000

      remove id3 support from the plugins

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-multimedia/flac/flac_1.2.1.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb b/meta/recipes-multimedia/flac/flac_1.2.1.bb
index 7fd7a03..37c7a97 100644
--- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
+++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
@@ -32,13 +32,13 @@ S = "${WORKDIR}/flac-${PV}"
 
 inherit autotools gettext
 
-EXTRA_OECONF = "--disable-oggtest --disable-id3libtest \
+EXTRA_OECONF = "--disable-oggtest \
                 --with-ogg-libraries=${STAGING_LIBDIR} \
                 --with-ogg-includes=${STAGING_INCDIR} \
                 --without-xmms-prefix \
                 --without-xmms-exec-prefix \
                 --without-libiconv-prefix \
-                --without-id3lib"
+                "
 
 EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "altivec", " --enable-altivec", " --disable-altivec", d)}"
 
-- 
1.7.10.4


