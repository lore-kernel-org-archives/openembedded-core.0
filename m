Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8F76BC77
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 12:11:27 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p57so3714556wes.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2013 05:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Xehp84WFBFNnRRFZhoYDMZajuQc0DpYFlFqKmmcYYV0=;
	b=Vfe4yWkcoyLXT5YjG2tOFcgTsmgjQZqVkZ52Sehss6y1DzObFttqj7+AFuFOlgWjHz
	p6uQiV+nkvKGt4aqmJGZJcFersh1/Yc2jJrQBxE472sHpZsdbiW2aQNRPBdtKMAtBDrk
	veOtd8aDqsetIeAL4f4P8FHHOk7eVwTt+Bw02z9P3BQyWdCmYUuCUxBloWqTRWLkMIUH
	cnxyICA9jVtGX/9Be0msSOpq+jw3Y1UJ7jPYVb7G87XgXZ4SiPGP+vx9W+jL1a1Q3GRh
	lV+y7CX6vnmOApwhdNXkMSD88bY+na/WPq1htPwNEuqpPMXsfdmqW1gP3KzQjNRhDeJY
	YG4w==
X-Gm-Message-State: ALoCoQnYRqZAk7KHAex/TekCZoQLJvo/7RLazUAU+Q4zowXTqshXO0+Z09q0d/Q9DD4cuA72o9Ee
X-Received: by 10.180.107.225 with SMTP id hf1mr13423140wib.7.1378123888189;
	Mon, 02 Sep 2013 05:11:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	mb7sm17267191wic.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Sep 2013 05:11:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Sep 2013 13:11:24 +0100
Message-Id: <1378123884-19368-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] pulseaudio: disable GTK+ by default
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
X-List-Received-Date: Mon, 02 Sep 2013 12:11:30 -0000

PulseAudio's GTK+ support is limited to a test case and automatic icon name
population for applications.  This is too limited to enforce GTK+ 3 on all
builds, so disable it by default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 49705f3..4c10aa9 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -35,7 +35,7 @@ EXTRA_OECONF = "\
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'x11', 'gtk x11', '', d)}"
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4 sbc"
 PACKAGECONFIG[gtk] = "--enable-gtk3,--disable-gtk3,gtk+3"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
-- 
1.7.10.4


