Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9937883F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 02:40:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5E2drhR022921
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Jun 2018 19:40:19 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 13 Jun 2018 19:39:44 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Thu, 14 Jun 2018 10:49:22 +0800
Message-ID: <cover.1528944217.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V2 0/1] linux-yocto: add ptest support
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
X-List-Received-Date: Thu, 14 Jun 2018 02:40:45 -0000
Content-Type: text/plain

Changed in V2:
	Put the run-ptest script in linux-yocto directory.

The following changes since commit ddbd7b0cd6580ee26e11aa87e426fb294b372d64:

  meta-yocto-bsp: bump to the latest linux stable kernel for edgerouter/beaglebone (2018-06-12 23:34:40 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git kernel-ptest
  https://github.com//tree/kernel-ptest

Dengke Du (1):
  linux-yocto: add ptest support

 meta/recipes-kernel/linux/linux-yocto/run-ptest | 138 ++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.14.bb   |   9 ++
 2 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/run-ptest

-- 
2.7.4


