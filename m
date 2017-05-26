Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 28D3E7825F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 13:50:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 06:50:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,397,1491289200"; d="scan'208";a="1135047899"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 26 May 2017 06:50:17 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 76025580240
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 06:50:16 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 16:49:54 +0300
Message-Id: <cover.1495806200.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] image_types_wic: fix scheduling of prepare_wic_build
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
X-List-Received-Date: Fri, 26 May 2017 13:50:19 -0000

Hi,

This patch fixes wic build on machines that don't support EFI.

It also fixes build on intel-meta layer for intel-corei7-64 machine that
was broken by previous patches due to the wrong assumption that
EFI_PROVIDER recipe must be present if layer provides EFI functionality.

This patch obsoletes 2 previous patches:
 image_types_wic: schedule prepare_wic_build correctly
 image_types_wic: reschedule do_prepare_wic_build

The following changes since commit 1b131061ebe121f554b931f50ee9ff934f61b762:

  runqemu: output qemu-system errors (2017-05-26 16:37:23 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (1):
  image_types_wic: schedule prepare_wic_build correctly

 meta/classes/image_types_wic.bbclass | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

--
Regards,
Ed


