Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDFDC4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 17:22:10 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web11.42858.1707067324599251486
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 09:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=nL8aT4KJ;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from vitani.co-bxl (vitani.co-bxl [10.0.0.37])
	by wilbur.contactoffice.com (Postfix) with ESMTP id 5D8991497;
	Sun,  4 Feb 2024 18:22:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1707067322;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	l=2045; bh=KDcj5Ekf33p2hEtX6+rHSRx8F8QCYEQ/V94iAESiGeE=;
	b=nL8aT4KJpSVMoHFd9TWU+yx2HMLQNhNsEjDm4wb/xtsneqW+8JpF20/3QEpjYBLD
	1A+b0NrSSQxkfvcMrxI3YvtedGf+CHUFCXtbge1sGFE0hzJp9pRugCNqChQkKjHnk+P
	hqpy5X2E5sYYD295eKh4RkO79LnUMcrxkEnY8erI9Wj8iTpArWsF/oEEzYCp2Kgrs1v
	IUpapu+3e5GxhWu2Pc857y1JE9agXAbcHhxPoCfhqRRZHYbIp7YDoQ7Ion8ejtM79Vy
	q7xTgJhfeWj9eoYgiASPIa2n8ukPJCIYer0CVx/L8I8BR4H+ST96uI7zkTw6Y553rXu
	XiHIGYb5QA==
Received: by smtp.mailfence.com with ESMTPSA ; Sat, 3 Feb 2024 18:21:24 +0100 (CET)
From: robert.joslyn@redrectangle.org
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update to 8.6.0
Date: Sat,  3 Feb 2024 09:20:55 -0800
Message-ID: <20240203172055.616834-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 17:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194901

From: Robert Joslyn <robert.joslyn@redrectangle.org>

This is a bug fix and feature update. Release notes are available at:
https://curl.se/changes.html#8_6_0

Disable test 1478, it's comparing help output to documentation.

License-Update: Copyright year updated
Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/curl/disable-tests               | 1 +
 meta/recipes-support/curl/{curl_8.5.0.bb =3D> curl_8.6.0.bb} | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_8.5.0.bb =3D> curl_8.6.0.bb} (97%=
)

diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-=
support/curl/curl/disable-tests
index 419022091f..259576fd01 100644
--- a/meta/recipes-support/curl/curl/disable-tests
+++ b/meta/recipes-support/curl/curl/disable-tests
@@ -15,6 +15,7 @@
 1119
 1132
 1135
+1478
 # These CRL tests are scanning headers
 1167
 1477
diff --git a/meta/recipes-support/curl/curl_8.5.0.bb b/meta/recipes-suppo=
rt/curl/curl_8.6.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_8.5.0.bb
rename to meta/recipes-support/curl/curl_8.6.0.bb
index 115ec7189f..b01f4542a2 100644
--- a/meta/recipes-support/curl/curl_8.5.0.bb
+++ b/meta/recipes-support/curl/curl_8.6.0.bb
@@ -7,14 +7,14 @@ HOMEPAGE =3D "https://curl.se/"
 BUGTRACKER =3D "https://github.com/curl/curl/issues"
 SECTION =3D "console/network"
 LICENSE =3D "curl"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddb8448a1e43eb2125f7740fc397db=
1f6"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deed2e5088e1ac619c9a1c747da291=
d75"
=20
 SRC_URI =3D " \
     https://curl.se/download/${BP}.tar.xz \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] =3D "42ab8db9e20d8290a3b633e7fbb3cec15db34df65fd1015e=
f8ac1e4723750eeb"
+SRC_URI[sha256sum] =3D "3ccd55d91af9516539df80625f818c734dc6f2ecf9bada33=
c76765e99121db15"
=20
 # Curl has used many names over the years...
 CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
--=20
2.43.0


