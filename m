Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1T9486-0001ev-NF
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 03:10:06 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Sep 2012 17:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,371,1344236400"; d="scan'208";a="188954927"
Received: from envy.jf.intel.com (HELO envy) ([10.7.201.159])
	by orsmga001.jf.intel.com with ESMTP; 04 Sep 2012 17:57:42 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id q850uckJ031726;
	Tue, 4 Sep 2012 17:56:38 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q850uchI031725;
	Tue, 4 Sep 2012 17:56:38 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 17:56:29 -0700
Message-Id: <cover.1346806132.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Add adt-installer-dev target for QA use
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 01:10:07 -0000

This is the first step in fixing the long standing QA complaint of having
no good way of testing ADTREPO:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=2800
https://bugzilla.yoctoproject.org/show_bug.cgi?id=1877
https://bugzilla.yoctoproject.org/show_bug.cgi?id=2718

This target will be added to most autobuilder buildouts and the autobuilder
will populate adtrepo-dev from the artifacts. This ensures that released build
artifacts are jailed off and cannot be accidentally destroyed while ensuring 
QA has something to test.

The following changes since commit 99c85ba93075a1aff789cafabbacf42e6a93bd32:

  build-appliance-image: Update to latest poky master (2012-09-04 18:04:40 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/adtfix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/adtfix

Elizabeth Flanagan (1):
  adt-installer: Add adt-installer-dev.bb

 .../installer/adt-installer-dev_1.0.bb             |   26 ++++++++++++++++++++
 .../installer/adt-installer/adt_installer.conf     |    2 +-
 2 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/installer/adt-installer-dev_1.0.bb

-- 
1.7.5.4



