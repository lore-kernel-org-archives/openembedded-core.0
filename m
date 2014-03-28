Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4886B255
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 21:49:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Mar 2014 14:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,753,1389772800"; d="scan'208";a="509274578"
Received: from unknown (HELO localhost) ([10.255.12.30])
	by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2014 14:49:00 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Mar 2014 16:48:58 -0500
Message-Id: <cover.1396043171.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1] wic: env-command bugfix
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
X-List-Received-Date: Fri, 28 Mar 2014 21:49:02 -0000

While testing some new wic functionality, I noticed a bug I introduced
when adding the plugin support, which this fixes.

The following changes since commit 8c3eb5ee4582b6f6d489549290937657f37fc19e:

  packagegroup-toolset-native: Update after ocf-linux -> cryptodev-linux change (2014-03-27 19:53:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-bitbake-env-fix
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-bitbake-env-fix

Tom Zanussi (1):
  wic: Fix bitbake_env_command for 'None' case

 scripts/lib/image/engine.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
1.8.3.1


