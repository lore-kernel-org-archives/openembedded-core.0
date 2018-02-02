Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB21271951
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 03:22:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w123Mn3A006549
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 19:22:49 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 1 Feb 2018 19:22:48 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 11:23:23 +0800
Message-ID: <cover.1517541572.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/4] use qemuboot.json to replace qemuboot.conf
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
X-List-Received-Date: Fri, 02 Feb 2018 03:22:48 -0000
Content-Type: text/plain

The qemuboot.conf uses configparser which can't suport upper case as key, and 
json is more clearer than configparser and is widely used in oe-core, so use 
qemuboot.json to replace qemuboot.conf.

// Robert

The following changes since commit a0988c3374e964170d1d24fc230306b887432d31:

  tcmode-default.inc: drop preferred version of gzip-native (2018-01-31 17:01:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/json
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/json

Robert Yang (4):
  qemuboot.bbclass: qemuboot.conf -> qemuboot.json
  runqemu: qemuboot.conf -> qemuboot.json
  runqemu: check for qemuboot.conf and raise error
  selftest/cases/runqemu.py: qemuboot.conf -> qemuboot.json

 meta/classes/qemuboot.bbclass           | 17 ++++----
 meta/lib/oeqa/selftest/cases/runqemu.py | 12 +++---
 scripts/runqemu                         | 73 +++++++++++++++++----------------
 3 files changed, 52 insertions(+), 50 deletions(-)

-- 
2.7.4


