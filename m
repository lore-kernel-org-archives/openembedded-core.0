Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 99A407846C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 01:32:41 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id v9so8949347lfa.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 17:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=exiHp9JRRjAJ0awKuI2J6ILlbTqcBPLoSxCDgofaaeA=;
	b=g0hp/PTBijaeZ/1jK/T3v3fgLbxZ4OJgcLg+ZxQ7nKKh0YRdIvYGX0o5xcMIzX4Bbb
	/njyChxJs///+eph+maALETKsQx5O3KKW2gTYEovaRgqOiJHKvjxIr6CYj4Zbv/82Lrr
	94FUrBVdpLj80wL4OT/T6494qIBWy/llmUfKGektkQPE2phfFFqCL0X6th+GD1XYIA0U
	Nf6tOHNuvZs/DSsgWDhcYYGC9C/s4RFLctWL9EFU4bU1f4ii4RZvq56QbDHYPpAxNrjJ
	GL3kfp94VBDrvcvFkHywSXN9ab+xX9kLnogddYxM87KIjMCcq2kd+Da5+Zl9Q5se26++
	6l2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=exiHp9JRRjAJ0awKuI2J6ILlbTqcBPLoSxCDgofaaeA=;
	b=AKtEmc6e2/M9cU7N8w7Xwwm2qXwgsaxJgAtTFIqaxexCoiEYrNus3P2kE9JjSI6AIy
	J7qkTsOuReRU1kIXKXrUAzDaOtGIWjJDdc4rKXpEjgnNd70NINyg+MmhVPK+RYtLVSSP
	8Ic2Y/9RnnOp2RoGMzlAUjS7KZHnAV7lv6flp8oGfD+1zGPqUlxwcSkRSB9N3Z1kou9s
	e+j3Fi2JYAIw0nfNFkyJpmO5W0KXvin/P2TEddhhc/90GP2IjuAZyDe3Yz9yGOP/MN5H
	zGfFj7vNbqZ9kDbA4PKf71ek9d061MJOl/5n1L0FUrKRS56Iu4uCM3NCCkqHsf44OfuW
	xTCA==
X-Gm-Message-State: APf1xPAHUgYN4UIz5Gqqi1LKbGKgTK1Zc+9wKYSjMBU+Ot/8nPBmPkVp
	km1oJSKwbLUUqT1UTK13dR/deJ116wc=
X-Google-Smtp-Source: AH8x2274fMg6oLolyHm2zDdbsxVRLueelzwn+ZDTEdLlPtQuaXHvfJojXkwbiSz7RrBYbzSMl/k1wQ==
X-Received: by 10.46.41.157 with SMTP id p29mr8131498ljp.137.1519003962035;
	Sun, 18 Feb 2018 17:32:42 -0800 (PST)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:80ad:a8be:d6c:2b2c])
	by smtp.gmail.com with ESMTPSA id 5sm4671501ljv.29.2018.02.18.17.32.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Feb 2018 17:32:41 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 02:32:09 +0100
Message-Id: <20180219013209.21401-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180219013209.21401-1-open.source@oleksandr-kravchuk.com>
References: <20180219013209.21401-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH 2/2] curl: upgrade to 7.58.0
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
X-List-Received-Date: Mon, 19 Feb 2018 01:32:41 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-support/curl/{curl_7.57.0.bb => curl_7.58.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.57.0.bb => curl_7.58.0.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.57.0.bb b/meta/recipes-support/curl/curl_7.58.0.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.57.0.bb
rename to meta/recipes-support/curl/curl_7.58.0.bb
index 47e3d45460..5535a5609b 100644
--- a/meta/recipes-support/curl/curl_7.57.0.bb
+++ b/meta/recipes-support/curl/curl_7.58.0.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "dd3e22e923be17663e67f721c2aec054"
-SRC_URI[sha256sum] = "c92fe31a348eae079121b73884065e600c533493eb50f1f6cee9c48a3f454826"
+SRC_URI[md5sum] = "fa049f9f90c1ae473a2a7bcfa14de976"
+SRC_URI[sha256sum] = "1cb081f97807c01e3ed747b6e1c9fee7a01cb10048f1cd0b5f56cfe0209de731"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.14.1


