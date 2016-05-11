Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA5962135
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 03:07:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4B37Cle004194
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 20:07:12 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 20:07:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2016 20:07:06 -0700
Message-ID: <cover.1462935990.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/5] [jethro] Consolidated pull
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
X-List-Received-Date: Wed, 11 May 2016 03:07:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The following changes since commit 69b49e8dc45cf60defba547d93e663df42c92127:

  boot-directdisk.bbclass: remove HDDIMG before create (2016-05-09 14:37:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/jethro-next

André Draszik (1):
  gdb: fix QA warning (uClibc)

Martyn Welch (1):
  glew: Correct version in autotooling patches

Tom Zanussi (1):
  Revert "kernel/kernel-arch: Explicitly mapping between, i386/x86_64
    and x86 for kernel ARCH"

Tristan Van Berkom (1):
  binutils: backport bug fix to the 2.25 branch for jethro

Yuanjie Huang (1):
  glibc: Fix CVE-2015-8778

 meta/classes/kernel-arch.bbclass                   |   4 +-
 meta/classes/kernel.bbclass                        |  15 +-
 meta/recipes-core/glibc/glibc/CVE-2015-8778.patch  | 199 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |   1 +
 meta/recipes-devtools/binutils/binutils-2.25.1.inc |   1 +
 ...plying-TLSDESC-relocs-without-TLS-segment.patch | 166 +++++++++++++++++
 meta/recipes-devtools/gdb/gdb-common.inc           |   2 +-
 meta/recipes-graphics/glew/glew/autotools.patch    |   4 +-
 .../glew/glew/fix-glew.pc-install.patch            |   2 +-
 9 files changed, 375 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8778.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/fix-internal-error-when-applying-TLSDESC-relocs-without-TLS-segment.patch

-- 
2.8.0


