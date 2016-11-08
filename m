Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.34])
	by mail.openembedded.org (Postfix) with ESMTP id E78256E65F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 10:42:05 +0000 (UTC)
Received: from 1c43qv-0003yy-WC by out11d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c43qw-00040U-UR
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2016 02:42:06 -0800
Received: by emcmailer; Tue, 08 Nov 2016 02:42:06 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c43qv-0003yy-WC
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2016 02:42:05 -0800
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0; Tue, 8 Nov 2016
	11:42:05 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Nov 2016 11:41:58 +0100
Message-ID: <1478601718-12481-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: sona.sarmadi@enea.com does not
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
Subject: [PATCH] curl: Upgrade 7.50.1.bb -> curl_7.51.0.bb
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
X-List-Received-Date: Tue, 08 Nov 2016 10:42:07 -0000
Content-Type: text/plain

The upgrade addresses following CVEs:
CVE-2016-8615: cookie injection for other servers
CVE-2016-8616: case insensitive password comparison
CVE-2016-8617: OOB write via unchecked multiplication
CVE-2016-8618: double-free in curl_maprintf
CVE-2016-8619: double-free in krb5 code
CVE-2016-8620: glob parser write/read out of bounds
CVE-2016-8621: curl_getdate read out of bounds
CVE-2016-8622: URL unescape heap overflow via integer truncation
CVE-2016-8623: Use-after-free via shared cookies
CVE-2016-8624: invalid URL parsing with '#'
CVE-2016-8625: IDNA 2003 makes curl use wrong host

Reference:
https://curl.haxx.se/docs/security.html

Fixes [Yocto #10617]

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-support/curl/{curl_7.50.1.bb => curl_7.51.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.50.1.bb => curl_7.51.0.bb} (94%)

diff --git a/meta/recipes-support/curl/curl_7.50.1.bb b/meta/recipes-support/curl/curl_7.51.0.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.50.1.bb
rename to meta/recipes-support/curl/curl_7.51.0.bb
index a21419a..e1a996b 100644
--- a/meta/recipes-support/curl/curl_7.50.1.bb
+++ b/meta/recipes-support/curl/curl_7.51.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "015f6a0217ca6f2c5442ca406476920b"
-SRC_URI[sha256sum] = "3c12c5f54ccaa1d40abc65d672107dcc75d3e1fcb38c267484334280096e5156"
+SRC_URI[md5sum] = "09a7c5769a7eae676d5e2c86d51f167e"
+SRC_URI[sha256sum] = "7f8240048907e5030f67be0a6129bc4b333783b9cca1391026d700835a788dde"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.9.1


