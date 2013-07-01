Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id EAE386AF4F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 19:36:23 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id l15so2254181eak.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 12:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KOkjD89ALds3aoDP3I4eqkd4zX9/QulJiy10WKDQaoY=;
	b=qTEsvFICEjg1zr936V1K25ibgf4Cbps2TiTL3HdF6Je8vnoCB0yBd4kHtHkkN4P84E
	UOjybHs2+bhENKKFzJEHnTMKsQ1ugcGvw7YvOSRTaoosWC5NqTdd/kOkXelrhjbHTV0T
	G81H85Aqx6B/3As7dvYGQTPCJDnjxL0CrhPbCuJhyv4O+1EYbLAehyV1o4bcGXoJbAyr
	AvzJsdQFDp4oBuv657yeB4aJTBSya4xt6CinbRWbTjp4xo2EfcYb0GrCeLpwK6LRkRd8
	myUJTGf8wpP34oeC2C7EuieIySdAfwcOhstEP+K+72Qe7CWQz3jwFsU62i1UDUP/7ZX9
	09Bg==
X-Received: by 10.15.26.199 with SMTP id n47mr22837604eeu.88.1372707384147;
	Mon, 01 Jul 2013 12:36:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm31742736eeh.15.2013.07.01.12.36.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Jul 2013 12:36:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 21:36:23 +0200
Message-Id: <cover.1372707180.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH 0/4] Fix and cleanup for mesa
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
X-List-Received-Date: Mon, 01 Jul 2013 19:36:24 -0000

Fix unrecognized --enable-gallium option.
Fix building pipe_loader_sw without X11 headers available.

Allow to change MESA_LLVM_RELEASE from .bbappend.
Add git headers to patches and rebase them for newer SRCREV.

The following changes since commit ff65497cd9a96d5ab49b16ba1f7e30a216ff4a42:

  classes/insane: remove la2 check which no longer exists from ERROR_QA (2013-06-28 16:33:05 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/mesa
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/mesa

Martin Jansa (4):
  mesa: Improve gallium PACKAGECONFIG options
  mesa: fix pipe_loader_sw build without libx11
  mesa: bump SRCREV in git recipe, refresh patches
  mesa: remove drirc file

 ...te-NativeDisplayType-depending-on-config.patch} |  21 +-
 ...ove-the-power-of-two-sizeof-struct-cmd_b.patch} |  15 +-
 meta/recipes-graphics/mesa/mesa.inc                |  14 +-
 ...void-use-of-AC_CHECK_FILE-for-cross-compi.patch |  14 +-
 ..._sw-include-xlib_sw_winsys.h-only-when-HA.patch |  52 +++
 ...ate-NativeDisplayType-depending-on-config.patch | 356 +++++++++++++++++++++
 ...l-fix-builtin_compiler-cross-compilation.patch} |  13 +-
 meta/recipes-graphics/mesa/mesa_9.1.3.bb           |   7 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |   9 +-
 9 files changed, 463 insertions(+), 38 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch => mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch} (96%)
 rename meta/recipes-graphics/mesa/{mesa/0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch => mesa-9.1.3/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch} (86%)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
 rename meta/recipes-graphics/mesa/mesa/{fix-glsl-cross.patch => 0004-glsl-fix-builtin_compiler-cross-compilation.patch} (76%)

-- 
1.8.2.1


