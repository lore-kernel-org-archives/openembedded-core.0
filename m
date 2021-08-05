Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web08.10529.1628177753926766928
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UdVou+yV;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id t128so7904375oig.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uxGjbsH4AbFCAFsNAG+tqTylv8qG0izqxMvZ3bUH0Oo=;
        b=UdVou+yVR997c8uuvXpwW4VbXFFrlXOlrzpCiv6Sih5QtHNLxFOGSU6UQpObK+XwNA
         /QI2BNLW0WbYgW4USaxcBe1R5VcoLBRDtRe8EcI9TMWXg1xQ6pc+r5vCcACl8GwEbkX7
         1sTwO4ccnyrd8Xlnw6WvcBA9ulZU8Ve6FlfCKrVuittJ0eO+s1+cBzZYeOUqVZQ/N7sP
         5UfaFUCk1a8MJSnwFt9CQ2EgA52w6m+gkOn/Ox4nIkLsAbZeV928pX+S/jUf7iu9PgBV
         mPiJPMXDNNgrxoAHQKaNJvw+ZbQJaHYMZtKEiCGQ1UAQCYaXZlt0iUGvegLs8aMK3tgj
         5f0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uxGjbsH4AbFCAFsNAG+tqTylv8qG0izqxMvZ3bUH0Oo=;
        b=Co3v5j4jqkSfOln2Fe6z3PICyI7XNsqlKt6Uupb85xLU4Xa8xj7YXwJbfT8lakGZAo
         hVtsXO92UHJ15Ckopu20CLAmyB1XL8qKzRUecoVpXjEVM80ENTbuMaXvLfaJauFFX7Hz
         4aNABWl3Da/ZO/z+JySX7jehlrf6hu3v8cbS/9wxTCLFtxsvHsE2RZ11QpkiXGKpZQ8Z
         aSwHPSujEdYogRyWPtqwy1O7EtiYXvlUFRBJaYABSfX//dQkerMkaU9ZwOlH9Y6//RWu
         ags/UHyKO7ms/4QTuwvXoGW2u0ZBwDbrYlDqzWHOnySN+cFCA+YIZCsoHYFWrkSuHGHT
         Hemw==
X-Gm-Message-State: AOAM532hW2NNP3R4cS11Kt5TZo7soojE49+0z2UzeivrzRXZVPjbV1Qv
	gaz6LRt9LrhtXUr8m3zh8VpHQ6XrX2N1OLVI
X-Google-Smtp-Source: ABdhPJy78SROraU4Y7+q0ayBtW8hbEUxwFdY/DjaYjF848/HMfpDgS6VDrCB4pjn2poVeAvCvj3awQ==
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr4084520oiu.19.1628177752864;
        Thu, 05 Aug 2021 08:35:52 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.35.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:35:52 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/33] oeqa/manual/toaster: fix small typo
Date: Thu,  5 Aug 2021 05:33:46 -1000
Message-Id: <5c5c6fe8ce588443adcd4c435c3570535ef3f23a.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ralph Siemsen <ralph.siemsen@linaro.org>

PACKAGE_CLASES should be PACKAGE_CLASSES.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a96f3bceb2c857f841b1dbeb4587a8aaace529e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/manual/toaster-managed-mode.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/manual/toaster-managed-mode.json b/meta/lib/oeqa/manual/toaster-managed-mode.json
index 12374c7c64..9566d9d10e 100644
--- a/meta/lib/oeqa/manual/toaster-managed-mode.json
+++ b/meta/lib/oeqa/manual/toaster-managed-mode.json
@@ -136,7 +136,7 @@
           "expected_results": ""
         },
         "3": {
-          "action": "Check that default values are as follows: \n\tDISTRO - poky \n\tIMAGE_FSTYPES - ext3 jffs2 tar.bz2 \n\tIMAGE_INSTALL_append - \"Not set\" \n\tPACKAGE_CLASES - package_rpm \n        SSTATE_DIR  - /homeDirectory/poky/sstate-cache \n\n",
+          "action": "Check that default values are as follows: \n\tDISTRO - poky \n\tIMAGE_FSTYPES - ext3 jffs2 tar.bz2 \n\tIMAGE_INSTALL_append - \"Not set\" \n\tPACKAGE_CLASSES - package_rpm \n        SSTATE_DIR  - /homeDirectory/poky/sstate-cache \n\n",
           "expected_results": ""
         },
         "4": {
-- 
2.25.1

