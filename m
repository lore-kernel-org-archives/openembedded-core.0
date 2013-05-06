Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UZOV3-0004bB-3F
	for openembedded-core@lists.openembedded.org;
	Mon, 06 May 2013 18:42:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r46GOnLk004502
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 May 2013 09:24:49 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.136) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 6 May 2013 09:24:48 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 6 May 2013 09:24:36 -0700
Message-ID: <cover.1367857109.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto/kern-tools: consolidated pull request
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
X-List-Received-Date: Mon, 06 May 2013 16:42:54 -0000
X-List-Received-Date: Mon, 06 May 2013 16:42:54 -0000
X-List-Received-Date: Mon, 06 May 2013 16:42:54 -0000
X-List-Received-Date: Mon, 06 May 2013 16:42:54 -0000
Content-Type: text/plain

Richard (and Paul),

Here is a consolidated kernel update pull request. It contains bug 
fixes and -stable updates that I've been staging since we stopped
pulling fixes into the 1.4 release.

All of these are good for master, and IMHO for the 1.4.1 release.
In particular the kern-tools patch should be pulled into 1.4.1, since
it fixes an issue that Phil Ballister found when using 1.4 with
his linux-yocto-custom kernels.

I've built and booted 3.4/LTSI, and 3.8 for all relevant qemu
(including qemumips64) architectures.

With this our backlog of -rt, korg and LTSI updates is cleared, and
I'll move on with updates solely for Yocto 1.5 and upcoming kernel
work.

cc: Paul Eggleton <paul.eggleton@linux.intel.com>
cc: Philip Balister <philip@balister.org>

Cheers,

Bruce

The following changes since commit 84d45db4ddced96c736f106f8122eefadf925c41:

  grub-efi-native: Cleanup whitespace (2013-05-03 16:37:08 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/3.4: iwlwifi, ext4, brtfs warning and -rt fixes
  kern-tools: anchor and delimit regexs
  linux-yocto/3.4: update to v3.4.43, ltsi-65311d8 and v3.4.42-rt56
  linux-yocto/3.8: udpate to v3.8.11

 .../recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb        |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb        |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb      |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb      |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb           |   16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_3.8.bb           |   16 ++++++++--------
 7 files changed, 31 insertions(+), 31 deletions(-)

-- 
1.7.10.4



