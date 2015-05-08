Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5EAA260034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 20:41:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 08 May 2015 13:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,393,1427785200"; d="scan'208";a="491228616"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by FMSMGA003.fm.intel.com with ESMTP; 08 May 2015 13:41:29 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 May 2015 20:41:27 +0000
Message-Id: <cover.1431117450.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
MIME-Version: 1.0
Subject: [PATCHv3 0/5] Add support to handle INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Fri, 08 May 2015 20:41:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The next changes are to add support for handle INCOMPATIBLE_LICENSE in 
manifest creation, in order to do it the license_create_manifest was 
reimplemented in python and also added some tweaks for save disk space
during build.

The patchset v2 fixes an issue when try to handle () into ManifestVisitor
for more info see next patches,
	license: Split visit_string in LicenseVisitor
	license: Add support for handle INCOMPATIBLE_LICENSE in manifest
    creation

The patchset v3 improves package reads in license_manifest_creation see,
	license_class: license_create_manifest improvment

The following changes since commit 4a711028c709d4bb1421e1637ae3fb0ac404fb45:

  oe-selftest: devtool: add a proper test to see if tap devices exist (2015-05-07 14:59:43 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/license-v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/license-v2

Aníbal Limón (5):
  license_class: Reimplemented manifest creation in python
  license_class: Generalize license_ok function
  license: Split visit_string in LicenseVisitor
  license: Add support for handle INCOMPATIBLE_LICENSE in manifest    
    creation
  license_class: license_create_manifest improvment

 meta/classes/license.bbclass | 202 ++++++++++++++++++++++---------------------
 meta/lib/oe/license.py       | 106 ++++++++++++++++++++++-
 2 files changed, 208 insertions(+), 100 deletions(-)

-- 
1.8.4.5


