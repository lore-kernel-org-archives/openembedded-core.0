Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D903B745A0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 07:17:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w657HXrq013189
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Jul 2018 00:17:33 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 5 Jul 2018 00:17:32 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Thu, 5 Jul 2018 15:27:28 +0800
Message-ID: <cover.1530775399.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V4 0/1] linux-yocto: add ptest support
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
X-List-Received-Date: Thu, 05 Jul 2018 07:17:33 -0000
Content-Type: text/plain

Changed in V3:
	1. Add comments and documentation for the tests
	2. Changed the results of the kernel ptest output in this format: "[PASS|SKIP|FAIL]" : testname, according to Lei yang's comments.

The tests output:
	#####result#####
	PASS: dma-example
	PASS: bytestream-example
	PASS: inttype-example
	PASS: record-example
	PASS: kobject-example
	PASS: kset-example
	PASS: trace-events-sample
	PASS: trace-printk
	PASS: kprobe_example
	PASS: kretprobe_example

Changed in V4:
	Remove useless info

The following changes since commit 611013a23a0082faa4fda2cd2529668965586a76:

  mesa: add lost Upstream-Status tag (2018-07-05 00:22:08 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/kernel-ptest2
  https://github.com//tree/dengke/kernel-ptest2

Dengke Du (1):
  linux-yocto: add ptest support

 meta/recipes-kernel/linux/linux-yocto/run-ptest | 144 ++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.14.bb   |  10 ++
 2 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/run-ptest

-- 
2.7.4


