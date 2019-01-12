Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 262CA7C0C6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 18:13:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0CID5ws024195
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 12 Jan 2019 10:13:15 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 12 Jan 2019 10:12:54 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 12 Jan 2019 13:12:50 -0500
Message-ID: <cover.1547316462.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Sat, 12 Jan 2019 18:13:41 -0000
Content-Type: text/plain

Hi all,

Here's the next batch of kernel updates. Nothing particular of note, but we
do gain new BSP descriptions for qemuarma15 and qemuriscv64. Although the
full machine definitions are not in oe-core yet, this sets the table for them
to be made widely available.

Other than that, I bumped the -dev kernel to 5.x, and have pulled in the
latest round of -stable updates to 4.19 (also note that I updated 4.14
with -stable updates as well, but haven't done the older branch SRCREVs
yet).

Cheers,

Bruce

The following changes since commit 46f6f6a5f9de5e7f8f32f6ae768af61ec20ade4a:

  bitbake: bitbake: runqueue: Use multiconfig name to fetch unihash (2019-01-11 10:39:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/4.19: introduce qemuriscv64 and qemuarma15 BSP definitions
  linux-yocto/4.19: update to v4.19.14
  linux-yocto-dev: bump to v5.0-rc

 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 20 ++++++++++----------
 4 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.5.0


