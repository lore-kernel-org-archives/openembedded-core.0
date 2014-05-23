Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 868C06ABDB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 18:13:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2014 11:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,895,1392192000"; d="scan'208";a="536721467"
Received: from bidesilv-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.159])
	by fmsmga001.fm.intel.com with ESMTP; 23 May 2014 11:13:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 May 2014 19:12:55 +0100
Message-Id: <cover.1400868743.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/4] Various script improvements
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
X-List-Received-Date: Fri, 23 May 2014 18:13:06 -0000

The following changes since commit f1727bb18f35ff01e53d3d442a6ff3c613639fa6:

  guile: Update to 2.0.11 version (2014-05-21 10:50:37 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/script-improvements
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/script-improvements

Paul Eggleton (4):
  scripts: consolidate code to find bitbake path
  list-packageconfig-flags: filter out doc and defaultval varflags
  list-packageconfig-flags: improve option parsing
  oe-pkgdata-util: fix help text

 scripts/bitbake-whatchanged                 |  18 ++--
 scripts/buildhistory-diff                   |  28 +++----
 scripts/contrib/list-packageconfig-flags.py | 122 +++++++++++-----------------
 scripts/lib/scriptpath.py                   |  42 ++++++++++
 scripts/oe-pkgdata-util                     |   2 +-
 5 files changed, 111 insertions(+), 101 deletions(-)
 create mode 100644 scripts/lib/scriptpath.py

-- 
1.9.0


