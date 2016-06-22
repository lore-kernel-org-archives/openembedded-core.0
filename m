Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 416C2601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 19:35:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jun 2016 12:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; d="scan'208";a="833370308"
Received: from yocto-dev86.jf.intel.com ([10.7.198.60])
	by orsmga003.jf.intel.com with ESMTP; 22 Jun 2016 12:35:04 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2016 12:35:51 -0700
Message-Id: <20160622193552.14761-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.3
Subject: [PATCH][for-krogoth] backport staticid fix
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
X-List-Received-Date: Wed, 22 Jun 2016 19:35:05 -0000

I've backported this from master and tested.

[ YOCTO #9777 ]

Peter Kjellerstedt (1):
  useradd-staticids.bbclass: Restore failure on missing UIDs/GIDs

 meta/classes/useradd-staticids.bbclass | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

-- 
2.8.3


