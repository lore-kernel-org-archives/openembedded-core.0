Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1RDVMP-0003im-CK
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 07:58:41 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1RDVGu-0006QG-PD from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 22:53:00 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 11 Oct 2011 07:52:59 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2011 10:51:18 +0500
Message-Id: <1318312278-24520-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 11 Oct 2011 05:52:59.0977 (UTC)
	FILETIME=[085C0390:01CC87DA]
Subject: [PATCH] bluez4: Add ending quote of FILES_${PN}-dbg
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
X-List-Received-Date: Tue, 11 Oct 2011 05:58:41 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* .debug directory was being moved in bluez4 package. Although we have asked to move it in bluez4-dbg package but as FILES_${PN}-dbg was not having ending quote, .debug folder was not being moved to correct directory in packages-split.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/recipes-connectivity/bluez/bluez4_4.96.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
index 5c170c1..420a525 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
@@ -30,4 +30,4 @@ FILES_${PN}-dbg += "\
   ${libdir}/bluetooth/plugins/.debug \
   ${libdir}/*/.debug \
   ${base_libdir}/udev/.debug \
-
+  "
-- 
1.7.0.4



