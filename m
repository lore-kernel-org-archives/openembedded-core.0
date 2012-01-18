Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RnZD7-0005Qz-MT
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 18:22:10 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0IHERoJ002582;
	Wed, 18 Jan 2012 09:14:27 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 18 Jan 2012 12:13:21 -0500
Message-Id: <cover.1326906635.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: restore WORKDIR as a patch source directory
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
X-List-Received-Date: Wed, 18 Jan 2012 17:22:10 -0000

Richard/Saul,

As was pointed out on IRC this morning, config fragments and other
config tweaks that were added to the SRC_URI weren't being processed
by the config phase of the linux-yocto build. 

When I switched to using src_patches, I dropped WORKDIR as a 
directory that would be scanned for patches and configs. This patch
restores that functionality by putting WORKDIR back into the 
path that will be searched.

Cheers,

Bruce

The following changes since commit 5724ee9c3a99519fea96446638910b727b89898d:
  Mark Hatle (1):
        package_rpm.bbclass: Add support for filenames with spaces

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto: restore WORKDIR as a patch source directory

 meta/classes/kernel-yocto.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)



