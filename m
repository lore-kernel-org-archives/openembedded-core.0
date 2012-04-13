Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SIngG-00064K-Kh
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 23:05:21 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3DKtrxE012756;
	Fri, 13 Apr 2012 13:55:53 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 13 Apr 2012 16:55:42 -0400
Message-Id: <cover.1334349764.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/2] linux-yocto: (hopefully) final fixes
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
X-List-Received-Date: Fri, 13 Apr 2012 21:05:21 -0000

Richard/Saul,

Here are two last commits for linux-yocto. One is a pending
SRCREV update for the romley. It's included to make sure that the
meta branch head matches the SRCREVs. Otherwise, we are relying
on branch renaming for everyone. There's no risk, and this is already
in use by the BSP layer.

The second commit is a change that I've been working on all week
with Andrea and his work on extending linux-yocto-tiny. The 
work that was done to support out of tree features was missing
.cfg and defconfig support. This meant that you could run into
patching issues.

To fix it, I pulled back changes that I made a few weeks ago 
to allow all types of fragments, features, and defconfigs to
be supported. The diffstat is largely a movement of code from 
the recipe back to the tools (where it belonged), but the intent
stays the same.

I've tested this on every use case I could find ..

  - core BSPs
  - Nitin's x32 use case
  - Andrea's use case
  - kernel.org test case
  - Constructed tests with fragments, nested features, etc.

Andrea has also tested his use case.

These all pass, and the code fixes an intended feature for 1.2 as
well as fixing the immediate bug in question.

This is for YOCTO 2250.

Cheers,

Bruce

cc: andrea.adami@gmail.com


The following changes since commit 023a12b70b1bbbd3625ab5a6df2ae9943a14bea5:

  linux-yocto/meta-yocto: update hardware reference SRCREVs (2012-04-13 16:35:59 -0400)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (2):
  linux-yocto/3.2: add igb support to romley
  linux-yocto: allow .cfg, .scc, .patch and defconfigs to be processed
    in order

 meta/classes/kernel-yocto.bbclass                  |   74 ++------------------
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 +-
 5 files changed, 11 insertions(+), 71 deletions(-)

-- 
1.7.5.4



