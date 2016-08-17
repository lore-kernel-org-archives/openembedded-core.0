Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 8D32676312
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 11:20:45 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 77583207F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 07:20:46 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 17 Aug 2016 07:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:in-reply-to
	:message-id:references:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=hKCwI6n27uupHVvN6PMwLPOwh4E=; b=F90M1
	GD4fnRz0SQvSmmc0Me7BDEtunbi0qd80o/fhWJNL0BW8/LYat95ilQAtOT8pmxbK
	wD5V+Ibx3wE0iSGkPYqd3wqt6hs3GgB+iSU4IPKe+OPP33to0lhduBwyvdZLEKrI
	yhIIID5/XDoU90Rky7Xa0akgaZIg0BTWxeaZkw=
X-Sasl-enc: B7wwUS/k7qvoA3/i3DOxIab5S+rJfMxW+3RmPBd7ssoP 1471432846
Received: from laptop.tanuk.dy.fi (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id EF4EEF285F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 07:20:45 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2016 14:20:30 +0300
Message-Id: <9b4cf246d85d0fe99e34b781b0d5ffa64d7ba1c3.1471432659.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1471432658.git.tanuk@iki.fi>
References: <cover.1471432658.git.tanuk@iki.fi>
In-Reply-To: <cover.1471432658.git.tanuk@iki.fi>
References: <cover.1471432658.git.tanuk@iki.fi>
Subject: [PATCH 2/2] alsa-utils: 1.1.1 -> 1.1.2
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
X-List-Received-Date: Wed, 17 Aug 2016 11:20:45 -0000

Changelog:
http://www.alsa-project.org/main/index.php/Changes_v1.1.1_v1.1.2

The FFT code in alsabat changed from double precision to single
precision floating point numbers, which is why the fftw dependency
changed to fftwf.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../{alsa-utils-scripts_1.1.1.bb => alsa-utils-scripts_1.1.2.bb}    | 0
 .../alsa/{alsa-utils_1.1.1.bb => alsa-utils_1.1.2.bb}               | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.1.bb => alsa-utils-scripts_1.1.2.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.1.bb => alsa-utils_1.1.2.bb} (96%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.1.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.2.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.1.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.2.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.1.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.2.bb
similarity index 96%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.1.1.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.1.2.bb
index ddb1644..a22d999 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.2.bb
@@ -14,7 +14,7 @@ PACKAGECONFIG ??= "udev"
 # enabling/disabling fftw. The configure script doesn't support that, however
 # (at least in any obvious way), so for now we only support alsabat with fftw
 # or no alsabat at all.
-PACKAGECONFIG[bat] = "--enable-bat,--disable-bat,fftw"
+PACKAGECONFIG[bat] = "--enable-bat,--disable-bat,fftwf"
 
 PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
 PACKAGECONFIG[xmlto] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
@@ -23,8 +23,8 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
           "
 
-SRC_URI[md5sum] = "f8d00ad5fba757b4c3735d066cc288e2"
-SRC_URI[sha256sum] = "89757c9abaf420831b088fce354d492acc170bd02bb50eb7392c175f594b8041"
+SRC_URI[md5sum] = "38ac7c781f80c41c02b4664d8cbafa87"
+SRC_URI[sha256sum] = "7af603c0877d1251599d65b4fbc372e63a54371b888f5c26c6a86ac1d0519071"
 
 # lazy hack. needs proper fixing in gettext.m4, see
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
-- 
2.8.1


