Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UF3xV-0000Jt-Eh
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 15:44:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2BERXAv008897
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Mar 2013 07:27:33 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 07:27:32 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 11 Mar 2013 10:27:11 -0400
Message-ID: <cover.1363011775.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto*: content and config updates
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
X-List-Received-Date: Mon, 11 Mar 2013 14:44:26 -0000
X-List-Received-Date: Mon, 11 Mar 2013 14:44:26 -0000
Content-Type: text/plain

Richard/Saul,

I'm sending out my kernel -stable refresh queue. We have updates to both
3.4, 3.8 and 3.4-LTSI, along with a few config tweaks for the 3.8 EDF
feature.

Build and basic boot tests work here.

Cheers,

Bruce

The following changes since commit 365eb9b5d22208c967dcd91d8ab52faed20f04b5:

  bitbake: bitbake-layers: fix duplicated help info (2013-03-10 04:36:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/3.4: update to v3.4.34 and LTSI refresh
  linux-yocto/3.8: bump kver to v3.8.1
  linux-yocto/3.8: update EDF configuration

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      |   16 ++++++++--------
 4 files changed, 23 insertions(+), 23 deletions(-)

-- 
1.7.10.4



