Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QI0AS-0002U1-ST
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 17:08:41 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QI07s-0005d5-Bp from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 08:06:00 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 5 May 2011 08:04:42 -0700
Received: from localhost.localdomain ([172.30.0.24]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 5 May 2011 09:05:59 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 May 2011 08:05:47 -0700
Message-Id: <cover.1304607797.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 05 May 2011 15:05:59.0141 (UTC)
	FILETIME=[F1006950:01CC0B35]
Subject: [PATCH 0/4] Misc sync up changes
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
X-List-Received-Date: Thu, 05 May 2011 15:08:41 -0000

The following series brings in a few fixups I pushed to openembedded today.
In short, in gcc/binutils we were referencing TARGET_SYS in places where we
had told configure to mangle things based on TARGET_PREFIX and in the
cases where they don't match, it wasn't working.  I had also just run into
some missing DEPENDS cases so they are included in this branch as well.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: trini/misc-sync-up
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/misc-sync-up

Thanks,
    Tom Rini <tom_rini@mentor.com>
---


Tom Rini (4):
  gcc-package-target: Switch to TARGET_PREFIX in symlinks
  binutils.inc: Switch to TARGET_PREFIX not TARGET_SYS
  sysstat.inc: Switch to inherit gettext
  bash.inc: Add bison-native to DEPENDS

 meta/recipes-devtools/binutils/binutils.inc      |   10 +++++-----
 meta/recipes-devtools/gcc/gcc-package-target.inc |   10 +++++-----
 meta/recipes-extended/bash/bash.inc              |    2 +-
 meta/recipes-extended/sysstat/sysstat.inc        |    4 +---
 meta/recipes-extended/sysstat/sysstat_9.1.5.bb   |    2 +-
 5 files changed, 13 insertions(+), 15 deletions(-)



