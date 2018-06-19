Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id F065A75488
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 11:47:54 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e16-v6so19388859wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 04:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=n323M2NZX6HqmBsSBdxjxdZqwgnd/F/bpm2mtEzqb/Q=;
	b=Z/IYvqEBzU3+uMfex4kOX8PwUFQho5tfhhAYBulkdEcTAlcdXjY3oBwpnbw7+f2+QN
	ljSR2XaS89Q0JHj5ZmBJQlEBQ1ydU10iyW+8lLPW7cQX9iSQd1LU6qLy/etHqnNO9lZh
	+SIuiqpyb8p2kx90bA4RXYWz9YljazWBGfBKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=n323M2NZX6HqmBsSBdxjxdZqwgnd/F/bpm2mtEzqb/Q=;
	b=sJCAVqiEyjmvXcPq6JdbhH5BOpihWF/+XieOeNY+zEeiDB0ymXF66iyIWmYqCb54uS
	ol6LOPQcz3t7P/p0YYqifVEkDSl20DhVSSlHi5gvO8mQg160cjaZ2iqwnLqsGzoMJw3t
	XDuI3n1OlNh9lvvbUmxpoOQq+VbeO0JBnm5a2Sq+ETo9nZjexdICvslVFslFDRjZEgGP
	caGqgSSur0sFVdxB/zabljwuM241HcvPSCWH8I/CyCLD/kln1Vou+iHCeLwvUYMsqcx7
	mMIt+1V6JpiHnaJVussy13aPPLiwcr/QPMOqFbAs2FiG3k+xZVfiJFqXvPlgL9BVO/La
	O71g==
X-Gm-Message-State: APt69E3NJFgmXopJEChfgEWQUyaCEw4Ah5K6eqRyVDF1/J7EdyrbQXRE
	nSzq3IL1cf62wywkelBMj74+pyJ6uwc=
X-Google-Smtp-Source: ADUXVKKPGIGBrBlphAZ8pP278ORcdqAvobNQ4biy9ZraKhX1F3ismKjzebfvil4+2a5DEeGa2jbcDA==
X-Received: by 2002:a1c:5f82:: with SMTP id
	t124-v6mr10851945wmb.147.1529408875556; 
	Tue, 19 Jun 2018 04:47:55 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a9-v6sm11213499wmh.38.2018.06.19.04.47.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 04:47:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 12:47:52 +0100
Message-Id: <20180619114752.12039-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] lttng-modules: upgrade 2.10.5 -> 2.10.6
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
X-List-Received-Date: Tue, 19 Jun 2018 11:47:55 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{lttng-modules_2.10.5.bb => lttng-modules_2.10.6.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.5.bb => lttng-modules_2.10.6.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.5.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-modules_2.10.5.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
index 370b78aae14..6146966894d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
@@ -16,8 +16,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
 "
 
-SRC_URI[md5sum] = "4aaabaafd15d9455c83972e26ccfbca7"
-SRC_URI[sha256sum] = "b8dbbbee45a673c381f51b99c555e36655c3c2c7a5477aab927591cc7f003a1f"
+SRC_URI[md5sum] = "8110099f4615fc89a74ffe9189b56cfc"
+SRC_URI[sha256sum] = "04a080c81743eb29d181bac29ceb0c15819a2f4210793f2cc9958d885435029f"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.17.1


