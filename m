Return-Path: <brian.avery@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CCF0D60670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 22:03:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 19 May 2016 15:03:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,336,1459839600"; d="scan'208";a="958388726"
Received: from bavery-ws-desk.jf.intel.com ([10.7.201.28])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2016 15:03:31 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 15:04:36 -0700
Message-Id: <cover.1463695255.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] [PATCHV2] gdb: Backport 7.12 features supporting AVX and MPX
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
X-List-Received-Date: Thu, 19 May 2016 22:03:31 -0000

The current MPX target descriptions assume that MPX is always combined
with AVX, however that's not correct.  We can have machines with MPX
and without AVX; or machines with AVX and without MPX.

This patch adds new target descriptions for machines that support
both MPX and AVX, as duplicates of the existing MPX descriptions.

The following commit will remove AVX from the MPX-only descriptions.

This commit is backported from 7.12

-bavery

The following changes since commit c9867c4624b88fb19deacf70b7a3ff46d4fa4699:

  bitbake: cooker: Improve taskgraph file handling (2016-05-19 15:19:11 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/gdb-7.11-avxmpx-backport
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/gdb-7.11-avxmpx-backport

bavery (1):
  gdb: Backport patch to changes with AVX and MPX

 meta/recipes-devtools/gdb/gdb-common.inc         |    2 +-
 meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch | 2601 ++++++++++++++++++++++
 2 files changed, 2602 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch

--
1.9.1

