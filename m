Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id A5464731EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:38:04 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id j3so1563229oig.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zfLfTJ4vxFxfPpVr3a/JkMUl0TlYwhKSPFcZc11Dg+Q=;
	b=SY7yg6mSZ/DIZ8ztrSHqFOBEmVx/f+NM/ecqaCbKrUuMngV9V3/egrtsgAtXHJ5VfS
	lfMAKLq/hK3nIo8KThUSMxige8tYdsB3bcq5a/E/9jRM+AAWNLX0g47nB78AsWZbFkQK
	Jw+RHzmrcqqoC7FGOIjsiRmivqJsswxTXPaVbCvRmCyOz0VT767GglUj/x5EOwVyiDjM
	qeV+wCqy4kcukywwsZsmPHgw/oXaeBuATq+SQ7BhZ35yQXhXz8221U0HN6EJk/Jstmp9
	b0ANal75z9OvCTZbU4WNNRanbgrIa23+/buuVnHtwLxN4CuUHgFYuD/S4OY8c/mBQ+q6
	P5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zfLfTJ4vxFxfPpVr3a/JkMUl0TlYwhKSPFcZc11Dg+Q=;
	b=nCbTuU5+oKPp0m6psLg8+vCLkrPWZ9fn8dLimLJA9KDFwWOd9WGqc0nesXIaZixuIx
	teM1dIgUO0cZgIwE94YVeBcoN8ctedJoOpn0oTJcynK9ldPGi4H58E+Pv71GYZmC37YR
	etdr0eHhLLMbcyTq9rca5nsExfuW+03S3IVT8IvyiHoKSQ6OfTnJZ5Z91cA52zVy9ksp
	YgcKPSDg8hcJrY2Fe++tJfmTEPK/6OxUNXWH5iaVO0bGCsfHOREYkBcPCM7MP/+QfHTW
	33DSW63TMzsqqwA7zuSXcVWHpKrpUD/ItSCW+grEOwCCqABlzZI0RbEimzX7GRWN+oFb
	Yw5w==
X-Gm-Message-State: ALoCoQn3cKM0NcKHhL66M+EKQzs4gtv1O7KWrLus4cTJbb5ZszzduHyX0lanF6NM09C2to+hpkf38sw2nhC5seeNYBuicoNAww==
X-Received: by 10.202.211.80 with SMTP id k77mr30453660oig.98.1453354685599;
	Wed, 20 Jan 2016 21:38:05 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.38.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:38:04 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:48 -0800
Message-Id: <1453354610-19218-31-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 30/32] gstreamer1.0-plugins-bad: update git recipe to 1.7.1
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
X-List-Received-Date: Thu, 21 Jan 2016 05:38:04 -0000

Handle renaming of the HLS plugin:

  http://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=efe62292a3d045126654d93239fdf4cc8e48ae08

Switch AES decryption for the HLS plugin from nettle to openssl.

The autogen.sh script takes care of cd'ing to the correct directory
before it does anything, so we don't need to cd on its behalf any more
in do_configure_prepend().

  http://cgit.freedesktop.org/gstreamer/gst-plugins-bad/tree/autogen.sh?id=1.7.1

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      | 40 ++++++++++++++++------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index 654eab0..ebf579f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -7,21 +7,39 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50 \
                     file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
 
-SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-plugins-bad"
+SRC_URI = " \
+    git://anongit.freedesktop.org/gstreamer/gst-plugins-bad;name=base \
+    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
+    file://configure-allow-to-disable-libssh2.patch \
+"
 
-SRCREV = "6e5db57d2446a753aaa76bee268e1f95600b14ce"
+PV = "1.7.1+git${SRCPV}"
 
-S = "${WORKDIR}/git"
+SRCREV_base = "3a088ecc9330d5cb8888ff43de0fe4f61c23a607"
+SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
+SRCREV_FORMAT = "base"
 
-PACKAGECONFIG[sbc] = "--enable-sbc,--disable-sbc,sbc"
-PACKAGECONFIG[hls] = "--enable-hls,--disable-hls,gnutls"
+S = "${WORKDIR}/git"
 
-EXTRA_OECONF += " \
-    -disable-openjpeg \
-"
+# over-ride the default hls PACKAGECONFIG in gstreamer1.0-plugins-bad.inc to
+# pass an additional --with-hls-crypto=XXX option (new in 1.7.x) and switch HLS
+# AES decryption from nettle to openssl (ie a shared dependency with dtls).
+# This should move back to the common .inc once the main recipe updates to 1.8.x
+PACKAGECONFIG[hls] = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl"
 
 do_configure_prepend() {
-	cd ${S}
-	./autogen.sh --noconfigure
-	cd ${B}
+	${S}/autogen.sh --noconfigure
+}
+
+# In 1.6.2, the "--enable-hls" configure option generated an installable package
+# called "gstreamer1.0-plugins-bad-fragmented". In 1.7.1 that HLS plugin package
+# has become "gstreamer1.0-plugins-bad-hls". See:
+# http://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=efe62292a3d045126654d93239fdf4cc8e48ae08
+
+PACKAGESPLITFUNCS_append = " handle_hls_rename "
+
+python handle_hls_rename () {
+    d.setVar('RPROVIDES_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
+    d.setVar('RREPLACES_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
+    d.setVar('RCONFLICTS_gstreamer1.0-plugins-bad-hls', 'gstreamer1.0-plugins-bad-fragmented')
 }
-- 
1.9.1


