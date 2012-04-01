Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SEC1j-0005Nu-RH
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 06:04:30 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q313tDT7023368;
	Sat, 31 Mar 2012 20:55:14 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sat, 31 Mar 2012 23:54:40 -0400
Message-Id: <cover.1333252345.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: update tiny configuration for 3.2
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
X-List-Received-Date: Sun, 01 Apr 2012 04:04:36 -0000
X-List-Received-Date: Sun, 01 Apr 2012 04:04:36 -0000

Richard/Saul,

Here's an update of the tiny kernel configuration for 3.2. Darren
and I have both tested this, and there's no impact on existing
configurations (outside of minor tweaks to common-pc), so there's
little risk in this pull request.

Cheers,

Bruce

The following changes since commit 8691a588267472eb5a32b978a0eb9ddfd0c91733:

  cross-canadian.bbclass: fix rpath for sdk executables (2012-03-31 18:00:59 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto: update tiny meta and configuration for kernel 3.2

 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.5.4



