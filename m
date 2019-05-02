Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8367D743
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 18:09:18 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
	helo=dude02.lab.pengutronix.de)
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hMG91-0006l1-Ef; Thu, 02 May 2019 20:09:19 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hMG91-0001hb-18; Thu, 02 May 2019 20:09:19 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: fabio.berton@ossystems.com.br,
	openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 20:09:12 +0200
Message-Id: <20190502180916.32114-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/4] Mesa improvements
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
X-List-Received-Date: Thu, 02 May 2019 18:09:19 -0000
Content-Transfer-Encoding: 8bit

Hi,

this series covers a few changes made by mesa-19. Since now mesa uses
meson as build system. This switch is covered by Fabio's patch.

Futhermore the imx gallium targets gets squashed into the kmsro target.

At last the gallium swrast and virgl shouldn't be build per default.

Fabio Berton (1):
  mesa: Convert recipe to use meson build system

Marco Felsch (3):
  mesa: fix imx gallium driver PACKAGECONFIG option
  mesa: make gallium swrast target optional
  mesa: make gallium virgl optional

 ...0001-Simplify-wayland-scanner-lookup.patch | 44 ----------
 ...k-for-all-linux-host_os-combinations.patch | 41 +++++++++
 ...-winsys-svga-drm-Include-sys-types.h.patch | 35 --------
 ...M-version-when-using-LLVM-Git-releas.patch | 45 ----------
 ...R-for-defining-WAYLAND_PROTOCOLS_DAT.patch | 38 ---------
 meta/recipes-graphics/mesa/mesa.inc           | 84 +++++++++----------
 meta/recipes-graphics/mesa/mesa_19.0.1.bb     |  5 +-
 7 files changed, 83 insertions(+), 209 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lookup.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-types.h.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch

-- 
2.20.1


