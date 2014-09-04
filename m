Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 65264713E8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 00:48:22 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id el20so2322315lab.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 17:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=2Q3IqAk8styoC67V7+TwQC6LFCHf6E4j4/h4WVIWXac=;
	b=EQP2yTK1V1QgSG0v/O/JN09KCpV6Zae4ps+u6XWo+zZSFsZQQh/Vsz/UwX+H3nx9Pi
	CE+n+uY8c2lGnZPG6Kats8p6KFitVwnKLz7Ho4vPflZ1nrOVqj8i+4c1AK4v/jsV6WOg
	qou9ADPE4XNjXuLFtlWFB4/53N2+uvJtlTnasn9Q5nln+DhJzglnLFOQyAX25AcHOFRA
	G4PMEITYIQr+Cd+PExMtVmO4SBEAs/MXOpCalE2LKRAgm3o9U8tNHfFp7Yb5Xky3nOLl
	7H1+CizofI25aULTxBNUQdnwQa1o7bTvpUKsbcET3VJvlrjI0dZeJ33Ueq7sH/aqdc5R
	hgOQ==
X-Received: by 10.112.147.74 with SMTP id ti10mr793044lbb.29.1409791703149;
	Wed, 03 Sep 2014 17:48:23 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id la9sm1622040lab.12.2014.09.03.17.48.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Sep 2014 17:48:21 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.84)
	(envelope-from <cazfi74@gmail.com>)
	id 1XPLDo-0008Ux-B8; Thu, 04 Sep 2014 03:48:20 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Sep 2014 03:48:14 +0300
Message-Id: <8112ee5c499b0fd24f8c02841d248cc9a7301ae0.1409791242.git.cazfi74@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <01fc289dc196b0e1bff3359fcfff1a3f33691302.1409791242.git.cazfi74@gmail.com>
References: <01fc289dc196b0e1bff3359fcfff1a3f33691302.1409791242.git.cazfi74@gmail.com>
In-Reply-To: <cover.1409791241.git.cazfi74@gmail.com>
References: <cover.1409791241.git.cazfi74@gmail.com>
Subject: [PATCH 3/6] libpng: update to 1.6.13
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
X-List-Received-Date: Thu, 04 Sep 2014 00:48:25 -0000

License terms have not changed. In case of LICENSE and png.h lines 0-15
the version numbers and release dates have changed. In case of png.h lines
229-343 the text has not changed at all, but old line numbers were not
pointing to correctly to the licensing terms segment.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libpng/{libpng_1.6.10.bb => libpng_1.6.13.bb}              | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.10.bb => libpng_1.6.13.bb} (62%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.10.bb b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
similarity index 62%
rename from meta/recipes-multimedia/libpng/libpng_1.6.10.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.13.bb
index 79d9122..0c6fd1f 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.10.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
@@ -2,17 +2,17 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cb7a834ba2891bc30b8577e49963a435 \
-                    file://png.h;endline=15;md5=853b11c4a19ec66decd641efd756bc2c \
-                    file://png.h;beginline=209;endline=323;md5=cface34a7db6b71eaa828fe934951f81"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=46401ee4b225b9ec066cb96cf1025c0f \
+                    file://png.h;endline=15;md5=8167a17735fc618d1df109f8b0f839a6 \
+                    file://png.h;beginline=229;endline=343;md5=5cdf8564a14e2f00339e4437a83b4913"
 DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "5f414b20f683b1d96b163c89e3eff768"
-SRC_URI[sha256sum] = "4003f0fd0e36110a2b742fc5b9e1ab93ed7a7ab57ae8dc65f0e8101458775a56"
+SRC_URI[md5sum] = "9822c25466f060142359f80ed142c9e5"
+SRC_URI[sha256sum] = "d9c8ce54a5fc8052ed794ca65b553384a74c0608b09ae163cbbb07176018e625"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-- 
2.1.0


