Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA18471183
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:57:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7RFvFYj005021
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 08:57:15 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 27 Aug 2014 08:57:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Aug 2014 08:57:05 -0700
Message-ID: <cover.1409154816.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/9] rdepends fixes and QA check: file-rdeps
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
X-List-Received-Date: Wed, 27 Aug 2014 15:57:23 -0000
Content-Type: text/plain

Hello,

I resent the remaining ones and put all of them in the same thread.

// Robert


The following changes since commit d0be4b37743492fc9c178fd6f9ef73a5eb2fd9c3:

  chrpath: Drop warning from darwn builds (2014-08-17 10:01:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rdeps
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rdeps

Robert Yang (9):
  insane.bbclass: add QA check: file-rdeps
  ltp: fix RDEPENDS
  meta: fix RDEPNEDS for the test related pkgs
  valgrind/oprofile/systemd: no bashism in run-ptest
  run-ptest: fix bashism
  lsbtest: no bashism in LSB_Test.sh
  sed: add sed to RDEPENDS sed-ptest
  bootchart2: no bashism in bootchartd.in
  python3-distribute: fix interpreter

 meta/classes/insane.bbclass                        |   73 +++++++++++++++++++-
 meta/recipes-core/libxml/libxml2.inc               |    2 +
 meta/recipes-core/systemd/systemd/run-ptest        |    2 +
 meta/recipes-core/udev/udev.inc                    |    2 +-
 .../bootchart2/bootchartd-no-bashism.patch         |   27 ++++++++
 meta/recipes-devtools/bootchart2/bootchart2_git.bb |    6 +-
 meta/recipes-devtools/insserv/files/run-ptest      |    2 +-
 .../python/python3-distribute_0.6.32.bb            |    2 +
 meta/recipes-devtools/quilt/quilt-0.63.inc         |    2 +-
 meta/recipes-devtools/quilt/quilt/run-ptest        |    2 +-
 meta/recipes-devtools/tcltk/tcl/run-ptest          |    4 +-
 meta/recipes-devtools/valgrind/valgrind/run-ptest  |    3 +-
 meta/recipes-extended/gawk/gawk-4.1.1/run-ptest    |    4 +-
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh      |    2 +-
 meta/recipes-extended/ltp/ltp_20140422.bb          |    2 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb          |   11 ++-
 meta/recipes-extended/sed/sed_4.2.2.bb             |    2 +-
 meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb     |    2 +-
 meta/recipes-kernel/oprofile/oprofile/run-ptest    |    3 +-
 meta/recipes-support/beecrypt/beecrypt/run-ptest   |    2 +-
 20 files changed, 135 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch

-- 
1.7.9.5


