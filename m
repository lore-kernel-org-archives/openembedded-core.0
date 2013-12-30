Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD4186B629
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 03:35:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBU3ZN1s026000
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 19:35:23 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 29 Dec 2013 19:35:22 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 29 Dec 2013 22:35:00 -0500
Message-ID: <480d14b1612414c171eb1e4728b18efb770ea600.1388369850.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1388369850.git.liezhi.yang@windriver.com>
References: <cover.1388369850.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/14] cups: remove unrecognised option
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
X-List-Received-Date: Mon, 30 Dec 2013 03:35:22 -0000
Content-Type: text/plain

Remove the following 2 options:
* --disable-tiff
* --with-pdftops

The tiff and pdftops filters have been moved into another package
cups-filters, so these options are not valid any more.

Please visit here for more info:
http://www.cups.org/str.php?L3930

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/cups/cups.inc |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index cb5b1a7..7a18500 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -25,7 +25,6 @@ EXTRA_OECONF = " \
                --enable-dbus \
                --enable-browsing \
                --disable-openssl \
-               --disable-tiff \
                --disable-gssapi \
                --enable-debug \
                --disable-relro \
@@ -34,7 +33,6 @@ EXTRA_OECONF = " \
                --without-perl \
                --without-python \
                --without-java \
-               --with-pdftops=none \
                "
 
 
-- 
1.7.10.4


