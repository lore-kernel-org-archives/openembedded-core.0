Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8946660017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 01:38:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 23 Mar 2016 18:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,383,1455004800"; d="scan'208";a="917593309"
Received: from afshjern.zpn.intel.com ([10.219.16.250])
	by orsmga001.jf.intel.com with ESMTP; 23 Mar 2016 18:38:08 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 19:39:08 -0600
Message-Id: <1458783551-757-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.7.3
Cc: joshua.g.lock@intel.com, aschultz@tpip.net, benjamin.esquivel@intel.com
Subject: [PATCHv3 0/3] fix icecc support
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
X-List-Received-Date: Thu, 24 Mar 2016 01:38:09 -0000

The commits related to this fix are provided in order of
importance.

1/3 - the actual fix, it adds a check for the
  inheritance of allarch in icecc.bbclass

2/3 - optional, makes it so that PACKAGE_ARCH is
  expanded ib icc_is_allarch, as it may contain
  unexpanded variables

3/3 - optional, replace icc with icecc to avoid
  confusing the Icecream compiler (icecc) with the
  Intel C compiler (icc)

Changes since v2: use of getVar(VAR, True) for expansion
Changes since v1: inheritance check instead of disabling

note: an additional related documentation patch is
  being sent to the documentation mailing list

Alex Franco (4):
  icecc.bbclass: add icc_is_allarch inherit check
  icecc.bbclass: expand package arch
  icecc.bbclass: replace icc with icecc

 documentation/ref-manual/ref-classes.xml |  2 +-
 meta/classes/icecc.bbclass               | 61 +++++++++++++++++---------------
 2 files changed, 33 insertions(+), 30 deletions(-)

-- 
2.7.3


