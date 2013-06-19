Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3FBAE60810
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 05:35:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5J5ZX2F025359
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Jun 2013 22:35:33 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 18 Jun 2013 22:35:33 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 19 Jun 2013 13:34:56 +0800
Message-ID: <cover.1371619993.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] V2: Update strace and fix autogen-native build failure
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
X-List-Received-Date: Wed, 19 Jun 2013 05:35:37 -0000
Content-Type: text/plain

V2:
update PACKAGECONFIG default definition of strace

The following changes since commit 1dd643b142c69ac9035e29bff11d02201638dc65:

  licences: Add SGI license (2013-06-17 16:45:37 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/update-strace
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-strace

Kai Kang (2):
  autogen-native: fix build failure on overloaded hosts
  strace: update to 4.8

 .../autogen/autogen-native_5.17.4.bb               |    3 +-
 .../autogen/files/increase-timeout-limit.patch     |   33 +
 ...ilding-when-glibc-has-a-stub-process_vm_r.patch |   54 -
 .../strace-4.7/0014-x32-update-syscall-table.patch |   91 -
 ...-x32-update-g-s-etsockopt-syscall-numbers.patch |   43 -
 .../0024-x32-add-64bit-annotation-too.patch        |  231 --
 .../0025-Add-e-trace-memory-option.patch           | 2898 --------------------
 ...ew-errno-values-for-EPROBE_DEFER-and-EOPE.patch |   36 -
 .../0027-Add-AArch64-support-to-strace.patch       |  542 ----
 .../0028-Enhance-quotactl-decoding.patch           |  391 ---
 ...029-Filter-out-redundant-32-ioctl-entries.patch |  145 -
 ...neric-ioctl-definitions-to-linux-ioctlent.patch |  571 ----
 ...-for-tracing-32-bit-ARM-EABI-binaries-on-.patch |  963 -------
 .../0032-Fix-kernel-release-string-parsing.patch   |   38 -
 .../strace/strace-4.8/git-version-gen              |  225 ++
 meta/recipes-devtools/strace/strace_4.7.bb         |   34 -
 meta/recipes-devtools/strace/strace_4.8.bb         |   32 +
 17 files changed, 292 insertions(+), 6038 deletions(-)
 create mode 100644 meta/recipes-devtools/autogen/files/increase-timeout-limit.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0014-x32-update-syscall-table.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0018-x32-update-g-s-etsockopt-syscall-numbers.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0024-x32-add-64bit-annotation-too.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0025-Add-e-trace-memory-option.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0026-linux-add-new-errno-values-for-EPROBE_DEFER-and-EOPE.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0027-Add-AArch64-support-to-strace.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0028-Enhance-quotactl-decoding.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0029-Filter-out-redundant-32-ioctl-entries.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0030-Move-asm-generic-ioctl-definitions-to-linux-ioctlent.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0031-Add-support-for-tracing-32-bit-ARM-EABI-binaries-on-.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.7/0032-Fix-kernel-release-string-parsing.patch
 create mode 100755 meta/recipes-devtools/strace/strace-4.8/git-version-gen
 delete mode 100644 meta/recipes-devtools/strace/strace_4.7.bb
 create mode 100644 meta/recipes-devtools/strace/strace_4.8.bb

-- 
1.7.5.4


