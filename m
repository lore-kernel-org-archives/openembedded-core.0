Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C0A9F6FFE5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 15:26:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5HFQNrB029831
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 08:26:24 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 17 Jun 2014 08:26:23 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 17 Jun 2014 11:26:10 -0400
Message-ID: <cover.1403016995.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto: 3.4, 3.10 and 3.14 updates
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
X-List-Received-Date: Tue, 17 Jun 2014 15:26:35 -0000
Content-Type: text/plain

Richard/Saul,

Here are my collect stable updates to 3.4 -> 3.14. Build and boot sanity
passed here, but with three versions being updated, its a lot of build
testing :)

I also have an update for NAND support on the mpc8315e reference board,
which allows us to shake out flash filesystem issues. I'll follow up
with a meta-yocto-bsp change to enable the changes there as well.

Cheers,

Bruce

The following changes since commit 02eb8620afa379d8b62f4cb761890068bb3232bc:

  hwlatdetect: fix PV (2014-06-17 10:23:53 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/3.10: update to v3.10.41
  linux-yocto/3.14: update to v3.14.5
  linux-yocto/3.4: update to v3.4.91
  linux-yocto/3.14: enable mpc8315e NAND and Yaffs2 gcc 4.9 fix
  linux-yocto/3.10: update to v3.10.43

 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       | 16 ++++++++--------
 9 files changed, 47 insertions(+), 47 deletions(-)

-- 
1.8.1.2


