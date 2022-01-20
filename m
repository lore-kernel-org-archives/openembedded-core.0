Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69170C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 21:24:31 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.2704.1642713870588886303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YPq/+xJA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 h20-20020a17090adb9400b001b518bf99ffso3972659pjv.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PH1q1mDFwEzwvpqn01kyXU6aYzaII3gx7vj3UX3cH9U=;
        b=YPq/+xJApwKTlJy1YmDhLMjCn56E/FpV7YHPf2ORaa+h2E1qR4KAxV2S1nyW84rseL
         CZBAALpxW7T/vEhBbjUvJsGutEaqo19ZmGLtvMABSVbiw3yDFeGU0IEjOhxI1WB7i4UJ
         qXgLbcVFbsOlXrZLjr/eicBV/F9osNAdahF9b/iR48UuNv5HYhHLccRcQO17+QWyXHX+
         +SeFRUlDRVzKZX2tkeuNo4APFDTmjmZbVaBaaOayjiNJNpViqaj7xSDYpdFvPI41Fn2O
         QLQSVZLEdYyCy042CU84Ag1QIFHZw0BpkfpGCGeNlrDi7bG8SOPrOHyIdhQ4PgzUGKFS
         LToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PH1q1mDFwEzwvpqn01kyXU6aYzaII3gx7vj3UX3cH9U=;
        b=nUS7YkJjXIyuc+xl4xY5fUICf5rDbre3188eKizUeczoU5c6u8xC/HXc9JKdETV+jn
         Au3fpWUS/HbzplYq3eN2kVKoRfjPudPI1pBdEZJBzodqshN3RRsI7/wD/haK15aG2t8i
         sMyYnsQRQuDGs1MttMoDIf9+EwaaIFxYv7hAxF89sOwWadDNutShJ8/79b9po9uZKmDi
         e6gxBcXcElujKoU1K9WDWpjUfHjiToFM/8+dsqEjPkcJ9Y4Omgdm/F+Y9KoQvSIJUJhJ
         wmmcBwn/V81Bteu0q56Q/MF4Dtikd5F5FspRguV/f/yIQtaQ6TsvPExfvutIjThpVbii
         ItAg==
X-Gm-Message-State: AOAM533zRpN88cS7o5+qlidrLCJxZ68J1Vn+HhFOwBW0o0YEVRzPw1xm
	tp7v5XRhLvw35K+nroW1Tlh/HrRPLzUpIrNzojw=
X-Google-Smtp-Source: 
 ABdhPJx+HHEyjIPGnA12CJHQtEDCA1MIPKB0LTqSbLnzshX+Y6V3HkQRMZy4EReaBNF0iR6YlqIg/A==
X-Received: by 2002:a17:90b:4f49:: with SMTP id
 pj9mr13078935pjb.187.1642713869534;
        Thu, 20 Jan 2022 13:24:29 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 o5sm4029115pfk.172.2022.01.20.13.24.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 13:24:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/11] lttng-tools: Add missing DEPENDS on
 bison-native
Date: Thu, 20 Jan 2022 11:23:49 -1000
Message-Id: 
 <32dd9e93c8a49c07d28c8bf240145c9e48864de7.1642693490.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642693490.git.steve@sakoman.com>
References: <cover.1642693490.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 21:24:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160800

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This was being provided by other pieces of the dependency chain but is
specifically required by configure and could fail if those pieces come
from sstate. Fix such builds by adding the missing dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba2587beb2a3fb0ef9139f846e161542d2c5c4ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb b/meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb
index e830475d0d..6306193809 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
-DEPENDS = "liburcu popt libxml2 util-linux"
+DEPENDS = "liburcu popt libxml2 util-linux bison-native"
 RDEPENDS_${PN} = "libgcc"
 RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod lttng-modules sed python3-core"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
-- 
2.25.1


