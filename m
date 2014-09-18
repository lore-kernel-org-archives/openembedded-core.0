Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E6F6271505
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 15:32:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8IFWVfZ015448
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Sep 2014 08:32:32 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Sep 2014 08:32:31 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 18 Sep 2014 11:32:26 -0400
Message-ID: <cover.1411053678.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto/3.10/3.14: SRCREV updates
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
X-List-Received-Date: Thu, 18 Sep 2014 15:32:38 -0000
Content-Type: text/plain

Hi all,

Here are the final -stable refresh update for 3.10 and 3.14 for the 1.7
release.

I've done build and boot testing for the arches on qemu machines, both for
standard and -rt. That being said, feeding it to a round of automated build
testing would be ideal, since I can't cover every single config and case.

I'll follow up with h/w reference board updates, which are staying on 
3.14 for this release, so they need the new SRCREVs as well.

Cheers,

Bruce

The following changes since commit 280b6d0011f101e7a8edabd34c265b37a2f791ed:

  sstatesig: fix overrides behaviour to remove SIGGEN_LOCKEDSIGS_i586 (2014-09-17 22:00:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/3.10: update to v3.10.54 and -rt55
  linux-yocto/3.14: update to v3.14.18 and -rt9

 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 6 files changed, 32 insertions(+), 32 deletions(-)

-- 
1.8.1.2


