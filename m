Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QIQ2Q-0005lE-4o
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 20:46:07 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p46Igj9N017707;
	Fri, 6 May 2011 11:42:46 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  6 May 2011 14:44:19 -0400
Message-Id: <cover.1304707341.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: yocto@yoctoproject.org, dvhart@linux.intel.com,
	openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: move non-core machines to meta-yocto
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
X-List-Received-Date: Fri, 06 May 2011 18:46:07 -0000

The machine configuration of the non-core (non-qemu) machines
has moved to meta-yocto. Moving the branch mappings, compatibility
and SRCREVs of these machines to meta-yocto should also be
done.

Anyone using meta-yocto to build these machines will see no impact
from this change.

Acked-by: Darren Hart <dvhart@linux.intel.com>

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: zedd/kernel
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Thanks,
    Bruce Ashfield <bruce.ashfield@windriver.com>
---


Bruce Ashfield (1):
  linux-yocto: move non-core machines to meta-yocto

 meta-yocto/conf/layer.conf                         |    3 ++-
 .../linux/linux-yocto-stable_git.bbappend          |   12 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_git.bbappend  |   12 ++++++++++++
 .../recipes-kernel/linux/linux-yocto-stable_git.bb |   10 +---------
 meta/recipes-kernel/linux/linux-yocto_git.bb       |   11 +----------
 5 files changed, 28 insertions(+), 20 deletions(-)
 create mode 100644 meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend
 create mode 100644 meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend



