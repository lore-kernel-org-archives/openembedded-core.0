Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1FDB973170
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 21:07:48 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g62so77059546wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 13:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=RDL5CB4nJywFWso85R05qfTgmqwEZTIbg/CwDNhDteI=;
	b=owjzXNWPsW2Vc2sd/uzSvVB0G4L9+zYPP9ajsemYM1kfwbQPx4ku4ePpavGY6Yi1Qy
	yb88U3oNu5l5MgWckX1OUc/45NAp/SZScpHK3U8Cf3J4n6hnRoLGXaH6eQ1PZ4MnLXc2
	0+KhGOGlgoTA2SB+JCW6LH0uoadnAODmZjVSQM4jgggxEDdppxSYAIcKsryzA6aJLK/6
	Uh/YC/UGwhG++/0ousNH2/1aUufAjGDAdV9cHl7PWT0RVkAdQK5SpnZq/iir1yZ5x/8v
	Zn35/OEUFQfplA71n/K6Nui/DPRyESgD1WCpsMaWflEpJKg+/RdrDeBnz7dcVEEaTY4V
	5x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=RDL5CB4nJywFWso85R05qfTgmqwEZTIbg/CwDNhDteI=;
	b=XgTyatEr6qlBQ0OPNw8TbCtv20qjbA7KLGetKv2C5QFD6JQmrpH5L/wx6RIJGZMaeC
	+WJ64LDrVChMlLNnNuPGv9ZcHITUwBUyLaGVUz2a00kmQLlXNmHTUXXX7TfBgJbdvw6r
	kz+1dcqIO9j1EaxUcw5w/i2bymm8dZ3q7QzSmGegt9bL+yzzYU/GvIESRX92LpZSEJ+n
	ow9V8YCfALnUmwygD2fpi42bLck8/HWY8VemiKfeW6ogBN1P0kq4HnuwEFMm+dN+CYy6
	sD5vUTJ8Jj61tvSi3l4T4KXNVnAGXlKFPRKkt8dEC6nsE9gNRitMAKMYpPvLKd/M9L8r
	7Z2g==
X-Gm-Message-State: AG10YOTfzenUVE9U25Vhon4LpjeH4heEUwuOrSIHM4/sGP/7gZtTLNvyPupZcpm6xyIUJQ==
X-Received: by 10.194.205.8 with SMTP id lc8mr17623755wjc.177.1455570468708;
	Mon, 15 Feb 2016 13:07:48 -0800 (PST)
Received: from localhost.localdomain (p5B0A09DF.dip0.t-ipconnect.de.
	[91.10.9.223]) by smtp.googlemail.com with ESMTPSA id
	js8sm27021938wjc.37.2016.02.15.13.07.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Feb 2016 13:07:48 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 22:07:34 +0100
Message-Id: <1455570454-10167-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] libsdl2: update to 2.0.4
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
X-List-Received-Date: Mon, 15 Feb 2016 21:07:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Licence checksum was changed by change of copyright year.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libsdl2/{libsdl2_2.0.3.bb => libsdl2_2.0.4.bb}                | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.3.bb => libsdl2_2.0.4.bb} (91%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb
similarity index 91%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb
index 61d9c1e..b50a0fa 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "http://bugzilla.libsdl.org/"
 SECTION = "libs"
 
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=67dcb7fae16952557bc5f96e9eb5d188"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b2304ad7e91711027590d3f102a754b7"
 
 PROVIDES = "virtual/libsdl2"
 
@@ -18,8 +18,8 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[md5sum] = "fe6c61d2e9df9ef570e7e80c6e822537"
-SRC_URI[sha256sum] = "a5a69a6abf80bcce713fa873607735fe712f44276a7f048d60a61bb2f6b3c90c"
+SRC_URI[md5sum] = "44fc4a023349933e7f5d7a582f7b886e"
+SRC_URI[sha256sum] = "da55e540bf6331824153805d58b590a29c39d2d506c6d02fa409aedeab21174b"
 
 inherit autotools lib_package binconfig pkgconfig
 
@@ -61,3 +61,5 @@ do_configure_prepend() {
         done
         export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
 }
+
+FILES_${PN}-dev += "${libdir}/cmake"
-- 
2.5.0


