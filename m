Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UI2fV-0006Ww-5l
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 20:57:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2JJf5wv019335
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 12:41:05 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 19 Mar 2013 12:41:06 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2013 15:17:48 -0500
Message-ID: <1363724268-31517-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] vte: Fix conflict between FILES_${PN}-dbg and FILES_vte-dbg
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 19:58:06 -0000
Content-Type: text/plain

Due to quarks with the way bitbake handles variable key values, the
hard coded FILES_vte-dbg or automatic FILES_${PN}-dbg could replace
each other, leaving the system in an inconsistent state.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-support/vte/vte.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 6e43554..b653fab 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -10,7 +10,7 @@ EXTRA_OECONF = "--disable-python --disable-introspection"
 
 PACKAGES =+ "libvte vte-termcap"
 FILES_libvte = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
-FILES_vte-dbg =+ "${libexecdir}/.debug ${prefix}/src ${bindir}/.debug \
+FILES_${PN}-dbg =+ "${libexecdir}/.debug ${prefix}/src ${bindir}/.debug \
                ${libdir}/.debug"
 FILES_vte-termcap = "${datadir}/vte/termcap-0.0"
 
-- 
1.8.1.2.545.g2f19ada



