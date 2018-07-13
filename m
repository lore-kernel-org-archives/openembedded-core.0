Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 039EA74E1A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 21:12:30 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id q7-v6so22182676pff.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 14:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ua3rwcYFVupWch4fY04FETdVwXmYw9tdtLzi45ftYTU=;
	b=urB643WlfpHCyVjdDma0hUeYOpxTPh1eN9FgJ+y9getUEvxHR+czVOWSQjcseq1CGB
	VOuCZ/CL4BTVlY9pN+5Kx7W7epwzE5dCSoqHG4ngPitxu3UgOf+mXhpRuz9rcB7kiz4n
	GhkMRgTRpLaYGvHe4M85Bf30XqJUzSgJrE0ZOrzTp3Ef/bN6fb0wLF+71ayZ+7uPrD5s
	xSW9kkyWEEFNsmib3dqRAzj46a4GZT1yIs1tWBTaHFla76LqEjMnKXNZUUC4xtJeSALK
	hOkKdtBwiEkYFlhvhQa9N52rSbtbKqXDY8EOzSTJOcfI45wjzJwVmKV/GS9HSaB5hAW3
	Pfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ua3rwcYFVupWch4fY04FETdVwXmYw9tdtLzi45ftYTU=;
	b=hC7GEk9DfCESBs4fierqcy+Uk14346BWQDl3oyfdsVtnnMN1dOZtxVQcHpjVy3yAvA
	1mKV9k/TTqXERtGSwOfWikSCytwUP1OAjCw5ro0VFORdFlt36Ajzpph3w4kwFWH97VnY
	i2TEQlByTgyWnbMNriyPSMLvjXkvC3nlVKh1z/PRxHsQHcENji+Rqa5WFiklFs8Y7bS4
	G9/fmqXx50PDi5eZHZ1kAboISPtmmj4Q0eCLrH1uR9w/23yzXBnnFH4GQ7OYQg1mlKn7
	0a//UlOYkJIyUbHIJZbTpoO34tj85oKmJMkz/+3/IPNqfWd2akbWxcO+rkZIgT3XS7nE
	EXVA==
X-Gm-Message-State: AOUpUlGk7eKql/KzF5PfX2wJDNERbiwmiHwKOuVmzrc69jKAlycNgwv9
	QyIoBcooLZ3xo9kagwGG38dmnQ==
X-Google-Smtp-Source: AAOMgpctoE7fUXOYMF1hPe0Mcs/MgurXsuw7OxMtvxFwyJv8W4rVyXr9Pi8c2d/eEXG939bVswMQwQ==
X-Received: by 2002:a63:8f03:: with SMTP id
	n3-v6mr7568468pgd.166.1531516351867; 
	Fri, 13 Jul 2018 14:12:31 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	o12-v6sm24305369pgd.71.2018.07.13.14.12.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jul 2018 14:12:31 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2018 14:12:24 -0700
Message-Id: <1531516345-10287-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] curl: update 7.60.0 -> 7.61.0
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
X-List-Received-Date: Fri, 13 Jul 2018 21:12:31 -0000

https://curl.haxx.se/changes.html#7_61_0

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/curl/{curl_7.60.0.bb => curl_7.61.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.60.0.bb => curl_7.61.0.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.60.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.60.0.bb
rename to meta/recipes-support/curl/curl_7.61.0.bb
index 50c9051..a80f926 100644
--- a/meta/recipes-support/curl/curl_7.60.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.0.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "bd2aabf78ded6a9aec8a54532fd6b5d7"
-SRC_URI[sha256sum] = "897dfb2204bd99be328279f88f55b7c61592216b0542fcbe995c60aa92871e9b"
+SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
+SRC_URI[sha256sum] = "5f6f336921cf5b84de56afbd08dfb70adeef2303751ffb3e570c936c6d656c9c"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
1.9.1


