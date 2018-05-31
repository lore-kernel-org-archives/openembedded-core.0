Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8CABF74592
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 08:30:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4V8UWIR017429
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 01:30:32 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 May 2018 01:30:31 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2018 16:32:47 +0800
Message-ID: <cover.1527755434.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/14] testimage: restore 'auto' behaviour and a few other fixes
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
X-List-Received-Date: Thu, 31 May 2018 08:30:32 -0000
Content-Type: text/plain

The following changes since commit 719d068bde55ef29a3468bc0779d4cb0c11e8c1d:

  bitbake: fetch2: fix import error for Python 3.6.5 (2018-05-29 21:07:46 +0100)

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
  testimage-auto.bbclass: execute the same codes as testimage task
  oeqa/core/target/ssh.py: increase maximum read bytes from 1024 to 4096

 .../oeqa/runtime/cases/{selftest.py => _selftest.py}    |  0
 meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py     |  3 +++
 meta/classes/testimage-auto.bbclass                     |  6 ++++++
 meta/classes/testimage.bbclass                          | 10 ++++++++--
 meta/conf/bitbake.conf                                  |  2 +-
 meta/lib/oeqa/core/decorator/__init__.py                | 10 +++++-----
 meta/lib/oeqa/core/decorator/data.py                    |  4 ++--
 meta/lib/oeqa/core/loader.py                            | 17 +++++++++++++----
 meta/lib/oeqa/core/target/ssh.py                        |  2 +-
 meta/lib/oeqa/runtime/cases/multilib.py                 |  4 +++-
 meta/lib/oeqa/runtime/cases/rpm.py                      |  1 +
 meta/lib/oeqa/selftest/cases/runtime_test.py            |  2 +-
 12 files changed, 44 insertions(+), 17 deletions(-)
 rename meta-selftest/lib/oeqa/runtime/cases/{selftest.py => _selftest.py} (100%)

-- 
1.9.1


