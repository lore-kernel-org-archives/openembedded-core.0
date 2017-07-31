Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6772E60107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 09:50:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6V9oAot020344
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 02:50:11 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 31 Jul 2017 02:50:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Jul 2017 02:50:00 -0700
Message-ID: <cover.1501494496.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 00/10] Revive ptest and add result to buildhistory
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
X-List-Received-Date: Mon, 31 Jul 2017 09:50:10 -0000
Content-Type: text/plain

We can get the regression result by:
$ git show HEAD ptest_log/pass.fail.skip.*

Can we add ptest to default TEST_SUITES, please ?

// Robert

The following changes since commit a2ab288bd002ebb6e64d46e941fb122e1157ff49:

  uninative: Update to 1.7 uninative release (2017-07-30 08:45:49 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ptest
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ptest

Robert Yang (10):
  oeqa/targetcontrol.py: simplify checking for qemu_use_kvm
  runtime/cases/_ptest.py: revive it
  oeqa/utils/logparser.py: add skip status
  runtime/cases/_ptest.py: add skip status
  runtime/cases/_ptest.py: rename it to ptest.py
  utils/logparser.py: fix section check
  core/target/ssh.py: replace decode errors
  buildhistory.bbclass: print message when no commit
  buildhistory.bbclass: add ptest_log
  testimage.bbclass: update comments

 meta/classes/buildhistory.bbclass     |  30 ++++++++++
 meta/classes/testimage.bbclass        |   4 +-
 meta/lib/oeqa/core/target/ssh.py      |   4 +-
 meta/lib/oeqa/runtime/cases/_ptest.py | 103 ----------------------------------
 meta/lib/oeqa/runtime/cases/ptest.py  |  82 +++++++++++++++++++++++++++
 meta/lib/oeqa/targetcontrol.py        |   5 +-
 meta/lib/oeqa/utils/logparser.py      |   7 ++-
 7 files changed, 122 insertions(+), 113 deletions(-)
 delete mode 100644 meta/lib/oeqa/runtime/cases/_ptest.py
 create mode 100644 meta/lib/oeqa/runtime/cases/ptest.py

-- 
2.11.0


