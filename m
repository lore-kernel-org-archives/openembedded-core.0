Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga14.intel.com (unknown [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 667AC6F778
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 12:23:04 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 Mar 2014 05:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,637,1389772800"; d="scan'208";a="417124593"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 12 Mar 2014 05:23:04 -0700
Received: from localhost.localdomain (unknown [10.237.112.121])
	by linux.intel.com (Postfix) with ESMTP id 652B16A4083;
	Wed, 12 Mar 2014 05:22:52 -0700 (PDT)
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 14:27:22 +0200
Message-Id: <1394627248-13097-1-git-send-email-alexandrux.palalau@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2 0/6] Remove unneeded class inheritance
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
X-List-Received-Date: Wed, 12 Mar 2014 12:23:08 -0000

This patchset removes gconf inheritance for several gconf recipes that reported 
a WARN-QA message at buildtime regarding unrecognised --disable-schemas-install
configure option. This option is required by gconf.bbclass

Alexandru Palalau (6):
  gnome-desktop: removed gconf inheritance
  gst-plugins-gl: removed gconf inheritance
  gnome-mime-data: removed gconf and gtk-icon-cache inheritance
  gsettings-desktop-schemas: removed unneeded class inheritance
  gnome-doc-utils: removed gconf inheritance
  gtk-engines: removed gconf inheritance

 meta/recipes-gnome/gnome/gnome-desktop.inc                  | 2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils.inc                | 2 +-
 meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb          | 3 +--
 meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb | 2 +-
 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb        | 2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb  | 2 +-
 6 files changed, 6 insertions(+), 7 deletions(-)

-- 
1.8.3.1


