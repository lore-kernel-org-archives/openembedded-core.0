Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 553F17404E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 22:17:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8OMHtL8016073
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Sep 2015 15:17:55 -0700 (PDT)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (147.11.116.147) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 24 Sep 2015 15:17:54 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 24 Sep 2015 18:17:52 -0400
Message-ID: <cover.1443132765.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto/4.1: -rt and common-pc updates
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
X-List-Received-Date: Thu, 24 Sep 2015 22:17:58 -0000
Content-Type: text/plain

Hi all,

During some routine merges over the last weeks, some of the
branches in the 4.1 kernel managed to get reset to invalid
SRCREVs, which meant that some changes (i.e. arm fixes for
gcc5) were dangling within the repo. We've fixed the standard
kernel references now .. but a bug report about -rt's build
being broken alerted me to the fact that the -rt branches were
also impacted.

I've now fixed, built and booted on all the qemu architectures
for preempt-rt.

This update fixes the SRCREVs to pickup that refreshed support, 
and includes a change to the common-pc configuration as well.

Cheers,

Bruce

The following changes since commit 9f66aa1a11b5b45280aa41bf4517ec56ee5f2ab2:

  bitbake: toaster: start script warning text formatting small improvement (2015-09-23 22:44:56 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/4.1: common-pc-drivers: add CONFIG_PATA_SCH
  linux-yocto/4.1: rt update to 4.1.x-rt8

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.1.0


