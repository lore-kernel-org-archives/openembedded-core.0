Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7624F75A1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 08:55:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O8tP4k016044
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 01:55:25 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Jun 2015 01:55:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jun 2015 01:55:18 -0700
Message-ID: <cover.1435135356.git.liezhi.yang@windriver.com>
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
X-List-Received-Date: Wed, 24 Jun 2015 08:55:29 -0000
Content-Type: text/plain

The following changes since commit 8c73bb7949656d91f138c087b9d261cdce90a94b:

  apt-native: Drop obsolete symlinks (2015-06-23 16:06:29 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PU
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (5):
  file: 5.22 -> 5.23
  elfutils: 0.161 -> 0.162
  git: 2.4.2 -> 2.4.4
  hdparm: 9.45 -> 9.48
  gnupg: 2.1.4 -> 2.1.5

 ...f-Fix-dir-traversal-vuln-in-ar-extraction.patch |   59 ----
 ...m-Silence-Werror-maybe-uninitialized-fals.patch |    0
 .../0001-remove-the-unneed-checking.patch          |    0
 .../arm_backend.diff                               |    0
 .../arm_func_value.patch                           |   39 ++-
 .../arm_unwind_ret_mask.patch                      |    0
 .../fixheadercheck.patch                           |   13 +-
 .../hppa_backend.diff                              |    0
 .../m68k_backend.diff                              |    0
 .../mips_backend.diff                              |    0
 .../mips_readelf_w.patch                           |    0
 .../non_linux.patch                                |    0
 .../redhat-portability.diff                        |  282 +++++++++-----------
 .../scanf-format.patch                             |    0
 .../testsuite-ignore-elflint.diff                  |    0
 .../uclibc-support-for-elfutils-0.161.patch        |    0
 .../{elfutils_0.161.bb => elfutils_0.162.bb}       |    7 +-
 .../file/0001-Add-P-prompt-into-Usage-info.patch   |    6 +-
 .../file/{file_5.22.bb => file_5.23.bb}            |    6 +-
 .../git/{git_2.4.2.bb => git_2.4.4.bb}             |    8 +-
 .../hdparm/{hdparm_9.45.bb => hdparm_9.48.bb}      |    6 +-
 .../gnupg/{gnupg_2.1.4.bb => gnupg_2.1.5.bb}       |    4 +-
 22 files changed, 167 insertions(+), 263 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.161/0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/0001-remove-the-unneed-checking.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/arm_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/arm_func_value.patch (88%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/arm_unwind_ret_mask.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/fixheadercheck.patch (60%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/hppa_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/m68k_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/mips_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/mips_readelf_w.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/non_linux.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/redhat-portability.diff (84%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/scanf-format.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/testsuite-ignore-elflint.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.161 => elfutils-0.162}/uclibc-support-for-elfutils-0.161.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.161.bb => elfutils_0.162.bb} (93%)
 rename meta/recipes-devtools/file/{file_5.22.bb => file_5.23.bb} (81%)
 rename meta/recipes-devtools/git/{git_2.4.2.bb => git_2.4.4.bb} (41%)
 rename meta/recipes-extended/hdparm/{hdparm_9.45.bb => hdparm_9.48.bb} (84%)
 rename meta/recipes-support/gnupg/{gnupg_2.1.4.bb => gnupg_2.1.5.bb} (89%)

-- 
1.7.9.5


