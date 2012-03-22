Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAfuu-0001Lu-7W
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 12:10:53 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so1696213wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 04:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=E2XIIWNE9BuFFP/CE9/hhpT59+BPnfS+mzXYGwc+lNY=;
	b=Xch0TDvzy0oIgKOma/oAnSH5UEoG+1K00GkYdwgSpe0AiWGx7bOjGylbglBwVC7+mK
	A5KfZaFOv72RE7O+PLGP8UWpG6lusesMVqrj+OTHIigcS7WgWmBpEsFzWmOLFND4dyEe
	NzpuLhWzWPToA1yhukescng51MDDhwr5G7+/c3WonwuNxlMSTHxuNJ30YQqRqHuz+VTQ
	6q/IMeWT/jbBx7qLZogcxJ/iQMwlUhfBqnR8o4EbhebAmDtxsLg1MGTMqqBHoZel5TEI
	KemS2CZY1vSTFdCxom5+Qm545E6TDGDyvutfmsF7aFxNqUWaHhUtmGWnf3vxTLqTPkNg
	Rq2Q==
Received: by 10.180.91.10 with SMTP id ca10mr3918131wib.17.1332414119698;
	Thu, 22 Mar 2012 04:01:59 -0700 (PDT)
Received: from localhost.localdomain (p5B0A13EE.dip.t-dialin.net.
	[91.10.19.238])
	by mx.google.com with ESMTPS id fn2sm7546875wib.0.2012.03.22.04.01.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 04:01:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 12:06:01 +0100
Message-Id: <1332414362-6406-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] alsa-utils: use systemd_unitdir
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
X-List-Received-Date: Thu, 22 Mar 2012 11:10:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
index fa11479..597e8b6 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
 DEPENDS = "alsa-lib ncurses libsamplerate0"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://ncursesfix.patch \
@@ -61,7 +61,7 @@ FILES_alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bind
 FILES_alsa-utils-aconnect    = "${bindir}/aconnect"
 FILES_alsa-utils-aseqnet     = "${bindir}/aseqnet"
 FILES_alsa-utils-iecset      = "${bindir}/iecset"
-FILES_alsa-utils-alsactl     = "${sbindir}/alsactl ${base_libdir}/udev/rules.d ${base_libdir}/systemd ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
+FILES_alsa-utils-alsactl     = "${sbindir}/alsactl ${base_libdir}/udev/rules.d ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
 FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
 FILES_alsa-utils-alsaconf    = "${sbindir}/alsaconf"
 FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
-- 
1.7.4.4



