Return-Path: <sona.sarmadi@enea.com>
X-Greylist: delayed 948 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Jan 2017 11:26:44 UTC
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.32])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0A2605BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 11:26:44 +0000 (UTC)
Received: from 1cQuKM-0006kn-Vr by out10c.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cQuKN-0006lO-T8
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2017 03:10:55 -0800
Received: by emcmailer; Tue, 10 Jan 2017 03:10:55 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10c.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cQuKM-0006kn-Vr
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2017 03:10:54 -0800
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Tue, 10 Jan 2017 12:10:54 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2017 12:10:51 +0100
Message-ID: <1484046651-61364-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH][morty] libxtst: 1.2.2 -> 1.2.3
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
X-List-Received-Date: Tue, 10 Jan 2017 11:26:47 -0000
Content-Type: text/plain

Upgrade libxtst from 1.2.2 to 1.2.3 to address:
Out of Bounds Write Denial of Service Vulnerability, CVE-2016-7951

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-7951
https://cgit.freedesktop.org/xorg/lib/libXtst/commit/?id=9556ad67af3129ec4a7a4f4b54a0d59701beeae3

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-graphics/xorg-lib/{libxtst_1.2.2.bb => libxtst_1.2.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.2.bb => libxtst_1.2.3.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
rename to meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
index 1b0bcf3..31ea439 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
@@ -16,5 +16,5 @@ PE = "1"
 
 XORG_PN = "libXtst"
 
-SRC_URI[md5sum] = "25c6b366ac3dc7a12c5d79816ce96a59"
-SRC_URI[sha256sum] = "ef0a7ffd577e5f1a25b1663b375679529663a1880151beaa73e9186c8309f6d9"
+SRC_URI[md5sum] = "ef8c2c1d16a00bd95b9fdcef63b8a2ca"
+SRC_URI[sha256sum] = "4655498a1b8e844e3d6f21f3b2c4e2b571effb5fd83199d428a6ba7ea4bf5204"
-- 
1.9.1


