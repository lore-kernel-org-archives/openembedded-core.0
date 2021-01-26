Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.13160.1611672140367022322
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=e1S/vo/P;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id s24so773067pjp.5
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fXA+3ht1d7toW90x+X1dcW+CjtoUCFoZHpZezLUBhm4=;
        b=e1S/vo/P6YAOouQhm8gv6tKLMzUKaVwuBHswz0fZn0Otyp3CR0V+B4bT0Fwc4lgp+I
         t44P/aPFLmtX2/gu/wK6AqQ+FiALlCe1LLn7hOWBzHWJrSCvdaq0v6iGaM7G7Nj05oJN
         ZJhF6OS3ysv4pg/M8d01nww+HV7c83tBi24St69qTfEaCUJog6BFMiTiui1cl21rYhV1
         EmO8YTKTD7UNMi6Aqac6ChhDcrA2qCgfn5UXnG1rNL+H+wY6JMxFfrRU++9M2msDQu2p
         StpCbcdWhEddRghuDyfq8/Q5ab3K/RICJPu6XtuVvsvZbuYrAfXz+i5RNPMbRK7Gncm1
         RDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fXA+3ht1d7toW90x+X1dcW+CjtoUCFoZHpZezLUBhm4=;
        b=Yq0FjvaebbeAa5BQrxUMrmhXOynMZjyDeMnJpETAcjWAUlJmyqVbyNxZXek/0lctFg
         RBIl46Cd1wLx6JBpvEEOP40K1ChTTq5yFSEbHAr5ml9iZyTFVg3fly06EILiByXzh22l
         Zo14wK/QY/NtP92A0FGDhWwkqOiuvPcyCtMMbHDZUHaN4UcV+8oP8dDnC8YfNQU7idVY
         jJ91YreDW6GKwYf0n8qY24H+t9YA4ECKKmI4aiQFsAE3XkDeXpWXltj0bLMoY1lryzCy
         2lRS744aXV3a21OorMePxoYrj5fOYSZgjXZv2zvmyvdZKu42cIQbvCUaFDRVN61RjcQG
         b7jA==
X-Gm-Message-State: AOAM531BFV7EgvxouWDZDJwQQso764u07nObnpiHkHorGKpgh2mIHi5A
	rGKjPR/k1utoh3B4eE2ufJCeeJvA2l8wwm8ZBNs=
X-Google-Smtp-Source: ABdhPJw9Pzobwpvi5mOoeVUyl9RWJ25j5AgOh2rthXxTfdCkYtQuH9WQXoD4TJ5RAS7KJbsL1kXFzw==
X-Received: by 2002:a17:90a:1c09:: with SMTP id s9mr79212pjs.83.1611672139391;
        Tue, 26 Jan 2021 06:42:19 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.42.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:42:18 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 02/46] pseudo: merge in fixes for setfacl issue
Date: Tue, 26 Jan 2021 04:41:13 -1000
Message-Id: <b3ef5623d35f560f0bc58ee1c6537640343b0eec.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

[YOCTO #13959]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 18fbd28c9aa0276d110839c4282a9ab75fc9f28e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index ead5dcfb14..fcadfd96ac 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "b94fa2fc81cde25865ee223ca437d07377229a53"
+SRCREV = "067950bd9415fafcafb2bf32c0e10df4f2ac936c"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

