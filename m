Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 85F3F73F27
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 21:38:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 07 May 2015 14:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,386,1427785200"; d="scan'208";a="568026459"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga003.jf.intel.com with ESMTP; 07 May 2015 14:38:53 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 May 2015 21:38:51 +0000
Message-Id: <cover.1431034430.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
MIME-Version: 1.0
Cc: richard.purdie@liuxfoundation.org
Subject: [PATCHv2 0/4] Add support to handle INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Thu, 07 May 2015 21:38:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The next changes are to add support for handle INCOMPATIBLE_LICENSE in 
manifest creation, in order to do it the license_create_manifest was 
reimplemented in python and also added some tweaks for save disk space
during build.

This patchset v2 fixes an issue when try to handle () into ManifestVisitor
for more info see next patches,
	license: Split visit_string in LicenseVisitor
	license: Add support for handle INCOMPATIBLE_LICENSE in manifest
    creation

The following changes since commit 4a711028c709d4bb1421e1637ae3fb0ac404fb45:

  oe-selftest: devtool: add a proper test to see if tap devices exist (2015-05-07 14:59:43 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/license-v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/license-v2

Aníbal Limón (4):
  license_class: Reimplemented manifest creation in python
  license_class: Generalize license_ok function
  license: Split visit_string in LicenseVisitor
  license: Add support for handle INCOMPATIBLE_LICENSE in manifest    
    creation

 meta/classes/license.bbclass | 205 +++++++++++++++++++++++--------------------
 meta/lib/oe/license.py       | 106 +++++++++++++++++++++-
 2 files changed, 211 insertions(+), 100 deletions(-)

-- 
1.8.4.5


