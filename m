Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4CA6FA4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 16:32:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Mar 2014 09:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,704,1389772800"; d="scan'208";a="504920311"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.240])
	by orsmga002.jf.intel.com with ESMTP; 21 Mar 2014 09:31:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Mar 2014 16:31:30 +0000
Message-Id: <cover.1395419449.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 0/1] Fix passwordless logins with pam enabled
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
X-List-Received-Date: Fri, 21 Mar 2014 16:32:12 -0000

The following change since commit eb53ae4a5702dbd65b6e340bbd3ae4566157c081:

  gnome-doc-utils: removed gconf inheritance (2014-03-21 12:05:33 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/pam-nullok
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/pam-nullok

Paul Eggleton (1):
  classes/image: disable pam nullok_secure with debug-tweaks

 meta/classes/image.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.8.5.3


