Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7B2876017E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 17:02:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 30 Dec 2014 09:00:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="435018729"
Received: from kolmos-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.19.251])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Dec 2014 08:50:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Dec 2014 17:02:05 +0000
Message-Id: <cover.1419958884.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [dizzy][PATCH 0/2] Backport fixes for git-perltools split
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
X-List-Received-Date: Tue, 30 Dec 2014 17:02:17 -0000

The following changes since commit 1cf1edcd28a002291622d04dd2d0ee2c67e329e4:

  buildtools-tarball: package all of Python (2014-12-11 16:34:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dizzy-git-tools
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dizzy-git-tools

Jackie Huang (1):
  packagegroup-self-hosted: add git-perltools

Paul Eggleton (1):
  buildtools-tarball: restore missing git tools

 meta/recipes-core/meta/buildtools-tarball.bb          |  4 ++++
 .../meta/nativesdk-buildtools-perl-dummy.bb           | 19 +++++++++++++++++++
 .../packagegroups/packagegroup-self-hosted.bb         |  1 +
 3 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb

-- 
1.9.3


