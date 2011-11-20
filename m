Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RSBdl-0003T6-D8
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Nov 2011 18:57:17 +0100
Received: by iahk25 with SMTP id k25so6180037iah.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2011 09:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2cnPfkUBYJZBRTJ4GgY+799UMAR5JbaVSjww4yUHvNs=;
	b=MRYg/rwCH9YzZrjLp9x3FVFIEZ+7aJNu/o0qGKSMXU6Tf1Xahk5bgqkARCWic2CfzW
	ZoGIPa0vLfHOVlKQd4l3ySRuF2OFld97BrpMMfzUo1T/wZwYIQsDVv2LA4fCur4i37wb
	yU3lYbm+G3iXee4oN9mdMBXCc05+wUWPfR7PE=
Received: by 10.42.156.9 with SMTP id x9mr10635883icw.42.1321811444624;
	Sun, 20 Nov 2011 09:50:44 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id dd36sm34706668ibb.7.2011.11.20.09.50.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 Nov 2011 09:50:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Nov 2011 09:50:37 -0800
Message-Id: <cover.1321811216.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/5] Fixes for uclibc based builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Nov 2011 17:57:17 -0000

This pull request has patches needed for core-image-sato to build with uclibc
gcc update needed for fixes qt4 ICE seen on armv7-a
Fix to matchbox to get core-image-sato building with gold linker

The following changes since commit 0a9b1f504e685351921e27e42452f51630d64cd3:

  gcc-4.6: Fix gcc ICE on qt4-x11-free/armv7-a (2011-11-20 09:39:36 -0800)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-updates

Khem Raj (5):
  matchbox-stroke: Fix linking error with gold
  gettext_0.18.1.1: Fix QA Issue
  pulseaudio-0.9.23: Fix build on uclibc
  netbase: Update recipe 4.46 -> 4.47
  gcc-4.6: Fix gcc ICE on qt4-x11-free/armv7-a

 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    5 +-
 .../netbase/{netbase-4.46 => netbase-4.47}/hosts   |    0
 .../netbase/{netbase-4.46 => netbase-4.47}/init    |    0
 .../{netbase-4.46 => netbase-4.47}/interfaces      |    0
 .../netbase/{netbase-4.46 => netbase-4.47}/nfsroot |    0
 .../qemuarm/interfaces                             |    0
 .../qemuarmv6/interfaces                           |    0
 .../qemuarmv7/interfaces                           |    0
 .../qemumips/interfaces                            |    0
 .../qemuppc/interfaces                             |    0
 .../qemux86-64/interfaces                          |    0
 .../qemux86/interfaces                             |    0
 .../netbase/{netbase_4.46.bb => netbase_4.47.bb}   |    6 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    9 ++-
 meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch    |   63 ++++++++++++++++++++
 .../pulseaudio-0.9.23/fix_bluez_build.patch        |   26 ++++++++
 .../pulseaudio/pulseaudio_0.9.23.bb                |    3 +-
 .../matchbox-stroke/files/ldadd_libXrender.patch   |   25 ++++++++
 .../matchbox-stroke/matchbox-stroke_git.bb         |    6 +-
 19 files changed, 131 insertions(+), 12 deletions(-)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/hosts (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/init (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/nfsroot (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/qemuarm/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/qemuarmv6/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/qemuarmv7/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/qemumips/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/qemuppc/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/qemux86-64/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/qemux86/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase_4.46.bb => netbase_4.47.bb} (92%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/fix_bluez_build.patch
 create mode 100644 meta/recipes-sato/matchbox-stroke/files/ldadd_libXrender.patch

-- 
1.7.5.4



