Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C20F782D6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 08:00:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L80fcS019557
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 01:00:42 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 01:00:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 01:00:36 -0700
Message-ID: <cover.1503302375.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/5] Packages upgrade
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
X-List-Received-Date: Mon, 21 Aug 2017 08:00:41 -0000
Content-Type: text/plain

The following changes since commit 5c9ef0734d23909b5694ed43cdbb205c2ba9ca95:

  devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK installation. (2017-08-19 22:15:25 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PU
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (5):
  git: 2.13.2 -> 2.13.3
  libbsd: 0.8.5 -> 0.8.6
  tcl: 8.6.6 -> 0.8.7
  e2fsprogs: 1.43.4 -> 1.43.5
  strace: 4.17 -> 4.18

 ...-with-exit-status-0-if-no-errors-were-fix.patch | 255 ---------------------
 .../e2fsprogs/e2fsprogs-1.43-sysmacros.patch       | 130 -----------
 .../{e2fsprogs_1.43.4.bb => e2fsprogs_1.43.5.bb}   |   4 +-
 meta/recipes-devtools/git/git_2.13.2.bb            |  11 -
 meta/recipes-devtools/git/git_2.13.3.bb            |  11 +
 ...8-replace-struct-ucontext-with-ucontext_t.patch |  31 ---
 .../strace/strace/Makefile-ptest.patch             |   2 +-
 .../strace/strace/update-gawk-paths.patch          |  58 ++---
 .../strace/{strace_4.17.bb => strace_4.18.bb}      |   7 +-
 .../tcltk/{tcl_8.6.6.bb => tcl_8.6.7.bb}           |   4 +-
 .../libbsd/{libbsd_0.8.5.bb => libbsd_0.8.6.bb}    |   4 +-
 11 files changed, 49 insertions(+), 468 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-exit-with-exit-status-0-if-no-errors-were-fix.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-1.43-sysmacros.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.4.bb => e2fsprogs_1.43.5.bb} (95%)
 delete mode 100644 meta/recipes-devtools/git/git_2.13.2.bb
 create mode 100644 meta/recipes-devtools/git/git_2.13.3.bb
 delete mode 100644 meta/recipes-devtools/strace/strace/0008-replace-struct-ucontext-with-ucontext_t.patch
 rename meta/recipes-devtools/strace/{strace_4.17.bb => strace_4.18.bb} (83%)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.6.bb => tcl_8.6.7.bb} (95%)
 rename meta/recipes-support/libbsd/{libbsd_0.8.5.bb => libbsd_0.8.6.bb} (92%)

-- 
2.10.2


