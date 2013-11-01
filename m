Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3414A6CE3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 16:09:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Nov 2013 09:09:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="402213565"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.91])
	by orsmga001.jf.intel.com with ESMTP; 01 Nov 2013 09:09:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2013 16:09:42 +0000
Message-Id: <cover.1383322030.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/2] Toaster-related improvements
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
X-List-Received-Date: Fri, 01 Nov 2013 16:09:48 -0000

Adds a class that allows Toaster (the new web-based UI for analysing
build output) to receive information about packages and image files,
and updates documentation.conf (which is used by Toaster to display
descriptions in the variable listing).


The following changes since commit 0636093711547957a8f5b25322bd3e0da367cfc4:

  sgml-common: make postinst run successfully at rootfs time (2013-11-01 11:08:31 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/toaster-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/toaster-oe

Alexandru DAMIAN (1):
  toaster: add class to dump toaster-tracked data

Belen Barros Pena (1):
  documentation.conf: update contents

 meta/classes/toaster.bbclass | 110 +++++++++++++++++++++++++++++++++++++++++++
 meta/conf/documentation.conf |  23 +++++----
 2 files changed, 124 insertions(+), 9 deletions(-)
 create mode 100644 meta/classes/toaster.bbclass

-- 
1.8.1.2


