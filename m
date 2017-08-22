Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA7D2781C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 01:23:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7M1NEkk032727
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 18:23:15 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 18:23:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 18:23:04 -0700
Message-ID: <cover.1503364879.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH V2 0/9] Revive ptest and add result to buildhistory
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
X-List-Received-Date: Tue, 22 Aug 2017 01:23:13 -0000
Content-Type: text/plain

* V2:
  - Fix Paul's comments
  - Fix RP's comments

* V1:
  - Initial version

// Robert

The following changes since commit 5c9ef0734d23909b5694ed43cdbb205c2ba9ca95:

  devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK installation. (2017-08-19 22:15:25 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ptest
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ptest

Robert Yang (9):
  runtime/cases/_ptest.py: revive it
  oeqa/utils/logparser.py: add skip status
  runtime/cases/_ptest.py: add skip status
  runtime/cases/_ptest.py: rename it to ptest.py
  utils/logparser.py: fix section check
  core/target/ssh.py: replace decode errors
  buildhistory.bbclass: print message when no commit
  testimage.bbclass: update comments
  buildhistory.bbclass: add ptest

 meta/classes/buildhistory.bbclass     |  32 +++++++++++
 meta/classes/testimage.bbclass        |   4 +-
 meta/lib/oeqa/core/target/ssh.py      |   4 +-
 meta/lib/oeqa/runtime/cases/_ptest.py | 103 ----------------------------------
 meta/lib/oeqa/runtime/cases/ptest.py  |  82 +++++++++++++++++++++++++++
 meta/lib/oeqa/utils/logparser.py      |   7 ++-
 6 files changed, 122 insertions(+), 110 deletions(-)
 delete mode 100644 meta/lib/oeqa/runtime/cases/_ptest.py
 create mode 100644 meta/lib/oeqa/runtime/cases/ptest.py

-- 
2.10.2


