Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 027D575716
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 09:57:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S9vRrm016902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 02:57:27 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 02:57:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 May 2015 02:57:18 -0700
Message-ID: <cover.1432805258.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/9] Packages Upgrade
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
X-List-Received-Date: Thu, 28 May 2015 09:57:29 -0000
Content-Type: text/plain

The following changes since commit e6952593d810636f26af541b12126848483e619a:

  kernel: Build uImage only when really needed (2015-05-26 10:57:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PU
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (9):
  debianutils: 4.4 -> 4.5
  git: 2.3.7 -> 2.4.2
  python-git: 1.0.0 -> 1.0.1
  cracklib: 2.9.3 -> 2.9.4
  man-pages: 3.83 -> 4.00
  gnupg: 2.1.2 -> 2.1.4
  btrfs-tools: 3.18.2 -> 4.0.1
  nasm: 2.11.06 -> 2.11.08
  lttng-ust: 2.6.0 -> 2.6.1

 .../btrfs-tools/btrfs-tools/fix-parallel.patch     |   16 ++++++++--------
 .../btrfs-tools/btrfs-tools_git.bb                 |   16 +++++++++-------
 .../git/{git_2.3.7.bb => git_2.4.2.bb}             |    8 ++++----
 .../nasm/{nasm_2.11.06.bb => nasm_2.11.08.bb}      |    5 +++--
 .../{python-git_1.0.0.bb => python-git_1.0.1.bb}   |    4 ++--
 .../{cracklib_2.9.3.bb => cracklib_2.9.4.bb}       |    4 ++--
 .../{man-pages_3.83.bb => man-pages_4.00.bb}       |    4 ++--
 .../{lttng-ust_2.6.0.bb => lttng-ust_2.6.1.bb}     |    0
 .../{debianutils_4.4.bb => debianutils_4.5.bb}     |    6 +++---
 .../gnupg/gnupg/dirmngr-uses-libgpg-error.patch    |    8 ++++----
 .../gnupg/{gnupg_2.1.2.bb => gnupg_2.1.4.bb}       |    4 ++--
 11 files changed, 39 insertions(+), 36 deletions(-)
 rename meta/recipes-devtools/git/{git_2.3.7.bb => git_2.4.2.bb} (41%)
 rename meta/recipes-devtools/nasm/{nasm_2.11.06.bb => nasm_2.11.08.bb} (81%)
 rename meta/recipes-devtools/python/{python-git_1.0.0.bb => python-git_1.0.1.bb} (85%)
 rename meta/recipes-extended/cracklib/{cracklib_2.9.3.bb => cracklib_2.9.4.bb} (91%)
 rename meta/recipes-extended/man-pages/{man-pages_3.83.bb => man-pages_4.00.bb} (86%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.6.0.bb => lttng-ust_2.6.1.bb} (100%)
 rename meta/recipes-support/debianutils/{debianutils_4.4.bb => debianutils_4.5.bb} (84%)
 rename meta/recipes-support/gnupg/{gnupg_2.1.2.bb => gnupg_2.1.4.bb} (89%)

-- 
1.7.9.5


