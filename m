Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QJVIG-0003cY-I3
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 20:34:56 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p49IW3FD027948;
	Mon, 9 May 2011 11:32:05 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  9 May 2011 14:34:03 -0400
Message-Id: <cover.1304965560.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: yocto@yoctoproject.org, dvhart@linux.intel.com,
	openembedded-core@lists.openembedded.org, poky@yoctoproject.org,
	saul.wold@intel.com
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 09 May 2011 18:34:57 -0000

Saul/Richard,

The first two patches are a split and resend of the machine
movement patch:

[
   linux-yocto: move non-core machines to meta-yocto

   The machine configuration of the non-core (non-qemu) machines
   has moved to meta-yocto. Moving the branch mappings, compatibility
   and SRCREVs of these machines to meta-yocto should also be
   done.

  Anyone using meta-yocto to build these machines will see no impact
  from this change.
]

Patch #3 is a sanity check that shows a problem that Tom managed
to hit, and cause us some significant debug time. If for some 
reason (we still don't have a root cause) the kernel repo is cloned
without tags and/or meta data, we can now detect it and throw an
informative error message rather than generating meta data and
building "something".

cc: Darren Hart <dvhart@linux.intel.com> 
cc: Tom Zanussi <tom.zanussi@intel.com>

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: zedd/kernel
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Thanks,
    Bruce Ashfield <bruce.ashfield@windriver.com>
---


Bruce Ashfield (3):
  linux-yocto: remove non-core (qemu) machine compatibility
  linux-yocto: move non-core machines to meta-yocto
  linux-yocto: error if meta data not present

 meta-yocto/conf/layer.conf                         |    3 ++-
 .../linux/linux-yocto-stable_git.bbappend          |   12 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_git.bbappend  |   12 ++++++++++++
 meta/classes/kernel-yocto.bbclass                  |    5 ++++-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 .../recipes-kernel/linux/linux-yocto-stable_git.bb |   10 +---------
 meta/recipes-kernel/linux/linux-yocto_git.bb       |   15 ++++-----------
 7 files changed, 36 insertions(+), 23 deletions(-)
 create mode 100644 meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend
 create mode 100644 meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend



