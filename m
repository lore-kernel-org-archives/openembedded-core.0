Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 39714606E9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 12:25:18 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id n3so16747139wiv.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Feb 2015 04:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=09a1lwYrqh7Ky+Y1x9jlf7fK5ljkGRKXETRex2aZq+E=;
	b=vfx/FDFiyvMndJyVtJjfKejkeiZfAR4mdNoCsuVuBRiVlfeGCRREvJM6bxma2EbPwN
	nwVgEMJNFpv39hH+qN1g4D5QXaeNYf7u34xT0fk/u57bsGHnzfLK2ZF9kdfMrJUhLD+Q
	dD1at6AGpHVJNPqS9fMnZtxlb2e0u/k7Le2qreZZMpLlQikJpDVrFVfIlY7KlSiij8Bm
	5zuC8B3w5hFAOx0OXIlZbIP3EWQXpMGQpZ0IaplZ4bBWZ57iNLBNxWHMaUnGQaKDuGCF
	CLBMG36vDzypQHTGN/qPzvL+9DzQ3lF6b/MhIfZJYMmHkffoJJ8KkszzO4NWCqSUCTwM
	D9AQ==
X-Received: by 10.194.59.112 with SMTP id y16mr41544179wjq.36.1423484717982;
	Mon, 09 Feb 2015 04:25:17 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w16sm14189906wia.15.2015.02.09.04.25.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Feb 2015 04:25:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Feb 2015 13:25:14 +0100
Message-Id: <cover.1423484647.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.0
Subject: [PATCHv6 0/1] REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 09 Feb 2015 12:25:25 -0000


Changes since v5:
Only rebased, matchbox-1.2 was removed last week.

The following changes since commit 234b4feef24ffe0cea9b6d88d9c51a05ee63db9e:

  linux-yocto/3.14: fix qemumips build error (2015-02-08 08:00:04 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/distro
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/distro

Martin Jansa (1):
  recipes: add x11 to required DISTRO_FEATURES

 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb           | 4 +++-
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb                      | 4 ++++
 meta/recipes-graphics/fstests/fstests_git.bb                          | 4 +++-
 meta/recipes-graphics/glew/glew_1.12.0.bb                             | 4 +++-
 meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb                 | 4 +++-
 meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb | 4 +++-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb                  | 4 +++-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb     | 4 +++-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb  | 4 +++-
 meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb          | 4 +++-
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb                    | 4 ++++
 .../startup-notification/startup-notification_0.12.bb                 | 4 +++-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb                    | 4 ++++
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb                         | 4 +++-
 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb      | 4 +++-
 meta/recipes-graphics/xrestop/xrestop_0.4.bb                          | 4 +++-
 meta/recipes-graphics/xtscal/xtscal_0.6.3.bb                          | 4 +++-
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb         | 4 +++-
 meta/recipes-support/atk/at-spi2-core_2.14.1.bb                       | 4 +++-
 meta/recipes-support/consolekit/consolekit_0.4.6.bb                   | 4 +++-
 20 files changed, 63 insertions(+), 17 deletions(-)

-- 
2.3.0


