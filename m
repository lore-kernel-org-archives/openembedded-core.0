Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q7dSv-0005Re-WE
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 02:52:54 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q7dQu-0004ba-6Z from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 17:50:48 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 6 Apr 2011 17:50:48 -0700
Received: from localhost.localdomain ([172.30.80.151]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 6 Apr 2011 18:50:46 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Apr 2011 17:50:38 -0700
Message-Id: <cover.1302137428.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 07 Apr 2011 00:50:46.0927 (UTC)
	FILETIME=[D4F8E9F0:01CBF4BD]
Subject: [PATCH 0/1] v2: Update ncurses
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
X-List-Received-Date: Thu, 07 Apr 2011 00:52:54 -0000

This updates ncurses to 5.9.  While less of a deal for oe-core where we
had the patch we applied on top of 5.7 mirrored and referenced that
openembedded.master did not and the patch recently went away.  Fortunately
there's now a 5.8 and 5.9 release of ncurses and our 5.7 + patch was
close to 5.8 making this an easy update.  While at this we move most of
the important parts of ncurses_5.x.bb into ncurses.inc which has previously
been unused.  Finally, we add a comment saying that invisible-island.net
may have useful additional patches.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: trini/update-ncurses
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/update-ncurses

Thanks,
    Tom Rini <tom_rini@mentor.com>
---


Tom Rini (1):
  ncurses: Update to 5.9

 .../{ncurses-5.7 => ncurses-5.9}/config.cache      |    0
 .../{ncurses-5.7 => ncurses-5.9}/tic-hang.patch    |    0
 meta/recipes-core/ncurses/ncurses.inc              |  256 +++++++++++++++-----
 meta/recipes-core/ncurses/ncurses_5.7.bb           |  246 -------------------
 meta/recipes-core/ncurses/ncurses_5.9.bb           |   10 +
 5 files changed, 204 insertions(+), 308 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses-5.7 => ncurses-5.9}/config.cache (100%)
 rename meta/recipes-core/ncurses/{ncurses-5.7 => ncurses-5.9}/tic-hang.patch (100%)
 delete mode 100644 meta/recipes-core/ncurses/ncurses_5.7.bb
 create mode 100644 meta/recipes-core/ncurses/ncurses_5.9.bb



