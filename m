Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D52CB70415
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 14:52:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jul 2014 07:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,625,1400050800"; d="scan'208";a="566758617"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.3])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2014 07:51:55 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jul 2014 09:51:54 -0500
Message-Id: <cover.1404830754.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/5] wic: Source plugin updates
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
X-List-Received-Date: Tue, 08 Jul 2014 14:52:10 -0000

This patchset adds a new 'list plugins' subcommand along with some
better error handling and messaging when users try to use
nonexistent plugins.  It also adds a new hook for general purpose
help topics and adds a 'plugins' topic as the first entry.

Addresses problems exposed in YOCTO #6481.

The following changes since commit 6879c3c903ec7d08cf0240281c83d85b4a42b6db:

  maintainers.inc: add info for libical (2014-07-08 11:20:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-plugin-updates
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-plugin-updates

Tom Zanussi (5):
  wic: Add command to list available source plugins
  wic: Add help text for 'wic list source-plugins'
  wic: Print error if a partition specifies an invalid --source
  wic: Add dummy subcommand and usage strings
  wic: Add general 'plugins' help topic

 scripts/lib/image/engine.py                        |  13 +++
 scripts/lib/image/help.py                          | 121 ++++++++++++++++++++-
 .../lib/mic/kickstart/custom_commands/partition.py |   5 +
 scripts/lib/mic/plugin.py                          |  16 +++
 scripts/wic                                        |  28 ++++-
 5 files changed, 173 insertions(+), 10 deletions(-)

-- 
1.8.3.1


