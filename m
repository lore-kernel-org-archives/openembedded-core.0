Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 030D36A983
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 21:45:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 10 Jun 2013 14:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,840,1363158000"; d="scan'208";a="347788819"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.247])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2013 14:45:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 14:45:10 -0700
Message-Id: <1370900715-29294-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/5] Fixup usage of create_wrapper
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
X-List-Received-Date: Mon, 10 Jun 2013 21:45:35 -0000

Richard,

I found these following the buildtools-tarball change, also a couple of
other changes, one to clean up the suprious warning, and other a DEPENDS
fix.

Sau!

Saul Wold (5):
  sanity: remove warn debug message
  createrepo: Fix usage of create_wrapper
  dpkg: Fix usage of create_wrapper
  gnome-doc-utils: Fix usage of create_wrapper
  librsvg: configure needs a native gdk-pixbuf binary

 meta/classes/sanity.bbclass                          | 1 -
 meta/recipes-devtools/dpkg/dpkg.inc                  | 2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils.inc         | 2 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb         | 1 +
 meta/recipes-support/createrepo/createrepo_0.4.11.bb | 2 +-
 5 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.8.1.4


