Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id D287F76FFA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 21:49:49 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id x125so90921462pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 13:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6CTPEpIBXzkdkmhQfuc1Yld2LN5bXh1lRJPfGEoecHg=;
	b=xZ6H1ApoY9LGfAUNOb+J319BRIh35Y002HGiq6i7md62+5WeYn98Sz8n3/ZjlaSP5A
	eMG0IUUcLZPJR1tb4EXsDRFT/PSiHyLa6H7tflDls1eTaIEJ8NXGELmxU6NbX2esgq4p
	aNDHGj/3sP0mZs/tYj+1qfTExTNyJN3XkC/n4j8seh58Yo8zTvbOGJG8SXuQWXCovSQu
	uyWYDaYG3oLfB/I7eq77e77vYmDhvWTxOLBG+NoRpZ5w4wuDv714XiezGffp8o4Trs3A
	Xe9cUqy1qJQ6vXeqJvM1Rt1AWcPuYpwoAzn4qNROkHXIrRbcHyFP4DPbN5OmoLmudsk3
	houg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6CTPEpIBXzkdkmhQfuc1Yld2LN5bXh1lRJPfGEoecHg=;
	b=K5qJtk3PK6st/0rXfv54NcxGvGTD+VMwFFXKemgSJtKK8ChLwXfbSJzF4vsQ+T6McY
	oonyrpyLMH6nLq9LonLn6OzC25Ewcx6dDlig6611JCS3qf6tb4qKzd32NmENWFdRNQV9
	Pym+DFwCcMP/su+vIIwTOyY3HLdELNx0Q4W6k7TVEPQqe8jcBz9F/llXRfi2i4YTU94h
	XOeH44xMBPH5KX55eJ3YnWCbbBSr/rI5yDlRDmmT2Kbf42brEJs/GjUYRUCtsCM9oUCg
	jwt7NK9N/HEIZVtYM19Q+9xqAHikLJYrde6mxxseayIJbUIfYLdn4GhdhdShR2avhCw+
	st9w==
X-Gm-Message-State: AG10YOTn8H1qEg+QHfY8VkLlUq6PkI7ZGG3teuJHhNb6viMKFZczFWuWKX8tvttMaxGpwA==
X-Received: by 10.98.17.92 with SMTP id z89mr41903122pfi.16.1454363389969;
	Mon, 01 Feb 2016 13:49:49 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	xm10sm21503622pab.12.2016.02.01.13.49.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Feb 2016 13:49:48 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 13:49:42 -0800
Message-Id: <1454363382-13387-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [RFT][PATCH] curl: disable curl-config binconfig file
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
X-List-Received-Date: Mon, 01 Feb 2016 21:49:49 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---

This works OK for me, but probably needs wider testing.

 meta/recipes-support/curl/curl_7.47.0.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.47.0.bb b/meta/recipes-support/curl/curl_7.47.0.bb
index ab3c7e1..8e6362f 100644
--- a/meta/recipes-support/curl/curl_7.47.0.bb
+++ b/meta/recipes-support/curl/curl_7.47.0.bb
@@ -17,7 +17,7 @@ SRC_URI += " file://configure_ac.patch"
 SRC_URI[md5sum] = "85c58a00412476993050cb242a3f365d"
 SRC_URI[sha256sum] = "2b096f9387fb9b2be08d17e518c62b6537b1f4d4bb59111d5b4fa0272f383f66"
 
-inherit autotools pkgconfig binconfig multilib_header
+inherit autotools pkgconfig binconfig-disabled multilib_header
 
 PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} gnutls zlib"
 PACKAGECONFIG_class-native = "ipv6 ssl zlib"
@@ -45,10 +45,7 @@ do_install_append() {
 	oe_multilib_header curl/curlbuild.h
 }
 
-do_install_append_class-target() {
-	# cleanup buildpaths from curl-config
-	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/curl-config
-}
+BINCONFIG = "${bindir}/curl-config"
 
 PACKAGES =+ "lib${BPN}"
 
-- 
1.9.1


