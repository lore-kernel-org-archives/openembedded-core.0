Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 21F0B6B5A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 20:46:41 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Aug 2013 13:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,848,1367996400"; d="scan'208";a="344195750"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.176])
	by azsmga001.ch.intel.com with ESMTP; 09 Aug 2013 13:46:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 13:46:38 -0700
Message-Id: <1376081200-12061-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/2] Current Groff is really GPLv3!
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
X-List-Received-Date: Fri, 09 Aug 2013 20:46:41 -0000

Turns out that a groff update was done sometime ago, and while committer
noted the license checksum changed, they did not verify the true nature
of the change.  I caught this by total chance looking at the license 
manifest directory.

Saul Wold (2):
  groff: Add GPLv2 version
  groff: Fix License to be GPLv3

 .../groff-1.18.1.4/groff-1.18.1.4-remove-mom.patch | 35 ++++++++++++++++
 .../groff/groff-1.18.1.4/man-local.patch           | 32 +++++++++++++++
 .../groff/groff-1.18.1.4/mdoc-local.patch          | 31 +++++++++++++++
 meta/recipes-extended/groff/groff_1.18.1.4.bb      | 46 ++++++++++++++++++++++
 meta/recipes-extended/groff/groff_1.22.2.bb        |  2 +-
 5 files changed, 145 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/groff-1.18.1.4-remove-mom.patch
 create mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/man-local.patch
 create mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/mdoc-local.patch
 create mode 100644 meta/recipes-extended/groff/groff_1.18.1.4.bb

-- 
1.8.1.4


