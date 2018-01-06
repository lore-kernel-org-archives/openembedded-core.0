Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay101b.appriver.com [207.97.230.15])
	by mail.openembedded.org (Postfix) with ESMTP id 5B97A7883F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jan 2018 20:09:27 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 01/06/2018 3:07:30 PM
X-Note: SecureTide Build: 12/19/2017 1:37:44 PM UTC (2.6.27.2)
X-Note: Filtered by 10.238.11.162
X-Note-AR-Scan: None - PIPE
Received: by relay.appriver.com (CommuniGate Pro PIPE 6.1.7)
	with PIPE id 274977363; Sat, 06 Jan 2018 15:07:30 -0500
Received: from [213.210.30.29] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.7)
	with ESMTPS id 274977355; Sat, 06 Jan 2018 15:07:29 -0500
Received: from chuckie.brightsign ([fd44:d8b8:cab5:cb01::19] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1eXumU-000Fod-Nd; Sat, 06 Jan 2018 20:09:26 +0000
Received: from mac by chuckie with local (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1eXumU-00020b-My; Sat, 06 Jan 2018 20:09:26 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Jan 2018 20:09:03 +0000
Message-Id: <20180106200903.7624-7-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180106200903.7624-1-mac@mcrowe.com>
References: <20180106200903.7624-1-mac@mcrowe.com>
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 01/06/2018 3:07:29 PM
X-Note: SecureTide Build: 12/19/2017 1:37:44 PM UTC (2.6.27.2)
X-Note: Filtered by 10.238.11.162
X-Policy: brightsign.biz
X-Primary: brightsign.biz@brightsign.biz
X-Virus-Scan: V-
X-Note: ICH-CT/SI:0-0/SG:1 1/1/0001 12:00:00 AM
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-29/SG:1 1/6/2018 3:07:08 PM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.551511 p=-0.943128 Source Normal
X-Signature-Violations: 0-0-0-2427-c
X-Note: Spam Tests Failed: 
X-Country-Path: ->->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G293 G294 G295 G296 G300 G301 G433 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 6/6] libproxy: Rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Sat, 06 Jan 2018 20:09:27 -0000

cmake.bbclass now ensures that ${datadir}/cmake ends up in the dev package,
so this recipe doesn't need to do so itself.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.15.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.15.bb b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
index 9a687df976..991c9d8320 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.15.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
@@ -34,4 +34,3 @@ EXTRA_OECMAKE += " \
 SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
 
 FILES_${PN} += "${libdir}/${BPN}/${PV}/modules"
-FILES_${PN}-dev += "${datadir}/cmake"
-- 
2.11.0



