Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SJsId-0004Xr-JL
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 22:13:23 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Apr 2012 13:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="130305538"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga001.jf.intel.com with ESMTP; 16 Apr 2012 13:03:57 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 13:09:08 -0700
Message-Id: <cover.1334606582.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2] Image description fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2012 20:13:23 -0000

[YOCTO #2227]

This changeset fixes two issues.

core-image-rt* DESCRIPTION: because of the require for core-image-minimal,
DESCRIPTION is reset to the imported value. Moved the require to the beginning.

A better solution may be to set all the image DESCRIPTIONS to ?= but that
may introduce some issues. 

This also fixes a small typo in core-image-sato-sdk.

The following changes since commit 5326847ef821c382aac26b474ab0e35939c463b7:

  Hob: fixed a little view issue about package selection page (2012-04-16 12:56:25 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/image_desc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/image_desc

Beth Flanagan (2):
  core-image-rt-*.bb: require munges DESCRIPTION
  core-image-sato-sdk: typo in DESCRIPTION

 meta/recipes-rt/images/core-image-rt-sdk.bb     |    3 +--
 meta/recipes-rt/images/core-image-rt.bb         |    3 +--
 meta/recipes-sato/images/core-image-sato-sdk.bb |    2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)



