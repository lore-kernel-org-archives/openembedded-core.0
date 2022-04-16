Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004ECC636FF
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.21640.1650136501123672050
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=grjRhMEA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id q19so11945592pgm.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y5DxtvoLagAj/AXW1g/EdP34GBYxQwJk2LT07r2nqGg=;
        b=grjRhMEAk8rgltJ3QeVobc91H3cZFvsFZjGQIeHfbJcAhLBp3RQ29bk6m4x0jTMxk3
         T7PuYWVx4pTKB0GUqmjmKpLyKWcGUv8cUE2oYUWzaSoXkpziI+HyHnDcQXfXF7hOr1Kr
         VCDmgJesN5t2fTFQwaFRYNFZTFgDekfGG0iUq0Trhixcq2yKcPjKB0ODQB8QRAngUKQu
         sFBz+c4n1geAx2bOj8/zKiG2arbkLVPb0aqTtlcNITDvU1BsRPF4zueY0z8rxOT7HftW
         mwNtmi0qcF8jKGefAShjpSJvsPpv8HWt8/F0o88DxODikU4BAwttkTHJxkrlp3G0puMQ
         Ogcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y5DxtvoLagAj/AXW1g/EdP34GBYxQwJk2LT07r2nqGg=;
        b=nqXlVIwJk+nQLIvhpeIBKrDDaKpv1VJ6eINmKCG9PpfLp02IjTLbqEmrRY3XatcwLQ
         8WV1w8VMz3V1Rny5x1cPlbrO54M7okLCVbgQ5mY2dAgW2s3GQoac+wetA/juj2Grq0E9
         08uqMeLxlLPdrcR49ttax8elCBnarLxbC/0Fc4v0inUT6HDUvN7krjMYRKsI9KkblGL+
         Pa/nLH/bjBPoU9xL8iNljn6QqOWeAUtsSthb+7C8sD0XQtNFGCBOEFCxU9OlWfygXwLG
         4pVLrPjtO/q7Bj4FwFDJqR9ceexMqOdv7mvXo6/YQ0TM7HxtNBmgM8syKO0Obrwh/mvf
         k7OA==
X-Gm-Message-State: AOAM531nBDENws2C7PUvNbWhkzvhe3kVkqjtBBTeBD7wSYrOPzFowfCI
	a1HtluW5WmZUsK8q18VSqH9rk6ZtCWCv3/4CYaE=
X-Google-Smtp-Source: 
 ABdhPJxjn+MFT3xLiyOePrILlodUMINoohU+tPx3m5n0a+2E6MObDJB66xGBJ3fhVChiXm9GK4nSvA==
X-Received: by 2002:aa7:9283:0:b0:505:fe1e:f6b with SMTP id
 j3-20020aa79283000000b00505fe1e0f6bmr4627205pfa.29.1650136500311;
        Sat, 16 Apr 2022 12:15:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a62b402000000b0050a62e582e5sm430004pfn.37.2022.04.16.12.14.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 12:14:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/11] git: Ignore CVE-2022-24975
Date: Sat, 16 Apr 2022 09:14:23 -1000
Message-Id: 
 <f35500a442d6a4564d52e23f9602a3f90a4ceee5.1650131192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650131192.git.steve@sakoman.com>
References: <cover.1650131192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164551

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Everyone I've talked to doesn't see this as a major issue. The CVE
asks for a documentation improvement on the --mirror option to
git clone as deleted content could be leaked into a mirror. For OE's
general users/use cases, we wouldn't build or ship docs so this wouldn't
affect us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5dfe2dd5482c9a446f8e722fe51903d205e6770d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index a89dd42e8b..ffbae145cf 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -20,6 +20,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
 
 CVE_PRODUCT = "git-scm:git"
 
+# This is about a manpage not mentioning --mirror may "leak" information
+# in mirrored git repos. Most OE users wouldn't build the docs and
+# we don't see this as a major issue for our general users/usecases.
+CVE_CHECK_IGNORE += "CVE-2022-24975"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cvsserver] = ""
 PACKAGECONFIG[svn] = ""
-- 
2.25.1


