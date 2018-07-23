Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 16F59746E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 12:31:21 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id e7-v6so519694wrs.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 05:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=GbUguiEzvNWpomjcuxn2PgEISHGTSC81rUYPlqq/SiA=;
	b=IkvT2aCMhlNa5qvoQlIzFz/eWFlPR2BGi86TL4MxHeq4KTMBNnU6+7hTimWrE6jdHu
	1mbkb7oXotTWwQBQX4jCqhW4RyuGpradHVyeb2FEhzefK2CMbgf8/aaXM4fgqASziIfq
	tw2OcXVst+VUZsHEbfm56b06bzwyT2ujGGNKjrXSkn6jUbFRpzjZ2tCQbr0ROfxz7R0Y
	Y32Zg/qWu05ur0Z6leR/Q7B9MSXSIfxGumsv3SEkLB/BR9E3UTQbEIT0EVGH9kUF97Jt
	41OVR5dd6792hdtqofRVhGYc+4ufhakZIJoQ3V91RGAvVfuad2x2YY1uUFvdOCctaQ4y
	Ueng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GbUguiEzvNWpomjcuxn2PgEISHGTSC81rUYPlqq/SiA=;
	b=oNWXc0yUuy4t5aQ8AWTLAFLOWrbyvkMlzUsWdh2ubmrfb+KtnfwiICE32DHM+bhgrK
	RsOkpfQoXpFBW075L/CB/fKcr5PjwaG1eWzoQg/tes5dUmC9NDJyuY2eC9GH9Zeskday
	W73Z+OsXBbGJ3VQDQExayY2Mv0Bkdx90NkRfQa/h9muSodpYJpzbdxrWryaf8EgY7a4L
	PU0lVgkyHKwhYHD+zgQO8eB77MBwE+0QuGN4LuRXq4z9GnrXzq3NTjIL9gXdRqLBmFbU
	Tdt7Y+Rv91i2NPGvlFGkgHzU86tl4iORUBMvKyjfiQTFJqifkqcP+C3WCzYjELxhmXOl
	54eg==
X-Gm-Message-State: AOUpUlFR1VuRD8ZN526xOva5Fn/vfLibgRMp4Ea7Hs7CmPwGSDu4T4Su
	OL5dSqgZ3VOWqXZytCQGVsprVCwCgKw=
X-Google-Smtp-Source: AAOMgpcCWCengqQJUV7JolfPJaSKq30wDmrUS4lZXvaDOfA3xkpCGIAZHqfShGwDgI9hdcbRCxVqcQ==
X-Received: by 2002:adf:e687:: with SMTP id r7-v6mr9074084wrm.35.1532349082437;
	Mon, 23 Jul 2018 05:31:22 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c13-v6sm13188575wrt.24.2018.07.23.05.31.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 05:31:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 13:31:20 +0100
Message-Id: <20180723123120.7299-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] curl: enable libidn
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
X-List-Received-Date: Mon, 23 Jul 2018 12:31:22 -0000

Now that oe-core has libidn2 we can enable it by default in target curl builds.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/curl/curl_7.61.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
index cc983fd4a6d..76f55094a41 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.0.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "5f6f336921cf5b84de56afbd08dfb70adeef2303751ffb3e570c936c6d
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy threaded-resolver verbose zlib"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls libidn proxy threaded-resolver verbose zlib"
 PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver verbose zlib"
 PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl threaded-resolver verbose zlib"
 
-- 
2.11.0


