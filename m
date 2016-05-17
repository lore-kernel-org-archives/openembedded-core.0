Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2B00C60249
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 12:18:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 17 May 2016 05:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,324,1459839600"; d="scan'208";a="808565162"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 17 May 2016 05:18:43 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 15:17:44 +0300
Message-Id: <cover.1463486899.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1463470541.4578.7.camel@linuxfoundation.org>
References: <1463470541.4578.7.camel@linuxfoundation.org>
Subject: [PATCH 0/2] Fix GLib 2.48.1 upgrade breakage
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
X-List-Received-Date: Tue, 17 May 2016 12:18:44 -0000

Two patches to fix configure failures that resulted from the glib-2.0
2.48.1 update. In both cases the AM_GLIB_GNU_GETTEXT macro is updated to
match the one provided by glib (the change is that the macro is now
marked deprecated).

I've pushed these on top of the original branch since these patches
should only be used with new GLib.

 - Jussi


The following changes since commit cb405da51da0413d5ac5999330a4e49cb7be262f:

  weston: Upgrade 1.9.0 -> 1.10.0 (2016-05-16 14:20:26 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/upgrades

Jussi Kukkonen (2):
  gnome-doc-utils: Update AM_GLIB_GNU_GETTEXT macro
  pkgconfig: Update AM_GLIB_GNU_GETTEXT macro

 ...t.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch | 41 ++++++++++++++++++++++
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |  1 +
 ...t.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch | 40 +++++++++++++++++++++
 .../recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb |  1 +
 4 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
 create mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch

-- 
2.1.4


