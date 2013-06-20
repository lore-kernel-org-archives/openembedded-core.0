Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9E44B61EB2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:11:57 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y10so225746wgg.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 09:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=mTZYuh/NjID9HeAgZHap/oq0PiwMmFuA+/x769JhZ1I=;
	b=GFoFBoalBJo3N1bLsvHp7OyVRk9hlmVOvA3kW42xVcmCtEQiRk+XaOB8g9RqX6ThtV
	wLhufQt1QVLqUWBCpEFSIlb2GaLFpvYMnnlFi8IW+3kLQJZohpbQoWXQz0ikJlxUHLyh
	ZnnN01YmendJMM8I2BtKUpBaE/58ipdsMEgcV61IuY1sURhdkr/h9QsnVn+d1A7iGAUe
	tOMLUuF87yokNA3NKDjExP/wgyrvt5tDyufBJh3T4GACKaMm4DzanEOPPP/32+3mIKqp
	JQq4oP+zMx/SXyulBlH+yG8jBaDrUS3ivf52i2jpTtPgdWQ1r04stjEkkVQp8+DewFci
	iB1Q==
X-Received: by 10.194.119.195 with SMTP id kw3mr6255045wjb.64.1371744717814;
	Thu, 20 Jun 2013 09:11:57 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id k10sm1508166wia.4.2013.06.20.09.11.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 09:11:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 17:08:22 +0100
Message-Id: <cover.1371744428.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlFoOrTnJny6JVFIusjZoLuf1vbVQ09pMYhxkmcMhGhhFkP/VqJXKfWFdPoXJBz07XXcrWA
Subject: [PATCH 0/7] Wayland/Mesa/Clutter improvements
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
X-List-Received-Date: Thu, 20 Jun 2013 16:11:58 -0000

Hi,

Here are the bits of my Wayland working branch that are good to merge.  Some
fixes to Weston, a Mesa tweak, and Wayland-enabling for Cogl and Clutter.

Ross

The following changes since commit 590010a6525b0e1bc1de73e794764e23404591df:

  core-image-weston: add weston-examples to the image (2013-06-18 17:33:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/wayland-safe

for you to fetch changes up to 8c481d40a6746d31d566a9db0b5bbb395ad54031:

  core-image-weston: add clutter examples (2013-06-20 17:06:11 +0100)

----------------------------------------------------------------
Ross Burton (7):
      weston-init: fix a typo in a user-visible message
      weston: add patches to make weston-launch work
      mesa: remove a redundant do_install tweak
      weston: move mtdev dependency to the DRM backend, where it belongs
      cogl: add Wayland support
      clutter: add Wayland support
      core-image-weston: add clutter examples

 meta/recipes-graphics/clutter/clutter-1.0.inc      |    8 ++-
 meta/recipes-graphics/cogl/cogl-1.0.inc            |   24 ++++---
 meta/recipes-graphics/images/core-image-weston.bb  |    2 +-
 meta/recipes-graphics/mesa/mesa.inc                |    3 -
 meta/recipes-graphics/wayland/weston-init/init     |    2 +-
 meta/recipes-graphics/wayland/weston/groups.patch  |   47 +++++++++++++
 .../wayland/weston/weston-launch-shell.patch       |   74 ++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.1.0.bb      |    6 +-
 8 files changed, 148 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/groups.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/weston-launch-shell.patch

Ross Burton (7):
  weston-init: fix a typo in a user-visible message
  weston: add patches to make weston-launch work
  mesa: remove a redundant do_install tweak
  weston: move mtdev dependency to the DRM backend, where it belongs
  cogl: add Wayland support
  clutter: add Wayland support
  core-image-weston: add clutter examples

 meta/recipes-graphics/clutter/clutter-1.0.inc      |    8 ++-
 meta/recipes-graphics/cogl/cogl-1.0.inc            |   24 ++++---
 meta/recipes-graphics/images/core-image-weston.bb  |    2 +-
 meta/recipes-graphics/mesa/mesa.inc                |    3 -
 meta/recipes-graphics/wayland/weston-init/init     |    2 +-
 meta/recipes-graphics/wayland/weston/groups.patch  |   47 +++++++++++++
 .../wayland/weston/weston-launch-shell.patch       |   74 ++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.1.0.bb      |    6 +-
 8 files changed, 148 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/groups.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/weston-launch-shell.patch

-- 
1.7.10.4


