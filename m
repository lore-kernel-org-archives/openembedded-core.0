Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id EFC9A77161
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 21:31:43 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id o185so25065191pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 13:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hTLukt/hG/2IeUymRT88fVdISx6VLgFS6ffRQ652bzU=;
	b=aM9pUhf6arVahK6+NY+RSb2YB1FTclICaSNFaXI0sjzmmbtmWCh0k4a00iq9eZQSs9
	XN8q8EenyNUXGEd/UFTj6BdIo9S13XGQVcLtntZogMFXVPqEtaRxCA/GOlD2WGfHIM+K
	DtGLHfwGc8go01rsDJWtVU6LAi45PS2nV0lZj6C1HTxGmYKJ6hJXAXlEO1kybgYhPAkC
	dA294t1bSyS/xf+yVlWWTla5xnMNyTLwYWp+6RHvoojIWZ0MFydW8CakXrS3KwMbySjE
	Maeuhx6lFsPNR3LnZzWFIJAtYJ42V6BtsNf5VYIQm/qxC0VtLT/AZ2Ies4Z4oCeynWJf
	a2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hTLukt/hG/2IeUymRT88fVdISx6VLgFS6ffRQ652bzU=;
	b=jJ9kVHlgpTdtHyuKTbAnBj8Dv0jJi5iApdpXi9nWi6/vYCavvILDvwtMW1/or946En
	egqL3ljPKB3LSFTlD0c/LLXdA4rb9ctp+86u51UmiyOieSFPlAMDD/RaL5CTPKTGr/r3
	ECir2SFyS9gTiROL/jCkJi6naC8VkBC/uqC/dlFFK3Pq2KpIYgvUZcwCheZ+jZMDT3yS
	DZtFPDpje5v1JEB/vRTrsjGvAnhQpdXlBolNUA70Tw9O3xWrCJQGMGdB6CZTjk9nhHUV
	u09oqXjUjTToVZeMMwNa7myDqgvzXhz9EQvdjqmoh/o7iOhVFYsnimvEtk5XIoWz5D8s
	stvQ==
X-Gm-Message-State: AG10YOSpo3jcR+yfhJFGEFAIn16a4v+lmwGp1UljlaDjaWM0z85tsb8gY6eDj6+r/ZcpzA==
X-Received: by 10.98.75.4 with SMTP id y4mr8077732pfa.32.1454016704456;
	Thu, 28 Jan 2016 13:31:44 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ze5sm18623743pac.32.2016.01.28.13.31.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jan 2016 13:31:43 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jan 2016 13:31:38 -0800
Message-Id: <1454016698-27409-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] curl: update 7.46.0 -> 7.47.0 ( CVE-2016-0754 CVE-2016-0755 )
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
X-List-Received-Date: Thu, 28 Jan 2016 21:31:45 -0000

Full changelog: http://curl.haxx.se/changes.html#7_47_0
Security fixes: http://curl.haxx.se/docs/vulnerabilities.html

CVE-2016-0754 : remote file name path traversal in curl tool for Windows
CVE-2016-0755 : NTLM credentials not-checked for proxy connection re-use

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/curl/{curl_7.46.0.bb => curl_7.47.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.46.0.bb => curl_7.47.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.46.0.bb b/meta/recipes-support/curl/curl_7.47.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.46.0.bb
rename to meta/recipes-support/curl/curl_7.47.0.bb
index f798886..ab3c7e1 100644
--- a/meta/recipes-support/curl/curl_7.46.0.bb
+++ b/meta/recipes-support/curl/curl_7.47.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "9979f989a2a9930d10f1b3deeabc2148"
-SRC_URI[sha256sum] = "b7d726cdd8ed4b6db0fa1b474a3c59ebbbe4dcd4c61ac5e7ade0e0270d3195ad"
+SRC_URI[md5sum] = "85c58a00412476993050cb242a3f365d"
+SRC_URI[sha256sum] = "2b096f9387fb9b2be08d17e518c62b6537b1f4d4bb59111d5b4fa0272f383f66"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.9.1


