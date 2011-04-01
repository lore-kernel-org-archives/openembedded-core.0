Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q5fVq-00088Q-Pe
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 16:39:46 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q5fTs-0002da-MG from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 07:37:44 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 1 Apr 2011 07:37:44 -0700
Received: from localhost.localdomain ([172.30.80.69]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 1 Apr 2011 08:37:43 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Apr 2011 07:37:40 -0700
Message-Id: <cover.1301668619.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 01 Apr 2011 14:37:43.0330 (UTC)
	FILETIME=[5C2CB020:01CBF07A]
Subject: [PATCH 0/2] Bring in and use patchdir
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
X-List-Received-Date: Fri, 01 Apr 2011 14:39:47 -0000

The following series brings in the 'patchdir' parameter from openembedded
so that we can say that a patch needs to be applied in a subdir.  This
allows us to re-write the db change for how we apply the arm patch to
be just ';subdir=..' and in meta-oe and other layers will help a number
of other patches be cleanly applied.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: trini/use-patchdir-for-nonstd-paths
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/use-patchdir-for-nonstd-paths

Thanks,
    Tom Rini <tom_rini@mentor.com>
---


Tom Rini (2):
  patch.bbclass: allow importing patches into other dirs
  db: Switch to patchdir rather than applying in do_configure

 meta/classes/patch.bbclass           |   19 ++++++++++++++++---
 meta/recipes-support/db/db_5.1.19.bb |    6 +-----
 2 files changed, 17 insertions(+), 8 deletions(-)



