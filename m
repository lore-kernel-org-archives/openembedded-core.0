Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5581ACD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 17:31:59 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.710.1781717510870304576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 10:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=r6wrByRr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202606171731476b54b55979000207b1-_k8qr5@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202606171731476b54b55979000207b1
        for <openembedded-core@lists.openembedded.org>;
        Wed, 17 Jun 2026 19:31:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=d3qasRG0ZRDT0kM33dA29Y3yVHkAFqX3woGZ2Wk+hEw=;
 b=r6wrByRrU2UdaBaXSmeX58CisMr13v4tuDy+5XIBSLsgYNzvhl6fRvPt7GzHXRMD4BKd9k
 ghbuNd4/0xtAx+bKGq2+O1Ia98m8RQtwy10pBZJY/KwH4u5FULBfvEkJSWbuaOHiu37Cc3e0
 R8VUmBiXyfjlTmTZl59eTPkLfBXRYyCNFeKh153jYOo6OOaw5TuuRiyuX1/FsRiOtF0BzEh+
 6N0gQFzHcpsA03lZbQBCEBfpxe6xdgpnfmTAwdXL28pa8Ee2lokBcJ/ymbREVoqHYwQtlIrZ
 i5mkAAY9cA2Qc7Vi2QF8cZ2MvNKoMcax3a59/GSS3w73yEiPj+otBXnQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2 1/4] wget: remove pcre packageconfig option
Date: Wed, 17 Jun 2026 19:31:26 +0200
Message-ID: <20260617173129.1013998-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 17:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239042

From: Peter Marko <peter.marko@siemens.com>

libpcre is obsolete project replaced by libpcre2.
Also libpcre2 is the current default packageconfig option.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/wget/wget_1.25.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index f0d3458462..e6650594d8 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"
 
 EXTRA_OECONF = "--without-libgnutls-prefix --without-libssl-prefix \
-                --disable-rpath"
+                --disable-rpath --disable-pcre"
 
 EXTRA_OEMAKE += 'TOOLCHAIN_OPTIONS="${TOOLCHAIN_OPTIONS}" \
                  DEBUG_PREFIX_MAP="${DEBUG_PREFIX_MAP}"'
@@ -34,7 +34,6 @@ PACKAGECONFIG[iri] = "--enable-iri,--disable-iri,libidn2"
 PACKAGECONFIG[libpsl] = "--with-libpsl,--without-libpsl,libpsl"
 PACKAGECONFIG[libuuid] = "--with-libuuid,--without-libuuid,util-linux"
 PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
-PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
 PACKAGECONFIG[pcre2] = "--enable-pcre2,--disable-pcre2,libpcre2"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 

