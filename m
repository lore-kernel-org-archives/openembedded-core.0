Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 323B873310
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 09:07:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1C97eWI022670
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 01:07:41 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Feb 2015 01:07:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Feb 2015 01:07:33 -0800
Message-ID: <cover.1423732000.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/7] meta: several fixes
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
X-List-Received-Date: Thu, 12 Feb 2015 09:07:41 -0000
Content-Type: text/plain

The following changes since commit 6bf5cbbcac80ee818cc932d69227e70e41ce02d3:

  libtool: Fix option parsing performance regression (2015-02-10 22:36:09 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/fixes

Robert Yang (7):
  Revert "libtool: avoid running automake/autoconf --version"
  libtool: don't execute automake and autoconf on every invocation
  rt-tests: fix gzip command
  gcc-sanitizers: check gcc-build-internal before link
  btrfs-tools: fix for parallel build
  btrfs-tools: remove nodocs.patch
  neard: do not ship version.h

 .../neard/Makefile.am-do-not-ship-version.h.patch  |   36 ++++++++++
 meta/recipes-connectivity/neard/neard_0.15.bb      |    1 +
 .../btrfs-tools/btrfs-tools/fix-parallel.patch     |   32 +++++++++
 .../btrfs-tools/btrfs-tools/nodocs.patch           |   22 ------
 .../btrfs-tools/btrfs-tools_git.bb                 |    5 +-
 meta/recipes-devtools/gcc/gcc-sanitizers.inc       |    4 +-
 meta/recipes-devtools/libtool/libtool-2.4.5.inc    |    2 +-
 .../avoid-running-automake-autoconf-version.patch  |   54 ---------------
 ...-t-execute-automake-and-autoconf-on-every.patch |   71 ++++++++++++++++++++
 .../rt-tests/files/Makefile-fix-gzip-command.patch |   30 +++++++++
 meta/recipes-rt/rt-tests/rt-tests.inc              |    1 +
 11 files changed, 179 insertions(+), 79 deletions(-)
 create mode 100644 meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-parallel.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/nodocs.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/avoid-running-automake-autoconf-version.patch
 create mode 100644 meta/recipes-devtools/libtool/libtool/libtool-don-t-execute-automake-and-autoconf-on-every.patch
 create mode 100644 meta/recipes-rt/rt-tests/files/Makefile-fix-gzip-command.patch

-- 
1.7.9.5


