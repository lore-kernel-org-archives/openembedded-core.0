Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB466E660
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:11:53 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 05:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,349,1496127600"; d="scan'208";a="124236671"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 12 Jul 2017 05:11:38 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id B5A905804B7;
	Wed, 12 Jul 2017 05:11:37 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org, gizero@gmail.com,
	otavio@ossystems.com.br
Date: Wed, 12 Jul 2017 15:11:27 +0300
Message-Id: <cover.1499860838.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] mesa: Improve Khronos header handling
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
X-List-Received-Date: Wed, 12 Jul 2017 12:11:54 -0000

Andrea: can you please confirm if this fixes the issue with
meta-raspberrypi (the second patch is just cosmetic)?

This should fix mesa-gl and RPi userland conflict by not installing
khrplatform.h in mesa-gl. I decided to do an actual mesa patch instead
of a do_install_append() based on positive comments from upstream.

As a side note: the header is now installed in libegl-mesa-dev which
is not really correct. I'll see about fixing this in a later patch.

Cheers,
  Jussi

The following changes since commit 81498aac9560fbeaeb58eaada32ce80e0ea51628:

  yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/khr-headers
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/khr-headers

Jussi Kukkonen (2):
  mesa: Avoid installing khrplatfrom.h when not needed
  mesa-gl: Clean recipe

 ...ly-install-khrplatform.h-with-EGL-or-GLES.patch | 52 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb       |  4 --
 meta/recipes-graphics/mesa/mesa_17.1.4.bb          |  1 +
 3 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch

-- 
2.1.4


