Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0D94A6F865
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 23:13:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Mar 2014 16:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,673,1389772800"; d="scan'208";a="493948200"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.82])
	by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2014 16:13:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Mar 2014 23:13:36 +0000
Message-Id: <cover.1395097868.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [dylan][PATCH 0/1] Fix for eglibc-initial failure for 1.4.3
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
X-List-Received-Date: Mon, 17 Mar 2014 23:13:47 -0000

Fixes the eglibc-initial do_configure failure seen on the Yocto Project
autobuilder. Backported from master. 


The following change since commit c3f1bedb2494a2465db23a4d89b9f998db953f0d:

  rpm: Enable compatibility with older RPM packages that have invalid platforms (2014-03-12 19:00:34 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-sstate
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-sstate

Richard Purdie (1):
  sstate: Drop 'SafeDep' code from setscene validation function

 meta/classes/sstate.bbclass | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

-- 
1.8.5.3


