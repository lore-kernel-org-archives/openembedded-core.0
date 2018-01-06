Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay101b.appriver.com [207.97.230.15])
	by mail.openembedded.org (Postfix) with ESMTP id 63F64788F5
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jan 2018 20:09:29 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 01/06/2018 3:07:30 PM
X-Note: SecureTide Build: 12/19/2017 1:37:44 PM UTC (2.6.27.2)
X-Note: Filtered by 10.238.11.162
X-Note-AR-Scan: None - PIPE
Received: by relay.appriver.com (CommuniGate Pro PIPE 6.1.7)
	with PIPE id 274977370; Sat, 06 Jan 2018 15:07:30 -0500
Received: from [213.210.30.29] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.7)
	with ESMTPS id 274977349; Sat, 06 Jan 2018 15:07:28 -0500
Received: from chuckie.brightsign ([fd44:d8b8:cab5:cb01::19] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1eXumT-000Foa-Rg; Sat, 06 Jan 2018 20:09:25 +0000
Received: from mac by chuckie with local (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1eXumT-00020X-R7; Sat, 06 Jan 2018 20:09:25 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Jan 2018 20:09:02 +0000
Message-Id: <20180106200903.7624-6-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180106200903.7624-1-mac@mcrowe.com>
References: <20180106200903.7624-1-mac@mcrowe.com>
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 01/06/2018 3:07:28 PM
X-Note: SecureTide Build: 12/19/2017 1:37:44 PM UTC (2.6.27.2)
X-Note: Filtered by 10.238.11.162
X-Policy: brightsign.biz
X-Primary: brightsign.biz@brightsign.biz
X-Virus-Scan: V-
X-Note: ICH-CT/SI:0-0/SG:1 1/1/0001 12:00:00 AM
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-29/SG:1 1/6/2018 3:07:08 PM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.551021 p=-0.942857 Source Normal
X-Signature-Violations: 0-0-0-2526-c
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
Subject: [PATCH 5/6] libical: Rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Sat, 06 Jan 2018 20:09:29 -0000

cmake.bbclass now ensures that ${libdir}/cmake ends up in the dev package,
so this recipe doesn't need to do so itself.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-support/libical/libical_2.0.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/libical/libical_2.0.0.bb b/meta/recipes-support/libical/libical_2.0.0.bb
index d4fe868eb4..dcc21cc16e 100644
--- a/meta/recipes-support/libical/libical_2.0.0.bb
+++ b/meta/recipes-support/libical/libical_2.0.0.bb
@@ -17,5 +17,3 @@ SRC_URI[sha256sum] = "654c11f759c19237be39f6ad401d917e5a05f36f1736385ed958e60cf2
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
-
-FILES_${PN}-dev += "${libdir}/cmake/*"
-- 
2.11.0



