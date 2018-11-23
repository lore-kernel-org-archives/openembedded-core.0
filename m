Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECB5B6C653
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:30:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAN7UIDb023398
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 23:30:28 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 22 Nov 2018 23:30:07 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 15:47:19 +0800
Message-ID: <cover.1542959097.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/4] Upgrade elfutils/gnupg/libgcrypt/ncurses
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
X-List-Received-Date: Fri, 23 Nov 2018 07:30:38 -0000
Content-Type: text/plain

The following changes since commit fc5418e7bbdecfb27bafe595084e0fd0f991a388:

  meta/icecc.bbclass: Update system blacklists (2018-11-21 11:48:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20181109
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20181109

Hongxu Jia (4):
  elfutils: 0.174 -> 0.175
  gnupg: upgrade 2.2.10 -> 2.2.11
  libgcrypt: upgrade 1.8.3 -> 1.8.4
  ncurses: upgrade 6.1 -> 6.1+20181013

 ...ses_6.1+20180714.bb => ncurses_6.1+20181013.bb} |   2 +-
 .../{elfutils_0.174.bb => elfutils_0.175.bb}       |  24 +-
 ...01-arlib-Check-that-sh_entsize-isn-t-zero.patch |  36 ---
 ...Sanity-check-partial-core-file-data-reads.patch |  60 ----
 .../0001-size-Handle-recursive-ELF-ar-files.patch  |  40 ---
 .../files/0005-fix-a-stack-usage-warning.patch     |  35 ---
 ...de-alternatives-for-glibc-assumptions-hel.patch |  14 +-
 ...ferences-between-mips-machine-identifiers.patch |   5 +-
 .../files/debian/0001-fix-gcc7-ftbfs.patch         |  57 ----
 .../debian/0001-testsuite-ignore-elflint.patch     |  57 ----
 ...-support-for-mips64-abis-in-mips_retval.c.patch |   5 +-
 .../0003-Add-mips-n64-relocation-format-hack.patch |  41 ++-
 .../{0001-arm_backend.patch => arm_backend.diff}   | 342 ++++++++++-----------
 ...1-disable_werror.patch => disable_werror.patch} |  29 +-
 .../{0001-hppa_backend.patch => hppa_backend.diff} | 174 +++++------
 .../elfutils/files/debian/hurd_path.patch          |  16 +
 .../elfutils/files/debian/kfreebsd_path.patch      |  19 ++
 .../{0001-mips_backend.patch => mips_backend.diff} | 139 ++++-----
 ...1-mips_readelf_w.patch => mips_readelf_w.patch} |  26 +-
 ...c-use-a-custom-value-for-the-location-of-.patch |   4 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch    |   2 +-
 .../gnupg/{gnupg_2.2.10.bb => gnupg_2.2.11.bb}     |   4 +-
 .../{libgcrypt_1.8.3.bb => libgcrypt_1.8.4.bb}     |   4 +-
 23 files changed, 379 insertions(+), 756 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.1+20180714.bb => ncurses_6.1+20181013.bb} (86%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.174.bb => elfutils_0.175.bb} (76%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-arlib-Check-that-sh_entsize-isn-t-zero.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-libdwfl-Sanity-check-partial-core-file-data-reads.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-size-Handle-recursive-ELF-ar-files.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0005-fix-a-stack-usage-warning.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch
 rename meta/recipes-devtools/elfutils/files/debian/{0001-arm_backend.patch => arm_backend.diff} (85%)
 rename meta/recipes-devtools/elfutils/files/debian/{0001-disable_werror.patch => disable_werror.patch} (46%)
 rename meta/recipes-devtools/elfutils/files/debian/{0001-hppa_backend.patch => hppa_backend.diff} (90%)
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
 rename meta/recipes-devtools/elfutils/files/debian/{0001-mips_backend.patch => mips_backend.diff} (91%)
 rename meta/recipes-devtools/elfutils/files/debian/{0001-mips_readelf_w.patch => mips_readelf_w.patch} (48%)
 rename meta/recipes-support/gnupg/{gnupg_2.2.10.bb => gnupg_2.2.11.bb} (92%)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.8.3.bb => libgcrypt_1.8.4.bb} (93%)

-- 
2.7.4


