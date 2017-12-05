Return-Path: <sgw@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id ECAED6079F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:10:36 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="184030299"
Received: from swold-mobl2.jf.intel.com ([10.24.10.97])
	by fmsmga006.fm.intel.com with ESMTP; 04 Dec 2017 17:10:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  4 Dec 2017 17:10:32 -0800
Message-Id: <20171205011035.14908-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH 0/3][RFC] Remove ELF Image Type
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
X-List-Received-Date: Tue, 05 Dec 2017 01:10:37 -0000

The ELF Image type is not currently used any more by the
coreboot project which was the original creator of this
image type along with the mkelfimage tool.  The tool was
removed from the coreboot repo back in 2014 and has no 
updates.  Each time binutils changes, the mkelfimage tool
breaks and requires a patch to the convert.bin.c special
header file.

I beleive I got all the bit.

If I don't hear any concerns, I will move this to a regular
patch later this week.

Sau!

Saul Wold (3):
  image_types: Remove ELF type
  mkelfimage: Remove un-needed recipe
  oeqa/qemu: remove elf image type

 meta/classes/image_types.bbclass                   |  13 -
 meta/lib/oeqa/core/target/qemu.py                  |   2 +-
 .../mkelfimage/mkelfimage/convert.bin.c            | 348 ---------------------
 .../mkelfimage/mkelfimage/cross-compile.patch      | 106 -------
 .../mkelfimage/fix-makefile-to-find-libz.patch     |  33 --
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |  48 ---
 6 files changed, 1 insertion(+), 549 deletions(-)
 delete mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage/convert.bin.c
 delete mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch
 delete mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage/fix-makefile-to-find-libz.patch
 delete mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb

-- 
2.13.6


