Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.11564.1588449248541000090
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 12:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dtHHCyuL;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id h9so5709456wrt.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 12:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kR0lBFMYlXv6uxBopZJ4/htJy5N6Uc8Zys6757OsU/Y=;
        b=dtHHCyuLb1NGGoOClEky8j8vtP6Ga/QzXuTR3NuP/s0u01WYipQIP88rq6d/HHZ3Zd
         oDQ3ZAYjomxud+f/wudGvLnLJ59KlfC1bX7/9TWA5fEjEaAAAwzrXTbAP6Nu76rb7dMH
         UTqpnUKnUEikYsgm6XCHh3B/+9ahgoVURaWQtKZd7Axc9jxIbmn5MXA/aEiAq/9CLjD3
         ejxN3jNN6/DDeU9dXZrcJoFauEpYo3DqJQfx1vg+TZMm9ujLt8r6eNn1xeXxDgZZrRWv
         Ar+ANJAIdaT8Ijuzg9ShsvQlEQCECRyuFGbfNRksOY39QuiVqkPVixHevVLbnM/32ylj
         vu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kR0lBFMYlXv6uxBopZJ4/htJy5N6Uc8Zys6757OsU/Y=;
        b=UYTQCMY7nlSu8yVW1CpJtmWOjb2GH7Tj24RESXnDoJ2jSpu9U/LBYVNrmoByS9AcO8
         iHbbGD4YFPg+v42ufMI6mi+1JSNBHsspiyQzenMCnSxEY5S2asvEvAGU9W04P+wWZidj
         wB9TY+t/StSnMwor5UosRjTzAMFS2QcpOomOB4zdHrl+tg7hR5JhosSYlaizyD79k5jn
         ls8OJPro2nfo2h1pLjlFT5ybjrmRA4nGor0Nhgi+2eWbuzFcn71Gad68U1f+A4vkBY6e
         A16gXxZ5ElW/nquYFns0SFip0RZS6hliSf0TFw5b2frB8xKflCjGs1KO0OYGj9MyUIho
         tmTg==
X-Gm-Message-State: AGi0PuY0Kl22MZT1V5eHi3Q0jblx1Bp/VyY4yq0kRn0UA95wwoenfpDF
	9biwzgetjXMg8ETFo/QABja5UaSC
X-Google-Smtp-Source: APiQypLgBfX+IW4sKrYSXTSxqI7P60E3k8uTYLpbnm8JiepMzI9VJgAE1drKdpK6y0zXuF1Zuylc4Q==
X-Received: by 2002:a5d:6145:: with SMTP id y5mr3491884wrt.195.1588449246912;
        Sat, 02 May 2020 12:54:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h6sm5276149wmf.31.2020.05.02.12.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 12:54:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/4] glib-networking: update to 2.64.2
Date: Sat,  2 May 2020 21:53:50 +0200
Message-Id: <20200502195352.17279-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200502195352.17279-1-alex.kanavin@gmail.com>
References: <20200502195352.17279-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{glib-networking_2.62.3.bb => glib-networking_2.64.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.62.3.bb => glib-networking_2.64.2.bb} (88%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.62.3.bb b/meta/recipes-core/glib-networking/glib-networking_2.64.2.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.62.3.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.64.2.bb
index e9596ce1a4..8300d20e0c 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.62.3.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.64.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "a758ca62bd54982a798b39c744cbf783"
-SRC_URI[archive.sha256sum] = "8ca1f86f23a76b5c7640624f7d5490705c78e81375e1741c9a1c41ce7f8f7ff7"
+SRC_URI[archive.md5sum] = "7f8c7ffe2616be4ef4232f2574353dab"
+SRC_URI[archive.sha256sum] = "45def0715c551f9b0b41a4e4f730ac95f3d5d4f3de8162260fbf9421cff695a7"
 
 PACKAGECONFIG ??= "gnutls"
 
-- 
2.26.1

