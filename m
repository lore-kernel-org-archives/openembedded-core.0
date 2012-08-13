Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T0yMI-0007ut-Pr
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 19:23:19 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7DHBMv8027646;
	Mon, 13 Aug 2012 10:11:22 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: scott.a.garman@intel.com
Date: Mon, 13 Aug 2012 13:10:52 -0400
Message-Id: <cover.1344876697.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] [denzil] linux-yocto: make validate_branches handle non BSP branches
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
X-List-Received-Date: Mon, 13 Aug 2012 17:23:19 -0000

Scott,

Here's a fix for validate_branches that comes from a pending master
change that I've been running for 3 weeks, and one that TomZ has tested
in his yocto BSP work on denzil.

It fixes some BSP use cases that involve setting a specific SRCREV
on a base branch, so that a BSP branch that doesn't yet exist can 
be created off of that known base. Previously only an existing BSP
branch could have it's SRCREV restricted.

cc: Tom Zanussi <tom.zanussi@intel.com>

Cheers,

Bruce

The following changes since commit 73cdebf60df225ee10f2eb215935be3b61e1b831:

  documentation/dev-manual/dev-manual-kernel-appendix.xml: Add note about conflict (2012-06-29 15:54:26 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-denzil
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-denzil

Bruce Ashfield (1):
  linux-yocto: allow do_validate_branches to handle all branches

 meta/classes/kernel-yocto.bbclass |  119 +++++++++++++++++++++++++------------
 1 files changed, 80 insertions(+), 39 deletions(-)

-- 
1.7.5.4



