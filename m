Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 69FC276618
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 06:40:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t746eAqT018729
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Aug 2015 23:40:10 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 3 Aug 2015 23:40:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Aug 2015 23:40:04 -0700
Message-ID: <cover.1438670283.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/6] Packages Upgrade
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
X-List-Received-Date: Tue, 04 Aug 2015 06:40:15 -0000
Content-Type: text/plain

* Changes of file_5.24.bb:
  - Use file_5.24.bb rather than file_git.bb, doesn't need the long PV
    either.

// Robert

The following changes since commit 288c76a41aebaf54c7fca3782160830df462b9e4:

  builder: Fix multilib compile failure (2015-08-03 07:15:47 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PU
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (6):
  git: 2.4.6 -> 2.5.0
  file: 5.23 -> 5.24
  libcheck: 0.9.14 -> 0.10.0
  bash: 4.3 -> 4.3.30
  binutils: 2.25 -> 2.25.1
  tcmode-default.inc: update BINUVERSION

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../{binutils-2.25.inc => binutils-2.25.1.inc}     |    2 +-
 ...n_2.25.bb => binutils-cross-canadian_2.25.1.bb} |    0
 ...tils-cross_2.25.bb => binutils-cross_2.25.1.bb} |    0
 ...rosssdk_2.25.bb => binutils-crosssdk_2.25.1.bb} |    0
 .../{binutils_2.25.bb => binutils_2.25.1.bb}       |    0
 ...h-long-options-and-explicitly-number-them.patch |  116 --------------------
 .../file/0002-fix-bug-with-5.23-long-options.patch |   26 -----
 .../file/{file_5.23.bb => file_5.24.bb}            |   16 ++-
 meta/recipes-devtools/git/git_2.4.6.bb             |   11 --
 meta/recipes-devtools/git/git_2.5.0.bb             |   11 ++
 meta/recipes-extended/bash/bash_4.3.30.bb          |   46 ++++++++
 meta/recipes-extended/bash/bash_4.3.bb             |  111 -------------------
 .../{libcheck_0.9.14.bb => libcheck_0.10.0.bb}     |    4 +-
 14 files changed, 68 insertions(+), 277 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.25.inc => binutils-2.25.1.inc} (97%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.25.bb => binutils-cross-canadian_2.25.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.25.bb => binutils-cross_2.25.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.25.bb => binutils-crosssdk_2.25.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.25.bb => binutils_2.25.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/file/file/0001-Fix-bug-with-long-options-and-explicitly-number-them.patch
 delete mode 100644 meta/recipes-devtools/file/file/0002-fix-bug-with-5.23-long-options.patch
 rename meta/recipes-devtools/file/{file_5.23.bb => file_5.24.bb} (64%)
 delete mode 100644 meta/recipes-devtools/git/git_2.4.6.bb
 create mode 100644 meta/recipes-devtools/git/git_2.5.0.bb
 create mode 100644 meta/recipes-extended/bash/bash_4.3.30.bb
 delete mode 100644 meta/recipes-extended/bash/bash_4.3.bb
 rename meta/recipes-support/libcheck/{libcheck_0.9.14.bb => libcheck_0.10.0.bb} (79%)

-- 
1.7.9.5


