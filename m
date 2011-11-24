Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RTeAg-0007wE-Li
	for openembedded-core@openembedded.org; Thu, 24 Nov 2011 19:37:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Nov 2011 10:29:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="79613678"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.93])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2011 10:29:26 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu, 24 Nov 2011 10:29:24 -0800
Message-Id: <cover.1322095568.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] Fix for host conamination
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
X-List-Received-Date: Thu, 24 Nov 2011 18:37:18 -0000

This address a problem where a intltool.m4 check will fail if 
the host system does not have XML::Parser installed.


The following changes since commit 0a1dedeb8eea4e230b47d1516b3e6e90495fe49d:

  libtool: Avoid relinking when cross compiling, its pointless (2011-11-24 00:02:27 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (1):
  intltool: remove XML::Parser check

 .../intltool-0.40.6/remove-xml-check.patch         |   29 ++++++++++++++++++++
 meta/recipes-devtools/intltool/intltool_0.40.6.bb  |    7 +++--
 2 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch

-- 
1.7.5.4



