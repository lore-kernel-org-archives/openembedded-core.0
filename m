Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 911476FCE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:06:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I66bkK026314
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:06:38 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 17 Aug 2014 23:06:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:06:31 -0700
Message-ID: <cover.1408341623.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/6] meta: fix rdepends issues for test related packages
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
X-List-Received-Date: Mon, 18 Aug 2014 06:06:40 -0000
Content-Type: text/plain

* Fix rdepends issues for test related packages
* Debash for bootchart2

// Robert

The following changes since commit d0be4b37743492fc9c178fd6f9ef73a5eb2fd9c3:

  chrpath: Drop warning from darwn builds (2014-08-17 10:01:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/test
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/test

Robert Yang (6):
  meta: fix RDEPNEDS for the test related pkgs
  sed: add sed to RDEPENDS sed-ptest
  lsbtest: no bashism in LSB_Test.sh
  run-ptest: fix bashism
  valgrind/oprofile/systemd: no need bash in run-ptest
  bootchart2: no bashism in bootchartd.in

 meta/recipes-core/libxml/libxml2.inc               |    2 ++
 meta/recipes-core/systemd/systemd/run-ptest        |    2 ++
 meta/recipes-core/udev/udev.inc                    |    2 +-
 .../bootchart2/bootchartd-no-bashism.patch         |   27 ++++++++++++++++++++
 meta/recipes-devtools/bootchart2/bootchart2_git.bb |    6 +++--
 meta/recipes-devtools/insserv/files/run-ptest      |    2 +-
 meta/recipes-devtools/quilt/quilt-0.63.inc         |    2 +-
 meta/recipes-devtools/quilt/quilt/run-ptest        |    2 +-
 meta/recipes-devtools/tcltk/tcl/run-ptest          |    4 +--
 meta/recipes-devtools/valgrind/valgrind/run-ptest  |    3 ++-
 meta/recipes-extended/gawk/gawk-4.1.1/run-ptest    |    4 +--
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh      |    2 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb          |   11 ++++++--
 meta/recipes-extended/sed/sed_4.2.2.bb             |    2 +-
 meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb     |    2 +-
 meta/recipes-kernel/oprofile/oprofile/run-ptest    |    3 ++-
 meta/recipes-support/beecrypt/beecrypt/run-ptest   |    2 +-
 17 files changed, 60 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch

-- 
1.7.9.5


