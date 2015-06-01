Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id D12DF75688
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 14:13:35 +0000 (UTC)
Received: by pdbnf5 with SMTP id nf5so47560978pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jun 2015 07:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0d0MYmm5MKI1jIWYLgINYVm5p3sj9IvRqPy6ZtjGTUM=;
	b=FEkLpaiba0ykdNsR/9c1sWQRqWXBhIOBuz+nP1c3/2cwpmJa2DMTMCxPa718EMhE6d
	Ae/49wFMz5ctGEGrOLNUNO1Jef9wQxsxd3PS1lXjE42PaRFSqbdRzRtIBvqSqcXUEJki
	WSHLaFD1lKAPkWuqNRLmFOk0VHWKDfy+HZOfy1yJUwp8tIqrBLDsJSETzS8I3AiUKoGU
	TgpQo7vJJXrHWd6kHeuRpBW4RdX8MIl5Q0nrnZHlmoa5Ha+5RIYUD/Ha/k6SedwkkiSH
	dlQHS4AzsxV85lmT9abIivfqRa4r26mBko0eYo3MM3sEGqfhzu/hMCAKUa7pbR89wtkK
	xMLw==
X-Received: by 10.70.127.140 with SMTP id ng12mr41282197pdb.94.1433168016861; 
	Mon, 01 Jun 2015 07:13:36 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	ie3sm14406775pbb.49.2015.06.01.07.13.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Jun 2015 07:13:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jun 2015 07:13:12 -0700
Message-Id: <c2e587da5d8a733f08543ad38c0214a6b16a932a.1433167180.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1433167180.git.akuster808@gmail.com>
References: <cover.1433167180.git.akuster808@gmail.com>
Subject: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Mon, 01 Jun 2015 14:13:35 -0000

this requires the gnutls 3.4.1  update or the current gnutils build will break.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nettle/{nettle_2.7.1.bb => nettle_3.1.1.bb}              | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/nettle/{nettle_2.7.1.bb => nettle_3.1.1.bb} (48%)

diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_3.1.1.bb
similarity index 48%
rename from meta/recipes-support/nettle/nettle_2.7.1.bb
rename to meta/recipes-support/nettle/nettle_3.1.1.bb
index f53afcc..ce5e756 100644
--- a/meta/recipes-support/nettle/nettle_2.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.1.1.bb
@@ -1,17 +1,17 @@
 SUMMARY = "A low level cryptographic library"
 HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
 SECTION = "libs"
-LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
-                    file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
+LICENSE = "GPLv2+ & GPLv3 & LGPLv3+"
+LIC_FILES_CHKSUM = "file://COPYINGv2;beginline=1;endline=2;md5=c70d8d3310941dcdfcd1e02800a1f548 \
+                    file://COPYINGv3;beginline=1;endline=2;md5=d1c727712ceba52db52e0ee449cadf43  \
+                    file://COPYING.LESSERv3;beginline=1;endline=2;md5=ff44a06d461487fb65f84ad672a1d1c8"
 
 DEPENDS += "gmp"
 
 SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
-SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
+SRC_URI[md5sum] = "b40fa88dc32f37a182b6b42092ebb144"
+SRC_URI[sha256sum] = "5fd4d25d64d8ddcb85d0d897572af73b05b4d163c6cc49438a5bfbb8ff293d4c"
 
 EXTRA_OECONF = "--disable-openssl"
 
-- 
2.3.5


