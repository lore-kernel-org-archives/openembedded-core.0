Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 67C1974C3F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 03:08:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5437sSB003764
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Jun 2018 20:08:09 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Sun, 3 Jun 2018 20:07:43 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jun 2018 11:10:01 +0800
Message-ID: <cover.1528081495.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V3 00/14] testimage: restore 'auto' behaviour and a few other fixes
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
X-List-Received-Date: Mon, 04 Jun 2018 03:08:18 -0000
Content-Type: text/plain

Changes in V3:
* update patch to fix oe-selftest problem: oeqa/runtime/cases/selftest.py: rename to _selftest.py

Changes in V2:
* move codes into testimage_main instead of modifying testimage-auto.bbclass
* use if...else... instead list index for setting of HOSTTOOLS


The following changes since commit bc6c8a0794999b49508aeff9b7cf855ddb2a0c40:

  poky: Switch to post release name/version (2018-06-03 16:30:43 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/testimage-auto
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/testimage-auto

Chen Qi (14):
  oeqa/core/loader.py: support the 'auto' keyword
  testimage.bbclass: fix behavior of empty TEST_SUITES
  oeqa/core/decorator/__init__.py: set metaclass to ABCMeta
  oeqa/core/decorator/__init__.py: use 'cls' instead of 'obj'
  oeqa/runtime/cases/dnf_runtime.py: skip test if PACKAGE_FEED_URIS is
    not set
  oeqa/runtime/cases/selftest.py: rename to _selftest.py
  testimage.bbclass: also check 'auto' to create rpm index
  oeqa/core/decorator/data.py: fix skipIfNotInDataVar
  oeqa/runtime/cases/rpm.py: skip if rpm not available
  oeqa/runtime/cases/multilib.py: skip if needed packages are not
    available
  oeqa/runtime/cases/multilib.py: fix test_file_connman skipping logic
  bitbake.conf: fix HOSTTOOLS setting related to image testing
  testimage.bbclass: move codes into testimage_main
  oeqa/core/target/ssh.py: increase maximum read bytes from 1024 to 4096

 .../runtime/cases/{selftest.py => _selftest.py}     |  2 +-
 meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py |  3 +++
 meta/classes/testimage.bbclass                      | 21 +++++++++++++--------
 meta/conf/bitbake.conf                              |  2 +-
 meta/lib/oeqa/core/decorator/__init__.py            | 10 +++++-----
 meta/lib/oeqa/core/decorator/data.py                |  4 ++--
 meta/lib/oeqa/core/loader.py                        | 17 +++++++++++++----
 meta/lib/oeqa/core/target/ssh.py                    |  2 +-
 meta/lib/oeqa/runtime/cases/multilib.py             |  4 +++-
 meta/lib/oeqa/runtime/cases/rpm.py                  |  1 +
 meta/lib/oeqa/selftest/cases/runtime_test.py        |  2 +-
 11 files changed, 44 insertions(+), 24 deletions(-)
 rename meta-selftest/lib/oeqa/runtime/cases/{selftest.py => _selftest.py} (94%)

-- 
1.9.1


