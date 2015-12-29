Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 59742607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 18:29:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 29 Dec 2015 10:29:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,496,1444719600"; d="scan'208";a="880558950"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga002.jf.intel.com with ESMTP; 29 Dec 2015 10:29:19 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Dec 2015 10:25:01 +0000
Message-Id: <cover.1451384414.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/1] rpmresolve.c: Fix unfreed pointers that keep DB opened
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
X-List-Received-Date: Tue, 29 Dec 2015 18:29:43 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

When rpmresolve is used, it keeps the DB opened because
of unfreed pointers. This patch solve this issue.

[YOCTO #8028]

The following changes since commit 2cd061a29a94fdcdfec86732e6bcbb71c12c4afc:

  bluez5: include the patch only for 5.36 (2015-12-28 13:02:11 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug8028
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug8028

Mariano Lopez (1):
  rpmresolve.c: Fix unfreed pointers that keep DB opened

 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
1.8.4.5


