Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F1CB0760FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 02:31:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H2VlSr018269
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 19:31:48 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 16 Jul 2015 19:31:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jul 2015 19:31:42 -0700
Message-ID: <cover.1437100265.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/5] Packages Upgrade
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
X-List-Received-Date: Fri, 17 Jul 2015 02:31:51 -0000
Content-Type: text/plain

The following changes since commit ff384c084678dab33bbd7eb82ece21a2baa13dfb:

  qemu: upgrade to 2.4.0-rc0 (2015-07-16 20:40:00 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PU
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (5):
  btrfs-tools: 4.0.1 -> 4.1.1
  lttng-modules: 2.6.1 -> 2.6.2
  lttng-ust: 2.6.1 -> 2.6.2
  git: 2.4.4 -> 2.4.5
  file: 5.23 -> 5.24

 .../btrfs-tools/btrfs-tools_git.bb                 |    4 +-
 ...h-long-options-and-explicitly-number-them.patch |  116 --------------------
 .../file/0002-fix-bug-with-5.23-long-options.patch |   26 -----
 .../file/{file_5.23.bb => file_git.bb}             |   17 ++-
 meta/recipes-devtools/git/git.inc                  |   14 +--
 meta/recipes-devtools/git/git_2.4.4.bb             |   11 --
 meta/recipes-devtools/git/git_git.bb               |    6 +
 ...lttng-modules_2.6.1.bb => lttng-modules_git.bb} |    3 +-
 .../lttng/lttng-ust/add-aarch64.patch              |   19 ----
 .../lttng/{lttng-ust_2.6.1.bb => lttng-ust_git.bb} |    6 +-
 10 files changed, 26 insertions(+), 196 deletions(-)
 delete mode 100644 meta/recipes-devtools/file/file/0001-Fix-bug-with-long-options-and-explicitly-number-them.patch
 delete mode 100644 meta/recipes-devtools/file/file/0002-fix-bug-with-5.23-long-options.patch
 rename meta/recipes-devtools/file/{file_5.23.bb => file_git.bb} (64%)
 delete mode 100644 meta/recipes-devtools/git/git_2.4.4.bb
 create mode 100644 meta/recipes-devtools/git/git_git.bb
 rename meta/recipes-kernel/lttng/{lttng-modules_2.6.1.bb => lttng-modules_git.bb} (93%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/add-aarch64.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.6.1.bb => lttng-ust_git.bb} (91%)

-- 
1.7.9.5


