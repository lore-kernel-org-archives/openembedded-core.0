Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5647C70D90
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 01:51:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I1pOg4024551
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 18:51:24 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 17 Aug 2014 18:51:24 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 09:51:37 +0800
Message-ID: <cover.1408326458.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V3 00/10] upgrade systemd to 215 and other misc fixes
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
X-List-Received-Date: Mon, 18 Aug 2014 01:51:28 -0000
Content-Type: text/plain

The following changes since commit 4321c553d5ae816e566234e981a0815bba046d39:

  SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts (2014-08-11 17:44:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-misc-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-misc-fixes

Chen Qi (10):
  systemd: upgrade to 215
  systemd: add PACKAGECONFIG for 'elfutils'
  systemd: make runlevel work in non-runlevel targets
  update-rc.d: fix logic in populate_packages_updatercd
  alsa-state: fix pkg_postinst and set INHIBIT_UPDATERCD_BBCLASS
  keymaps: fix for systemd
  systemd: add kbd-keymaps to RRECOMMENDS of systemd-vconsole-setup
  v86d: set INHIBIT_UPDATERCD_BBCLASS if 'sysvinit' not in
    DISTRO_FEATURES
  systemd: add support for executing scripts under /etc/rcS.d
  dhcp: add dhcpd.service

 meta/classes/update-rc.d.bbclass                   |    2 +-
 meta/recipes-bsp/alsa-state/alsa-state.bb          |   11 +-
 meta/recipes-bsp/keymaps/keymaps_1.0.bb            |   17 ++-
 meta/recipes-bsp/v86d/v86d_0.1.10.bb               |    7 ++
 meta/recipes-connectivity/dhcp/dhcp.inc            |   18 ++-
 meta/recipes-connectivity/dhcp/files/dhcpd.service |   11 ++
 ...ort-for-executing-scripts-under-etc-rcS.d.patch |   93 ++++++++++++++++
 ...k-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch |  116 ++++++++++++++++++++
 ...icitly-include-endian.h-wherever-we-want-.patch |   52 +++++++++
 .../systemd/systemd/systemd-older-kernel.patch     |   56 ----------
 .../systemd/{systemd_213.bb => systemd_215.bb}     |   27 ++++-
 11 files changed, 338 insertions(+), 72 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhcpd.service
 create mode 100644 meta/recipes-core/systemd/systemd/0001-add-support-for-executing-scripts-under-etc-rcS.d.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-endian-explicitly-include-endian.h-wherever-we-want-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
 rename meta/recipes-core/systemd/{systemd_213.bb => systemd_215.bb} (89%)

-- 
1.7.9.5


