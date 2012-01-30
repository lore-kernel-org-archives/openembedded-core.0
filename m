Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rrude-0001Oy-6X
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 18:03:30 +0100
Received: by werc1 with SMTP id c1so3625119wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 08:55:37 -0800 (PST)
Received: by 10.216.135.35 with SMTP id t35mr7397937wei.9.1327942211157;
	Mon, 30 Jan 2012 08:50:11 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id y1sm2391709wiw.6.2012.01.30.08.50.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 08:50:10 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 17:49:59 +0100
Message-Id: <1327942199-4604-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1327942199-4604-1-git-send-email-koen@dominion.thruhere.net>
References: <1327942199-4604-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/2] alsa-utils: make alsa-utils-alsactl recommend alsa-states
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jan 2012 17:03:30 -0000

This will drag in the asound.state from the BSP that alsactl uses.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
index 196128e..e62a0f3 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
 DEPENDS = "alsa-lib ncurses libsamplerate0"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://ncursesfix.patch \
@@ -79,4 +79,6 @@ DESCRIPTION_alsa-utils-alsactl      = "saves/restores ALSA-settings in /etc/asou
 DESCRIPTION_alsa-utils-alsaconf     = "a bash script that creates ALSA configuration files"
 DESCRIPTION_alsa-utils-alsaucm      = "ALSA Use Case Manager"
 
+RRECOMMENDS_alsa-utils-alsactl = "alsa-states"
+
 ALLOW_EMPTY_alsa-utils = "1"
-- 
1.7.2.5



