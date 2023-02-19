Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C66C6379F
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.3842.1676835072492801080
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hmYraz+d;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id g7so781334wrd.3
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJxahEo3EAUmj8T0n0mSoARYoc5K7IZjm9I1Vmjr2NE=;
        b=hmYraz+d71JJARlBWKGr/8gQInEqaYfbgGNZInIsZi5fPBCceEGn97j5isTHlxy2gz
         7KKe402+sMlnk+BR+Qf64v8d1Mvn5Jn1wQaRIbLskQnQQsZwAIf8pOZy5EdYaqS0p48F
         mmu5U+2nae8KX4lI2X+DkKfGX5fzWeVXkgWMiDrpEVZNk7WQiLTlzs0v/QvexEp3ieXU
         zXKLrYNdaqecoy0wT2QEpyrnKKCoSGbPULnRLsFx5s6o5w8UM1vTkoFJCm9+beZzsp7f
         +UOIVYVRB1hCx0oAC8MeNjPiCQx4KlMQM4ad9HGUdXhIXVd3akHk3w9vkOGUZ/1zucqb
         yDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJxahEo3EAUmj8T0n0mSoARYoc5K7IZjm9I1Vmjr2NE=;
        b=LyR2vHjF+VdFeO/s6iAj7QZOz+RVaLX/0V6lraCGS7P6D+ttiqJ02BQ1j/pdWaUbrt
         wd3CngJxKzk+p01q6JmgxlZDTNHU/mkq0cFZJUBF5v1gLyt2f1T82CGmmwsWSgyMJA79
         fuifC7aX2IS1/Q1A34G+tiOzsOIb5/AII5roBRmPeA9uaTPEq/yMWgGnfkEyRSSf/FGi
         2lrNGoJO5JoMroYBhuEgj+4oSWNeXf2ITTH/NyMSWE+M5Xzc1+OwnryhOgAx3Qjo0gwZ
         nGXtI8Wvan++VzqIqot55VORJn24q8RECljXl3S+snmEdi0RYsmEvMidQmkDOC4Ge+LS
         XTNg==
X-Gm-Message-State: AO0yUKVlQ646Z2uX0CQdi0tTEaozFDpCIB8D1xms3YI/MLm1z23bCCB+
	0OGh/7jQEBf5+5MFdV83RIBiRA6i3Zc=
X-Google-Smtp-Source: AK7set/1wJHerMwSJHptfxPai39P2QMlzkewlYtjatjWc1jH6u9Y+axbjMuMowzovn/sz8ZwvP1A1Q==
X-Received: by 2002:a05:6000:18c2:b0:2c5:5312:e81b with SMTP id w2-20020a05600018c200b002c55312e81bmr1975870wrq.28.1676835076690;
        Sun, 19 Feb 2023 11:31:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/39] man-pages: upgrade 6.02 -> 6.03
Date: Sun, 19 Feb 2023 20:30:40 +0100
Message-Id: <20230219193101.338397-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177361

License-Update: unrelated clarification in README

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../man-pages/{man-pages_6.02.bb => man-pages_6.03.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.02.bb => man-pages_6.03.bb} (91%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.02.bb b/meta/recipes-extended/man-pages/man-pages_6.03.bb
similarity index 91%
rename from meta/recipes-extended/man-pages/man-pages_6.02.bb
rename to meta/recipes-extended/man-pages/man-pages_6.03.bb
index 8f1eb38082..bc02597ef7 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.02.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.03.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
 
-LIC_FILES_CHKSUM = "file://README;md5=26901408d8cfd6f6675f8b49daf9cc74 \
+LIC_FILES_CHKSUM = "file://README;md5=0fdad39ebaa973a50785f79f0f59f87f \
                     file://LICENSES/BSD-2-Clause.txt;md5=d0f280d1058e77e66264a9b9e10e6c89 \
                     file://LICENSES/BSD-3-Clause.txt;md5=71f739ef75581cae312e8c711bcdab16 \
                     file://LICENSES/BSD-4-Clause-UC.txt;md5=1da3cf8ad50cd8d5d1de3cfc53196d01 \
@@ -13,10 +13,10 @@ LIC_FILES_CHKSUM = "file://README;md5=26901408d8cfd6f6675f8b49daf9cc74 \
                     file://LICENSES/GPL-2.0-or-later.txt;md5=3d26203303a722dedc6bf909d95ba815 \
                     file://LICENSES/Linux-man-pages-copyleft.txt;md5=173b960c686ff2d26f043ddaeb63f6ce \
                     file://LICENSES/MIT.txt;md5=7dda4e90ded66ab88b86f76169f28663 \
-                   "
+                    "
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "968def9e7055c9cbca9a4f21f79677b02ac8b0d2fa62ceea7bd8ef4dcc6cac41"
+SRC_URI[sha256sum] = "76eca045b42a90dd25d094c46d97ac90187bc0f1bfca358bb5dae5c4337acbb0"
 
 inherit manpages
 
-- 
2.30.2


