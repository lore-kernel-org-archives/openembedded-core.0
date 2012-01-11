Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Rl3Pi-0005A9-L9
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 20:00:47 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0BIqk2h020538;
	Wed, 11 Jan 2012 10:52:46 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 11 Jan 2012 13:52:18 -0500
Message-Id: <cover.1326307011.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 11 Jan 2012 19:00:47 -0000

Richard/Saul,

Since this is a stabilization week, this probably can't be merged
immediately, but I've been working with this enough to call it
good enough, and me sitting on them longer doesn't help.

The first change in this series is the switch of qemuppc from prep to
mac99. With this, we'll close a whole set of issues (slow bootup) and
close a feature gap that has existed for a while.

I'm seeing a bit of strangeness with the mouse in my sato testing,
but that's about it. Liming hasn't seen the same issues, so getting
this into the tree will allow us to incrementally improve and debug
this.

The second change is a SRCREV update pulls in the forward looking
fix from Khem and a fix from Zumeng that fixes a failed ltp/mm test
that was found on the routerstationpro.

Cheers,

Bruce

cc: Khem Raj <raj.khem@gmail.com>
cc: Zumeng Chen <zumeng.chen@windriver.com>
cc: Liming Wang <liming.wang@windriver.com>

The following changes since commit 18c88fcec85f96d2495457928be913807971aea7:

  package.bbclass: per recipe PRSERV_HOST support (2012-01-11 10:37:43 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto: consolidated fix SRCREV updates

Liming Wang (4):
  qemuppc: replace emulation of qemuppc from prep to mac99
  qemuppc: add pointercal file
  qemuppc: add machconfig
  tslib: enable big endian support for qemuppc

 meta/conf/machine/qemuppc.conf                     |    2 +-
 .../formfactor/files/qemuppc/machconfig            |   10 ++++++++++
 .../pointercal/files/qemuppc/pointercal            |  Bin 0 -> 36 bytes
 meta/recipes-graphics/tslib/tslib_1.0.bb           |    1 +
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   15 ++++++++-------
 scripts/runqemu                                    |    7 +------
 scripts/runqemu-internal                           |   16 ++++++++--------
 8 files changed, 32 insertions(+), 25 deletions(-)
 create mode 100755 meta/recipes-bsp/formfactor/files/qemuppc/machconfig
 create mode 100644 meta/recipes-bsp/pointercal/files/qemuppc/pointercal

-- 
1.7.4.1



