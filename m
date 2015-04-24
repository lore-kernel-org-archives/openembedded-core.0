Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68D966E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 16:13:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3OGDt9h015434
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Apr 2015 09:13:55 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Fri, 24 Apr 2015 09:13:55 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Apr 2015 12:13:52 -0400
Message-ID: <cover.1429891826.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] kernel: 3.19 updates and tools tweak
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
X-List-Received-Date: Fri, 24 Apr 2015 16:13:56 -0000
Content-Type: text/plain

Richard,

Here are a couple of change that just missed the 1.8 cut off, so I'm sending
them out now .. before I send my queue with the new 4.x kernels, and LTSI/stable
updates for all the trees.

The tools change addresses [YOCTO: #7441], and makes the detection of meta
data simpler, and also smarter, so random directories in the source tree
won't break things.

The 3.19 update is a stable integration and some configuration changes that
are requied for Bluetooth (along wit some other board tweaks). I've built and
booted on the qemu machines for this update.

Cheers,

Bruce


The following changes since commit 203aaaec084b80d0146b379d00527f8bd08b4119:

  bitbake: bitbake-user-manual: Cleaned up parallelism note and formatted user input (2015-04-17 13:28:47 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  kern-tools: unify meta directory detection
  linux-yocto/3.19: configuration updates and stable integration

 .../kern-tools/kern-tools-native_git.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.19.bb        | 20 ++++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.1.0


