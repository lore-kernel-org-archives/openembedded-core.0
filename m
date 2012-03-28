Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SCioZ-0005ms-8j
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 04:40:47 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2S2Ve1E026374;
	Tue, 27 Mar 2012 19:31:40 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 27 Mar 2012 22:31:13 -0400
Message-Id: <cover.1332901487.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: fix externalsrc builds
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
X-List-Received-Date: Wed, 28 Mar 2012 02:40:47 -0000

Richard/Saul,

This is a fix for externalsrc builds when the linux-yocto bbclass
is used.

The commit tells most of the story:

-----

There are a few extra task that modify the source tree that should
be removed when externalsrc is inherited by a recipe that uses a
linux-yocto tree.

Adding those tasks to SRCTREECOVEREDTASKS means that they are skipped
and externalsrc works as intended.

-----

You'll note that do_patch is repeated in SRCTREECOVEREDTASKS here, 
since my tested showed that only having it in externalsrc.bbclass
did not inhibit the kernel-yocto.bbclass variant from running

There's no impact if externalsrc isn't being used, so this is a 
safe change (from where I stand :)

Cheers,

Bruce

The following changes since commit 7b01671f54f70c28c98457058c51ffefcb07c0e8:

  nspr 4.8.9: failed to build on x86_64 board (2012-03-27 13:26:37 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto: support externalsrc builds

 meta/classes/kernel-yocto.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

-- 
1.7.5.4



