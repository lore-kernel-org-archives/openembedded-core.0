Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QM4IC-0001qa-S7
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 22:21:29 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QM4FD-0000Ou-GS from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 13:18:23 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 16 May 2011 13:16:09 -0700
Received: from localhost.localdomain ([172.30.80.14]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 16 May 2011 14:18:22 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2011 13:18:17 -0700
Message-Id: <1aa9f65465fedd448f96fdf6eeaee89d2bfc7ad6.1305577030.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1305577030.git.tom_rini@mentor.com>
References: <cover.1305577030.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 16 May 2011 20:18:22.0340 (UTC)
	FILETIME=[675CDC40:01CC1406]
Subject: [PATCH 1/2] openssh: Don't use ${libdir}exec
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
X-List-Received-Date: Mon, 16 May 2011 20:21:29 -0000

This is 1259e0289ce53198cc6c57a9616c8a1623be502a in OE.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-connectivity/openssh/openssh_5.6p1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_5.6p1.bb b/meta/recipes-connectivity/openssh/openssh_5.6p1.bb
index d93a773..df7fcad 100644
--- a/meta/recipes-connectivity/openssh/openssh_5.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_5.6p1.bb
@@ -75,8 +75,8 @@ FILES_${PN}-ssh = "${bindir}/ssh.${PN} ${sysconfdir}/ssh/ssh_config"
 FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd"
 FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config"
 FILES_${PN}-sftp = "${bindir}/sftp"
-FILES_${PN}-sftp-server = "${libdir}exec/sftp-server"
-FILES_${PN}-misc = "${bindir}/ssh* ${libdir}exec/ssh*"
+FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
+FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
 FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
-- 
1.7.0.4



