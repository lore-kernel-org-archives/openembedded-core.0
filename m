Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E061B73F96
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 14:17:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 07:17:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,416,1437462000"; d="scan'208";a="776041369"
Received: from tlomotow-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.18.45])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2015 07:17:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 15:17:12 +0100
Message-Id: <cover.1440598330.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/8] buildhistory improvements
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
X-List-Received-Date: Wed, 26 Aug 2015 14:17:45 -0000

A set of improvements for the buildhistory class: 
* A fix for not pushing after making "No changes" commits
* Four fixes for the recently added package file listing functionality
* A patch to avoid errors if additional files are added at the recipe
  level in extension classes
* A couple of patches improving the commit messages


The following changes since commit f07045fcae859c902434062d1725f1348f42d1dd:

  oeqa/oetest.py: add better package search for hasPackage() (2015-08-26 08:26:37 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fixes10
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fixes10

Paul Eggleton (8):
  classes/buildhistory: ensure we push when "no changes" commits are made
  classes/buildhistory: exclude . in file listings
  classes/buildhistory: indent recently added function consistently
  classes/buildhistory: tweak buildhistory_list_pkg_files
  classes/buildhistory: fix permissions in package file listing
  classes/buildhistory: handle additional files at recipe level
  classes/buildhistory: include metadata revisions in commit message
  classes/buildhistory: add build result to commit message

 meta/classes/buildhistory.bbclass | 95 ++++++++++++++++++++++++++++-----------
 1 file changed, 70 insertions(+), 25 deletions(-)

-- 
2.1.0


