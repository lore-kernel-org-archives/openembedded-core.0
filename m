Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q26FT-0006hA-Tb
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 19:24:08 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q26Df-0001ej-Ps from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 11:22:15 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 22 Mar 2011 11:21:23 -0700
Received: from localhost.localdomain ([172.30.80.248]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Mar 2011 12:22:14 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2011 11:21:50 -0700
Message-Id: <cover.1300817337.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 22 Mar 2011 18:22:14.0565 (UTC)
	FILETIME=[11868550:01CBE8BE]
Subject: [PATCH 0/2] coreutils-native and gettext fixes
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
X-List-Received-Date: Tue, 22 Mar 2011 18:24:08 -0000

They following changes do two things.  First up, this re-syncs
coreutils-native with the changes I just made in openembedded.master
to opt out of gmp-native rather than DEPEND on it (oe.master had neither
previously).  The second change was that in testing the above I ran into
gettext.bbclass + BBCLASSEXTEND breakage that I had fixed in oe.master
previously.  I've extended what I did slightly to also cover crosssdk
here.  After talking with Khem there's further cleanups that we can do
but are separate.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: trini/misc-fixes
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/misc-fixes

Thanks,
    Tom Rini <tom_rini@mentor.com>
---


Tom Rini (2):
  coreutils: Switch to disabling gmp support
  gettext.bbclass: Fix cases where we lost DEPENDS_GETTEXT

 meta/classes/gettext.bbclass                 |    8 ++++++--
 meta/recipes-core/coreutils/coreutils_8.9.bb |    6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)



