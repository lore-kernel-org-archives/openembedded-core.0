Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1R13pu-0000W6-UA
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 00:09:43 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p86M4e2F031138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 17:04:40 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p86M4eS6012731
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 17:04:40 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p86M4e36014692
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 17:04:40 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 6 Sep 2011 17:04:39 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p86M4cHC013829;	Tue, 6 Sep 2011 17:04:39 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Sep 2011 16:54:01 -0500
Message-ID: <1315346049-8611-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: jdk@ti.com, k-kooi@ti.com
Subject: [PATCH v2 meta-oe 0/8] mplayer and vlc dependencies
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
X-List-Received-Date: Tue, 06 Sep 2011 22:09:44 -0000
Content-Type: text/plain

Summary:
- Dropped Schroedinger, added gst-plugins-bad dependency to vlc
- Updated libmad license to GPLv2
- Dropped PR=r0 from libdvdread
- live555: Changed License to LGPLv3 and dropped PR=r*
- xsp: Dropped PR=r* and PRIORITY=option
- vlc: Moved common code to .inc, dropped INC_PR
- xpext: Dropped PR
- faad2: Changed LICENSE to GPLv2 and added LIC_FILES_CHKSUM

Joel A Fernandes (8):
  faad2: Imported from OE classic
  libmad: Imported from OE-classic
  libdvdread: Imported from OE classic
  libdvdcss: Imported from OE classic, vlc depends on it
  vlc: Imported from OE classic
  live555: Imported from OE classic
  xsp: Imported from OE classic
  xpext: Imported from OE classic

 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb      |   25 +
 .../libdvdread/libdvdread_4.1.3-10.bb              |   16 +
 .../libmad/files/add-pkgconfig.patch               |   68 +
 .../files/libmad-0.15.1b-avr32-optimization.patch  | 2922 ++++++++++++++++++++
 .../libmad/files/mad-mips-h-constraint.patch       |   70 +
 meta-oe/recipes-multimedia/libmad/files/mad.diff   |   24 +
 .../recipes-multimedia/libmad/libmad_0.15.1b.bb    |   34 +
 .../live555/files/config.linux-cross               |   17 +
 meta-oe/recipes-multimedia/live555/live555.inc     |   54 +
 .../recipes-multimedia/live555/live555_20110314.bb |   10 +
 meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb |   13 +
 meta-oe/recipes-multimedia/vlc/vlc.inc             |   85 +
 meta-oe/recipes-multimedia/vlc/vlc_1.1.4.1.bb      |   12 +
 .../recipes-multimedia/xpext/xpext/auxdir.patch    |   13 +
 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb    |   22 +
 .../recipes-multimedia/xsp/xsp/xsp-fix-pc.patch    |   10 +
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb      |   13 +
 17 files changed, 3408 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
 create mode 100644 meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb
 create mode 100644 meta-oe/recipes-multimedia/libmad/files/add-pkgconfig.patch
 create mode 100644 meta-oe/recipes-multimedia/libmad/files/libmad-0.15.1b-avr32-optimization.patch
 create mode 100644 meta-oe/recipes-multimedia/libmad/files/mad-mips-h-constraint.patch
 create mode 100644 meta-oe/recipes-multimedia/libmad/files/mad.diff
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
 create mode 100644 meta-oe/recipes-multimedia/live555/files/config.linux-cross
 create mode 100644 meta-oe/recipes-multimedia/live555/live555.inc
 create mode 100644 meta-oe/recipes-multimedia/live555/live555_20110314.bb
 create mode 100644 meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb
 create mode 100644 meta-oe/recipes-multimedia/vlc/vlc.inc
 create mode 100644 meta-oe/recipes-multimedia/vlc/vlc_1.1.4.1.bb
 create mode 100644 meta-oe/recipes-multimedia/xpext/xpext/auxdir.patch
 create mode 100644 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
 create mode 100644 meta-oe/recipes-multimedia/xsp/xsp/xsp-fix-pc.patch
 create mode 100644 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb



