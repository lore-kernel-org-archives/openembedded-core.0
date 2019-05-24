Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6926D7E43A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 06:37:39 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id m15so5605220lfh.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 23:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Y+0NyR5DwgtIVh12XFz1NDEGit+yv231MBT5+hiJX3Q=;
	b=TTM2EeyIFrMnN6GIizH2wEzA2QMDlWwZXdHnVjuD1/jyoo6o1/qZrtCdzV6e3T41b9
	sqsZ50DkoPvAYtGBqMmNzuq0IxpABub+Z7XrbORwkxR7dj1b58lbqhx2SXafvJ9NupQc
	jGY5KoFa9a1910vYDAImPesjNiTKGQUCbpk2qf/5IHinORuPTFxgCwyU2nbIHzyYD3ae
	5qsgZZKDSKiprjN78ZVq/AWb6F4rZe9YUJhJnUsun33UZrHkBN+Jn/8ffIXuv5ZGQjGu
	YMHl8nCqq4jwUh0rUDH3/Ht0DlAQZdwg82S8uz1lUbxSNIGfqN68akGFb42l3JlebqRC
	iK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y+0NyR5DwgtIVh12XFz1NDEGit+yv231MBT5+hiJX3Q=;
	b=F1Kf8lmMlozsE6RLH/vy9xqM+dXiHUHg9xa/XmzKNxIPwT9LYG66ap/3s8CnKpRCtN
	cuDUh+BEJshDubZ9h5hLoIsfggnBq9htQ/Ny8Ji2INlyu3DoopIn4lp3yJaHXWVQuOIa
	ajrYQ6sU6dMCf6biVpYh3tiAOCsWTSPrFPbzO1gwD6cFIxNTXDMuNBLfA5kkE10dbt9Z
	VYa+MmyP96FrSvJqjymajuV/MkcwVnZMBXc3ujbXAJm97vKvmYjX8U3PeWUr8wuZeTRo
	ckdPGy3qUaa4xxz1ayfUimwcupugeSfwyr8cODVgITvrKQfyltApV6pZOv8PHxqD9w06
	QlsA==
X-Gm-Message-State: APjAAAXSUCPVXbmyFTKC5NNOINFSivomEgjRnhabLWlXOviCNNfERroz
	1Hd9ldnJOSSsfday+UeLhNkOsO8TP75b5A==
X-Google-Smtp-Source: APXvYqzBfMi0sHqS9hNs6LISPAJrh5KiV1qhPw8neAeRkAfCOYXoIXXzk+meLceeWfTjLBVH2VU2VA==
X-Received: by 2002:ac2:51de:: with SMTP id u30mr43699912lfm.42.1558679859939; 
	Thu, 23 May 2019 23:37:39 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id v2sm339236ljg.6.2019.05.23.23.37.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 May 2019 23:37:39 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2019 08:37:36 +0200
Message-Id: <1558679856-10339-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V2] alsa-utils: fix multilib names
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
X-List-Received-Date: Fri, 24 May 2019 06:37:40 -0000

From: Ming Liu <liu.ming50@gmail.com>

Append ${MLPREFIX} to the 'alsa-utils' names, or else it would fail
with multilib build.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb | 66 ++++++++++++------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
index 03b5c8d..5976914 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
@@ -56,39 +56,39 @@ PACKAGES += "${ALSA_UTILS_PKGS}"
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
+FILES_${MLPREFIX}alsa-utils-alsabat     = "${bindir}/alsabat"
+FILES_${MLPREFIX}alsa-utils-alsatplg    = "${bindir}/alsatplg"
+FILES_${MLPREFIX}alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord ${bindir}/axfer"
+FILES_${MLPREFIX}alsa-utils-amixer      = "${bindir}/amixer"
+FILES_${MLPREFIX}alsa-utils-alsamixer   = "${bindir}/alsamixer"
+FILES_${MLPREFIX}alsa-utils-speakertest = "${bindir}/speaker-test ${datadir}/sounds/alsa/ ${datadir}/alsa/speaker-test/"
+FILES_${MLPREFIX}alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bindir}/amidi"
+FILES_${MLPREFIX}alsa-utils-aconnect    = "${bindir}/aconnect"
+FILES_${MLPREFIX}alsa-utils-aseqnet     = "${bindir}/aseqnet"
+FILES_${MLPREFIX}alsa-utils-iecset      = "${bindir}/iecset"
+FILES_${MLPREFIX}alsa-utils-alsactl     = "${sbindir}/alsactl */udev/rules.d/90-alsa-restore.rules */*/udev/rules.d/90-alsa-restore.rules ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
+FILES_${MLPREFIX}alsa-utils-aseqdump    = "${bindir}/aseqdump"
+FILES_${MLPREFIX}alsa-utils-alsaloop    = "${bindir}/alsaloop"
+FILES_${MLPREFIX}alsa-utils-alsaucm     = "${bindir}/alsaucm */udev/rules.d/89-alsa-ucm.rules */*/udev/rules.d/89-alsa-ucm.rules"
+
+SUMMARY_${MLPREFIX}alsa-utils-alsabat      = "Command-line sound tester for ALSA sound card driver"
+SUMMARY_${MLPREFIX}alsa-utils-alsatplg     = "Converts topology text files into binary format for kernel"
+SUMMARY_${MLPREFIX}alsa-utils-aplay        = "Play (and record) sound files using ALSA"
+SUMMARY_${MLPREFIX}alsa-utils-amixer       = "Command-line control for ALSA mixer and settings"
+SUMMARY_${MLPREFIX}alsa-utils-alsamixer    = "ncurses-based control for ALSA mixer and settings"
+SUMMARY_${MLPREFIX}alsa-utils-speakertest  = "ALSA surround speaker test utility"
+SUMMARY_${MLPREFIX}alsa-utils-midi         = "Miscellaneous MIDI utilities for ALSA"
+SUMMARY_${MLPREFIX}alsa-utils-aconnect     = "ALSA sequencer connection manager"
+SUMMARY_${MLPREFIX}alsa-utils-aseqnet      = "Network client/server for ALSA sequencer"
+SUMMARY_${MLPREFIX}alsa-utils-iecset       = "ALSA utility for setting/showing IEC958 (S/PDIF) status bits"
+SUMMARY_${MLPREFIX}alsa-utils-alsactl      = "Saves/restores ALSA-settings in /etc/asound.state"
+SUMMARY_${MLPREFIX}alsa-utils-aseqdump     = "Shows the events received at an ALSA sequencer port"
+SUMMARY_${MLPREFIX}alsa-utils-alsaloop     = "ALSA PCM loopback utility"
+SUMMARY_${MLPREFIX}alsa-utils-alsaucm      = "ALSA Use Case Manager"
+
+RRECOMMENDS_${MLPREFIX}alsa-utils-alsactl = "alsa-states"
+
+ALLOW_EMPTY_${MLPREFIX}alsa-utils = "1"
 
 do_install() {
 	autotools_do_install
-- 
2.7.4


