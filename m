Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id A316E6A8DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 23:19:34 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so3391165eek.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=FZck9VaFsUbpf+iX9YaHxKJ2Y8G1pQBROg7YKx6u+ak=;
	b=ZJ70axvKeSqkkrSg1N3ocmi1h38d2uG1dJPhjIlWAgy8UphDImoFTcySZ+AnnzYl2D
	fWktSYJmLQBEtN2OVOzwjDMXemNVQVcTnvtCA3ye2rUK43b+O7N/uEehO0ATiUmCLi/r
	P+pDpRmTjILneO8wW5xbNRAQWxpA5PDZSJmkVZahEqPj/4v5sllmFrGdmGec5LJMSIKK
	PloCpbEtZL1E2PfIobrIEJZA7pposVM7sx7YHydpbLX6BORTmnMARDzh6GuVEYZTmHKn
	njs3fAidznHrIHYBOzjDp9F95/GcWHQcU1qWAaO48BcVhbZEJmAoczbiSFJk4hZ7Xot7
	Rlew==
X-Received: by 10.15.42.129 with SMTP id u1mr23605015eev.116.1371079174590;
	Wed, 12 Jun 2013 16:19:34 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y10sm39824574eev.3.2013.06.12.16.19.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 16:19:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 01:19:56 +0200
Message-Id: <cover.1371079127.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH 00/10] Mesa cleanup and more PACKAGECONFIG options
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
X-List-Received-Date: Wed, 12 Jun 2013 23:19:35 -0000

The following changes since commit 74158c2e99c6d8631800ae80025d1cc9f19336d2:

  tune-cortexa*.inc: fix tunings for cortex a5, a7, a8, a9, a15 machines. (2013-06-12 17:54:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/mesa2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/mesa2

Martin Jansa (10):
  mesa: merge mesa-common.inc to mesa.inc
  mesa: use PACKAGECONFIG instead of DISTRO_FEATURES to define
    EGL_PLATFORMS
  mesa: move LIC_FILES_CHKSUM to .inc
  mesa: merge mesa-git.inc to mesa_git.bb
  mesa: introduce PACKAGECONFIG for dri
  mesa: remove more .la files
  mesa: introduce gallium PACKAGECONFIG
  mesa: introduce openvg PACKAGECONFIG
  mesa: use PACKAGESPLITFUNCS
  mesa: introduce gallium-llvmpipe PACKAGECONFIG

 meta/recipes-graphics/mesa/mesa-common.inc         | 106 ---------------
 meta/recipes-graphics/mesa/mesa-git.inc            |  12 --
 meta/recipes-graphics/mesa/mesa.inc                | 144 +++++++++++++++++++--
 ...void-use-of-AC_CHECK_FILE-for-cross-compi.patch |  65 ++++++++++
 ...move-the-power-of-two-sizeof-struct-cmd_b.patch |  42 ++++++
 meta/recipes-graphics/mesa/mesa_9.1.3.bb           |   9 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |  16 ++-
 7 files changed, 260 insertions(+), 134 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-common.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa-git.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/0001-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch

-- 
1.8.2.1


