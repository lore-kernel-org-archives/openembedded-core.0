Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4922A6B6B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 16:55:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8DGt1A6014462
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Sep 2013 09:55:01 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 13 Sep 2013 09:54:59 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 13 Sep 2013 12:54:57 -0400
Message-ID: <cover.1379091188.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto/3.10: genericx86 meta data factoring
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Sep 2013 16:55:01 -0000
Content-Type: text/plain

Richard/Saul,

This bumps the 3.10 kernel meta SRCREV to pick up some pending
genericx86 patches from Darren. There's no other changes and
no risk to other boards.

cc: Darren Hart <dvhart@linux.intel.com>

Cheers,

Bruce

The following changes since commit dd36930f3f37b2e0e1258de28ac1b1fa99cf196f:

  bitbake: data_smart: Account for changes in append/prepend/remove in the config hash (2013-09-12 17:03:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.10: genericx86 meta data factoring

 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.10.4


