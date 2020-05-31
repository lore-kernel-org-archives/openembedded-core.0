Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.17613.1590940411274860707
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IOStMmKV;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id h21so6883060ejq.5
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IrRmXUEcjKY6rQ/QL0nAnfZGQpBCNgM41sohfRSwIZc=;
        b=IOStMmKVMeRPSV6WY1iMbVu0DWFFZZQnUKlBlhauK5d369P35giYgwZp3pjOfii54z
         tldX1RFxE9Tov6fd+qC8m0ts2SDiw4LlikSxz54aObjbmq0aB4LGHarE3TKazJoHTQxh
         OryvugGf/eP4foYqDtw17tQtJbhP2woKluZqbtLYbsmCJaqqgO81zlIDiMXiyU/b5FlL
         R2RqzZWJQiShLOzqJIPEN6gPCLWkf+zMwFSOvwGKxHjC6As1mZZ6I8gjCZebSfYzWaXI
         wFFsiThC8AKcADF2Z5EAjdy406nG346VdnpK44RiJbz4xFiBVmshQ1CVbmUfdazR7E2p
         wnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IrRmXUEcjKY6rQ/QL0nAnfZGQpBCNgM41sohfRSwIZc=;
        b=LTeDf23rjgcs2K2m8Lb5Ak72ORJpS0RqniUGp7aI5SH+2+IXIKLVADLmqUqVjY3clV
         ANZ5UOUx3Y6wkEx24idf2Q0TBD+srRnEnsT/nsAB+Wz2+Ygldm/k+WKcsZA4tQICpBYs
         67gZH/4vWPnR9XA3TqoA4ZVwfar/MImuiRoRG2PIxDb5vd9YKKJvPk08io8FRt2xKMli
         goXxfnoqaOxGZD4H/dVriHsQ2xbp/tG1GGlSOl9sCIUVD8oMzx4MsO3vw/g4BjcCmC+n
         A7dMLuwibxGjdWKS3OHdLzNXJ6bOjA+RqXh6nOiek0eCvix7Rh4C0dZrwIWxs8xbL7wo
         C4QQ==
X-Gm-Message-State: AOAM531mkkcPhfVWNv8PJc5JdhBXBAkkXM7MlNsehjW4ECm4CZlImYNN
	6zriCfqtmObV+xQc5JF4/v5NoNhn
X-Google-Smtp-Source: ABdhPJy40vEzIK9aCFHaNp4mrJWh7y/fCc1e7AsmieOHcDGxnYZgmF/K9xbOAEFdk3P+sd6S/X0EiQ==
X-Received: by 2002:a17:906:f745:: with SMTP id jp5mr16691098ejb.440.1590940409554;
        Sun, 31 May 2020 08:53:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/70] build-compare: upgrade to latest revision
Date: Sun, 31 May 2020 17:51:46 +0200
Message-Id: <20200531155254.10283-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/build-compare/build-compare_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index d2a4b5444d..74a954db46 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -9,9 +9,9 @@ SRC_URI = "git://github.com/openSUSE/build-compare.git"
 
 # Date matches entry in build-compare.changes and date of SRCREV.
 #
-SRCREV = "28bf642fcfdab94adb9b847329338005be6f73c7"
+SRCREV = "102d844ce052c6dec6c56ee1d471bde72a1b4633"
 PE = "1"
-PV = "2020.03.31+git${SRCPV}"
+PV = "2020.05.29+git${SRCPV}"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
-- 
2.26.2

