Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id CEE71779F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:13:10 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id t144so43900055lff.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 05:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=5+d8wr+Zw4rTMtJkSnIOLu+mtdD5Obglt2Nlu9Dllzw=;
	b=DswjW6HdOHI0adBhVcbkj8OfNFlvIpZ0+F2UYASZYMb8owO7kYaNoBhPkOZzyWI/Mp
	1ARbvF945aSudlNCTEqVeHVWd9no0CWaFDyBVSQYFhH+0RxApu2hA5/0ttlgUu6iLe+H
	txsSteCEVR9wcDidTqzlz1E0NL+iPdAMn+tpRnz75txRKLFugeftSRRPugadO2koU4+B
	TlOhCrXw9t9hymHvT0zN0TnbxDffEff6RsUX0aLFZg8jPzpz9Mf1WZ9i3V4NHmxhHSA/
	xJKrlpr1QQOm2Lg8A+aQQdi/Exu12Vq59c4NArTqCXvsxE9sK8OTGvdGoTwYArx1NkWr
	CApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5+d8wr+Zw4rTMtJkSnIOLu+mtdD5Obglt2Nlu9Dllzw=;
	b=HEFcefVehoAhiuELLCiqKBUn02fBgJ3P3f0yfaOw4lNrcVh63KjKN1yEts0frh6jLm
	L+cr3aVI2gLqTzD8F59kKPirWxqGZjAUVxkdzB+JcQmzRO+JPluk3Lz3/nd/Ls9q/uxl
	VXycYHhgor/5NPWtBKwC3rVbRNH0qmI70RE2sE4/9SUGZ3jx9Nn7fyfY7SVqlF2r0rbK
	oY8deceFzXpIqOZ+3cAZjHaAIks5FPa9YKjtOLBc9o3/hBZ/SZSe8U7EWmbhUcyuJuUA
	Aq2Bny05lYhJgT+AERHE2cLlw3TnC3gizZhk+R3wde1Ya99Dm4pYw8Qm5F5fYrDcCccq
	LAKw==
X-Gm-Message-State: AN3rC/6ZBRWj53MuDywALhJH28lNEBLVeAU0fYljzztNHcByJb1P7dYs
	T0MLIAHlEKEa78oF
X-Received: by 10.25.193.207 with SMTP id r198mr4611595lff.62.1492776791300;
	Fri, 21 Apr 2017 05:13:11 -0700 (PDT)
Received: from stout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	p188sm1561036lfe.11.2017.04.21.05.13.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Apr 2017 05:13:10 -0700 (PDT)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 14:12:33 +0200
Message-Id: <1492776753-6784-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [PATCH] curl: upgrade to 7.54.0
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
X-List-Received-Date: Fri, 21 Apr 2017 12:13:12 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta/recipes-support/curl/{curl_7.53.1.bb => curl_7.54.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.53.1.bb => curl_7.54.0.bb} (94%)

diff --git a/meta/recipes-support/curl/curl_7.53.1.bb b/meta/recipes-support/curl/curl_7.54.0.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.53.1.bb
rename to meta/recipes-support/curl/curl_7.54.0.bb
index bc78ffb..ce5ca37 100644
--- a/meta/recipes-support/curl/curl_7.53.1.bb
+++ b/meta/recipes-support/curl/curl_7.54.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "fb1f03a142236840c1a77c035fa4c542"
-SRC_URI[sha256sum] = "1c7207c06d75e9136a944a2e0528337ce76f15b9ec9ae4bb30d703b59bf530e8"
+SRC_URI[md5sum] = "89bb7ba87384dfbf4f1a3f953da42458"
+SRC_URI[sha256sum] = "f50ebaf43c507fa7cc32be4b8108fa8bbd0f5022e90794388f3c7694a302ff06"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4


