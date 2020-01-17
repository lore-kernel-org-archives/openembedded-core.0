Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B2AAB7FA24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:58:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znM24zwgzC6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:58:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579280302;
	bh=2DORk+EtODobDprgW8PEBSL4BUCQEwR6FZSKdNW67hE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HmZ38lka1tD9eoiiNM2PEwhvw+SZol0cquYOH1ao92ilGIb3twUc521AimeIM81nW
	JZqka1w2UgetF/VSKNfjMWT1nunmWw91DkxkdMDmm6pwcrF1XsP6X1ztmH09j0IIGC
	IE2I9Gms3fhgu5Y0FYRAPEg/T9mqnQfWaltTcRoEiWVTAVnTUoiGPWHBEhNnuLIO/t
	Ysgbg/YsvoIqWlICWEm9XYv3ZGZ29CkjH4Rs6kJEHgVlT9n/3QlwUjwJO4A9KXYZ0Y
	WtABhNFMxUGYw2mranGaamNefb8A5MJOMDkBxnyplO0TAG6RyREi2SeJFjfoxkfQgv
	C6yS859zi9YmF1f5LHn5u2A86bjHmGxhV0itoJQAChWBfKOFs0Xb4vXsw6ZphZIMAE
	VBNDPMz1RajPOc2MVGlSddYUDZtEXwBkMIUPYbGHGgn9r3DBD27sXeW/xrS3+ActQ1
	bVBJ8jZxaq1fnfTmXmPqZhmYQXWcGU/rXIsxZ7xSm1TyzM+3kLX8MjWedDCSiVjSW1
	V/naNsjDuZi38Giz4X/Wxy/XZ9qLUf4s6DOm8gDmrxyqZj+8CL+/yTY1GY330zplHR
	4jlOdJSZcEroA1YCwcdT7kzo0om4q746ddHoQxcOy2v8kQXznUexohzK0p9pKrClt5
	BffqVH4VvXwvgvc1tLNmgLlw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 18:58:18 +0200
Message-Id: <20200117165819.2542-6-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200117165819.2542-1-bunk@stusta.de>
References: <20200117165819.2542-1-bunk@stusta.de>
Subject: [warrior][PATCH] openssl: Whitelist CVE-2019-0190
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
X-List-Received-Date: Fri, 17 Jan 2020 16:58:22 -0000

This is only a problem with older Apache versions.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index 0e65f333e2..af2217bd15 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -205,3 +205,7 @@ RCONFLICTS_openssl-conf = "openssl10-conf"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "openssl:openssl"
+
+# Only affects OpenSSL >= 1.1.1 in combination with Apache < 2.4.37
+# Apache in meta-webserver is already recent enough
+CVE_CHECK_WHITELIST += "CVE-2019-0190"
-- 
2.17.1


