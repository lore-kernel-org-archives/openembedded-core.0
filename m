Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 135C0731DF
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 07:50:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jun 2016 00:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,482,1459839600"; d="scan'208";a="720598048"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2016 00:50:46 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 10:50:39 +0300
Message-Id: <cover.1466149452.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] gtk+3: Add patch for --disable-opengl
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
X-List-Received-Date: Fri, 17 Jun 2016 07:50:47 -0000

Objective here is to allow building core-image-sato without OpenGL
even though Gtk+3 depends on it.

I'm not proud of the patch:
* It modifies Gtk API (only GdkX11GLContext is removed but still)
* It's a maintenance problem
* It finds all kinds of nasty corner cases in the Gtk build system

but I'm guessing many people expect core-image-sato to work without GL
so maybe this i worth it. In the longer term I'd prefer some other
solution.

Thanks,
 Jussi

The following changes since commit 2a85038dd03463774fb787b655887297ec4f0a04:

  directfb: fix client->gfx_state initialisation (2016-06-15 18:13:16 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/gtk3-without-opengl
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gtk3-without-opengl

Jussi Kukkonen (1):
  gtk+3: Add patch for --disable-opengl

 meta/recipes-gnome/gtk+/gtk+3.inc                  |   7 +-
 .../0001-Add-disable-opengl-configure-option.patch | 965 +++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb            |   1 +
 3 files changed, 972 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch

-- 
2.1.4


