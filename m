Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 99086716CB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 04:43:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s914hgXY007886
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Sep 2014 21:43:43 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 30 Sep 2014 21:43:42 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Oct 2014 00:43:30 -0400
Message-ID: <cover.1412137857.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 01 Oct 2014 04:43:51 -0000
Content-Type: text/plain

Richard (or whoever is picking these up for testing),

Here's the nearly final update for the kernel bits in the 1.7 release.
These took far longer than I wanted to get out, but 3.17-rc6 was not the
last, and I had to work through another round of tools and kernel build
issues for both 3.14 and 3.17 (i.e. I spent another day or two working
with perf and 3.17).

We had some feature breakage creep into 3.14 and 3.17 trees, but Paul
Gortmaker helped me out, and we've now worked through the issues with
3.14 and 3.17.

I also have a small kern-tools fix for YOCTO #6753 as part of this
series.

So the summary is:

  - 3.14 feature fixes
  - 3.17 updates to rc7
  - kern tools bug fix
  - perf fix 3.17 breakage

I've built and booted this series for all arches, using my kernel-dev
image for extended build coverage, and we've had multiple eyes confirming
the 3.14 fixes.

** My warning is that I'm on vacation for the next week, and will only have
external access to email. So this needs to go through a build cycle before
merging .. and if there are problems, I'll be back mid next week to fix them
up for sure, or sooner if I see email on the external list.

Cheers,

Bruce


The following changes since commit abf9372358e5db70e7d707a5a732c4ec7d0f2efe:

  build-appliance-image: Update to dizzy head revision (2014-09-30 21:48:12 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  kern-tools: fix overly greedy path relocations
  linux-yocto/3.14/3.17: menuconfig and cryptodev
  linux-yocto/3.14: revert BFP feature, and fix intel-common -rt
  linux-yocto/3.14/3.17: allmodconfig/allyesconfig build fixes
  linux-yocto/3.17: update to v3.17-rc7
  perf: fix undefined pr_* routines

 .../recipes-kernel/kern-tools/kern-tools-native_git.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb       |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb     |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb     |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb          | 16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_3.17.bb          | 18 +++++++++---------
 meta/recipes-kernel/perf/perf.bb                       | 11 ++++++++---
 7 files changed, 34 insertions(+), 29 deletions(-)

-- 
1.8.1.2


