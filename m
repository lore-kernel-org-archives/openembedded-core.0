Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3DD7DE82
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 21:07:19 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id v18so7670462lfi.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 14:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=f01d9EeWFjNAJpb8mLuIe2G2FX4ytKVOOQ/RZQVFPbg=;
	b=eQmsnUoCn+OXtZWlcCnm9NgTPzHCOEiM7x5DbWW6ST0WvSZhvC3KvF1zqiBvHWdxyZ
	Xa6r4FENZz/5vCEK/xJxgNAAOTTo4FZEaLz/sY9mqEh0aOfJWfSC/YAaoSYWVtbZ7nOS
	+X3j+YpcFfF6lXAxbLCBZBPcnlGEzwHPIruqRFzoHmlEZGGtsNtdQpv24lPzfjx9/sEc
	rUnSCTmbcGF6PLInGCmTFUiCqiosOVcQtPSzBYM7CjBKCnbCNXyTTr/eM/FwM6fyNbX1
	+kWyjTEMd+cqkWZrKJ4A7UoqCJDdkhLzAGoGlBrMCtVZ1opMHMiBVEmVXBtmy/aqOSrc
	UoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=f01d9EeWFjNAJpb8mLuIe2G2FX4ytKVOOQ/RZQVFPbg=;
	b=pBYW/Dutnwbv5IihAaG05I2JeZ9OLa35Pxzb+VjxxF3sac+Qiz2TmqwDEEu+M5a8Pv
	TNWSaoJQ3rbwObpdr82o+eDoyTXcFRj7Z3Kq+VE0DUhGQCQvIeTP1NfxgdH28ZEoLmfJ
	2rca/k20C4XBcl8OkBtflXQr1pS4dWbhUR2hBsro9BuHy8UsarVTrw9pgekvXtScOYKo
	rlKq9rp8Ai4XQjciUyd8G5cB/JroQUX74xuqNUXdlU4Aei45DAkslFtWnasfPBvmft8Q
	EsV8B57m0dcYU8sGgX1bcZeEmHKy/64uJUJ+jtOUwFtYeMRy8HTx4D7W8skTzguabGzi
	PyzQ==
X-Gm-Message-State: APjAAAVFgzXfJvp1Th9fOgKOLCqr2qrEHMhAaJaQLMqX/KNnlvft4/Wi
	z2Chj83AwMkVlM4pTa/4P7V5FOsYqPw=
X-Google-Smtp-Source: APXvYqyUKzwfdywHzw8F/T3gZ51Q4gSnK75Zk13oj9whm8PP1x1bYRgGbJesZpHf6Mb15Kn4YweQkw==
X-Received: by 2002:a19:a295:: with SMTP id l143mr30473489lfe.83.1558213639844;
	Sat, 18 May 2019 14:07:19 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id f9sm2638623ljf.69.2019.05.18.14.07.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 May 2019 14:07:19 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 May 2019 23:07:14 +0200
Message-Id: <1558213634-6468-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] alsa-utils: replace hard-coded alsa-utils with PN
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
X-List-Received-Date: Sat, 18 May 2019 21:07:19 -0000

From: Ming Liu <liu.ming50@gmail.com>

This is mandatory to support multilib build, and also to avoid being
redundant with plenty of hard-coded alsa-utils references.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb | 96 ++++++++++++------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb
index 96d54e5..ef98891 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb
@@ -20,7 +20,7 @@ PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev
 PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
+SRC_URI = "https://www.alsa-project.org/files/pub/utils/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "54d6f9b483144823d0fc0c26e8cea028"
 SRC_URI[sha256sum] = "fd9bf528922b3829a91913b89a1858c58a0b24271a7b5f529923aa9ea12fa4cf"
 
@@ -36,59 +36,59 @@ inherit autotools gettext pkgconfig manpages
 # ipk depends on them.
 
 ALSA_UTILS_PKGS = "\
-             ${@bb.utils.contains('PACKAGECONFIG', 'bat', 'alsa-utils-alsabat', '', d)} \
-             alsa-utils-alsamixer \
-             alsa-utils-alsatplg \
-             alsa-utils-midi \
-             alsa-utils-aplay \
-             alsa-utils-amixer \
-             alsa-utils-aconnect \
-             alsa-utils-iecset \
-             alsa-utils-speakertest \
-             alsa-utils-aseqnet \
-             alsa-utils-aseqdump \
-             alsa-utils-alsactl \
-             alsa-utils-alsaloop \
-             alsa-utils-alsaucm \
+             ${@bb.utils.contains('PACKAGECONFIG', 'bat', '${PN}-alsabat', '', d)} \
+             ${PN}-alsamixer \
+             ${PN}-alsatplg \
+             ${PN}-midi \
+             ${PN}-aplay \
+             ${PN}-amixer \
+             ${PN}-aconnect \
+             ${PN}-iecset \
+             ${PN}-speakertest \
+             ${PN}-aseqnet \
+             ${PN}-aseqdump \
+             ${PN}-alsactl \
+             ${PN}-alsaloop \
+             ${PN}-alsaucm \
             "
 
 PACKAGES += "${ALSA_UTILS_PKGS}"
 RDEPENDS_${PN} += "${ALSA_UTILS_PKGS}"
 
 FILES_${PN} = ""
-FILES_alsa-utils-alsabat     = "${bindir}/alsabat"
-FILES_alsa-utils-alsatplg    = "${bindir}/alsatplg"
-FILES_alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord ${bindir}/axfer"
-FILES_alsa-utils-amixer      = "${bindir}/amixer"
-FILES_alsa-utils-alsamixer   = "${bindir}/alsamixer"
-FILES_alsa-utils-speakertest = "${bindir}/speaker-test ${datadir}/sounds/alsa/ ${datadir}/alsa/speaker-test/"
-FILES_alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bindir}/amidi"
-FILES_alsa-utils-aconnect    = "${bindir}/aconnect"
-FILES_alsa-utils-aseqnet     = "${bindir}/aseqnet"
-FILES_alsa-utils-iecset      = "${bindir}/iecset"
-FILES_alsa-utils-alsactl     = "${sbindir}/alsactl */udev/rules.d/90-alsa-restore.rules */*/udev/rules.d/90-alsa-restore.rules ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
-FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
-FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
-FILES_alsa-utils-alsaucm     = "${bindir}/alsaucm */udev/rules.d/89-alsa-ucm.rules */*/udev/rules.d/89-alsa-ucm.rules"
-
-SUMMARY_alsa-utils-alsabat      = "Command-line sound tester for ALSA sound card driver"
-SUMMARY_alsa-utils-alsatplg     = "Converts topology text files into binary format for kernel"
-SUMMARY_alsa-utils-aplay        = "Play (and record) sound files using ALSA"
-SUMMARY_alsa-utils-amixer       = "Command-line control for ALSA mixer and settings"
-SUMMARY_alsa-utils-alsamixer    = "ncurses-based control for ALSA mixer and settings"
-SUMMARY_alsa-utils-speakertest  = "ALSA surround speaker test utility"
-SUMMARY_alsa-utils-midi         = "Miscellaneous MIDI utilities for ALSA"
-SUMMARY_alsa-utils-aconnect     = "ALSA sequencer connection manager"
-SUMMARY_alsa-utils-aseqnet      = "Network client/server for ALSA sequencer"
-SUMMARY_alsa-utils-iecset       = "ALSA utility for setting/showing IEC958 (S/PDIF) status bits"
-SUMMARY_alsa-utils-alsactl      = "Saves/restores ALSA-settings in /etc/asound.state"
-SUMMARY_alsa-utils-aseqdump     = "Shows the events received at an ALSA sequencer port"
-SUMMARY_alsa-utils-alsaloop     = "ALSA PCM loopback utility"
-SUMMARY_alsa-utils-alsaucm      = "ALSA Use Case Manager"
-
-RRECOMMENDS_alsa-utils-alsactl = "alsa-states"
-
-ALLOW_EMPTY_alsa-utils = "1"
+FILES_${PN}-alsabat     = "${bindir}/alsabat"
+FILES_${PN}-alsatplg    = "${bindir}/alsatplg"
+FILES_${PN}-aplay       = "${bindir}/aplay ${bindir}/arecord ${bindir}/axfer"
+FILES_${PN}-amixer      = "${bindir}/amixer"
+FILES_${PN}-alsamixer   = "${bindir}/alsamixer"
+FILES_${PN}-speakertest = "${bindir}/speaker-test ${datadir}/sounds/alsa/ ${datadir}/alsa/speaker-test/"
+FILES_${PN}-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bindir}/amidi"
+FILES_${PN}-aconnect    = "${bindir}/aconnect"
+FILES_${PN}-aseqnet     = "${bindir}/aseqnet"
+FILES_${PN}-iecset      = "${bindir}/iecset"
+FILES_${PN}-alsactl     = "${sbindir}/alsactl */udev/rules.d/90-alsa-restore.rules */*/udev/rules.d/90-alsa-restore.rules ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
+FILES_${PN}-aseqdump    = "${bindir}/aseqdump"
+FILES_${PN}-alsaloop    = "${bindir}/alsaloop"
+FILES_${PN}-alsaucm     = "${bindir}/alsaucm */udev/rules.d/89-alsa-ucm.rules */*/udev/rules.d/89-alsa-ucm.rules"
+
+SUMMARY_${PN}-alsabat      = "Command-line sound tester for ALSA sound card driver"
+SUMMARY_${PN}-alsatplg     = "Converts topology text files into binary format for kernel"
+SUMMARY_${PN}-aplay        = "Play (and record) sound files using ALSA"
+SUMMARY_${PN}-amixer       = "Command-line control for ALSA mixer and settings"
+SUMMARY_${PN}-alsamixer    = "ncurses-based control for ALSA mixer and settings"
+SUMMARY_${PN}-speakertest  = "ALSA surround speaker test utility"
+SUMMARY_${PN}-midi         = "Miscellaneous MIDI utilities for ALSA"
+SUMMARY_${PN}-aconnect     = "ALSA sequencer connection manager"
+SUMMARY_${PN}-aseqnet      = "Network client/server for ALSA sequencer"
+SUMMARY_${PN}-iecset       = "ALSA utility for setting/showing IEC958 (S/PDIF) status bits"
+SUMMARY_${PN}-alsactl      = "Saves/restores ALSA-settings in /etc/asound.state"
+SUMMARY_${PN}-aseqdump     = "Shows the events received at an ALSA sequencer port"
+SUMMARY_${PN}-alsaloop     = "ALSA PCM loopback utility"
+SUMMARY_${PN}-alsaucm      = "ALSA Use Case Manager"
+
+RRECOMMENDS_${PN}-alsactl = "alsa-states"
+
+ALLOW_EMPTY_${PN} = "1"
 
 do_install() {
 	autotools_do_install
-- 
2.7.4


