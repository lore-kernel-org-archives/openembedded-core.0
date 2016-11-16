Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 67F83607A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 13:14:52 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 16 Nov 2016 05:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,500,1473145200"; d="scan'208";a="32044189"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 16 Nov 2016 05:14:51 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id B432A6A4080;
	Wed, 16 Nov 2016 05:14:10 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 15:14:39 +0200
Message-Id: <cover.1479301275.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] Upgrade mesa, piglit
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
X-List-Received-Date: Wed, 16 Nov 2016 13:14:52 -0000

This includes
 * Mesa 13.0.1 upgrade
 * piglit master upgrade
 * piglit test compression patches that I sent earlier
All three are independent of each other.

This passes a quick smoke test and piglit results are ok:

           pass:   57334
           fail:     345
          crash:       1
           skip:    7558
           warn:       7
          total:   65245


Thanks,
 Jussi

The following changes since commit 7c3a47ed8965c3a3eb90a9a4678d5caedbba6337:

  bitbake: toaster: settings set ALLOWED_HOSTS to * in debug mode (2016-11-16 11:38:44 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/mesa-piglit
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/mesa-piglit

Jussi Kukkonen (4):
  piglit: Package tests in compressed form as well
  core-tools-testapps: Re-add piglit
  piglit: Upgrade to current master head
  mesa: Upgrade 12.0.3 -> 13.0.1

 .../packagegroup-core-tools-testapps.bb            |  2 +
 .../0001-Use-wayland-scanner-in-the-path.patch     | 37 +++++++++++++++
 .../files/replace_glibc_check_with_linux.patch     | 25 ++++++----
 .../mesa/{mesa-gl_12.0.3.bb => mesa-gl_13.0.1.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc                |  2 +-
 .../mesa/{mesa_12.0.3.bb => mesa_13.0.1.bb}        |  5 +-
 .../0001-cmake-Link-test-utils-with-ldl.patch      | 41 ----------------
 ...0001-cmake-Link-utils-with-xcb-explicitly.patch | 54 ----------------------
 meta/recipes-graphics/piglit/piglit/piglit.sh      | 20 ++++++++
 meta/recipes-graphics/piglit/piglit_git.bb         | 26 +++++++++--
 10 files changed, 101 insertions(+), 111 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_12.0.3.bb => mesa-gl_13.0.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_12.0.3.bb => mesa_13.0.1.bb} (75%)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-test-utils-with-ldl.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/piglit.sh

-- 
2.1.4


