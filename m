Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 351CA77133
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 17:02:24 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 5CA7020C6A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 12:56:13 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Mon, 06 Jun 2016 12:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:in-reply-to
	:message-id:references:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=wVBxPDMRq1CdDZSh5ys/mTfV0vs=; b=u5y8m
	T4uPBQPKZFpywxRkYKWbNrFqj930wv7Chj45WNj/LTZ1a7lUjUuWlQGTeIylpxhv
	X3GedJRh7TeVC6DvpbtlXFO+92V3OFo2OZP2BLWlkqvIwBxqM/nsolBLkPHIcCAw
	GCTHiaMyPQyn3yfls+FNBn4GxXDaNMnecKoTCI=
X-Sasl-enc: J2NO/cPKt4iVca0D2qXBDjiNT0bz3tQ/ijZQfsa+l/7r 1465232172
Received: from laptop.tanuk.dy.fi (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id CB060F29F4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 12:56:12 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 19:55:57 +0300
Message-Id: <7e9fdbf1cfb95374f11ed02203489d85f2e8c61f.1465231939.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1465231939.git.tanuk@iki.fi>
References: <cover.1465231939.git.tanuk@iki.fi>
In-Reply-To: <cover.1465231939.git.tanuk@iki.fi>
References: <cover.1465231939.git.tanuk@iki.fi>
Subject: [PATCH 3/4] alsa-utils: 1.1.0 -> 1.1.1
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
X-List-Received-Date: Mon, 06 Jun 2016 17:02:24 -0000

Changelog:
http://alsa-project.org/main/index.php/Changes_v1.1.0_v1.1.1

alsabat has now a "standalone" mode, in which analysis with libfftw is
not needed. Therefore, it's now possible to enable alsabat without
fftw. However, there's no way to explicitly tell the configure script
to enable alsabat, but disable fftw. Without support for explicit
request to disable fftw, fftw would become a floating dependency,
which is why the recipe still only supports the "disable alsabat" and
"enable alsabat with fftw" options.

Dropped 0001-alsabat-rename-to-avoid-naming-conflict.patch (it's
included in the new release).

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...sa-utils-scripts_1.1.0.bb => alsa-utils-scripts_1.1.1.bb} |  0
 .../alsa/{alsa-utils_1.1.0.bb => alsa-utils_1.1.1.bb}        | 12 +++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.0.bb => alsa-utils-scripts_1.1.1.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.0.bb => alsa-utils_1.1.1.bb} (90%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.1.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.0.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.1.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.1.bb
similarity index 90%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.1.1.bb
index 62b1686..08c4646 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.1.bb
@@ -8,17 +8,23 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 DEPENDS = "alsa-lib ncurses libsamplerate0"
 
 PACKAGECONFIG ??= "udev"
+
+# alsabat can be built also without fftw support (with reduced functionality).
+# It would be better to always enable alsabat, but provide an option for
+# enabling/disabling fftw. The configure script doesn't support that, however
+# (at least in any obvious way), so for now we only support alsabat with fftw
+# or no alsabat at all.
 PACKAGECONFIG[bat] = "--enable-bat,--disable-bat,fftw"
+
 PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
 PACKAGECONFIG[xmlto] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
-           file://0001-alsabat-rename-to-avoid-naming-conflict.patch \
           "
 
-SRC_URI[md5sum] = "b9d6102fbbd0b68040bb77023ed30c0c"
-SRC_URI[sha256sum] = "3b1c3135b76e14532d3dd23fb15759ddd7daf9ffbc183f7a9a0a3a86374748f1"
+SRC_URI[md5sum] = "f8d00ad5fba757b4c3735d066cc288e2"
+SRC_URI[sha256sum] = "89757c9abaf420831b088fce354d492acc170bd02bb50eb7392c175f594b8041"
 
 # lazy hack. needs proper fixing in gettext.m4, see
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
-- 
2.8.1


