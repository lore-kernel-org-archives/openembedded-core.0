Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13563C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:05 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.8302.1662560463065190118
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=eeMIxt2a;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id 65so4552435pfx.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=fxg137MTz6c1D1tR5/r2OOq97gA9LlRczr24yyEK3zw=;
        b=eeMIxt2aqITcH52obYGNmBrqAdXoEFb0WKj5kzbpy5cgewRKtdUvxVRHBmpsfcT6pr
         2tnvuI52bNm2aDznSo87W+ImrXc4fzTy5RxXHqwJF0CM4ZkiDYTmDaAUyr1lVW5nobvi
         mCp+9ZGyJjvCKofepmNaoaNNALuaGWih5i+03DPJ0BsUSAJLsu0wG69Spk9g01HWgyqW
         3yCe0RbGlnuFABhyYvrLjPzZassBbMLcLDCuMxkqyK+shUpwpT9q3eC7TSo3N0dPz30u
         MjNLRdCjAYonqrymENjIB4hLQrVr1Da4qtN+GFCbwVqv2dnsKdraSyO2+8z2FdU+5h2g
         E7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fxg137MTz6c1D1tR5/r2OOq97gA9LlRczr24yyEK3zw=;
        b=mdLevYq5ztw+KR8nJh2NrD1GJsh+WrKYY6AQ0WracPhtODxbBQH+wGDhHBvVKIlh2e
         Cag27+/aZyU0m0uNoVbW4tonMuRhlgeS8Wy6w59eN0fuIs5RUtgKUODPKqqoJiOKLcie
         ihm8nyPViAXg1zKCOMTo1bsDd0rNIkg2CrQmsRvx6+Rzf03icgkrA8jqo3Ce0mIL3t7u
         uVUN5FnN9/XNaojV6+OFzwa4MB+IgP7fzXdvjX2SUSpAvtrZk38g34UNHdp+ObcQb2Ou
         uqjnEaLG/P0E/vM1nX6KZPb0VC4nkaFbLV95yIuIgnFd0vxzBlQJ0XeNgWM13iF1Ijdn
         kg/g==
X-Gm-Message-State: ACgBeo2WdjDA/GxA1rZbQsFdbDZAZirKR5Em5rD+wlSCUgMgCBeCUZq8
	4wdgSkdMnuDb7qlwkNCUAUGCj7LpRTBvYYR0
X-Google-Smtp-Source: 
 AA6agR6gbo5MweFgip4RyoNChUTQvZFmAmrgrJqadR/PGJ/UmFz46icnreL0HGwfIsWLKWFxSpH5yA==
X-Received: by 2002:a63:86c6:0:b0:434:fe98:9f8a with SMTP id
 x189-20020a6386c6000000b00434fe989f8amr1456243pgd.541.1662560461922;
        Wed, 07 Sep 2022 07:21:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.21.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:21:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/24] lz4: upgrade 1.9.3 -> 1.9.4
Date: Wed,  7 Sep 2022 04:20:12 -1000
Message-Id: 
 <8883d3992078ae24c2601ebf844223fa6e056ded.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170406

From: wangmy <wangmy@fujitsu.com>

CVE-2021-3520.patch
removed since it's included in 1.9.4

License-Update:
  Copyright year updated to 2020
  description of 3rd party applications changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f95c66050bc69af7769d1868b0118cefb24e5b0d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lz4/files/CVE-2021-3520.patch             | 27 -------------------
 .../lz4/{lz4_1.9.3.bb => lz4_1.9.4.bb}        | 10 +++----
 2 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-support/lz4/files/CVE-2021-3520.patch
 rename meta/recipes-support/lz4/{lz4_1.9.3.bb => lz4_1.9.4.bb} (78%)

diff --git a/meta/recipes-support/lz4/files/CVE-2021-3520.patch b/meta/recipes-support/lz4/files/CVE-2021-3520.patch
deleted file mode 100644
index 5ac8f6691f..0000000000
--- a/meta/recipes-support/lz4/files/CVE-2021-3520.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8301a21773ef61656225e264f4f06ae14462bca7 Mon Sep 17 00:00:00 2001
-From: Jasper Lievisse Adriaanse <j@jasper.la>
-Date: Fri, 26 Feb 2021 15:21:20 +0100
-Subject: [PATCH] Fix potential memory corruption with negative memmove() size
-
-Upstream-Status: Backport
-https://github.com/lz4/lz4/commit/8301a21773ef61656225e264f4f06ae14462bca7#diff-7055e9cf14c488aea9837aaf9f528b58ee3c22988d7d0d81d172ec62d94a88a7
-CVE: CVE-2021-3520
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- lib/lz4.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: git/lib/lz4.c
-===================================================================
---- git.orig/lib/lz4.c
-+++ git/lib/lz4.c
-@@ -1665,7 +1665,7 @@ LZ4_decompress_generic(
-                  const size_t dictSize         /* note : = 0 if noDict */
-                  )
- {
--    if (src == NULL) { return -1; }
-+    if ((src == NULL) || (outputSize < 0)) { return -1; }
- 
-     {   const BYTE* ip = (const BYTE*) src;
-         const BYTE* const iend = ip + srcSize;
diff --git a/meta/recipes-support/lz4/lz4_1.9.3.bb b/meta/recipes-support/lz4/lz4_1.9.4.bb
similarity index 78%
rename from meta/recipes-support/lz4/lz4_1.9.3.bb
rename to meta/recipes-support/lz4/lz4_1.9.4.bb
index 129a86b681..a2a178bab5 100644
--- a/meta/recipes-support/lz4/lz4_1.9.3.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.4.bb
@@ -3,18 +3,16 @@ DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing comp
 HOMEPAGE = "https://github.com/lz4/lz4"
 
 LICENSE = "BSD-2-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
+LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=5cd5f851b52ec832b10eedb3f01f885a \
                     file://programs/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LICENSE;md5=d57c0d21cb917fb4e0af2454aa48b956 \
+                    file://LICENSE;md5=c5cc3cd6f9274b4d32988096df9c3ec3 \
                     "
 
 PE = "1"
 
-SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
+SRCREV = "5ff839680134437dbf4678f3d0c7b371d84f4964"
 
-SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
-           file://CVE-2021-3520.patch \
-           "
+SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


