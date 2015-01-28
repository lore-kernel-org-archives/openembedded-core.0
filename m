Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7670D72D87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 14:52:12 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id h11so12454825wiw.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 06:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=GXvObe2RQyBdArRiqGVPkycS5G5TUzir1tudMJPE6Gk=;
	b=iZOVkyK4oPo+psFy3ZZamh9W95IYUpPYFlU8rTQg825cf5BGgSZRfpIH+ZqFfuNomQ
	CMYDNowPZoHsTYWPZeAT9sctJ9sAR4gESlE4YV6TjdusMZCVUaDpAPVC2I3CHHORCgyS
	s0xnfPh8taANMAjpXpL+480xB+OY7eGlp9irPun6q1CuvLHRAwS0XaBMT02ZZ4FfVya+
	VZw6VD2osLLsuiCNY3FH3JxUDqUtzx62dvhDJEIk0RDzrH4ALmnx84/3SySJPCaMqx/7
	umKH/ws1CV/Ucu2hD2Z/FeT1ZdBJDwOgzF6EMS/PNNQayuR0kOxFpYK5vddTXg1xs67X
	FXeA==
X-Received: by 10.180.73.239 with SMTP id o15mr7832813wiv.14.1422456732617;
	Wed, 28 Jan 2015 06:52:12 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r3sm3134148wic.10.2015.01.28.06.52.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 06:52:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 15:52:07 +0100
Message-Id: <cover.1422456689.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [PATCHv4 0/4] REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 28 Jan 2015 14:52:20 -0000

Changes since v3:
xf86-* resolved xorg-driver-common.inc

piglit moved to separate commit which maybe won't be merged if piglit if fixed sooner

more recipes were updated, in the end I could delete 116 entries from my blacklist

The following changes since commit 2a775ebbb175dd70fc7228607c306d4ccb9e4ba4:

  net-tools: Fix rerunning of do_patch task (2015-01-23 14:32:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/distro
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/distro

Martin Jansa (4):
  recipes: add x11 to required DISTRO_FEATURES
  xorg-driver: add x11 to required DISTRO_FEATURES
  recipes-qt: add x11 to required DISTRO_FEATURES
  piglit: add x11 to required DISTRO_FEATURES

 meta/classes/qt4x11.bbclass                                          | 5 ++++-
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb          | 4 +++-
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb                     | 4 ++++
 meta/recipes-graphics/fstests/fstests_git.bb                         | 4 +++-
 meta/recipes-graphics/glew/glew_1.11.0.bb                            | 4 +++-
 meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb                | 4 +++-
 .../recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb | 4 +++-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb                 | 4 +++-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb                 | 4 +++-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb    | 4 +++-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb | 4 +++-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb         | 4 +++-
 meta/recipes-graphics/piglit/piglit_git.bb                           | 4 +++-
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb                   | 4 ++++
 .../startup-notification/startup-notification_0.12.bb                | 4 +++-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb                   | 4 ++++
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb                        | 4 +++-
 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb     | 4 +++-
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc             | 4 +++-
 meta/recipes-graphics/xrestop/xrestop_0.4.bb                         | 4 +++-
 meta/recipes-graphics/xtscal/xtscal_0.6.3.bb                         | 4 +++-
 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb    | 4 ++++
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb        | 4 +++-
 meta/recipes-support/atk/at-spi2-core_2.14.1.bb                      | 4 +++-
 meta/recipes-support/consolekit/consolekit_0.4.6.bb                  | 4 +++-
 25 files changed, 80 insertions(+), 21 deletions(-)

-- 
2.2.1


