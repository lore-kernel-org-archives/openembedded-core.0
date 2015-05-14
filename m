Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3117D6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 18:01:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 May 2015 11:01:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,430,1427785200"; d="scan'208";a="694972222"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.30.48])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2015 11:01:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 19:01:39 +0100
Message-Id: <cover.1431626401.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [dizzy][PATCH 0/2] dizzy backports
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
X-List-Received-Date: Thu, 14 May 2015 18:01:56 -0000

A couple of backports from master; Fabrice requested his one and
I noticed the other hadn't yet been backported in the process.


The following changes since commit 4a44c9287d80dec0973b31d30d3d6250ce4b4df4:

  init-install-efi.sh: fix gummiboot entry installation (2015-05-01 12:35:26 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dizzy-strip
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dizzy-strip

Ed Bartosh (1):
  split_and_strip_files: regroup hardlinks to make build deterministic

Fabrice Coulon (1):
  meta/lib/oe/package.py: fix files ownership in packages

 meta/classes/package.bbclass | 48 ++++++++++++++++++++++++--------------------
 meta/lib/oe/package.py       |  3 +--
 2 files changed, 27 insertions(+), 24 deletions(-)

-- 
2.1.0


