Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3801578569
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 22:22:48 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id y15so21327209lfd.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 15:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=5+d8wr+Zw4rTMtJkSnIOLu+mtdD5Obglt2Nlu9Dllzw=;
	b=nvAcLMmGkSNBb2KcZHpWvDtTG7pETcTslvLU+k/6sdSNFtE7WTtLzaCYJBpwtsEuxm
	TKYytoCIBRwaHBEakCHHom6pAbfLH1IBLccoMRGJEeSCn1xfPs7fLjdNMjLRwJWNNQWq
	SA5RiqheGvRm752IZ1jKkSw17LB+yiblHQzPLzARoDBNonHStw4LwzbpN3dFqXZWMH5D
	xRNTQJiaQh5W+LhSu8YBiEqwI7IZh2vq3iVdVN9YbWKgWimFm6VzNh31VRkI8iLMamof
	aQirmTBFF4tokj4CxOD4QGJXW5X66b0RTWznfE4D5ufxjouKR2yeZtR8ymJAVvOMwuYb
	nNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5+d8wr+Zw4rTMtJkSnIOLu+mtdD5Obglt2Nlu9Dllzw=;
	b=pPsF9EAPTGvcztksX8G5T1cgG/f4qGL6lpdrf8qv3JTqODGmEc8ykZo3tdncW1UBvh
	hNjCuPBmXy8aBWj53R1t8/U2DYVV5qXy3ObTQ5Y6KzlOWy8WOiy28taDTvNlDfQC8RAQ
	CAjKvQkqjXxRpbLwhRn3ZLGOgvzZ/NdiD3+iMXwRoJB6DUOafooGn567DJBaKRxGr75F
	NKDPwRQ2p09UW4kpO1EzlTS9w9jbcHrqWHwx5JhDZRM9owsy+bAqyBJzOaI/ndB6QHZL
	OxLOdtupqsfdbY0IPC6ba85Xk7zT/2bFs4JCSWoDuIcAWS0w5Lgdae49ehMy1nGX/fej
	WISw==
X-Gm-Message-State: AHYfb5iuS72UfgnlwF1Ujd6PqQ03L44VyTsLK+WSanOFCup8NWONnstG
	jTpMUhXKE8AdpCdxMjc=
X-Received: by 10.46.9.141 with SMTP id 135mr6353571ljj.36.1502490169007;
	Fri, 11 Aug 2017 15:22:49 -0700 (PDT)
Received: from ubuntu.lan (c-7569e055.018-216-6762674.cust.bredbandsbolaget.se.
	[85.224.105.117])
	by smtp.gmail.com with ESMTPSA id s8sm314770lfk.82.2017.08.11.15.22.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Aug 2017 15:22:48 -0700 (PDT)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 00:22:34 +0200
Message-Id: <1502490154-14268-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [meta-oe][PATCH v3] curl: upgrade to 7.54.0
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
X-List-Received-Date: Fri, 11 Aug 2017 22:22:48 -0000

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


