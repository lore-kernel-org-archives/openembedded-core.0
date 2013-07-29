Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 14402612D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 08:34:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jul 2013 01:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,767,1367996400"; d="scan'208";a="353446522"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.206])
	by orsmga001.jf.intel.com with ESMTP; 29 Jul 2013 01:34:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 09:34:34 +0100
Message-Id: <cover.1375086591.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [dylan][PATCH 00/14] Backports for the OE-Core dylan branch
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
X-List-Received-Date: Mon, 29 Jul 2013 08:34:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These are mostly backports from master with one patch for mesa which
derives from part of a change in master. These have been tested on the
Yocto Project autobuilder in conjunction with the two bitbake 1.18
patches I just sent.

Note: I would normally not backport PACKAGECONFIG additions, however
these are in aid of preventing floating dependencies so I have taken
these (and there may be a few more to come in the next series).


The following changes since commit 5b90fc7d36b468251f4f9371c5f7eb32a78a8f69:

  qt4: disable qmeegographicssystemhelper (2013-07-08 16:28:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-next

Beth Flanagan (1):
  adt_installer_internal: fix spelling error

Chen Qi (1):
  tar: remove an erroneous patch

Jonathan Liu (1):
  wget: backport fixes for documentation build errors

Laurentiu Palcu (2):
  populate_sdk_base, adt_installer: abort install if path contains
    spaces
  populate_sdk_base: fix bashism

Martin Jansa (5):
  gst-plugins-good: add PACKAGECONFIG for jack
  gst-plugins-ugly: add PACKAGECONFIG for x264, cdio, dvdread
  pulseaudio: add PACKAGECONFIG for jack
  subversion: add PACKAGECONFIG for sasl
  cups: add PACKAGECONFIG for avahi

Nicolas Dechesne (1):
  mesa: fix EGL compilation without X11 headers

Petter Mabäcker (1):
  remake: fix insufficient gettext dependency

Saul Wold (1):
  pigz: Fix typo in ALTERNATIVES line

Stefan Stanacar (1):
  populate_sdk_base.bbclass: use new perm option for find

 meta/classes/populate_sdk_base.bbclass             |  15 +-
 .../installer/adt-installer/adt_installer          |  13 +-
 .../adt-installer/scripts/adt_installer_internal   |   4 +-
 meta/recipes-devtools/remake/remake_git.bb         |   6 +-
 .../subversion/subversion_1.6.15.bb                |   2 +
 .../subversion/subversion_1.7.8.bb                 |   2 +
 meta/recipes-extended/cups/cups16.inc              |   3 +
 meta/recipes-extended/pigz/pigz.inc                |   2 +-
 .../tar-1.26/tar-1.26-fortifysourcessigabrt.patch  |  36 --
 meta/recipes-extended/tar/tar_1.26.bb              |   1 -
 meta/recipes-extended/wget/wget-1.14/fix_doc.patch |  71 ++++
 meta/recipes-extended/wget/wget_1.14.bb            |   1 +
 meta/recipes-graphics/mesa/mesa-9.0.2.inc          |   2 +-
 ...ate-NativeDisplayType-depending-on-config.patch | 361 +++++++++++++++++++++
 .../fix-egl-compilation-without-x11-headers.patch  |  32 --
 .../gstreamer/gst-plugins-good_0.10.31.bb          |   1 +
 .../gstreamer/gst-plugins-ugly_0.10.19.bb          |   5 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   1 +
 18 files changed, 475 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-extended/tar/tar-1.26/tar-1.26-fortifysourcessigabrt.patch
 create mode 100644 meta/recipes-extended/wget/wget-1.14/fix_doc.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch

-- 
1.8.1.2


