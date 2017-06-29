Return-Path: <brian.avery@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5CFD078049
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 21:38:08 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jun 2017 14:38:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,283,1496127600"; d="scan'208";a="280349486"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.28])
	by fmsmga004.fm.intel.com with ESMTP; 29 Jun 2017 14:38:09 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2017 14:41:34 -0700
Message-Id: <cover.1498760462.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] scripts: make createrepo_c run
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
X-List-Received-Date: Thu, 29 Jun 2017 21:38:11 -0000

This uses oe-run-native to run the createrepo_c native binary. RSS means we need additional steps
to run native binaries, so it is better to consolidate the logic.

-brian avery

The following changes since commit 98099349e358a9caaec8ec81f0d4abe588909cfe:

  bitbake: npm fetcher: fix unknown variable name. (2017-06-29 14:33:42 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/core/11706
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/core/11706

brian avery (1):
  scripts/oe-setup-rpmrepo: leverage oe-run-native

 scripts/oe-setup-rpmrepo | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

--
1.9.1

