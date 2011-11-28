Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RV6yf-0007f2-NV
	for openembedded-core@openembedded.org; Mon, 28 Nov 2011 20:34:58 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Nov 2011 11:28:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,585,1315206000"; d="scan'208";a="89897438"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga001.fm.intel.com with ESMTP; 28 Nov 2011 11:28:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Mon, 28 Nov 2011 11:28:15 -0800
Message-Id: <cover.1322508364.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] Fix for host conamination (v2)
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
X-List-Received-Date: Mon, 28 Nov 2011 19:34:58 -0000



This address a problem where a intltool.m4 check will fail if 
the host system does not have XML::Parser installed.

v2: Update both Commit comment and recipe with more info about why this
is needed based on email thread.

Sau!

The following changes since commit 2864ff6a4b3c3f9b3bbb6d2597243cc5d3715939:

  getVar/setVar cleanups (2011-11-26 22:42:00 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (1):
  intltool: remove XML::Parser check

 .../intltool-0.40.6/remove-xml-check.patch         |   29 ++++++++++++++++++++
 meta/recipes-devtools/intltool/intltool_0.40.6.bb  |   11 +++++--
 2 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch

-- 
1.7.6.4



