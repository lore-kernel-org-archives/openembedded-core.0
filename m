Return-Path: <brian.avery@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D39C471D7F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 23:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491348074; x=1522884074;
	h=from:to:cc:subject:date:message-id;
	bh=ghj5r99I4+soI4rISsVMJ9ZR1BwM5qHAG28pqIXaHZo=;
	b=LRV/05DUnl492j6aj+tM7cRt4/czW/sFP/AVxGkgDAAMsKogHo80gGn1
	Yidwf5h7AMclkUvrsQQKzZnlu+kGTA==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2017 16:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,276,1486454400"; d="scan'208";a="69334334"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by orsmga002.jf.intel.com with ESMTP; 04 Apr 2017 16:21:13 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 16:23:21 -0700
Message-Id: <cover.1491347966.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] esdk: Fixes for runqemu and sysroot
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
X-List-Received-Date: Tue, 04 Apr 2017 23:21:13 -0000

The removal of STAGING_BINDIR_NATIVE broke runqemu in the esdk. This patch points the
"devtool runqemu" into the correct native bindir where the necessary tools are
located.

This fixes Bug 11223.

-brian

The following changes since commit eff56e4f0d59b1d965a68e4f009b7f07717b7edd:

  bitbake: bitbake-user-manual: Fixed special character in -D output (2017-04-03 22:32:02 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/esdk_sadqemu/bug11223
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/esdk_sadqemu/bug11223

brian avery (1):
  devtool: point runqemu to correct native bindir

 scripts/lib/devtool/runqemu.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--
1.9.1

