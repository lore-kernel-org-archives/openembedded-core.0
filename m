Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 50E6562135
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 23:50:53 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 22 Mar 2016 16:50:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,379,1455004800"; d="scan'208";a="71450813"
Received: from afshjern.zpn.intel.com ([10.219.16.250])
	by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2016 16:50:53 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 17:52:04 -0600
Message-Id: <1458690727-23015-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.7.3
Cc: joshua.g.lock@intel.com, aschultz@tpip.net, benjamin.esquivel@intel.com
Subject: [PATCHv2 0/3] fix icecc support
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
X-List-Received-Date: Tue, 22 Mar 2016 23:50:55 -0000

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


