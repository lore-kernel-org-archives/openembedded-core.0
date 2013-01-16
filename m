Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TvVmr-0006vc-1A
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 17:24:41 +0100
Received: from mail-ee0-f72.google.com ([74.125.83.72])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 16 Jan 2013 08:09:01 -0800
Received: by mail-ee0-f72.google.com with SMTP id b15so1839108eek.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 08:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=05bXFprrT+vQwLZ1NhdmZ9hMvoZ4z/Cpg/uKxLBGowU=;
	b=HgYzkBhnRhdfjiKnmxN8v7ShIA+2gjTOqI+niGLHFVOI00qas1+GBA3FLnu6STwxzi
	CEYl4YYJ81sA1vF5Ws3G4VEJcUgChb58QjRLCEQWHujDdpdpCO1x/K0z4MgUiDEguOXN
	Fd3k9rY/2g32CqLB/5FGOyZ3KpKBwvJFfygND6/CeMyAhKYvoLyPOd/LYJdJTWz41yWg
	+ruLMWHpvJu6fGtzw94rh/dxUTwhA98V5TeQk4Gh9o6avrlqh3ujvCBHM3u77lVW5rNI
	JsMxpaZC4Nzz0lkEECSItHzzNrLyJ2c9sxA+yyoefIfTLft//b/rFxQEIFeKnHoQ0L1z
	VOzQ==
X-Received: by 10.194.76.7 with SMTP id g7mr3142209wjw.50.1358352539175;
	Wed, 16 Jan 2013 08:08:59 -0800 (PST)
X-Received: by 10.194.76.7 with SMTP id g7mr3142186wjw.50.1358352538944;
	Wed, 16 Jan 2013 08:08:58 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ex6sm9768803wid.3.2013.01.16.08.08.57
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 08:08:58 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 16:06:55 +0000
Message-Id: <cover.1358351050.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmpFGy3BKqCRltyuqTW2c0OK968sVOA9xpMXyzIJ132Y+utqEMru/1vivaC92AwWVLifgXrCgX3jQTPi9y3qfsfjT5fzfLqrDPIT3FKhZCiRySz+U9VwRIJ8WOEkaOByUr7jFQsE9s9fLynbIyAFrukUnQyr98x9O4Sf4m0TLcmd84tw82O5lrmVjQyKIdXUZKh8InM
Subject: [PATCH 0/4] Initial Wayland integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 16:24:42 -0000

Hi,

This is the first round of Wayland integration.  The Wayland protocol libraries,
optional (based on DISTRO_FEATURE) support for the Wayland EGL backend is added
to Mesa, and then Weston is added.

Weston's packaging is rather complicated because it can build multiple backends,
but it's flexible enough to cope.

Future plans include an image that boots directly into wayland-on-KMS, and
enabling the Wayland support in GTK+ and Qt.

One quirk is that you can build weston without the wayland distro feature, which
results in just wayland-on-x11. The distro feature name may have to be split up
to reflect the different aspects more accurately.

Ross

The following changes since commit 53cc748b93e8af584557d6db5309c3e955182c5c:

  linux-libc-headers: fix headers install in long path name environments (2013-01-10 23:53:51 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/wayland

for you to fetch changes up to b9bddcdeee3b8b0091e54b2e414757458101779b:

  weston: add reference Wayland compositor (2013-01-16 15:43:12 +0000)

----------------------------------------------------------------
Alexandru DAMIAN (2):
      wayland: add Wayland protocol library
      mesa-dri: enable the wayland-egl platform

Ross Burton (2):
      x11-common: set XDG_RUNTIME_DIR if it isn't already set
      weston: add reference Wayland compositor

 meta/recipes-graphics/mesa/mesa-common.inc         |   10 +++-
 meta/recipes-graphics/mesa/mesa-dri.inc            |    1 +
 meta/recipes-graphics/wayland/wayland_1.0.3.bb     |   37 ++++++++++++++
 .../recipes-graphics/wayland/weston/weston.desktop |    9 ++++
 meta/recipes-graphics/wayland/weston/weston.png    |  Bin 0 -> 2383 bytes
 meta/recipes-graphics/wayland/weston_1.0.3.bb      |   52 ++++++++++++++++++++
 .../x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh |   13 +++++
 7 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland_1.0.3.bb
 create mode 100644 meta/recipes-graphics/wayland/weston/weston.desktop
 create mode 100644 meta/recipes-graphics/wayland/weston/weston.png
 create mode 100644 meta/recipes-graphics/wayland/weston_1.0.3.bb
 create mode 100644 meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh

Alexandru DAMIAN (2):
  wayland: add Wayland protocol library
  mesa-dri: enable the wayland-egl platform

Ross Burton (2):
  x11-common: set XDG_RUNTIME_DIR if it isn't already set
  weston: add reference Wayland compositor

 meta/recipes-graphics/mesa/mesa-common.inc         |   10 +++-
 meta/recipes-graphics/mesa/mesa-dri.inc            |    1 +
 meta/recipes-graphics/wayland/wayland_1.0.3.bb     |   37 ++++++++++++++
 .../recipes-graphics/wayland/weston/weston.desktop |    9 ++++
 meta/recipes-graphics/wayland/weston/weston.png    |  Bin 0 -> 2383 bytes
 meta/recipes-graphics/wayland/weston_1.0.3.bb      |   52 ++++++++++++++++++++
 .../x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh |   13 +++++
 7 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland_1.0.3.bb
 create mode 100644 meta/recipes-graphics/wayland/weston/weston.desktop
 create mode 100644 meta/recipes-graphics/wayland/weston/weston.png
 create mode 100644 meta/recipes-graphics/wayland/weston_1.0.3.bb
 create mode 100644 meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh

-- 
1.7.10.4



