Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1D79477A8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 14:57:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2018 07:57:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,338,1526367600"; d="scan'208";a="63922091"
Received: from bucksteg-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.38.111])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jul 2018 07:57:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2018 16:56:48 +0200
Message-Id: <cover.1531320900.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/3] Buildhistory fixes
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
X-List-Received-Date: Wed, 11 Jul 2018 14:57:03 -0000

Fixes for a couple of buildhistory bugs in YP bugzilla plus one extra
that I found in the process.


The following changes since commit f9324af88a99eca28b160fa31aa4516fd397e44b:

  distutils3: pass build arguments when doing a clean (2018-07-10 11:10:14 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fixes2
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/buildhistory-fixes2

Paul Eggleton (3):
  lib/oe/buildhistory_analysis: drop related field feature
  classes/buildhistory: handle packaged files with names containing
    spaces
  classes/buildhistory: properly process escaped chars from pkgdata

 meta/classes/buildhistory.bbclass    |  5 ++--
 meta/lib/oe/buildhistory_analysis.py | 42 ++++++++--------------------
 2 files changed, 15 insertions(+), 32 deletions(-)

-- 
2.17.1


