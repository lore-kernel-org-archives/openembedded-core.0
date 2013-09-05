Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CA34E615E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 02:20:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r852KSj5026975
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Sep 2013 19:20:29 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 4 Sep 2013 19:20:26 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 4 Sep 2013 22:20:21 -0400
Message-ID: <cover.1378347409.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto/3.10: M4/rc fixes
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
X-List-Received-Date: Thu, 05 Sep 2013 02:20:29 -0000
Content-Type: text/plain

Richard/Saul,

Here are my pending m4/rc3 fixes for the 3.10 kernel. I know you are most
interested in patch 3/3, but patches 1 and 2 have already been staged, 
merged and pushed to the linux-yocto tree, since they were also destined
for M4, reverting them makes a horrible mess of history, and reverts 
merge commits, so that's a really bad idea.

Anyway, here are the three patches. With these, we have a building yaffs2,
CVE and -stable fixes (prep for our ssh issues) and finally a working 
mips graphical login.

Cheers,

Bruce

[YOCTO #5095]

The following changes since commit f41b7a7d4d0463a0dfafe6621d01680b81798019:

  bitbake: hob: remove PACKAGE_INSTALL variable setting from hob (2013-09-04 14:18:49 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel-hot-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-hot-fixes

Bruce Ashfield (3):
  linux-yocto/3.10: fix YAFFS2 build issues
  linux-yocto/3.10: update to v3.10.10
  qemumips: fix keyboard entry in graphical boots

 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

-- 
1.7.10.4


