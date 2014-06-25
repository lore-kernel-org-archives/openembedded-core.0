Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD6D565DB4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:28:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5P0S8CX024219
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 17:28:10 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 24 Jun 2014 17:28:08 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jun 2014 19:28:03 -0500
Message-ID: <cover.1403655933.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH 0/4] Misc fixes around SDK and package management
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
X-List-Received-Date: Wed, 25 Jun 2014 00:28:14 -0000
Content-Type: text/plain

While working with meta-mingw and some related toolchain SDKs, I found
a number of minor issues.  These 4 fixes correct the issues observed.

Note RPM is not capable of installing meta-mingw into an SDK.  You must
still use IPK for that.  I'll continue to work on a fix for that.

The following changes since commit 41bd9dbf6f3e0add6a9e2cb20cfcbff44d785ea4:

  syslinux: fix isohybird overflows on 32 bit system (2014-06-24 19:53:02 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mhatle/oe-core
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/oe-core

Mark Hatle (4):
  classes/package_rpm.bbclass: Fix SDK Suffix reference
  populate_sdk: Fix TOOLCHAIN_TARGET_TASK_ATTEMPTONLY implementation
  gcc-cross-canadian: Add configure-target-libgcc
  lib/oe/package_manager.py: Add processing for alternative SDK_OS

 meta/classes/package_rpm.bbclass                 |  3 ++-
 meta/classes/populate_sdk_base.bbclass           |  1 +
 meta/lib/oe/manifest.py                          |  2 +-
 meta/lib/oe/package_manager.py                   |  6 +++++-
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 13 ++++++++++---
 5 files changed, 19 insertions(+), 6 deletions(-)

-- 
1.9.3


