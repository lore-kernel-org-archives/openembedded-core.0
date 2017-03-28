Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA5C77A4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:58:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2SCw8v2012470
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 28 Mar 2017 05:58:09 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 28 Mar 2017 05:58:08 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 28 Mar 2017 08:58:02 -0400
Message-ID: <cover.1490705726.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto: -stable, -rt updates and 4.8 removal
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
X-List-Received-Date: Tue, 28 Mar 2017 12:58:09 -0000
Content-Type: text/plain

Hi all,

These are updates to the 4.4, 4.9 and 4.10 linux-yocto kernel trees to
the latest -stable and -rt releases.

Nothing particular ground breaking here, but they are the usual set of
CVE and bug fixes. Everything built and booted fine for me.

I'm also removing the 4.8 linux-yocto recipe from master, since we are
adding 4.10 for this release. I'll still be doing updates to 4.8, just
not sending SRCREV updates to master.

Cheers,

Bruce

The following changes since commit 49c2df5652d25e6e9b2a4976658ab9bb17fe6694:

  meta-yocto-bsp: Remove superfluous OVERRIDES in machine conf files (2017-03-22 11:35:23 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/4.10: update to v4.10.5
  linux-yocto/4.9: update to v4.9.17
  linux-yocto/4.4: update to v4.4.56
  linux-yocto/4.9: integrate 4.9-rt12
  linux-yocto: drop 4.8 recipes

 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  6 +--
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  6 +--
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    | 38 -------------------
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |  6 +--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  6 +--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  6 +--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb  | 25 ------------
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  |  6 +--
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 20 +++++-----
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 20 +++++-----
 meta/recipes-kernel/linux/linux-yocto_4.8.bb       | 44 ----------------------
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 20 +++++-----
 12 files changed, 48 insertions(+), 155 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.8.bb

-- 
2.5.0


