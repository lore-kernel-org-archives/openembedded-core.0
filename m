Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.33859.1613997402568708640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 04:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DOKWisn6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id i7so7354852wmb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 04:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qM15tqmmXZJdkOlkpe80BhcIl0St8q3FIPTPOgX/Rqg=;
        b=DOKWisn60cHzh405jnlgd+UJTDOwdslt6LQpWcKHhXc4lJ7UM8Yio5b1Bb2isbnbYx
         sawRdp2eTRL8NPYF6XS1H5caAnci/HrEQzTqSX8aCGqZdTkUE101uqRR9twk48rNmtQD
         CjFCzy9qgxMLQ0on504kjKQZMdcpk31MFHI08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qM15tqmmXZJdkOlkpe80BhcIl0St8q3FIPTPOgX/Rqg=;
        b=olQU091CgD9vSQFUFzNxJ+NoYVbW3MscqTo3DdimRfKBIqLW0Jh6j+IDTs2nfMNU3K
         9xkl87H52000pAG6mgbCeMGvrLikVUODMJ+LgWZIb+y/d3Kcy0VzXVE+yhNGq261VbsV
         dKY+bXBqN538bwutfxCQWGzstOk0NxxKliyKc1Pfq/p4tDnwKugjJqRV878sJNidNQYH
         YHNq1beWHBIXtm2f8LA5kt6DJZcvt3qso2rZLGrEb+HOjZ7OWaSi5hDkQ6XcVy8Wv4E8
         eBcCBTnr7t2ReW4+P9U+x1aRdy1oZmzT8g2q2YW9saHPZ2ZR2TzW23sTlCjbah2vbH8s
         iSCw==
X-Gm-Message-State: AOAM533V275CKxynJ/WAYvEd7RoYUJ+Xh75yoRH9KlqJs6j2uwa2reax
	iRT2INAWnG/a6y6FPqqXTuZYMZRwr5G6bg==
X-Google-Smtp-Source: ABdhPJw6fGuf4El5il4CHFsmkmnyCWf/pTRJ6U9l4Z1Z9dxyauUcrNJ+hk2Uo9hwmbUfmvipf5eCkQ==
X-Received: by 2002:a1c:2090:: with SMTP id g138mr19985208wmg.137.1613997401100;
        Mon, 22 Feb 2021 04:36:41 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id c12sm17432526wru.71.2021.02.22.04.36.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 04:36:40 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-firmware: upgrade 20201218 -> 20210208
Date: Mon, 22 Feb 2021 12:36:38 +0000
Message-Id: <20210222123638.3754068-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210222123638.3754068-1-richard.purdie@linuxfoundation.org>
References: <20210222123638.3754068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License file had a number of new additions for new firmware but no
new licenses that didn't already exist.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{linux-firmware_20201218.bb => linux-firmware_20210208.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201218.bb => linux-firmware_20210208.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
index 700a79b118a..59ce4d51246 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
@@ -128,7 +128,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=03f0fad70b8b557b56084e3090198021 \
+                    file://WHENCE;md5=ef0565762eac313c409567b59dff00b2 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -201,7 +201,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a1cc1ff72c739f312b095df589e9fd639fc81c3f8f7966377ea35222dc94c04b"
+SRC_URI[sha256sum] = "1bcb1a3944c361507754a7d26ccff40ffc28d1fb93bce711d67da26b33e785b7"
 
 inherit allarch
 
-- 
2.27.0

