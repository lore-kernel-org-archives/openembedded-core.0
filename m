Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20D4D6AC3E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 17:27:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2GHRAYn014530
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Mar 2015 10:27:11 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 16 Mar 2015 10:27:10 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 16 Mar 2015 13:27:05 -0400
Message-ID: <cover.1426525757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] kernel: consolidated pull request
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
X-List-Received-Date: Mon, 16 Mar 2015 17:27:12 -0000
Content-Type: text/plain

Hi all,

Here are the latest batch of kernel (and kernel related packages) fixes that 
I've been working with and testing in my environment.

perf: two commits

  [PATCH 4/5] perf: drop PR
  [PATCH 5/5] perf: add bash to RDEPENDS

The PR drop is incidental to when I was fixing the bash rdepends issue [YOCTO: #7445],
so I kept it in a separate commit.

kernel-tools: two commits

  [PATCH 1/5] kern-tools: fix iterative configuration runs                                                                                          
  [PATCH 2/5] kernel-yocto: split meta data generation from patching phase

These changes were triggered when fixing up QA warnings on the Intel BSPs,
and the incremental processing of changing meta data, and re-running the
configure and check steps was less than ideal. They are a shuffling and
split of the tasks, with no other significant changes.

And finally, a 3.19 -stable kernel update.

  [PATCH 3/5] linux-yocto/3.19: integrate korg -stable update                                                                                       

Cheers,

Bruce

The following changes since commit 7f30749fe026e9ceb75d73b89271145a45a60763:

  oeqa/parselogs: Skip hda opcode errors (2015-03-12 12:50:24 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  kern-tools: fix iterative configuration runs
  kernel-yocto: split meta data generation from patching phase
  linux-yocto/3.19: integrate korg -stable update
  perf: drop PR
  perf: add bash to RDEPENDS

 meta/classes/kernel-yocto.bbclass                    |  9 +++++++--
 .../kern-tools/kern-tools-native_git.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.19.bb        | 20 ++++++++++----------
 meta/recipes-kernel/perf/perf.bb                     |  4 +---
 5 files changed, 22 insertions(+), 19 deletions(-)

-- 
2.1.0


