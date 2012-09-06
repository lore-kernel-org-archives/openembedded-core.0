Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T9hHx-00016R-W4
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 20:58:54 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.wrs.com
	[128.224.146.167])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q86IkQoo018815;
	Thu, 6 Sep 2012 11:46:26 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  6 Sep 2012 14:43:22 -0400
Message-Id: <cover.1346956528.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] machine/tune: add tune-ppce300c3.inc
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
X-List-Received-Date: Thu, 06 Sep 2012 18:58:54 -0000

Richard/Saul,

I was asked to pick up the languishing yocto bug #1192, which
tells us that the mpc8315 reference board was using the 
incorrect tuning.

To fix this, I created a new tune-ppce300c3, which is based on 
the tune-ppce300c2.

core-image-minimal, and core-image-sato builds have passed, as
well as boot tests. During the sato build, I had to fix flac to
not use altivec. The examples already in flac didn't seem to work,
since my tuning override wasn't working. To fix it, I added DEFAULTTUNE
to the OVERRIDES for the package and sato now builds.

I'll follow this with a pull request for the yocto reference BSP.

I'm by no means a tuning or powerpc expert, but to the best of
my knowledge, this is what we want to do. Anyone more familiar 
with the board can feel free to comment :)

Cheers,

Bruce

The following changes since commit 55d82fd07f6bded10333735a99fcb176b3d26e6f:

  stash: disable x11 for gdkpixbuf (2012-09-05 14:55:14 -0400)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/ppc-tune
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/ppc-tune

Bruce Ashfield (1):
  conf/tune: add tune-ppce300c3

 meta/conf/machine/include/tune-ppce300c3.inc |   11 +++++++++++
 meta/recipes-multimedia/flac/flac_1.2.1.bb   |    5 +++++
 2 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-ppce300c3.inc

-- 
1.7.7



