Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 980786AC49
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 18:33:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2014 11:32:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,278,1413270000"; d="scan'208";a="627816976"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.154])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2014 11:33:52 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 12:34:12 -0600
Message-Id: <1414607656-12144-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] license_class: Added support for LICENSE_PRIORITY in manifest creation
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
X-List-Received-Date: Wed, 29 Oct 2014 18:33:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now you can specify LICENSE_PRIOTIY that enables the distro to set the license
preferences for manifest creation.

The major change is when you have OR'ed LICENSE only one is choose according
LICENSE_PRIORITY preferences if LICENSE_PRIORITY isn't specified the left one
is choosen.

The test was done building qemux86/core-image-sato with and without these set of
patches and then run diff recursive under common-licenses created directory.

You can find a tarball with common-license directories, resulted diff and 
local.conf at:

https://bugzilla.yoctoproject.org/attachment.cgi?id=2223

Aníbal Limón (4):
  license_class: Reimplemented manifest creation in python
  license_class: Added support for INCOMPATIBLE_LICENSE into
    license_create_manifest
  license_class: Added LICENSE_PRIORITY support
  license_class: Fix remove + trim in license_create_manifest.

 meta/classes/license.bbclass | 250 ++++++++++++++++++++++++++++---------------
 meta/conf/documentation.conf |   1 +
 2 files changed, 164 insertions(+), 87 deletions(-)

-- 
1.9.1


