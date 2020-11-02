Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.1224.1604335810780558059
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B1RXl3BV;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id j24so19754374ejc.11
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fP784fxiDy0/W5Dv7iqP3VayfF3BS/QIwK/p22UjVqA=;
        b=B1RXl3BVmj/9fT0YexhEIeKdVjlmxonJyLuLggisyrLKnlFvVJtLzOX/yf33lXSEYn
         pgg5uCe7dNEQQLU3gu1jZjo4DxZKnmxt1xXwTCWhV8eFaXaUxVNSKFqqIFbkdgMEwzaM
         Ug2+WOeQxt+70wlogkiJXNaOOHHhDGAL5MV3QqyCjCZB3ktm7iCPnyL9NQ6YkxTh8D/n
         57cGwdcjmI7M2Rxc+4ra7rSdbvqxT7pPRpeTRCiA4mpJL0OOnC3CJgc7aiM5kfU0+eg+
         /+Bc89etYUrIeAKUj6B8dnUO90G/adJ589pFm2l2Wq/rJVKhq1d+T8ILP4ULS42hvjZD
         OSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fP784fxiDy0/W5Dv7iqP3VayfF3BS/QIwK/p22UjVqA=;
        b=JC+BAEJ8GEFdSWmml++zDZKEsgu533EALzCeu2PodBsIxti3HPff/KZ1DjHGSw0qj7
         hRPOJWd2N7BotjoBTwCSNQYxTblg7XomJglYjaRPebeZbyaBnSSPD6e7JlzMWyQ/KdHk
         Iy+Q8WFktSkslsl/sWqYk8mGJYg/Yak1vxdwkbzM+fUtxyDijR93n+5MLjG6h4tGewBp
         dsLmAdNAKZoi9krU0SzSudfrLDopg1q6iQr70seDIhH63WzQm0JCFBsdUfEZDCj7+QfO
         4NdsqHeKyOp6XzrDMXdKN66Ie537iH9PjkfIrvS0jSlMJEy3L5Izbl1XooDLBdUcv5aQ
         ghHg==
X-Gm-Message-State: AOAM5337OtnplOfkANrHd+fxr1+DTN3Q6DVQPWu3GJWeH4S/i48RDEw4
	cjj7aAo1KRRpK4TSQkKiWs8jyfer5tzL0g==
X-Google-Smtp-Source: ABdhPJweImoqccwCyfEWSC1M+NDzUEc+fegPhtJ3/kPDlDmOJztqM6uVvJ9qnNIVl01Skwb+6jWNhw==
X-Received: by 2002:a17:906:5402:: with SMTP id q2mr15842473ejo.316.1604335809149;
        Mon, 02 Nov 2020 08:50:09 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:08 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 58/80] python3-pygments: upgrade 2.6.1 -> 2.7.2
Date: Mon,  2 Nov 2020 17:48:45 +0100
Message-Id: <20201102164907.27572-58-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-pygments_2.6.1.bb => python3-pygments_2.7.2.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.6.1.bb => python3-pygments_2.7.2.bb} (62%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.6.1.bb b/meta/recipes-devtools/python/python3-pygments_2.7.2.bb
similarity index 62%
rename from meta/recipes-devtools/python/python3-pygments_2.6.1.bb
rename to meta/recipes-devtools/python/python3-pygments_2.7.2.bb
index bffef59e69..00e5dc6e30 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.6.1.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.7.2.bb
@@ -2,11 +2,10 @@ SUMMARY = "Pygments is a syntax highlighting package written in Python."
 DESCRIPTION = "Pygments is a syntax highlighting package written in Python."
 HOMEPAGE = "http://pygments.org/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e1d7b7bffbfeaa14083fd2bd3236aea8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1f5d0c4cf38dfc8122c00d6f1a97a0cc"
 
 inherit setuptools3
-SRC_URI[md5sum] = "a48c5219de92f12c41acba814730b31a"
-SRC_URI[sha256sum] = "647344a061c249a3b74e230c739f434d7ea4d8b1d5f3721bc0f3558049b38f44"
+SRC_URI[sha256sum] = "381985fcc551eb9d37c52088a32914e00517e57f4a21609f48141ba08e193fa0"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.29.0

