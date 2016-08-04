Return-Path: <california.l.sullivan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D80536E5CB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 23:39:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 03 Aug 2016 16:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,468,1464678000"; d="scan'208";a="1008007497"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga001.jf.intel.com with ESMTP; 03 Aug 2016 16:39:41 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2016 19:36:35 -0700
Message-Id: <1470278197-30440-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] Update SERIAL_CONSOLES_CHECK to allow aliasing
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
X-List-Received-Date: Wed, 03 Aug 2016 23:39:42 -0000

This patch set fixes the corner case described in [YOCTO #9440] and
updates its documentation. The documentation was not up to date with
what the code actually does, and I added to its functionality, so it
needed to be completely rewritten.

Scott, please review the documentation patch and feel free to update
it however you see fit. I'm not the best writer and I'm not confident
the description I gave is sufficient.

Thanks,
Cal Sullivan

California Sullivan (2):
  sysvinit-inittab_2.88dsf.bb: Allow aliasing with SERIAL_CONSOLES_CHECK
  documentation/ref-manual: Update SERIAL_CONSOLES_CHECK description

 documentation/ref-manual/ref-variables.xml             | 12 ++++++++----
 meta/conf/documentation.conf                           |  2 +-
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb |  7 +++++--
 3 files changed, 14 insertions(+), 7 deletions(-)

-- 
2.5.5


