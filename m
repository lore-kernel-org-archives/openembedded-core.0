Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id BA8F160CC9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 20:20:08 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 017KK8FO028724
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Feb 2020 14:20:09 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 14:20:05 -0600
Message-Id: <20200207202008.132026-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/3] Fix some package issues, and add new features
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
X-List-Received-Date: Fri, 07 Feb 2020 20:20:09 -0000

While working on baremetal toolchains, I found that the SDKs were potentially
very very large.  I investigated and found it was due to included debug info,
but realize the associated source files were not actually present.

Patch 1/3 - Fixes identification of corresponding dwarf debug sources
Patch 2/3 - Allow us to skip kernel modules and static libraries
Patch 3/3 - Add a -dbg like behavior for static libraries (off by default)


Mark Hatle (3):
  package.bbclass: Fix debug source processing for static libraries
  package.bbclass: Allow INHIBIT_PACKAGE_STRIP_FILES to skip .ko and
    static libs
  package.bbclass: Support stripping and debug copy of static libraries

 meta/classes/insane.bbclass  |  2 +-
 meta/classes/package.bbclass | 80 ++++++++++++++++++++++++++++++++----
 meta/conf/bitbake.conf       |  2 +-
 3 files changed, 73 insertions(+), 11 deletions(-)

-- 
2.17.1


