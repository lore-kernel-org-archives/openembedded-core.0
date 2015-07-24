Return-Path: <pau.espin@aweurope.be>
Received: from barracuda.aweurope.be (barracuda.aweurope.be [212.166.56.147])
	by mail.openembedded.org (Postfix) with ESMTP id 079B160962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 14:03:29 +0000 (UTC)
X-ASG-Debug-ID: 1437746608-041f750f7b2ffd0001-7zcVdP
Received: from localhost.localdomain ([172.23.1.67]) by barracuda.aweurope.be
	with ESMTP id EVSuEEdGdx3srVXP;
	Fri, 24 Jul 2015 16:03:28 +0200 (CEST)
X-Barracuda-Envelope-From: pau.espin@aweurope.be
X-Barracuda-RBL-Trusted-Forwarder: 172.23.1.67
X-ASG-Whitelist: Client
From: Pau Espin Pedrol <pau.espin@aweurope.be>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jul 2015 16:02:58 +0200
X-ASG-Orig-Subj: [oe-core][PATCH v3 1/3] bitbake.conf: Add nonarch_libdir and
	base systemd vars on it
Message-Id: <1437746580-31696-1-git-send-email-pau.espin@aweurope.be>
X-Mailer: git-send-email 1.9.1
X-Barracuda-Connect: UNKNOWN[172.23.1.67]
X-Barracuda-Start-Time: 1437746608
X-Barracuda-URL: http://172.23.0.12:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at aweurope.be
X-Barracuda-BRTS-Status: 1
Cc: Pau Espin Pedrol <pau.espin@aweurope.be>
Subject: [PATCH v3 1/3] bitbake.conf: Add nonarch_libdir and base systemd vars on it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jul 2015 14:03:33 -0000

Signed-off-by: Pau Espin Pedrol <pau.espin@aweurope.be>
---
 meta/conf/bitbake.conf | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 730ab80..26c548c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -32,7 +32,10 @@ export datadir = "${prefix}/share"
 export infodir = "${datadir}/info"
 export mandir = "${datadir}/man"
 export docdir = "${datadir}/doc"
-export systemd_unitdir = "/lib/systemd"
+export nonarch_libdir = "${exec_prefix}/lib"
+export systemd_unitdir = "${nonarch_libdir}/systemd"
+export systemd_system_unitdir = "${nonarch_libdir}/systemd/system"
+export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
 
 # Architecture dependent paths
 export bindir = "${exec_prefix}/bin"
-- 
1.9.1


