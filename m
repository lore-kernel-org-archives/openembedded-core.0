Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 21DE2731FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 14:13:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jan 2016 06:13:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,350,1449561600"; d="scan'208";a="868951768"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 26 Jan 2016 06:13:25 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 16:13:23 +0200
Message-Id: <1453817605-19259-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Improve externalsrc task dependency tracking
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
X-List-Received-Date: Tue, 26 Jan 2016 14:13:53 -0000

This patchset improves task hashing of do_compile when externalsrc is enabled.
Previously, it was simply a 'nostamp' task that was always being (re-)run. This
patchset changes externalsrc to utilize the file-checksum dependency feature of
tasks to really track changes in the source tree, and thus, aims in preventing
unneeded (re-)compilations.

[YOCTO #8853]


The following changes since commit fc4209baa098caebf9c4cb75f9a6f2e85f43333c:

  Revert "xz: Allow to work with ASSUME_PROVIDED xz-native" (2016-01-25 10:08:25 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/devtool/fixes


Markus Lehtonen (2):
  externalsrc.bbclas: remove nostamp from do_configure
  devtool: create-workspace: define separate cache for task file
    checksums

 meta/classes/externalsrc.bbclass | 3 +--
 scripts/devtool                  | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.1.4


