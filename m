Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7087D3CE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 23:48:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2019 16:48:03 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga005.jf.intel.com with ESMTP; 07 Jun 2019 16:48:03 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 16:47:50 -0700
Message-Id: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Move SCons to Python 3
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
X-List-Received-Date: Fri, 07 Jun 2019 23:48:02 -0000
Content-Transfer-Encoding: 8bit

python-scons and python-scons-native are perhaps the last python2 only
recipes in oe-core. With Python 2 going EOL in or before 2020, it's time
to switch everything to Python 3.

I updated scons.bbclass to use python3-scons-native. Tested build with serf.

I also added a simple oeqa/runtime test while I was at it.

I did not drop python-scons and python-scons-native, although we should
at some point soon.

[YOCTO #13381]

The following changes since commit 666f6192aaa9e847ad0d920a487b82d984b58d26:

  gnutls: Use the sysconfdir variable for the ca-certificates path (2019-06-07 09:10:34 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib timo/python3-scons
  http://cgit.openembedded.org//log/?h=timo/python3-scons

Tim Orling (4):
  python3-scons-{native}: add recipe for v3.0.5
  scons.bbclass: use python3-scons
  serf: switch to python3-scons-native
  oeqa/runtime: add simple test for scons

 meta/classes/scons.bbclass                    |  2 +-
 meta/conf/distro/include/maintainers.inc      |  2 +
 meta/lib/oeqa/runtime/cases/scons.py          | 37 +++++++++++++++++++
 meta/lib/oeqa/runtime/files/SConstruct        |  1 +
 meta/lib/oeqa/runtime/files/hello.c           |  5 +++
 .../python/python3-scons-native_3.0.5.bb      |  8 ++++
 .../python/python3-scons_3.0.5.bb             | 29 +++++++++++++++
 meta/recipes-support/serf/serf_1.3.9.bb       |  2 +-
 8 files changed, 84 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/scons.py
 create mode 100644 meta/lib/oeqa/runtime/files/SConstruct
 create mode 100644 meta/lib/oeqa/runtime/files/hello.c
 create mode 100644 meta/recipes-devtools/python/python3-scons-native_3.0.5.bb
 create mode 100644 meta/recipes-devtools/python/python3-scons_3.0.5.bb

-- 
2.20.1


