Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.20482.1607112481282937202
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:08:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VVpRJcn4;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id cm17so7127530edb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wOKwxgfHo1UUalH/J5y1tu+9wPAz+LHoHKX23q8RpXs=;
        b=VVpRJcn48N9GHcgsGC9+mm8nxP//quIyg2BAzzwLrQM3V3HgexFp1HwFl2jyKFxmZH
         X9AlunQjshEiA66txwL+Afj/bfPGRMmniGtCicxZl1HD+cDyI0oNnWFWiKte1XqE1HA/
         I+1+c9YdmIhAaPG6z6TG/u/JdYhRnIqBm+nFUdEgsu2JE88H+ooZOipmIQpciJ5KYiDc
         t2G1jWg8V073crnTh8zHQHE9TXoPrOvJtioBmvH7gC8T9SMXEX85ErsVMeNChzw/g777
         sLxgIKuzY0wxTd5vV6nYtVG1aBA3tRo8uaOdo0ZN7pEwZdXvCnOE/tWd4Jp15y9b7q/j
         eHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wOKwxgfHo1UUalH/J5y1tu+9wPAz+LHoHKX23q8RpXs=;
        b=BTTftPLWV32vBacm89VlaNPpQcLCwcAN/PkMCSwlSgir1qm1U4pSYydo6P2xlNwu/B
         AGFZTJ+x9/EV7AsmFFfCFuNo2+3Qn052POg21tFdAR+2rDKGw8FAFi3Anv7/HfZDGUk+
         J7XP1s11iWjzZtRaa72B7wUq0OK+EKQCxRJp0LP5bISSYTqdVoATJ6/UfINce/Id8e4l
         u/w7vXaCm88qYR7uz2rjKNOj6PJCN6yPFv032/oD0NAVf//UiKsLfUAsa4V4NmXSxeSI
         Tq5oXxjhN2opnvsZf6yFCr4KQrEo0z6RojOlbq0c1vgzOBKWbu3MsBj6u2ygxpGs2Yrd
         fbfA==
X-Gm-Message-State: AOAM532PkfZZ7GtqopF/naBOOfMekKJAxTcYzNiluCuFvZqKZQP1/SU0
	Ghk3ytKKIKZTI5MYMMiIW9uMayhyHcg8sg==
X-Google-Smtp-Source: ABdhPJx6G4FxKErLZcdegjS1s9LD1HwhP+7hE/hC/Fq12AAqNJW0qHjNYchkArAols4HzHS4MyVbiw==
X-Received: by 2002:aa7:ca41:: with SMTP id j1mr9425928edt.295.1607112479323;
        Fri, 04 Dec 2020 12:07:59 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:58 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/23] libhandy: upgrade 1.0.1 -> 1.0.2
Date: Fri,  4 Dec 2020 21:07:29 +0100
Message-Id: <20201204200737.7072-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libhandy/{libhandy_1.0.1.bb => libhandy_1.0.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.0.1.bb => libhandy_1.0.2.bb} (91%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.0.1.bb b/meta/recipes-gnome/libhandy/libhandy_1.0.2.bb
similarity index 91%
rename from meta/recipes-gnome/libhandy/libhandy_1.0.1.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.0.2.bb
index 146ef62f41..4daa3c1a54 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.0.1.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.0.2.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/${BPN}.git;protocol=https"
-SRCREV = "5cee0927b8b39dea1b2a62ec6d19169f73ba06c6"
+SRCREV = "465c00f8f80c27330be494ed7c0ba2ffe26321c4"
 S = "${WORKDIR}/git"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.29.2

