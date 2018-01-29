Return-Path: <juro.bystricky@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 70A617851A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 22:48:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jan 2018 14:39:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,432,1511856000"; d="scan'208";a="170120206"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 29 Jan 2018 14:39:32 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 14:39:44 -0800
Message-Id: <1517265587-84623-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/3] Unused patch files?
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
X-List-Received-Date: Mon, 29 Jan 2018 22:48:53 -0000

There seem to be some patch files present in the repository  that are not referenced anywhere anymore.


Juro Bystricky (3):
  tzcode: remove unused patch files
  kexec-tools: remove unused patch file
  libcrypt: remove unused patch file

 .../files/0001-Fix-Makefile-quoting-bug.patch      | 174 -----
 .../files/0002-Port-zdump-to-C90-snprintf.patch    | 115 ---
 .../kexec/kexec-tools/kexec-aarch64.patch          | 801 ---------------------
 ...g-AArch32-CE-implementations-when-target-.patch |  96 ---
 4 files changed, 1186 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
 delete mode 100644 meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/kexec-aarch64.patch
 delete mode 100644 meta/recipes-support/libgcrypt/files/0006-Fix-building-AArch32-CE-implementations-when-target-.patch

-- 
2.7.4


