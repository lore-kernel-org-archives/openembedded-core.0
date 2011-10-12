Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RE5yO-0005UL-HT
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 23:04:20 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9CKwXdl028745;
	Wed, 12 Oct 2011 13:58:33 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 12 Oct 2011 16:58:21 -0400
Message-Id: <cover.1318452930.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: config cleanup and streamlining
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
X-List-Received-Date: Wed, 12 Oct 2011 21:04:20 -0000

Richard/Saul,

This is a master only pull request (not that I need to
tell you that) that contains some cleanups that Tom has been
doing for various intel BSPs (although the changes will be
useful elsewhere).

I've also pushed these out to the dev kernel, in case anyone
is interested.

This incorporates the following meta branch commits:

  353d43d fri2: cleanup bsp config
  2a605e2 sugarbay: cleanup bsp config
  47b76ed fishriver: cleanup bsp config
  ad6edab jasperforest: cleanup bsp config
  07f7e89 emenlow: cleanup bsp config
  d32a651 crownbay: cleanup bsp config
  ad2d621 meta: add vesafb feature
  913facf features/drm-psb: add related config options

cc: Tom Zanussi <tom.zanussi@intel.com>

Cheers,

Bruce

The following changes since commit 2cf9fb4df498fe0e4fa8356dc663fdfdec9a98cc:

  hal/hal-info: This is unsed in OE-Core and deprecated, drop (2011-10-12 14:12:10 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto: config cleanup and streamlining

 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.4.1



