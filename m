Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qh4or-0002nq-V5
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:10:02 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qh4l1-0000yz-2s from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 12:06:03 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 13 Jul 2011 12:06:02 -0700
Received: from localhost.localdomain ([172.30.80.65]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 13 Jul 2011 13:06:01 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 12:05:56 -0700
Message-Id: <cover.1310583666.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 13 Jul 2011 19:06:01.0800 (UTC)
	FILETIME=[E8288480:01CC418F]
Subject: [PATCH 0/3] siteinfo.bbclass re-merge
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
X-List-Received-Date: Wed, 13 Jul 2011 19:10:02 -0000

Hey all,

This is the second of two pull requests.  This doesn't depend on the first
request, it's just splitting changes up.  There's three changes here.  First,
site/ix86-common was setting the wrong value for unsigned int.  Second,
change perl to use SITEINFO variables rather than functions.  Third, bring
in the various changes in siteinfo.bbclass that have been in oe.dev.  This
last part will, I hope, also make dealing with multilib-specific siteinfo
stuff easier (also alternative ABIs like x32).

My next step is to work on merging and verifying as much as possible
the site files in oe-core and oe.dev.

The following changes since commit e66c2999afa2b3efbce8bb46c89f9db5e15f35c7:
  Saul Wold (1):
        libx11: ensure nativesdk uses correct DEPENDS and XCB flags

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib trini/update-siteinfo
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/update-siteinfo

Tom Rini (3):
  site/ix86-common: Fix ac_cv_sizeof_unsigned_char definition
  perl: Use SITEINFO variables not functions
  siteinfo.bbclass: Port over oe.dev logic for site files

 meta/classes/autotools.bbclass             |    2 +-
 meta/classes/siteinfo.bbclass              |  202 +++++++++++++---------------
 meta/classes/toolchain-scripts.bbclass     |    2 +-
 meta/recipes-core/meta/meta-environment.bb |    2 +-
 meta/recipes-core/meta/meta-toolchain.bb   |    2 +-
 meta/recipes-devtools/perl/perl_5.12.3.bb  |    4 +-
 meta/site/ix86-common                      |    2 +-
 7 files changed, 103 insertions(+), 113 deletions(-)
 create mode 100644 meta/site/common-linux



