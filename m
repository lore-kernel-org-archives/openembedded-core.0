Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8D64265C7C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 13:53:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 07 Nov 2014 05:47:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="413010237"
Received: from moyraecc-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.isw.intel.com) ([10.252.122.2])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Nov 2014 05:45:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Nov 2014 13:52:30 +0000
Message-Id: <cover.1415368311.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/1] readline fix
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
X-List-Received-Date: Fri, 07 Nov 2014 13:54:03 -0000

The following change since commit dd93b3a950d063f4e3020362c636006f51fb5782:

  image_types.bbclass: whitespace and reorder (2014-11-06 16:41:38 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/readline-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/readline-fix

Saul Wold (1):
  readline: Patch for readline multikey dispatch issue

 .../readline-6.3/readline-dispatch-multikey.patch  | 32 ++++++++++++++++++++++
 meta/recipes-core/readline/readline_6.3.bb         |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch

-- 
1.9.3


