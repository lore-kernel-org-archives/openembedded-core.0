Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id BE2E572CE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:39:42 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id fb4so4106854wid.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=SptxsRNV/3/UFVx/Bl1kFg66DELWd5ypP3mJkiSnoks=;
	b=gnGPF2ZXm6uj9myheaTak2FeBgnvG1yhgEjLTgocUL2NlQNhxuokXG/OzT6iGEUptJ
	PbUoNugUGPOZPFsIDlU/SdSbd7AHaJl9d0nFf6yCcXLUQyE8DSB0D1AD01Vw5kYJZPR3
	JR+M8Sz0/dRpLAcoA2cBF9CYERiI8YumiMatrzh5q2hxD+opP69Kqm4wylHizO9/l45t
	v8u/7SJuhLuRUcKuH36XAw5LCDre4AmO5VsFmkdubC/qi83LvWqLoewTxFVVwqJ8sC9Z
	mB/UW2o3zelGw6+tFvirW+hOQmrdD7V4fdTdHXw8Yp+kRBx99X7cHQXK8no4Xg1iLfEV
	vKUQ==
X-Received: by 10.194.7.103 with SMTP id i7mr4590905wja.53.1421944783185;
	Thu, 22 Jan 2015 08:39:43 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ck7sm4650692wjb.13.2015.01.22.08.39.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 08:39:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 17:39:42 +0100
Message-Id: <cover.1421944678.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [PATCHv3 0/4] REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Thu, 22 Jan 2015 16:39:48 -0000

Changes since v2:
Removed piglit which is supposed to get fixed.
Removed qt4-x11-free which inherits it from qt4x11.
Used += in qt4x11.bbclass.

The following changes since commit 0bcc01121e928d0be7a0550e500425852c63cf98:

  arch-mips.inc: Add the MIPS ABIEXTENSION to toolchain name (2015-01-21 14:28:43 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/distro
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/distro

Martin Jansa (4):
  xorg-app: add x11 to required DISTRO_FEATURES and cleanup dependencies
  recipes: add x11 to required DISTRO_FEATURES
  xorg-driver: add x11 to required DISTRO_FEATURES
  recipes-qt: add x11 to required DISTRO_FEATURES

 meta/classes/qt4x11.bbclass                                          | 5 ++++-
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb                     | 4 ++++
 meta/recipes-graphics/fstests/fstests_git.bb                         | 5 ++++-
 meta/recipes-graphics/glew/glew_1.11.0.bb                            | 4 +++-
 meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb                | 5 ++++-
 .../recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb | 5 ++++-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb                 | 5 ++++-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb                 | 5 ++++-
 meta/recipes-graphics/piglit/piglit_git.bb                           | 2 +-
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb                   | 4 ++++
 .../startup-notification/startup-notification_0.12.bb                | 5 ++++-
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb                        | 5 ++++-
 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb     | 5 ++++-
 meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb                        | 2 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc                   | 5 ++++-
 meta/recipes-graphics/xorg-app/xprop_1.2.2.bb                        | 2 +-
 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb        | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb       | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb             | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb           | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb           | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb        | 4 ++++
 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb    | 4 ++++
 23 files changed, 82 insertions(+), 14 deletions(-)

-- 
2.2.1


