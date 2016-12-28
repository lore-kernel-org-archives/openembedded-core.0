Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 30B5E719ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 13:02:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 28 Dec 2016 05:02:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,422,1477983600"; d="scan'208";a="802981675"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Dec 2016 05:02:45 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2016 15:02:36 +0200
Message-Id: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/8] oeqa.utils.metadata: update xml schema
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
X-List-Received-Date: Wed, 28 Dec 2016 13:02:45 -0000

This patchset extends and modifies the xml format of the test metadata report.
The goal is to make the data more comprehensive in slightly more consistent
format.

The following changes since commit 425afe2484707640ac71194885fdb263e95e9950:

  lib/oe/utils: Drop python2 compatibility code (2016-12-22 08:50:21 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/oeqa-metaxml
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/oeqa-metaxml


Markus Lehtonen (8):
  oeqa.utils.metadata: re-organise host distro information
  oeqa.utils.metadata: re-organise distro information
  oeqa.utils.metadata: drop 'unknown' git data elements
  oeqa.utils.metadata: fix retrieval of git branch and revision
  oeqa.utils.metadata: rename 'revision' to 'commit'
  oeqa.utils.metadata: add commit count information
  oeqa.utils.metadata: have layer name as an attribute in xml
  oeqa.utils.metadata: add bitbake revision information

 meta/lib/oeqa/utils/metadata.py | 81 ++++++++++++++++++++++++++++-------------
 scripts/oe-selftest             |  8 ++--
 2 files changed, 59 insertions(+), 30 deletions(-)

-- 
2.6.6


