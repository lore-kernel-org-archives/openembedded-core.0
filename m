Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F671770CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 04:27:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0R4RpDi008267
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Jan 2016 20:27:51 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 26 Jan 2016 20:27:50 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jan 2016 23:27:47 -0500
Message-ID: <cover.1453868682.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/2]: linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 27 Jan 2016 04:27:55 -0000
Content-Type: text/plain

Hi all,

Now that we've introduced the 4.4 versioned kernel, and updated the libc-headers
to match, here's the next round of updates.

Obviously the SRCREV updates are -stable and CVE fixes, and I've tested them
on qemu*. These are good for master, and the 4.1 change is suitable for any
stable branches that have the 4.1 kernel.

On the topic of the KEYS CVEs, I also pushed changes to linux-yocto 3.14
and 3.19, but haven't prepared a SRCREV update, since I don't have the
cycles to build and boot those branches. If we do want to update older
releases with those SRCREVs, we'll have to work out a special case.

Cheers,

Bruce

The following changes since commit 3d2c0f5902cacf9d8544bf263b51ef0dd1a7218c:

  cmake: update to 3.4.2 (2016-01-26 22:49:40 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/4.1: update to 4.1.16
  linux-yocto/4.4: CVEs and preempt-rt update

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 6 files changed, 29 insertions(+), 29 deletions(-)

-- 
2.1.0


