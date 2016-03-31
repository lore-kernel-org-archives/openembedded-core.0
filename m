Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5700E607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 08:47:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 31 Mar 2016 01:47:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,421,1455004800"; d="scan'208";a="922433230"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.133.74])
	by orsmga001.jf.intel.com with ESMTP; 31 Mar 2016 01:47:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 21:47:01 +1300
Message-Id: <cover.1459413941.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] Tweak for linux-yocto SRC_URI
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
X-List-Received-Date: Thu, 31 Mar 2016 08:47:55 -0000

The following changes since commit e3fc8ef152494e9b7cff8de110a784150295f17e:

  recipes-support/rng-tools: Change runlevel start from S to 2, 3, 4, 5. (2016-03-30 21:32:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/kernel-src-uri-tidy
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/kernel-src-uri-tidy

Paul Eggleton (1):
  linux-yocto: add patch in existing SRC_URI value rather than using _append

 meta/recipes-kernel/linux/linux-yocto_4.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.5.5


