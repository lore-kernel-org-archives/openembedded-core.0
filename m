Return-Path: <brian.avery@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 266B477D3A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 21:26:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 14:26:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="247902470"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by fmsmga004.fm.intel.com with ESMTP; 12 Apr 2017 14:26:26 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 14:29:11 -0700
Message-Id: <cover.1492031994.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] scripts: rss fixes for oe-find-sysroot and oe-run-native
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
X-List-Received-Date: Wed, 12 Apr 2017 21:26:28 -0000

This patch set does a couple of things:

1) revert brian's runqemu-extract-sdk patch and add in Robert's more generically useful patch.
2) Correct the suggestion oe-find-native gives if bitbake meta-ide-support has not been run
3) fix a /bin/sh to bin/bash since the script used bashisms and was failing on my dash system and worked

Partial fix for bugs 11170 && 11119, Ed's patch set required to finish off the bugs.

-brian

The following changes since commit 94467d5087ca3b13e7baac670af107550701b333:

  dev-manual, ref-manual: Edits to the "Incrementing Binary Package" section. (2017-04-12 19:35:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/ed/oe-core/rm_work-runqemu-bavery
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/ed/oe-core/rm_work-runqemu-bavery

Ed Bartosh (1):
  Revert "scripts: change way we find native tools (pseudo)"

Robert Yang (1):
  oe-find-native-sysroot: work with RSS

brian avery (2):
  oe-find-native-sysroot: add appopriate suggestion
  oe-run-native: explicitly use bash

 scripts/oe-find-native-sysroot | 59 ++++++++++++++++++++++++++++--------------
 scripts/oe-run-native          | 17 +++++++-----
 scripts/runqemu-export-rootfs  |  2 +-
 scripts/runqemu-extract-sdk    |  2 +-
 4 files changed, 53 insertions(+), 27 deletions(-)

--
1.9.1

