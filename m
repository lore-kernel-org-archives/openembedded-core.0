Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8318673BBE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 10:57:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 08 Jun 2015 03:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,573,1427785200"; d="scan'208";a="723020647"
Received: from sentry.rb.intel.com ([10.237.105.157])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2015 03:53:00 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jun 2015 13:53:06 +0300
Message-Id: <cover.1433760735.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] Fix for YOCTO #7662
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
X-List-Received-Date: Mon, 08 Jun 2015 10:57:57 -0000

The following changes since commit 20a3a36547831349d5d8b429cb35f1415a856bda:

  scripts/combo-layer: Fix exit codes and tty handling (2015-06-05 16:42:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib Ciorga/YB7662
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=Ciorga/YB7662

Cristian Iorga (1):
  insane: errors out on binaries installed by allarch-inherit recipes

 meta/classes/insane.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.1.4


