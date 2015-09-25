Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 087C277022
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 11:11:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 25 Sep 2015 04:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,586,1437462000"; d="scan'208";a="568271235"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Sep 2015 04:11:16 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	obi@opendreambox.org
Date: Fri, 25 Sep 2015 14:13:25 +0300
Message-Id: <cover.1443179044.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] connman: Always depend on xuser-account & fix D-Bus policy
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
X-List-Received-Date: Fri, 25 Sep 2015 11:11:17 -0000

Review on the policy change is appreciated: it looks clearly correct to me but
maybe there's some context I've missed.

Cheers,
  Jussi



The following changes since commit 9f66aa1a11b5b45280aa41bf4517ec56ee5f2ab2:

  bitbake: toaster: start script warning text formatting small improvement (2015-09-23 22:44:56 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/connman-policy
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/connman-policy

Jussi Kukkonen (2):
  connman: Depend on xuser-account unconditionally
  connman: Don't use a blanket "allow" D-Bus policy

 meta/recipes-connectivity/connman/connman.inc      |  8 +------
 .../connman/add_xuser_dbus_permission.patch        | 28 +++++++++++++++++++---
 2 files changed, 26 insertions(+), 10 deletions(-)

-- 
2.1.4


