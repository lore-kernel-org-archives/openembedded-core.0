Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web09.31711.1613399946405505741
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OUDT+eGm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id r21so6162940otk.13
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0NkbQKskwdjCpvdzUbLCGgRSXYdX1q1/yshB1z0vKAI=;
        b=OUDT+eGmRpkMFaMeOXW1ObFgKs2SX61AnzcWASa7ZkS6L/N9+Me9/rjZT7AU3peHCj
         LapW1UAZwGsNROslUoGD8hRE+xCffV8aLhUxeyAK7NMWPMY/t2tn1ECcVp1JNQBUsyHV
         joH9WdGdHA4Q5ITD+j89U1F1syPw9hRl6X43eY/txEM0et25envX+rTVBHkkA90t8XyI
         SASNbnXUB4l5ITo/UE3zk+KTaEd4jUoIPQLWjQKkOzS5u1bLHF4qTe9fQSbyENyUUw3Y
         PxILLP6+Ci1rS7wdjxDjsGztOa1+4/ZwSE0NffIuaPns2+D5VhLzEKTgksdFDikKkaxb
         K0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0NkbQKskwdjCpvdzUbLCGgRSXYdX1q1/yshB1z0vKAI=;
        b=klBl/k6NAkitAkd4UbV2nIiwaRqGCTdM1D/LwShnsABJDhE7DWVVbClbAgIXj3ymmy
         yG1Io+1IOI+Jpp9Ujw94rmvbIAzH1vm4YbfEn4xspRXdfBty9VpZI+UAvqtvU/32uSpw
         CVBGrazeMIJPBAQhWZSQED1ScdTjwcmGaHEUhCINfOx7ZPDzpZuZbg3myed9GK+HwXnR
         +BRPlj6B1h11BQab/Lc3zoWHGDpv4VquhPQBBZkt59fIYXVhXBWm8ja61orfafiPtT6S
         2L/K68+rVckKjFpj0mEdQmbADdf10DOsKWHqRvmzv2UUv8hAyzc7ZTLl0BM1xXuLDAbt
         6xRA==
X-Gm-Message-State: AOAM533OpURglIVlCsNglcHSXI0vIT5/rQRjDmkQoa0GF0pR6d3WeGYt
	z5hzsyHoW9M2g9VEH6uVlsH4ueS5cQYtLtMz
X-Google-Smtp-Source: ABdhPJxG/dyRUi0TO4uOPL6SHjQ2iRuHCLyPjyklMtcTvTqUPT02wqD7WI0+8kjzgrXqNjo1rYoMkA==
X-Received: by 2002:a9d:470b:: with SMTP id a11mr11655876otf.327.1613399945369;
        Mon, 15 Feb 2021 06:39:05 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.39.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:39:05 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/17] gpgme: use python3targetconfig
Date: Mon, 15 Feb 2021 04:37:27 -1000
Message-Id: <bf0e67e6b9d8b5cb532b7b479872a9930f50063f.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 38ecb83c444406b5157712d87aef3bbb320b45ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gpgme/gpgme_1.13.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.13.1.bb b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
index b51534351d..6e945d3165 100644
--- a/meta/recipes-support/gpgme/gpgme_1.13.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
@@ -49,7 +49,7 @@ DEFAULT_LANGUAGES_class-target = "cpp"
 LANGUAGES ?= "${DEFAULT_LANGUAGES} python"
 
 PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
-PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}"
+PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native python3targetconfig', '', d)}"
 
 EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-gpgconf-test \
-- 
2.25.1

