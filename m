Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 842AE6017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 09:00:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Oct 2014 02:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,645,1406617200"; d="scan'208";a="609154495"
Received: from rebeccas-ilbpg2.png.intel.com ([10.88.227.41])
	by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2014 02:00:46 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Oct 2014 17:00:17 +0800
Message-Id: <1412326818-32462-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [daisy] [PATCH 0/1] lttng-modules: update version to 2.4.2
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
X-List-Received-Date: Fri, 03 Oct 2014 09:00:58 -0000

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

 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb |   38 ----------------------
 meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb |   38 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb

-- 
1.7.9.5


