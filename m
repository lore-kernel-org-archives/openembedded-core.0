Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 534AD78A52
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 09:08:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6698MH7021256
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2018 02:08:22 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 6 Jul 2018 02:08:21 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jul 2018 05:07:40 -0400
Message-ID: <cover.1530867788.git.hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V2 0/2] kernel-selftest: add it
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
X-List-Received-Date: Fri, 06 Jul 2018 09:08:21 -0000
Content-Type: text/plain

The following changes since commit 611013a23a0082faa4fda2cd2529668965586a76:

  mesa: add lost Upstream-Status tag (2018-07-05 00:22:08 +0100)

are available in the git repository at:

  https://github.com/csqshz/openembedded-core.git hong/kself
  https://github.com//tree/hong/kself

Dengke Du (1):
  kernel-selftest: add it

Hongzhi.Song (1):
  kernel-selftest: add vm testcase to recipe

 .../kernel-selftest/kernel-selftest.bb             | 94 ++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc          |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-kernel/kernel-selftest/kernel-selftest.bb

-- 
2.8.1


