Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S7Fe0-000129-O9
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 01:31:16 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cfC6004613 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:41 GMT
X-Quarantine-ID: <b3V1SYZTOA41>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id b3V1SYZTOA41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:41 +0000 (GMT)
Received: from ted (ted.config [192.168.1.70]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cZZZ004549
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:37 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S7FVU-0002eg-3V
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 00:22:28 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:22:19 +0000
Message-Id: <3b9256140bde09f8319a96bc8cbe15288ff5899b.1331598077.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
References: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
References: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/17] license.bbclass: Add mapping for LGPLv2.0, pango uses it
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
X-List-Received-Date: Tue, 13 Mar 2012 00:31:17 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 3de704f..3126318 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -33,6 +33,7 @@ SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0"
 
 #LGPL variations
 SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
+SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
 SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
 SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
 SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0"
-- 
1.7.5.4



