Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5873A65CDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 13:58:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Nov 2014 05:58:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,332,1413270000"; d="scan'208";a="628322932"
Received: from moyraecc-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.isw.intel.com) ([10.252.122.2])
	by fmsmga002.fm.intel.com with ESMTP; 07 Nov 2014 05:57:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Nov 2014 13:57:05 +0000
Message-Id: <cover.1415368521.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [dizzy][PATCH 0/2] dizzy branch fixes
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
X-List-Received-Date: Fri, 07 Nov 2014 13:58:03 -0000

The following changes since commit 652008fd9dc909836819e5c6808c63643eff6db6:

  license.bbclass: canonicalise the licenses named with 'X+' (2014-11-05 12:02:29 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dizzy-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dizzy-fixes

Saul Wold (2):
  wget: Fix for CVE-2014-4887
  readline: Patch for readline multikey dispatch issue

 .../readline-6.3/readline-dispatch-multikey.patch  | 32 +++++++++
 meta/recipes-core/readline/readline_6.3.bb         |  3 +-
 .../wget/wget-1.15/wget_cve-2014-4877.patch        | 78 ++++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.15.bb            |  1 +
 4 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch
 create mode 100644 meta/recipes-extended/wget/wget-1.15/wget_cve-2014-4877.patch

-- 
1.9.3


