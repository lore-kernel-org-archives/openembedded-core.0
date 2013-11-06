Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 98E8D6D46B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 13:08:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Nov 2013 05:04:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="404450827"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by orsmga001.jf.intel.com with ESMTP; 06 Nov 2013 05:08:02 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2013 15:07:57 +0200
Message-Id: <cover.1383742507.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 0/1] flex: fix m4 issue on target
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
X-List-Received-Date: Wed, 06 Nov 2013 13:08:20 -0000

v2:
 * changed the implementation as per Enrico Scholz's suggestion (thanks);

Laurentiu

The following changes since commit d6cc7c8ed76c8b1117cf03c7bd4b0742f98f79b3:

  toolchain-scripts/meta-environment: Further cleanup code duplication (2013-11-06 11:02:27 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5329_flex_issue_target
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5329_flex_issue_target

Laurentiu Palcu (1):
  flex: fix m4 issue on target

 meta/recipes-devtools/flex/flex.inc |    5 +++++
 1 file changed, 5 insertions(+)

-- 
1.7.9.5


