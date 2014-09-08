Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7645162252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:08 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id t60so988515wes.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rpZJbh2rHvl/27eODVITXiM9sQmoXi7GUVPEP3MTcMU=;
	b=kU5/X4VqrMGxGh8TxX7CbydlGJGWcfa5XtB4RxSTi8jqkJfmtie4lfDgcQSg+y2/Xm
	eVBfZRa/uFPTxpLgJPQKV1GrPta6jOJsMVIdXrFN6nTGPNStylnSGhBx2O+bn18x0Jj2
	cKqrHY3rJQ2Ltw7lCs7p92ZQd2BqFLdJQn4qLUO2OfdlREN3UWmUs+zyn6X5CYhpM0oE
	KWqqTlGumV9ZuVRvqqk00RZbwYbgWypTG+1YHgXYwut+s5Y86ngsVCuU6qHcgG1Jw9Jb
	gjNkVzb70un7yH5wcrvIy4/U/qFjlFmFst+SfTw+OWSo2rzWty/cUGIgsLFl3WHrvxwZ
	m5iQ==
X-Gm-Message-State: ALoCoQmX0yM9KAEyVNqiA/pb0ktIYzHKIcE+SOaXRlknKJgg6dtNazibv43Nz4UHL/ylqdFiU9Bd
X-Received: by 10.180.149.244 with SMTP id ud20mr21817184wib.55.1410177549611; 
	Mon, 08 Sep 2014 04:59:09 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:32 +0100
Message-Id: <3617ccefcdc38316356e999de2d2eb054138ae58.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 14/27] libpng: update to 1.6.13
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:09 -0000

From: Marko Lindqvist <cazfi74@gmail.com>

License terms have not changed. In case of LICENSE and png.h lines 0-15
the version numbers and release dates have changed. In case of png.h lines
229-343 the text has not changed at all, but old line numbers were not
pointing to correctly to the licensing terms segment.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libpng/{libpng_1.6.10.bb => libpng_1.6.13.bb}            |   10 +++++-----
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
1.7.10.4


