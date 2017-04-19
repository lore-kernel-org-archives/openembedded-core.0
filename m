Return-Path: <brian.avery@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 53E5671C54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 19:46:13 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Apr 2017 12:46:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,222,1488873600"; d="scan'208";a="78950565"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by orsmga004.jf.intel.com with ESMTP; 19 Apr 2017 12:46:14 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 12:49:01 -0700
Message-Id: <cover.1492631156.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] meta: save relative paths to qemuboot.conf and testdata.json
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
X-List-Received-Date: Wed, 19 Apr 2017 19:46:14 -0000

This patch set changes the behaviour to save relative paths instead of absolute paths into the qemuboot.conf and the testdata.json files.
A sed test verified that this seems to work without complication. If certain variables, need to be excluded from this relative path fix, that can be
done with subsequent patches.

This is to fix YOCTO #11375 https://bugzilla.yoctoproject.org/show_bug.cgi?id=11375

-brian

The following changes since commit 1423508b29fc557d8a1305f39c33de33e28d9003:

  bitbake: bitbake: Update version to 1.34.0 for stable release (2017-04-19 10:42:12 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/poky/relpath_11375
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/poky/relpath_11375

brian avery (3):
  meta: add search,replace strings to export2json
  rootfs-postcommands.bbclass: save relative paths
  qemuboot.bbclass: save relative paths in conf file

 meta/classes/qemuboot.bbclass            | 7 +++++++
 meta/classes/rootfs-postcommands.bbclass | 8 +++++---
 meta/lib/oe/data.py                      | 6 ++++--
 3 files changed, 16 insertions(+), 5 deletions(-)

--
1.9.1

