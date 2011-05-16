Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QM4Hy-0001pQ-R7
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 22:21:15 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QM4FB-0000Og-2Y from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 13:18:21 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 16 May 2011 13:16:06 -0700
Received: from localhost.localdomain ([172.30.80.14]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 16 May 2011 14:18:19 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2011 13:18:14 -0700
Message-Id: <cover.1305577030.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 16 May 2011 20:18:19.0730 (UTC)
	FILETIME=[65CE9B20:01CC1406]
Subject: [PATCH 0/2] Minor fixes
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
X-List-Received-Date: Mon, 16 May 2011 20:21:15 -0000

The following series brings in two minor fixups I've pushed into openembedded
master recently.  openssh was being silly and using ${libdir}exec rather
than ${libexecdir} and we weren't wrapping perl${PV} which breaks relocated
caches where perl-native exists and perl doesn't.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: trini/minor-fixes-16may2011
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/minor-fixes-16may2011

Thanks,
    Tom Rini <tom_rini@mentor.com>
---


Tom Rini (2):
  openssh: Don't use ${libdir}exec
  perl-native: create_wrapper on perl${PV} too

 meta/recipes-connectivity/openssh/openssh_5.6p1.bb |    4 ++--
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |    3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)



