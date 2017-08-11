Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id CF3E178569
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 22:20:26 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id d17so21481569lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 15:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0uyYcFIg7aNAoTWUB2FyGYI/A9lE4vyOeyYARK2SXdU=;
	b=cURBtn4yIWrOf6IbAWarOrtVgNL9/KOceWN31MAWOfasebXJjAtxvEarrc4cwERVSZ
	VvGsLSMy1YwTtaVvc7aisu1KEIg9vIoE+qw0eVkWZmnMz3D+7uRbgtUfhel7S8OF3phr
	asn0/Ioo76k5G5r5BTREm+rM1BLKN5Yv6l/flAS0MDo5hHaVKbPg/vvGsLwByDmSignS
	zA/f5pID6P7NEUrW9iHUlSryYXUZIY6ZT8lw2I9ly3nZK+TBI45071rmJq3Os6aYoyr4
	N6YYzuBeA3COcBL8bmnhvCe8ZWApSKgOVwggwM+bwx2FvQvVVzwMLN4vKUVU7FwRTEbH
	ZvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0uyYcFIg7aNAoTWUB2FyGYI/A9lE4vyOeyYARK2SXdU=;
	b=q4qvYvFkb9PPEukv5a8D+kUldcbsbg3ppzG7V7pp/PTiSsC2Wy06Tbm3F3XsQKd9Qx
	7fj6+Mo5vKJSp9iF9azLdI3nWqCT0u4y/SgKuYOJM+SIgHcdRAxa85fAgLJ1DK2gaWqS
	PAtB56oOKKVZayYMuSgqaMxlyDFy+s3ToTRkzcVSwZO4j4+inHatxUpatO53RpgL2h7j
	x0YeWzrREJZQCz6POKhbw/4tEpO3HR+fansPWbsJuxEmV8bN7XF5U+MFGQ0mXnczEp+A
	ib7X7YhaWIKoDii1gQNKY2JOW8UPJoUbf5aH1uDVSZbKPLTVb2jra86cgXweZlPNgJkG
	SnzQ==
X-Gm-Message-State: AHYfb5g/7ke4dNoiqeQtSlwgXbn7l+f4yALBAL2/AYLmYdOdQzM9bu/x
	uVyRfB5vYTxqX8mm02I=
X-Received: by 10.46.64.79 with SMTP id n76mr5913469lja.108.1502490027220;
	Fri, 11 Aug 2017 15:20:27 -0700 (PDT)
Received: from ubuntu.lan (c-7569e055.018-216-6762674.cust.bredbandsbolaget.se.
	[85.224.105.117])
	by smtp.gmail.com with ESMTPSA id h63sm276560lji.54.2017.08.11.15.20.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Aug 2017 15:20:26 -0700 (PDT)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
X-Google-Original-From: Oleksandr Kravchuk <hello@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 00:20:13 +0200
Message-Id: <1502490013-14008-1-git-send-email-hello@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.7.4
Cc: Oleksandr Kravchuk <hello@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH v2] curl: upgrade to 7.54.0
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
X-List-Received-Date: Fri, 11 Aug 2017 22:20:28 -0000

Signed-off-by: Oleksandr Kravchuk <hello@oleksandr-kravchuk.com>
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


