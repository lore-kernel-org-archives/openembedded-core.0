Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 245C465CC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 02:29:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0F2TCOu028412
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 18:29:13 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 18:29:12 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 18:29:04 -0800
Message-ID: <cover.1452824908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/8] bitbake.conf: set CONFFILES by default
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
X-List-Received-Date: Fri, 15 Jan 2016 02:29:14 -0000
Content-Type: text/plain

The following changes since commit 541315d6c56df6448f64c262f99d43d5c1e9400b:

  update_font_cache: only scan system font directories (2016-01-11 23:23:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/conf
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/conf

Robert Yang (8):
  bitbake.conf: set CONFFILES by default
  recipes-bsp: cleanup CONFFILES
  recipes-connectivity: cleanup CONFFILES
  recipes-extended: cleanup CONFFILES
  recipes-core: cleanup CONFFILES
  recipes-devtools: cleanup CONFFILES
  recipes-graphics: cleanup CONFFILES
  recipes-multimedia/sato/support: cleanup CONFFILES

 meta/conf/bitbake.conf                             |    1 +
 meta/recipes-bsp/alsa-state/alsa-state.bb          |    1 -
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    2 --
 meta/recipes-connectivity/avahi/avahi.inc          |    2 --
 meta/recipes-connectivity/bind/bind_9.10.3-P2.bb   |   11 -----------
 .../nfs-utils/nfs-utils_1.3.3.bb                   |    2 +-
 meta/recipes-connectivity/openssh/openssh_7.1p1.bb |    3 ---
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |    1 -
 .../wpa-supplicant/wpa-supplicant_2.5.bb           |    1 -
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    4 ----
 meta/recipes-core/busybox/busybox.inc              |    3 ---
 meta/recipes-core/dbus/dbus_1.8.20.bb              |    2 --
 meta/recipes-core/glibc/glibc-package.inc          |    1 -
 .../init-ifupdown/init-ifupdown_1.0.bb             |    1 -
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 --
 meta/recipes-core/netbase/netbase_5.3.bb           |    2 --
 meta/recipes-core/readline/readline.inc            |    2 --
 meta/recipes-core/systemd/systemd_228.bb           |    7 -------
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    1 -
 meta/recipes-core/udev/udev-extraconf_1.1.bb       |    1 -
 meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb |    2 --
 meta/recipes-devtools/opkg/opkg_0.3.1.bb           |    1 -
 meta/recipes-extended/cronie/cronie_1.5.0.bb       |    1 -
 meta/recipes-extended/cups/cups.inc                |    1 -
 meta/recipes-extended/lighttpd/lighttpd_1.4.38.bb  |    2 --
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb |    3 +--
 meta/recipes-extended/pam/libpam_1.2.1.bb          |    5 -----
 meta/recipes-extended/procps/procps_3.3.11.bb      |    2 --
 meta/recipes-extended/sudo/sudo.inc                |    2 --
 meta/recipes-extended/sysklogd/sysklogd.inc        |    1 -
 meta/recipes-extended/tzdata/tzdata_2015g.bb       |    3 ---
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    2 --
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |    1 -
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |    3 ---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    8 --------
 .../pulseaudio-client-conf-sato_1.bb               |    1 -
 .../ca-certificates/ca-certificates_20150426.bb    |    4 ----
 37 files changed, 3 insertions(+), 89 deletions(-)

-- 
1.7.9.5


