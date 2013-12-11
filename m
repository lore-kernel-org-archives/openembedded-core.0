Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 60B066A463
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 19:06:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Dec 2013 11:06:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,873,1378882800"; d="scan'208";a="448496763"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.240])
	by fmsmga002.fm.intel.com with ESMTP; 11 Dec 2013 11:06:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2013 19:06:15 +0000
Message-Id: <cover.1386788633.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [dylan][PATCH 0/2] Backports from master (cover letter only)
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
X-List-Received-Date: Wed, 11 Dec 2013 19:06:55 -0000

A couple of patches that I missed in the recent series.


The following changes since commit 32c064e567aaba18dfb07b171dde9cc43d0e6de8:

  license.bbclass: include all licenses in the manifest (2013-12-03 16:49:24 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-next

Christopher Larson (1):
  package.bbclass: ensure license excluded files aren't packaged

Nicolas Dechesne (1):
  image-mklibs: ensure sysroot is correctly set when calling gcc

 meta/classes/image-mklibs.bbclass | 1 +
 meta/classes/package.bbclass      | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
1.8.1.2


