Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 003E771BE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:32:54 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id t25-v6so5882545wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GbUguiEzvNWpomjcuxn2PgEISHGTSC81rUYPlqq/SiA=;
	b=vqLZebXRZYnenPGPHnlfcL6zyMpmGntayyqVJVU+l6PNdHCKX+PQUTV42em5cyP4Th
	nZIcul3ewXtxjG/YGm0npEfkIC05u3LVtjrRYTm+sDVA7npXBslMC4DY1cdIxfYIzBGn
	c/ftmoR+PQoj8LKG4uVZULWrFzTCyAzCSSlRH+3YqqQbJqGZEW29BwdbPfElczzrRBj4
	KZf9XkFxWCs3KoEXUqmAyguIkhBdjudwLv26feX4VUlD7/N/9ugRwezpDtgjm+NC9vRt
	8mWTyUVZZFY4clZLnvbCzBg5IwHQ9yXVNcoZBOJn1qqmwx9+xnLfrU7Vdd5ifodEbDla
	JX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GbUguiEzvNWpomjcuxn2PgEISHGTSC81rUYPlqq/SiA=;
	b=oZlPzAazQa2AtwFABzIvFcVUllB4sfUl1QLEToKx5ToCr7lzqtoFus1AZTRjJSeWmu
	xx/G8PTPKkifiiJ17XQgrOKB6F7ZKVESv0zENx87j+/EaMIBMtewFosvfAEJ6DPbNPaY
	sn8hag/Fn2yXRZEPp5HUoFYkHNGvSNanA+c2xMFyd1SA8xwUcdy/pCdxEmi6PwYZudDB
	jeaAKUUDcY0VQwrSlpimrwSxKQ3HvnfGlVYHa1qIe1W9+lzVUfWqmc5i5Tr65NSIFqDz
	7Zhx+kNfBUrV34Meg5YtT4i5KfSUaWo8Dn17Iu0jWpSIp9yBjDVfQ34/YkD2nO1G+8Yo
	V5ng==
X-Gm-Message-State: AOUpUlH81Vq1Tagcj3TXZSz6aUgtOMsqrXjD/YqM/bQMIRviDHFreuDM
	IHnVwyqVtwLmp3INprxYekWSIJOmJlw=
X-Google-Smtp-Source: AAOMgpdS7kfSFeSCtAGAA5ZvOlClWttRFnXWyIevyuxC3bAQGBKX0uPnFKn08XJGGjRDd7rF0+B0fQ==
X-Received: by 2002:a1c:168a:: with SMTP id
	132-v6mr5038518wmw.13.1532705575445; 
	Fri, 27 Jul 2018 08:32:55 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.32.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:32:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:36 +0100
Message-Id: <20180727153248.22838-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180727153248.22838-1-ross.burton@intel.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
Subject: [PATCH 04/16] curl: enable libidn
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
X-List-Received-Date: Fri, 27 Jul 2018 15:32:55 -0000

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


