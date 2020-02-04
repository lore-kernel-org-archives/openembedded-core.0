Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 03C4960706
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 21:06:37 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 014L6UMs009706;
	Tue, 4 Feb 2020 15:06:32 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2020 15:06:25 -0600
Message-Id: <20200204210630.41960-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v4 0/5] Microblaze tune updates
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
X-List-Received-Date: Tue, 04 Feb 2020 21:06:38 -0000

Version 4 of the patch set.

I've collected all of the patches resently sent, and reworked them per
the comments on the mailing list.

The patches are directly available at:

git://git.openembedded.org/openembedded-core-contrib mgh/xilinx-microblaze

The work was broken up into a few more individual pieces.  This will allow
backports to Zeus for fixes vs new features.

Mark Hatle (5):
  microblaze tune: change microblazeeb to microblaze
  microblaze tune: Allow no version to be set
  microblaze tune: Enable 64-bit
  microblaze tune: cleanup +=
  Microblaze: Adjust Linux items from microblazeeb to microblaze

 meta/classes/meson.bbclass                    |  2 +-
 meta/classes/siteinfo.bbclass                 |  3 --
 .../include/microblaze/arch-microblaze.inc    | 35 ++++++++++++-------
 .../microblaze/feature-microblaze-math.inc    | 12 +++----
 .../feature-microblaze-versions.inc           |  4 +--
 meta/lib/oe/elf.py                            |  3 --
 .../{microblazeeb => microblaze}/objarch.h    |  0
 7 files changed, 31 insertions(+), 28 deletions(-)
 rename meta/recipes-extended/ghostscript/ghostscript/{microblazeeb => microblaze}/objarch.h (100%)

-- 
2.17.1


