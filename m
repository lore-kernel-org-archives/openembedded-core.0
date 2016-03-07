Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp23.services.sfr.fr (smtp23.services.sfr.fr [93.17.128.19])
	by mail.openembedded.org (Postfix) with ESMTP id A5FA9605FF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 15:59:37 +0000 (UTC)
Received: from filter.sfr.fr (localhost [111.250.196.5])
	by msfrf2304.sfr.fr (SMTP Server) with ESMTP id DED8070000E7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 16:59:37 +0100 (CET)
Authentication-Results: sfrmc.priv.atos.fr; dkim=none (no signature);
	dkim-adsp=none (no policy) header.from=herve.jourdain@neuf.fr
Received: from nb-hjo (111-250-196-5.dynamic.hinet.net [111.250.196.5])	(using
	TLSv1 with cipher AES128-SHA (128/128 bits))	(No client certificate
	requested)
	by msfrf2304.sfr.fr (SMTP Server) with ESMTP id 31F277000068
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 16:59:36 +0100 (CET)
X-SFR-UUID: 20160307155937204.31F277000068@msfrf2304.sfr.fr
Received: from nbhjo
	by nb-hjo (PGP Universal service);  Mon, 07 Mar 2016 16:59:36 +0100
X-PGP-Universal: processed;	by nb-hjo on Mon, 07 Mar 2016 16:59:36 +0100
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: 'OE-core' <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Mar 2016 16:59:32 +0100
Message-ID: <00ce01d1788a$58d10b90$0a7322b0$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdF4ii7g3E81FC+DQEykupL5yJ/hPw==
Subject: [meta-oe][PATCH] systemd: binfmt should be added to SYSTEMD_PACKAGES only if binfmt is enabled
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
X-List-Received-Date: Mon, 07 Mar 2016 15:59:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

V2
Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
---
 meta/recipes-core/systemd/systemd_229.bb | 2 ++--
 1 file changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb
b/meta/recipes-core/systemd/systemd_229.bb
index 16af0ac..a537dd3 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -298,7 +298,7 @@ PACKAGES =+ "\
     ${PN}-extra-utils \
 "
 
-SYSTEMD_PACKAGES = "${PN}-binfmt"
+SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt',
'${PN}-binfmt', '', d)}"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
 USERADD_PACKAGES = "${PN}"
--
1.9.1
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

