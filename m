Return-Path: <sgw@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 93AC578848
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 00:32:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 16:32:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,393,1508828400"; 
   d="scan'208";a="2042590"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.intel.com)
	([10.254.41.228])
	by orsmga006.jf.intel.com with ESMTP; 11 Dec 2017 16:32:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 11 Dec 2017 16:31:58 -0800
Message-Id: <20171212003202.4209-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH v2 0/4] Remove ELF Image Type
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
X-List-Received-Date: Tue, 12 Dec 2017 00:32:04 -0000

The ELF Image type is not currently used any more by the
coreboot project which was the original creator of this
image type along with the mkelfimage tool.  The tool was
removed from the coreboot repo back in 2014 and has no 
updates.  Each time binutils changes, the mkelfimage tool
breaks and requires a patch to the convert.bin.c special
header file.

v2: Added patch to switch out which recipe devtool tests with GIT
    - reorder patch set to hopefully address bisecting issues.

Saul Wold (4):
  devtool QA: switch which git recipe is used
  oeqa/qemu: remove elf image type
  image_types: Remove ELF type
  mkelfimage: Remove un-needed recipe

 meta/classes/image_types.bbclass                   |  13 -
 meta/lib/oeqa/core/target/qemu.py                  |   2 +-
 meta/lib/oeqa/selftest/cases/devtool.py            |   6 +-
 .../mkelfimage/mkelfimage/convert.bin.c            | 348 ---------------------
 .../mkelfimage/mkelfimage/cross-compile.patch      | 106 -------
 .../mkelfimage/fix-makefile-to-find-libz.patch     |  33 --
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |  48 ---
 7 files changed, 4 insertions(+), 552 deletions(-)
 delete mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage/convert.bin.c
 delete mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch
 delete mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage/fix-makefile-to-find-libz.patch
 delete mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb

-- 
2.13.6


