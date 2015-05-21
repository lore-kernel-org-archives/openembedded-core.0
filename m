Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE2260168
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 12:16:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2015 05:16:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,468,1427785200"; d="scan'208";a="733043658"
Received: from lpobrien-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.1.32])
	by orsmga002.jf.intel.com with ESMTP; 21 May 2015 05:16:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 13:16:33 +0100
Message-Id: <cover.1432210537.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Work around missing git user config in buildhistory
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
X-List-Received-Date: Thu, 21 May 2015 12:16:41 -0000

The following change since commit fe7780a9bbbfa4dcbbe457618a0842e91a3c6a0e:

  libxdmcp: make libbsd usage deterministic (2015-05-21 10:48:41 +0100)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-gituser
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-gituser

Paul Eggleton (1):
  classes/buildhistory: ensure that git user email and name are set

 meta/classes/buildhistory.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.1.0


