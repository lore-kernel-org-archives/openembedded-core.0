Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E6B8C6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 02:06:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBT26AWI014740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 18:06:10 -0800 (PST)
Received: from PEK-ZHE-D1.wrs.com (128.224.163.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Dec 2016 18:06:09 -0800
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Dec 2016 10:06:29 +0800
Message-ID: <cover.1482975938.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v3 0/1] kexec-tools: Upgrade to 2.0.14
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
X-List-Received-Date: Thu, 29 Dec 2016 02:06:10 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

v1 to v2: Remove redundant tarball link in SRC_URI
v2 to v3: Address Alex's comments:
          Remove kexec-aarch64.patch and kexec-x32.patch files
          Correct Upstream-Status
          Regenerate patch with git's rename detection enabled

He Zhe (1):
  kexec-tools: Upgrade to 2.0.14

 ...nd-the-semantics-of-kexec_iomem_for_each_.patch |  78 ++
 ...eneralize-and-rename-get_kernel_stext_sym.patch | 194 +++++
 ...0003-arm64-identify-PHYS_OFFSET-correctly.patch |  76 ++
 .../0004-arm64-kdump-identify-memory-regions.patch | 202 ++++++
 ...5-arm64-kdump-add-elf-core-header-segment.patch | 191 +++++
 ...6-arm64-kdump-set-up-kernel-image-segment.patch | 137 ++++
 .../0007-arm64-kdump-set-up-other-segments.patch   |  35 +
 ...-add-DT-properties-to-crash-dump-kernel-s.patch | 150 ++++
 ...-kdump-Add-support-for-binary-image-files.patch |  52 ++
 .../kexec/kexec-tools/kexec-aarch64.patch          | 801 ---------------------
 .../kexec/kexec-tools/kexec-x32.patch              |  88 ---
 ...kexec-tools_2.0.12.bb => kexec-tools_2.0.14.bb} |  15 +-
 12 files changed, 1126 insertions(+), 893 deletions(-)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-exntend-the-semantics-of-kexec_iomem_for_each_.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0003-arm64-identify-PHYS_OFFSET-correctly.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0004-arm64-kdump-identify-memory-regions.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0005-arm64-kdump-add-elf-core-header-segment.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0006-arm64-kdump-set-up-kernel-image-segment.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0007-arm64-kdump-set-up-other-segments.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0009-arm64-kdump-Add-support-for-binary-image-files.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/kexec-aarch64.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.12.bb => kexec-tools_2.0.14.bb} (55%)

-- 
2.8.3


