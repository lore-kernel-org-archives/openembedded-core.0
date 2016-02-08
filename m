Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id EDD1073175
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 22:49:24 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id o185so116630907pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 14:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=W4ZZlksWJ1+k1GzDtTHxxdPi0BtseVJS6aH2V9nsZR8=;
	b=p+pMQdSJ4QKzuYDYNHMY/qyjjqLGkfLty7FLf3//71QDRhcu0x1Mp4FnpS3AoV1zt8
	mrFXKRQKWCL7i8q+B/MEB44ET0gZnGaPE2Qqz5a9cJA4CDCAzhq1Ks+09rT2qNZZdB7p
	/hnhvW55lxoYjMyO0TYwecSlU3BuKk4ibJlJJBab56wi5JQoo3CE6RdHLrsgvHgs8TSC
	ZSIxqstEYHuV//uMCqkkKnUGCaaYcW60C7zQjFZiOptWTGgOtCt9OWWu1f7jx2X0EU0C
	hlCyx9XR70cRwO6rLbhdeANOAx4voGkyN/1TJ8A1mhzQOVLmTJpDHUmHB12d/ZeROzXo
	u0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=W4ZZlksWJ1+k1GzDtTHxxdPi0BtseVJS6aH2V9nsZR8=;
	b=cu1qEQgIncf/kMpLegyVw+Mg/YZGwCXeLE5OH5TNoxjjMrzY+BGICXn2U988rLjum3
	CwSQ0UV1dv3wSleAfJoYhnwWkHKcGs/C0/Ih44UYt+e3VT9XboKI+0RKuQfpyMg+Y0Cp
	8cyDWs7JeKVz6lIQugvtmQc8iAKbMx5emrwODfr62/kcZ6BisInLm3XCCDtZLoQ3s/A+
	3pO3cXscVppNp2mPu51gg+r7UeKdBG0rrLkO47wQ8VVmeHD4AZFDhFLWy5iUPdpQSyD3
	8jKWAK5a0d6updwx0nE3bY/ZmQtm+DDmhoum6hZ/2nmYR1kcuEZrqpjYd7y50awerySW
	LJjg==
X-Gm-Message-State: AG10YOTkNcT5suL48xb4M9skkyr/Zowm48/HKa/dixbATXPT0ohaE6Tg581ICxW78a+RlA==
X-Received: by 10.98.12.8 with SMTP id u8mr16816661pfi.36.1454971764917;
	Mon, 08 Feb 2016 14:49:24 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	dg12sm45666485pac.47.2016.02.08.14.49.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 14:49:23 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 14:49:18 -0800
Message-Id: <1454971758-28544-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] curl: update 7.47.0 -> 7.47.1
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
X-List-Received-Date: Mon, 08 Feb 2016 22:49:25 -0000

Adjust LIC_FILES_CHKSUM beginline due to changes to the Copyright to
acknowledge additional contributors. No change to the license text.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/curl/{curl_7.47.0.bb => curl_7.47.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/curl/{curl_7.47.0.bb => curl_7.47.1.bb} (90%)

diff --git a/meta/recipes-support/curl/curl_7.47.0.bb b/meta/recipes-support/curl/curl_7.47.1.bb
similarity index 90%
rename from meta/recipes-support/curl/curl_7.47.0.bb
rename to meta/recipes-support/curl/curl_7.47.1.bb
index ab3c7e1..f2fa37c 100644
--- a/meta/recipes-support/curl/curl_7.47.0.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://curl.haxx.se/"
 BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
+LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e664ac"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch \
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "85c58a00412476993050cb242a3f365d"
-SRC_URI[sha256sum] = "2b096f9387fb9b2be08d17e518c62b6537b1f4d4bb59111d5b4fa0272f383f66"
+SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"
+SRC_URI[sha256sum] = "ddc643ab9382e24bbe4747d43df189a0a6ce38fcb33df041b9cb0b3cd47ae98f"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.9.1


