Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DDDB74EFD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 02:59:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4V2xFw5032338
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 19:59:30 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 30 May 2018 19:59:04 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2018 11:08:29 +0800
Message-ID: <cover.1527735211.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] linux-yocto: add ptest support
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
X-List-Received-Date: Thu, 31 May 2018 02:59:40 -0000
Content-Type: text/plain

Add ptest for kernel samples.

Prerequisite: 
1. Install package kernel-modules
2. enable ptest distro feature

Runtime testing(x86):
1. cd /usr/lib/linux-yocto/ptest
2. ./run-ptest

Testing result:
#####result#####
dma-example: PASS
bytestream-example: PASS
inttype-example: PASS
record-example: PASS
kobject-example: PASS
kset-example: PASS
trace-events-sample: PASS
trace-printk: PASS
kprobe_example: PASS
kretprobe_example: PASS

The following changes since commit 719d068bde55ef29a3468bc0779d4cb0c11e8c1d:

  bitbake: fetch2: fix import error for Python 3.6.5 (2018-05-29 21:07:46 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/dev
  https://github.com//tree/dengke/dev

Dengke Du (1):
  linux-yocto: add ptest support

 meta/recipes-kernel/linux/files/run-ptest     | 138 ++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc     |   8 ++
 meta/recipes-kernel/linux/linux-yocto_4.14.bb |   2 +-
 3 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux/files/run-ptest

-- 
2.7.4


