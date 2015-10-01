Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 90851770A3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 18:50:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 01 Oct 2015 11:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,619,1437462000"; d="scan'208";a="572293142"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Oct 2015 11:50:39 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 10:40:45 +0000
Message-Id: <cover.1443694820.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/2] Unicode support for Report Error and Qemu
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
X-List-Received-Date: Thu, 01 Oct 2015 18:50:40 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

These two patches add Unicode support for the report error bbclass
and the qemu bootlog.

[YOCTO #8225]


The following changes since commit eac61f37e36099f74485dab398b57f3812826d17:

  build-appliance-image: Update to jethro head revision (2015-10-01 17:55:11 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug8225p2v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug8225p2v2

Mariano Lopez (2):
  report-error.bbclass: Support Unicode reports
  oeqa/utils/qemurunner: Add support for Unicode from qemu

 meta/classes/report-error.bbclass | 11 +++++++----
 meta/lib/oeqa/utils/qemurunner.py | 15 +++++++++++----
 2 files changed, 18 insertions(+), 8 deletions(-)

-- 
1.8.4.5


