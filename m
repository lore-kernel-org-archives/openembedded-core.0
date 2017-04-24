Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 086F2771D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 19:13:21 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g23so5870787pfj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 12:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FfZdCv7/qkkbJz78892m7O5xIIvCUhKaVirseE5bmpo=;
	b=L9LatkdI3lmDf4wL0wPLd5XCGX2/3lLzYqj9zrXEWiQR23Wx28HkEMIaTjXMi2s1+W
	VsMAcNMHbc1kY6bCPe0+YH2kSsuFN9VGKenjcSEYmsSKCNcM90RuBMFlLv6dEtxUZx24
	Cy2Vlr5M1LMLAYI5J4faE+im0sx+0TJJoBptxFmgCrfLwUY7NdI8C3zoi0ZzvO6xs7CS
	2IVdSqFgVN8xlHsA3RNfWaloHIbzqN4w4PkKmrs6tggFcXNeQGtXdLWEYTQGnpYfyJX5
	y092wZdGoYYOsMxG2O/m7nDolC+CfDfsHgVJ76BsEUxhFVNPlQvvad9i89hw1D7MI3Zj
	e/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FfZdCv7/qkkbJz78892m7O5xIIvCUhKaVirseE5bmpo=;
	b=VrG9w5MXm4SXx8/cB1EejOZW/9Wh71iplL59Z+8Mgs+uc6jS49v8U+L71xa2HkRVYr
	uv+OLq3iIsZazS95PTzTUK5qmHhUdVdpQZABXsvHyzLZhjxS4oD8szxGwrGuGx+kvIKc
	PlOHtrzpaPkGKkHgAWx8cgHHDiQ2yo/gr9yhcBx7/i7qHPuH05bof1z/qjv7I87YdVLi
	tz7sPiDQEqr/FbOtIkqHUumoX2+2pypFJJZEPMRyerLfei7u/isvX3vJazN6fB5e755M
	6f94QdJXhnmiiPJEw9Oyljc6JYsSft+ScO5nI4ZEhsNa/7huYd61DDQe+VML1LpFLvQ9
	l3Ig==
X-Gm-Message-State: AN3rC/6SXESzC0vvp0AdYaPH1mm5MHKvdwoEvm3nP7Fx+Mr7EOMDkUxM
	B4VjM6ZKLQIu7A==
X-Received: by 10.98.163.75 with SMTP id s72mr26669068pfe.227.1493061202782;
	Mon, 24 Apr 2017 12:13:22 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	w17sm32264183pfg.75.2017.04.24.12.13.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Apr 2017 12:13:21 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Apr 2017 12:13:16 -0700
Message-Id: <1493061196-8616-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gnutls: move BBCLASSEXTEND from gnutls.inc into the gnutls recipe
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
X-List-Received-Date: Mon, 24 Apr 2017 19:13:22 -0000

There may be alternative gnutls recipes outside oe-core which include
gnutls.inc but which don't want BBCLASSEXTEND = "native nativesdk".

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc      | 2 --
 meta/recipes-support/gnutls/gnutls_3.5.9.bb | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 1ecad1f..e75d3a6 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -59,5 +59,3 @@ PACKAGES =+ "${PN}-openssl ${PN}-xx"
 FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
 FILES_${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
 FILES_${PN}-xx = "${libdir}/libgnutlsxx.so.*"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.9.bb b/meta/recipes-support/gnutls/gnutls_3.5.9.bb
index 8f84dbb..92e58b1 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.9.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.9.bb
@@ -8,3 +8,4 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
 SRC_URI[md5sum] = "0ab25eb6a1509345dd085bc21a387951"
 SRC_URI[sha256sum] = "82b10f0c4ef18f4e64ad8cef5dbaf14be732f5095a41cf366b4ecb4050382951"
 
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


