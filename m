Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3FA6014F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 02:40:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2016 19:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,358,1459839600"; d="scan'208";a="987306351"
Received: from jchang2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.174.130])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2016 19:40:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:40:05 +1200
Message-Id: <cover.1464057554.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] Allow GIT_SSL_CAINFO set by buildtools-tarball to work
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
X-List-Received-Date: Tue, 24 May 2016 02:40:35 -0000

The following changes since commit d6241e4c94a0a72acfc57e96a59918c0b2146d65:

  useradd: Fix infinite build loop (2016-05-23 10:33:39 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/git-ssl-cainfo
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/git-ssl-cainfo

Paul Eggleton (2):
  oe-init-build-env: allow GIT_SSL_CAINFO from external environment
  conf/bitbake.conf: whitelist GIT_SSL_CAINFO

 meta/conf/bitbake.conf       | 3 ++-
 scripts/oe-buildenv-internal | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.5.5


