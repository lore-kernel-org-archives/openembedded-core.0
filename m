Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1USJiU-0003lM-OH
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 06:11:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3H3rtXv006115
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Apr 2013 20:53:55 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 16 Apr 2013 20:53:55 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 16 Apr 2013 20:53:43 -0700
Message-ID: <cover.1366143106.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto/3.8: Makefile: add -grecord-gcc-switches if using -mfentry
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
X-List-Received-Date: Wed, 17 Apr 2013 04:11:31 -0000
Content-Type: text/plain

Richard,

One small update. A kernel fix from Tom for 3.8, the patch has
all the details.

** This is a resend, since I forgot to cc oe-core when I initially sent
   out the changes.

cc: Tom Zanussi <tom.zanussi@intel.com>

Cheers,

Bruce

The following changes since commit bef8d8d3bd2d96fb62734071597df415c7c23f4c:

  qt4-embedded: bump PR to allow removal of meta-oe bbappend (2013-04-16 16:51:41 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.8: Makefile: add -grecord-gcc-switches if using
    -mfentry

 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      |   12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
1.7.10.4



