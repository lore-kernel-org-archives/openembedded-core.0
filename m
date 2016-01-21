Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6CFF2731CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:44:16 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id oj9so1833711obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WfUlMqouzq+/GcOaRRfUkPV33LBdzOxRqfV76ZLmuQo=;
	b=fZ+3dlgj84rtqrbc4AeuRzzZGgmfG1KLxdI88HKD08Iw792ANWRnx4j3ih5J4lh6Ms
	H5PsOjGzAdoTTHo0AXHzRGqmNlit6Rt6+oJY4B79liNUVPKAPpkBkIzg4AqjNECf6cpZ
	WHjznRQYyvn+xUAEkWTONUsF9AdreptRj+7fIbe2l/3u05wD/gN/AAqbAFH+SNmXp0/u
	fNB8QqQ5m7/EHXF9g1eJLsoQ7zlCYo82f3h+g1OcDCIA0oKKrvtioC4W5R7e5mv6Tz0Y
	022cBcJ/RVy98liq8pSZ6iRjqo9JiniJCE/gxvXhJpYHVvTRdpiQYrGJJMAsUH/XhXDD
	Og3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WfUlMqouzq+/GcOaRRfUkPV33LBdzOxRqfV76ZLmuQo=;
	b=OG9eez2LBAuHNzKeo7HuU4dUkh1ia+4eegHQG33D+tg+ijKUkhY0K3rNCscY+ydRxn
	ZpazsWBrttPJS4HNWjtantIPoeUihtUi2hcuk4SuOX/oraaKfQ4CP9cZ+A6GwpSMUrVi
	kPOvFxbqoLzpQHh5vfRk3tB6S3Nz4sj3NeW6e6zGXNT1C38QkTAZJTixFiTO0mjk0PV2
	K5s5kw/u40rDUL1BalMik+xycO5cQwch0Ps8hmUlULr/H0cFhEkc07llOojgM6Vei0DY
	zbYjQPBX/LpG89SRCMP/F5YX8swLPUSxKU6nfqp32Mie4JQx93lOrSQ7NPlDbetPQtL9
	QWJg==
X-Gm-Message-State: ALoCoQm+fNl4xOu7U3HlFQSr5BsJBbcFbJnYCS5KaQR9cf+YNY5wfADhfQktfv7rIJko5EWYYN+MmyXwVFVJnK620NIIgKw79A==
X-Received: by 10.182.108.229 with SMTP id hn5mr31601438obb.75.1453344257369; 
	Wed, 20 Jan 2016 18:44:17 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.44.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:44:16 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:21 -0800
Message-Id: <1453344203-7118-24-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 23/25] gstreamer1.0-plugins-bad: update git recipe to 1.7.1
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
X-List-Received-Date: Thu, 21 Jan 2016 02:44:16 -0000

Handle renaming of the HLS plugin:

  http://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=efe62292a3d045126654d93239fdf4cc8e48ae08

Switch AES decryption for the HLS plugin from nettle to openssl.

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


