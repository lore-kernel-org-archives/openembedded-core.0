Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD8D9701C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 01:16:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s6V1GTsk020569
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 18:16:29 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 30 Jul 2014 18:16:28 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jul 2014 20:16:24 -0500
Message-ID: <cover.1406769215.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH 0/3] Misc toolchain patches
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
X-List-Received-Date: Thu, 31 Jul 2014 01:16:29 -0000
Content-Type: text/plain

A few misc toolchain fixes/patches.  This serials corrects a couple of issues
noticed when working with an external binary toolchain, as well as when
generating an SDK.

The following changes since commit 7986adeac16550b33f65fded39a55f668e0e543f:

  populate_sdk_base: Fix grep command usage on old hosts (2014-07-29 09:57:54 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mhatle/tc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/tc

Mark Hatle (3):
  gcc: Fix gcc-multilib-config comparison
  tune-mips*: Ensure tunes are inherited in order
  sanity.bbclass: Add ability to verify toolchain flags

 meta/classes/sanity.bbclass                       | 52 ++++++++++++++++++++---
 meta/conf/machine/include/tune-mips32r2.inc       |  2 +-
 meta/conf/machine/include/tune-mips64.inc         |  2 +-
 meta/recipes-devtools/gcc/gcc-multilib-config.inc |  2 +-
 4 files changed, 49 insertions(+), 9 deletions(-)

-- 
1.9.3


