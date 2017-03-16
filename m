Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA0073133
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 10:13:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2GADU9Q003341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 03:13:31 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 03:13:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 03:13:23 -0700
Message-ID: <cover.1489657029.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/6] runqemu: add selftest and fixes
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
X-List-Received-Date: Thu, 16 Mar 2017 10:13:31 -0000
Content-Type: text/plain

The following changes since commit 477805b913a6c4b4b630e42f08cd9e59f1e4e254:

  wic: selftest: account for occasional newline in debugfs file names (2017-03-14 14:39:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qemu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/qemu

Robert Yang (6):
  runqemu: improve when no machine specified
  runqemu: add -h and --help
  runqemu: only boot ramfs when specified
  oeqa/targetcontrol.py: modify it to test runqemu
  selftest/runqemu.py: add it to test runqemu
  targetcontrol.py: use logger.info to replace of bb.note

 meta/lib/oeqa/selftest/runqemu.py | 140 ++++++++++++++++++++++++++++++++++++++
 meta/lib/oeqa/targetcontrol.py    |  33 ++++++---
 meta/lib/oeqa/utils/commands.py   |  13 +++-
 meta/lib/oeqa/utils/qemurunner.py |  28 +++++---
 scripts/runqemu                   |  21 +++++-
 5 files changed, 208 insertions(+), 27 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/runqemu.py

-- 
2.9.0


