Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DE2C465D56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 02:08:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 12 Oct 2014 19:06:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,707,1406617200"; d="scan'208";a="587747004"
Received: from rebeccas-ilbpg2.png.intel.com ([10.88.227.41])
	by orsmga001.jf.intel.com with ESMTP; 12 Oct 2014 19:08:46 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Oct 2014 10:08:42 +0800
Message-Id: <1413166123-2719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [daisy] [PATCHv2 0/1] lttng-modules: update version to 2.4.2
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
X-List-Received-Date: Mon, 13 Oct 2014 02:08:51 -0000

Changelog V2:
- Remove bio-bvec-iter.patch from the repo since it was fixed in version 2.4.2

Hi all,

This is a fix for [YOCTO #6788] where we encounter lttng-modules build
failure with kernel version 3.10.43.

Upgrading the lttng-modules version to 2.4.2 and also removed additional
patch (bio-bvec-iter.patch) as its fix is already available in version 2.4.2.

This version of lttng-modules has been verified with kernel version 3.10.43
and older kernel version 3.10.40 to ensure it does not break older kernel
version build. It is also being verified with kernel 3.14.4.

Thank you.

Regards,
Rebecca

Chang Rebecca Swee Fun (1):
  lttng-modules: Update to version 2.4.2

 .../lttng/lttng-modules/bio-bvec-iter.patch        |  156 --------------------
 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb   |   38 -----
 meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb   |   38 +++++
 3 files changed, 38 insertions(+), 194 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb

-- 
1.7.9.5


