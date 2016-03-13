Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E2BD96FFED
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:33 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p65so11584054wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=0BxuXCRPist1mgYsmmS7bBWUVbn0CRTNqOpGV7N856w=;
	b=s/Mb++om1Mc/5k4kzReW347j+1Gc1b1DBZflqOxzWzBgGBgba4/Xwqp7YsJZLnAzPm
	HKTmn1BGGav93bUx72ZAK+plgGPnEf/KDxXqJYuizkunPNmWzgDDWWFY3asNOAynERrK
	b4/659142b91IRBDYSxd9T9o/VGGe8zr4mLvBpmHa0QO7pvdoiMWHV+Z+6cDn17TBCIk
	aZFZSorRnPkMmYgtS2QYkKsVoA3iM0H2PZVk+ThPPIX11SdyQKRjtpdN2aXb5w9uGjTa
	UxTXTz7CKI72vQ7AdZxo/ymnwoeTnnUtMZhKL+SO6fofPfnWtrPZvSKc+cmQd8tvsXf7
	PGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0BxuXCRPist1mgYsmmS7bBWUVbn0CRTNqOpGV7N856w=;
	b=b0vQDR58CVU6uuRQTwCVYJ2SuHKY4RO+oI/qG943lcJQU3YrOLEtrz0nGcdEK/hzN7
	5nzG7m/r2rUEhMniGjqsvknn+72VZNyOlOdPMmaz8VpBQHO5wVW1KI3TC8GrYaPy4IUT
	J+Q1wYUPXEPBKi+sVEYeb148n+I8UXNgDtzaCTHEXGcZyjm7T1U/kHkllSms/Bdp2i93
	dbABeYGs5/AU8NIN1HRypKOYgFD6MITNr+gL4AKUo3rAj+2zSFms5Ymk5MeZ+yt5nu2k
	x+GFqw8dazBWq5w4vfWHeK+a9pDF79aVCDyAzFsgXJQHNuH9IghVkRb3n9CHcCu+XVkf
	HPHw==
X-Gm-Message-State: AD7BkJJcsXHSvTu9ORbrWy40YblWy8ivjvoymzUINrYB55tryHaBUg/dUV0uzSQ7fiA5FA==
X-Received: by 10.28.225.198 with SMTP id y189mr14750448wmg.94.1457896473900; 
	Sun, 13 Mar 2016 12:14:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:32 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:12:58 +0100
Message-Id: <cover.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH 00/42] General cleanage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:35 -0000

* These series of patches aim at improving the usage of some systemd related variables
  in several recipes from oe-core. Main aim is to change those recipes to use
  'systemd_system_unitdir' instead of the old 'systemd_unitdir/system' variable,
  which will be marked as deprecated instead of being removed as is may still be
  used in other oe layers. To mark it as deprecated, a comment is added in bitbake.conf,
  but better ideas regarding this are welcome.

* Few recipes have also been changed to use the 'systemd_user_unitdir' variable for
  their systemd user services.

The following changes since commit 4be0e15f74cff85edca9de55248939fb438f30ae:

  oeqa/selftest/recipetool: Fix test_recipetool_create_simple (2016-03-13 18:15:41 +0000)

are available in the git repository at:

  git://github.com/pespin/openembedded-core systemd-var-fixes
  https://github.com/pespin/openembedded-core/tree/systemd-var-fixes

Pau Espin Pedrol (42):
  rootfs-postcommands: Fix usage of systemd unitdir vars
  acpid: Fix usage of systemd unitdir vars
  apmd: Fix usage of systemd unitdir vars
  avahi: Fix usage of systemd unitdir vars
  bind: Fix usage of systemd unitdir vars
  connman: Fix usage of systemd unitdir vars
  dhcp: Fix usage of systemd unitdir vars
  neard: Fix usage of systemd unitdir vars
  nfs-utils: Fix usage of systemd unitdir vars
  openssh: Fix usage of systemd unitdir vars
  portmap: Fix usage of systemd unitdir vars
  ppp: Fix usage of systemd unitdir vars
  wpa-supplicant: Fix usage of systemd unitdir vars
  busybox: Fix usage of systemd unitdir vars
  dropbear: Fix usage of systemd unitdir vars
  glibc-package: Fix usage of systemd unitdir vars
  systemd-compat-units: Fix usage of systemd unitdir vars
  systemd-serialgetty: Fix usage of systemd unitdir vars
  systemd: Fix usage of systemd unitdir vars
  util-linux: Fix usage of systemd unitdir vars
  volatile-binds: Fix usage of systemd unitdir vars
  distcc: Fix usage of systemd unitdir vars
  run-postints: Fix usage of systemd unitdir vars
  tcf-agent: Fix usage of systemd unitdir vars
  at: Fix usage of systemd unitdir vars
  cronie: Fix usage of systemd unitdir vars
  lighttpd: Fix usage of systemd unitdir vars
  rpcbind: Fix usage of systemd unitdir vars
  sysstat: Fix usage of systemd unitdir vars
  xinetd: Fix usage of systemd unitdir vars
  xserver-nodm-init: Fix usage of systemd unitdir vars
  oprofileui-server: Fix usage of systemd unitdir vars
  consolekit: Fix usage of systemd unitdir vars
  alsa-utils: Fix usage of systemd unitdir vars
  ofono: Fix usage of systemd unitdir vars
  bluez5: Fix usage of systemd unitdir vars
  avahi-ui: Fix usage of systemd unitdir vars
  opkg: Fix usage of systemd unitdir vars
  dpkg: Fix usage of systemd unitdir vars
  systemd.bbclass: Remove user services too if systemd is not enabled
  systemd: Remove usage of systemd_unitdir
  bitbake.conf: Mark systemd_unitdir as deprecated to avoid future use

 meta/classes/rootfs-postcommands.bbclass           |  4 +-
 meta/classes/systemd.bbclass                       | 19 ++++--
 meta/conf/bitbake.conf                             |  3 +
 meta/recipes-bsp/acpid/acpid.inc                   |  6 +-
 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb             |  6 +-
 meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb |  8 +--
 meta/recipes-connectivity/avahi/avahi.inc          |  2 +-
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |  6 +-
 meta/recipes-connectivity/bluez5/bluez5.inc        |  4 +-
 meta/recipes-connectivity/connman/connman.inc      |  6 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            | 16 ++---
 meta/recipes-connectivity/neard/neard_0.15.bb      |  2 +-
 .../nfs-utils/nfs-utils_1.3.3.bb                   | 20 +++---
 meta/recipes-connectivity/ofono/ofono.inc          |  4 +-
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb | 12 ++--
 meta/recipes-connectivity/portmap/portmap_6.0.bb   |  6 +-
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |  8 +--
 .../wpa-supplicant/wpa-supplicant_2.5.bb           |  4 +-
 meta/recipes-core/busybox/busybox.inc              | 12 ++--
 meta/recipes-core/dropbear/dropbear.inc            | 10 +--
 meta/recipes-core/glibc/glibc-package.inc          |  6 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |  2 +-
 meta/recipes-core/systemd/systemd-serialgetty.bb   | 16 ++---
 meta/recipes-core/systemd/systemd_229.bb           | 72 +++++++++++-----------
 meta/recipes-core/util-linux/util-linux.inc        |  2 +-
 meta/recipes-core/volatile-binds/volatile-binds.bb |  6 +-
 meta/recipes-devtools/distcc/distcc_3.1.bb         |  8 +--
 meta/recipes-devtools/dpkg/dpkg.inc                |  7 +--
 meta/recipes-devtools/opkg/opkg_0.3.1.bb           |  9 ++-
 .../run-postinsts/run-postinsts_1.0.bb             |  6 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |  6 +-
 meta/recipes-extended/at/at_3.1.18.bb              |  6 +-
 meta/recipes-extended/cronie/cronie_1.5.0.bb       |  6 +-
 meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb  |  6 +-
 meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb     | 10 +--
 meta/recipes-extended/sysstat/sysstat.inc          |  6 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |  6 +-
 .../x11-common/xserver-nodm-init.bb                |  8 +--
 .../oprofile/oprofileui-server_git.bb              |  6 +-
 meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb   |  2 +-
 .../recipes-support/consolekit/consolekit_0.4.6.bb |  4 +-
 41 files changed, 182 insertions(+), 176 deletions(-)

--
2.7.1


