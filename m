Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE2A608F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:11:26 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id t59so1391163wes.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=wI2myWszXbF3q2nXF36A8aR6V7atp7M7gaNQUrXQQh4=;
	b=nOAhoE8M3bk7L5DMHjcIkqmAsc5524ktwVXjRd+4WBlZcVeUtteDoHk+F/6jfwRljj
	y8cpcpMkajFQqgSlnF6V9BnJFEqW2aOln4NFFNhBZQ4qdqwzGJ9rOvBiV+Iuj154ukFG
	sIL3lgCLLCLnlaCuJERrxfVM7i0GRGo2Ducf8ZUD9TFuebyu+usEZvQGjYfslT+7zJV+
	j4xY23wmcRPI/P6P/cAXM4eHs70C7GFu3mhuReQh514rcxDRNxoBuMdN/u1KijspH98Y
	XuLplyTHeRMkL8vmzAQmF9jBg2XjYUR2ItZo/SNqZq7c6hsPudBWNVQycU3JpxUTY1f8
	Esxg==
X-Received: by 10.180.79.200 with SMTP id l8mr3656826wix.60.1370013087011;
	Fri, 31 May 2013 08:11:27 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ca19sm4609942wib.3.2013.05.31.08.11.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:11:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:08:03 +0100
Message-Id: <cover.1370012830.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmS0bsag5SjM1jr5HSvtNQVsUACGxBBBM286J5bVeMaS0lrXs4GdfF3J9YYUCu/Dph8G5mU
Subject: [PATCH 0/7] Wayland updates
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
X-List-Received-Date: Fri, 31 May 2013 15:11:26 -0000

Hi,

Another revision of this branch with more improvements and Weston 1.1 (now that
the GTK+ issue was resolved).

Ross

The following changes since commit ea281d3b8e5f2ae21b37ea2ad4d440bf9c6427ff:

  bitbake: Added distroy signal to information dialogs (2013-05-31 08:25:40 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/wayland

for you to fetch changes up to 299fde808fbdca44b396fc35f0df196cad73dec9:

  weston: update to 1.1.0 (2013-05-31 16:02:43 +0100)

----------------------------------------------------------------
Ross Burton (7):
      mesa: upgrade to 9.1.3
      mesa: update git recipe to 9.1.3 release
      wayland: update to 1.1.0
      weston: install the examples into weston-examples
      weston: add a weston-launch group
      weston: clean up and add comments
      weston: update to 1.1.0

 meta/recipes-graphics/mesa/mesa-9.0.2.inc          |   13 -
 meta/recipes-graphics/mesa/mesa-git.inc            |    9 +-
 .../mesa/mesa/0002-cross-compile.patch             |   94 ---
 ...ate-NativeDisplayType-depending-on-config.patch |  358 +++++++++++
 meta/recipes-graphics/mesa/mesa/cross-glsl.patch   |  632 --------------------
 .../mesa/dont-fail-if-libX11-isnt-installed.patch  |   36 --
 .../fix-egl-compilation-without-x11-headers.patch  |   32 -
 .../mesa/mesa/fix-glsl-cross.patch                 |   43 ++
 meta/recipes-graphics/mesa/mesa_9.0.2.bb           |    4 -
 meta/recipes-graphics/mesa/mesa_9.1.3.bb           |   14 +
 .../wayland/{wayland_1.0.6.bb => wayland_1.1.0.bb} |    6 +-
 .../wayland/weston/install-examples.patch          |   18 +
 .../wayland/{weston_1.0.6.bb => weston_1.1.0.bb}   |   38 +-
 13 files changed, 471 insertions(+), 826 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-9.0.2.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/cross-glsl.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa_9.0.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa_9.1.3.bb
 rename meta/recipes-graphics/wayland/{wayland_1.0.6.bb => wayland_1.1.0.bb} (91%)
 create mode 100644 meta/recipes-graphics/wayland/weston/install-examples.patch
 rename meta/recipes-graphics/wayland/{weston_1.0.6.bb => weston_1.1.0.bb} (63%)

Ross Burton (7):
  mesa: upgrade to 9.1.3
  mesa: update git recipe to 9.1.3 release
  wayland: update to 1.1.0
  weston: install the examples into weston-examples
  weston: add a weston-launch group
  weston: clean up and add comments
  weston: update to 1.1.0

 meta/recipes-graphics/mesa/mesa-9.0.2.inc          |   13 -
 meta/recipes-graphics/mesa/mesa-git.inc            |    9 +-
 .../mesa/mesa/0002-cross-compile.patch             |   94 ---
 ...ate-NativeDisplayType-depending-on-config.patch |  358 +++++++++++
 meta/recipes-graphics/mesa/mesa/cross-glsl.patch   |  632 --------------------
 .../mesa/dont-fail-if-libX11-isnt-installed.patch  |   36 --
 .../fix-egl-compilation-without-x11-headers.patch  |   32 -
 .../mesa/mesa/fix-glsl-cross.patch                 |   43 ++
 meta/recipes-graphics/mesa/mesa_9.0.2.bb           |    4 -
 meta/recipes-graphics/mesa/mesa_9.1.3.bb           |   14 +
 .../wayland/{wayland_1.0.6.bb => wayland_1.1.0.bb} |    6 +-
 .../wayland/weston/install-examples.patch          |   18 +
 .../wayland/{weston_1.0.6.bb => weston_1.1.0.bb}   |   38 +-
 13 files changed, 471 insertions(+), 826 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-9.0.2.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/cross-glsl.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa_9.0.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa_9.1.3.bb
 rename meta/recipes-graphics/wayland/{wayland_1.0.6.bb => wayland_1.1.0.bb} (91%)
 create mode 100644 meta/recipes-graphics/wayland/weston/install-examples.patch
 rename meta/recipes-graphics/wayland/{weston_1.0.6.bb => weston_1.1.0.bb} (63%)

-- 
1.7.10.4


