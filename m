Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA95265CE8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 03:59:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w653xGZb027208
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Jul 2018 20:59:16 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 4 Jul 2018 20:59:15 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Thu, 5 Jul 2018 12:09:10 +0800
Message-ID: <cover.1530762357.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V3 0/1] linux-yocto: add ptest support
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
X-List-Received-Date: Thu, 05 Jul 2018 03:59:17 -0000
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


The following changes since commit 611013a23a0082faa4fda2cd2529668965586a76:

  mesa: add lost Upstream-Status tag (2018-07-05 00:22:08 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/kernel-ptest
  https://github.com//tree/dengke/kernel-ptest

Dengke Du (1):
  linux-yocto: add ptest support

 meta/recipes-kernel/linux/linux-yocto/run-ptest | 144 ++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.14.bb   |  15 +++
 2 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/run-ptest

-- 
2.7.4


