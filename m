Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA0375D8A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 10:59:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jul 2015 03:59:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,431,1432623600"; d="scan'208";a="520745263"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2015 03:59:49 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 13:59:47 +0300
Message-Id: <1436353189-21566-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 0/2] combo-layer pull changes
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
X-List-Received-Date: Wed, 08 Jul 2015 10:59:54 -0000

These patches are an effort to make combo-layer pull operation a bit more
predictable. The first patch avoids unwanted merge commits in local component
repositories by requiring fast-forward when pulling. The second patch adds a
--hard-reset command line option to make sure that the local component
repositories are always in sync with the remote.


The following changes since commit df6ddc4bf9795212fda87f9d401893eb254074da:

  file: fix long-options (2015-07-07 23:57:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/combo-layer


Markus Lehtonen (2):
  combo-layer: only allow fast-forward when pulling
  combo-layer: implement --hard-reset option

 scripts/combo-layer | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

-- 
2.1.4


