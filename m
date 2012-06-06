Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1ScJ4D-0001Mw-Sh
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 18:26:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Jun 2012 09:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="153769516"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 06 Jun 2012 09:15:08 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2012 09:14:40 -0700
Message-Id: <cover.1338999174.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] tcmode-default.inc fix
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
X-List-Received-Date: Wed, 06 Jun 2012 16:26:42 -0000

Hello,

This pull request is for the denzil branch. It's a bugfix for
Yocto #2503.

Scott

The following changes since commit d7bf94647f17c0382caad8af0bdda837b14b22dc:

  fotowall: Add #include ui_wizard.h to ExportWizard.cpp (2012-05-16 16:20:31 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgarman/eglibc-pref-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/eglibc-pref-fix

Scott Garman (1):
  tcmode-default.inc: use ${EGLIBCVERSION} in PREFERRED_VERSION
    definitions

 meta/conf/distro/include/tcmode-default.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.9.5



