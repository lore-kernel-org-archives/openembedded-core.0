Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB6F6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 05:57:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0F5vhW1026110
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Jan 2014 21:57:43 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 14 Jan 2014 21:57:43 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 15 Jan 2014 00:57:41 -0500
Message-ID: <cover.1389765320.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto/3.10: consolidated update pull request
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
X-List-Received-Date: Wed, 15 Jan 2014 05:57:44 -0000
Content-Type: text/plain

Richard/Saul,

Here are three updates to the 3.10 kernel that I've had for a while. I'm
about to merge the 3.10 LTSI content, so it is time to get these out of
my queue. I had them for long enough, that muliple updates are squashed
into the three patches.

I've build and boot tested the various qemu boards and kernel types, basic
sanity has passed.

Cheers,

Bruce

The following changes since commit 1b636173ca88e5ccca1992f9a12367a1189fa674:

  bitbake: toaster: Toaster GUI, generic search, filter and order (2014-01-10 15:20:26 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/3.10: update meta data for media fragments
  linux-yocto/3.10: update to 3.10.25
  linux-yocto/3.10: mohonpeak bsp config and scc files

 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 10 ++++------
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  7 ++++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 17 insertions(+), 18 deletions(-)

-- 
1.8.1.2


