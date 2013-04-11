Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UQHnm-0005ZD-Rg
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 15:44:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3BDR9Ll014170
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 06:27:09 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Apr 2013 06:27:09 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2013 06:26:59 -0700
Message-ID: <cover.1365686481.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/8] linux-yocto/qemu/kern-tools: 1.4 release items
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
X-List-Received-Date: Thu, 11 Apr 2013 13:44:57 -0000
Content-Type: text/plain

Hi all,

I'm broadcasting the following 8 patch series that went into various
trees in the past few days to fix some pressing 1.4 issues. There is
no further action required on this series (unless something breaks).

We'll be revisiting some of the last minute config and kernel changes,
since they are real issues in the mainline kernel that need work to
resolve.

Cheers,

Bruce

The following changes since commit cb4db44c14959ca76870cfaf02b5d314ac68ba8f:

  initscripts: fix read-only-rootfs-hook.sh to start earlier (2013-04-10 16:49:24 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/yocto-1.4-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/yocto-1.4-fixes

Bruce Ashfield (8):
  linux/yocto: update AUTOFS configuration
  linux-yocto/3.8: fix atom-pc config audit warnings
  linux-yocto/3.8: atom-pc: Update atom-pc-preempt-rt.scc to reuse
    config from common-pc
  kern-tools: fix excluded configuration processing
  linux-yocto/3.8: aufs, config processing, tiny, mips boot fixes
  linux-yocto/3.8: qemumips graphical boot
  linux-yocto/3.8: qemumips boot fixes and netfilter kernel features
  kern-tools: fix conditional configuration items

 .../kern-tools/kern-tools-native_git.bb             |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb     |   11 ++++++-----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.8.bb        |   19 ++++++++++---------
 4 files changed, 19 insertions(+), 17 deletions(-)

-- 
1.7.10.4



