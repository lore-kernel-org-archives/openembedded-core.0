Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3060477BA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:45:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2O8j3cn005494
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 01:45:03 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Mar 2017 01:45:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Mar 2017 01:44:58 -0700
Message-ID: <cover.1490343063.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/4 V2] runqemu: add selftest
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
X-List-Received-Date: Fri, 24 Mar 2017 08:45:06 -0000
Content-Type: text/plain

* V2
  Add Qi's patch to fix hang of "oe-selftest -r wic.Wic.test_qemu_efi".

// Robert

The following changes since commit 3b5ac72bdf76ac8ff98dc3c882a4edc77c6e2c33:

  rpm: add a "rpm-build" PROVIDES (2017-03-22 15:09:26 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qemu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/qemu

Chen Qi (1):
  qemurunner.py: fix handling of runqemuparams

Robert Yang (3):
  oeqa/targetcontrol.py: modify it to test runqemu
  selftest/runqemu.py: add it to test runqemu
  targetcontrol.py: use logger.info to replace of bb.note

 meta/lib/oeqa/selftest/runqemu.py | 140 ++++++++++++++++++++++++++++++++++++++
 meta/lib/oeqa/targetcontrol.py    |  33 ++++++---
 meta/lib/oeqa/utils/commands.py   |  13 +++-
 meta/lib/oeqa/utils/qemurunner.py |  28 +++++---
 4 files changed, 190 insertions(+), 24 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/runqemu.py

-- 
2.9.0


