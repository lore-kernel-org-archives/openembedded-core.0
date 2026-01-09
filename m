Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825A4D1A63C
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 14:33:29 +0000 (UTC)
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11310.1767969204415551190
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 06:33:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@redrectangle.org header.s=key1 header.b=c+YGYFa/;
 spf=pass (domain: redrectangle.org, ip: 91.218.175.182, mailfrom: robert.joslyn@redrectangle.org)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=key1; t=1767969202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KUQhLmK19NfcClmkaHaG3qCbAxVrZmYDxldHGeL85bw=;
	b=c+YGYFa/ZHaCaceoa4E9RlOhaEAxY74GpbcrzkyqCxEs+c1I3Fl5U3/9ogqVo2VEce8HBt
	WpgikDo1HcnOwhwDDb8Y+jy/c1MtjtQC09QMcTIuukGTFuGLc8XvyBmyaIaMPE55s+pwOY
	/4cTTkSkn01dZtCGAm7Z24oW2+yg2wG+0WHfr2uXY1v1nnbstGfUQCNI9254lXNWcvXC8y
	+IpmdY4H0StM4l6LhQhrcCJRCjamgq92luTE6QFnDox4GvB5eWb3xOMaIiX4o+bQ/7W4TG
	GeMkOKuImK2+gI/59Rmn7eJEc05ka39F500kSzahired68rNFb7I7VhZSytV5w==
From: robert.joslyn@redrectangle.org
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update to 8.18.0
Date: Fri,  9 Jan 2026 06:33:11 -0800
Message-ID: <20260109143311.536300-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 14:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229125

From: Robert Joslyn <robert.joslyn@redrectangle.org>

Addresses six CVEs from 8.17.0:
 * CVE-2025-13034
 * CVE-2025-14017
 * CVE-2025-14524
 * CVE-2025-14819
 * CVE-2025-15079
 * CVE-2025-15224

https://curl.se/ch/8.18.0.html

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/curl/no-test-timeout.patch     | 9 +++++----
 .../curl/{curl_8.17.0.bb =3D> curl_8.18.0.bb}              | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-support/curl/{curl_8.17.0.bb =3D> curl_8.18.0.bb} (9=
8%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/=
recipes-support/curl/curl/no-test-timeout.patch
index 34e46fed6d..3ece55cab6 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,7 +1,8 @@
-From 42cddb52e821cfc2f09f1974742714e5f2f1856e Mon Sep 17 00:00:00 2001
+From 30fb6d1ce4cc721feef5665934f2b7f83fb50efb Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 15 Mar 2024 14:37:37 +0000
 Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 mi=
nutes
+
  instead of 13 seconds.
=20
 Upstream-Status: Inappropriate
@@ -11,12 +12,12 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/tests/servers.pm b/tests/servers.pm
-index d4472d5..9999938 100644
+index 5d5d98b..442cfaf 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -125,7 +125,7 @@ my $sshdverstr;  # for socks server, ssh daemon vers=
ion string
+@@ -124,7 +124,7 @@ my $sshdverstr;  # for socks server, ssh daemon vers=
ion string
  my $sshderror;   # for socks server, ssh daemon version error
- my %doesntrun;    # servers that don't work, identified by pidfile
+ my %doesntrun;    # servers that do not work, identified by pidfile
  my %PORT =3D (nolisten =3D> 47); # port we use for a local non-listenin=
g service
 -my $server_response_maxtime=3D13;
 +my $server_response_maxtime=3D600;
diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-supp=
ort/curl/curl_8.18.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.17.0.bb
rename to meta/recipes-support/curl/curl_8.18.0.bb
index 315364902e..b94da348b7 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.18.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk =3D " \
            file://environment.d-curl.sh \
 "
=20
-SRC_URI[sha256sum] =3D "955f6e729ad6b3566260e8fef68620e76ba3c31acf0a1852=
4416a185acf77992"
+SRC_URI[sha256sum] =3D "40df79166e74aa20149365e11ee4c798a46ad57c34e4f68f=
d13100e2c9a91946"
=20
 # Curl has used many names over the years...
 CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
--=20
2.52.0


