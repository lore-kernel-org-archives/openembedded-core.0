Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C388CC3DA4A
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 01:45:26 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web11.20010.1722735920994445402
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Aug 2024 18:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=i/nSTuBg;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth2.co-bxl (smtpauth2.co-bxl [10.2.0.24])
	by wilbur.contactoffice.com (Postfix) with ESMTP id F1A33139E;
	Sun,  4 Aug 2024 03:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722735918;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=w7zbEmHrSLRqZOkQzlQ7Yvy8G6WSp5/ixMcNZiKDImY=;
	b=i/nSTuBgX6GpNuqqSUqN0Fvb4HooLtIiFLgG0RmYCTQBdukSMXqCZphRSAnjZW6o
	57WtBRX8vyys6g5PtMK52RSTeYHAAVm0Iea9zSSS5QMNzMXEL4mbeYfUk/F2I2m5aEb
	Q6eSGJSjGrcSsKobOhKUeQf2OGzQwEVVY0ZHauC6sTv7XCXEMH7U/3NtkdAUjh/DrO8
	naMITIsOEva0pXEnPUCOBvb36EpgOzdcVZ7CKmEz+xVShrgQBUfQOpZ+cyUquTXodUG
	gYQUolxFnP0ny/j7sL4ZE+BfA2c1xUKM4F7TdHn3DYJTYIVX/NaQ9xTDfAqweplElPh
	aBHCyGvBvg==
Received: by smtp.mailfence.com with ESMTPSA ; Sun, 4 Aug 2024 03:45:15 +0200 (CEST)
From: robert.joslyn@redrectangle.org
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update to 8.9.1
Date: Sat,  3 Aug 2024 18:44:47 -0700
Message-ID: <20240804014447.2463258-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 01:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202940

From: Robert Joslyn <robert.joslyn@redrectangle.org>

This update contains minor features, bugfixes, and addresses several CVEs=
:
* https://curl.se/docs/CVE-2024-6197.html
* https://curl.se/docs/CVE-2024-6874.html
* https://curl.se/docs/CVE-2024-7264.html

Full relese notes available at https://curl.se/ch/8.9.1.html

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/{curl_8.8.0.bb =3D> curl_8.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_8.8.0.bb =3D> curl_8.9.1.bb} (98%=
)

diff --git a/meta/recipes-support/curl/curl_8.8.0.bb b/meta/recipes-suppo=
rt/curl/curl_8.9.1.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.8.0.bb
rename to meta/recipes-support/curl/curl_8.9.1.bb
index 2b058e4e82..3abe1596a0 100644
--- a/meta/recipes-support/curl/curl_8.8.0.bb
+++ b/meta/recipes-support/curl/curl_8.9.1.bb
@@ -15,7 +15,7 @@ SRC_URI =3D " \
     file://disable-tests \
     file://no-test-timeout.patch \
 "
-SRC_URI[sha256sum] =3D "0f58bb95fc330c8a46eeb3df5701b0d90c9d9bfcc42bd1cd=
08791d12551d4400"
+SRC_URI[sha256sum] =3D "f292f6cc051d5bbabf725ef85d432dfeacc8711dd717ea97=
612ae590643801e5"
=20
 # Curl has used many names over the years...
 CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
--=20
2.44.2


