Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E9411782C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:46:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 30 Aug 2017 16:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="1189997541"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2017 16:46:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:46:21 +1200
Message-Id: <cover.1504136074.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 0/1] classes/license: drop erroneous sha256 parameter in LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 30 Aug 2017 23:46:59 -0000

Drop what seems to be an erroneous parameter from LIC_FILES_CHKSUM
handling code.


The following changes since commit 62f1122ef166eba56441d669c6b3b3fe5f367418:

  bluez5: cosmetic fixes to bluetooth bootscript (2017-08-30 11:13:52 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/lic-sha256-drop
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/lic-sha256-drop

Paul Eggleton (1):
  classes/license: drop erroneous sha256 parameter in LIC_FILES_CHKSUM

 meta/classes/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.9.5


