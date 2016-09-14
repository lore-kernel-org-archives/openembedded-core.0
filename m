Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.38])
	by mail.openembedded.org (Postfix) with ESMTP id 322A4607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 12:34:41 +0000 (UTC)
Received: from 1bk9Oi-0007KW-Ut by out11b.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1bk9Oj-0007L7-T6
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2016 05:34:41 -0700
Received: by emcmailer; Wed, 14 Sep 2016 05:34:41 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11b.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1bk9Oi-0007KW-Ut
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2016 05:34:40 -0700
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Sep 2016 14:34:40 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Sep 2016 14:34:38 +0200
Message-ID: <1473856478-36621-1-git-send-email-sona.sarmadi@enea.com>
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
Subject: [PATCH][krogoth] dropbear: upgrade to 2016.72
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
X-List-Received-Date: Wed, 14 Sep 2016 12:34:45 -0000
Content-Type: text/plain

The upgrade addresses CVE-2016-3116:

- Validate X11 forwarding input. Could allow bypass of
  authorized_keys command= restrictions,
  found by github.com/tintinweb.
  Thanks for Damien Miller for a patch. CVE-2016-3116

References:
https://matt.ucc.asn.au/dropbear/CHANGES
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-3116

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-core/dropbear/dropbear_2015.71.bb | 5 -----
 meta/recipes-core/dropbear/dropbear_2016.72.bb | 4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2015.71.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2016.72.bb

diff --git a/meta/recipes-core/dropbear/dropbear_2015.71.bb b/meta/recipes-core/dropbear/dropbear_2015.71.bb
deleted file mode 100644
index 6332579..0000000
--- a/meta/recipes-core/dropbear/dropbear_2015.71.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "2ccc0a2f3e37ca221db12c5af6a88137"
-SRC_URI[sha256sum] = "376214169c0e187ee9f48ae1a99b3f835016ad5b98ede4bfd1cf581deba783af"
-
diff --git a/meta/recipes-core/dropbear/dropbear_2016.72.bb b/meta/recipes-core/dropbear/dropbear_2016.72.bb
new file mode 100644
index 0000000..1385efd
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2016.72.bb
@@ -0,0 +1,4 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "96226b82725a8cbecad9fc738930d1d2"
+SRC_URI[sha256sum] = "9323766d3257699fd7d6e7b282c5a65790864ab32fd09ac73ea3d46c9ca2d681"
-- 
1.9.1


