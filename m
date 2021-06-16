Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.97.1623872392796685245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 12:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Js+ygkbC;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id g22so2872333pgk.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 12:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kUlNrLub+h6DnnS3I2cgWbWiJUn2bdYU4wB2714Hj90=;
        b=Js+ygkbCelH4giFCEeenich2eb0E6SPj4Fs6QL4VFd/3foPvxc2Ry1iQoa6CHtnWcG
         zmS73ixgtEwtmvvw1/PYXNp5nw0SJygIoz73Jd55zVosHpKNSD3iYCCje03SD3vhb2rv
         zbCgWH3ESfHwc44H5eR9PngquDsVQgGuKYJn/aHMk3ehBvHkOotR7QocQ5/QuOaR7TP2
         5a+74ceOOWQb4NVCszqLWDBbFd68VR7h4+RGW2XrHiB7ZGGlR7YfevO7rbgUJOsdxSJS
         VBog+UfdWGE9KkugjTvNGcEIlRyriIepRu9paL9AwyIt6YKKMyWOs74WUi/o0TbZALy4
         4/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kUlNrLub+h6DnnS3I2cgWbWiJUn2bdYU4wB2714Hj90=;
        b=ULVPqOHaP+LxltKdLTeH5+0JLzGyBDqBHastEMfY5tMq3y/qKAPP9fjmiM8jVCUaxM
         H5KfYjA9qoqgJ60c5cGsfsjOJg113TXxwYU3uHvmMe6dIMm1chvFOlW9tBH/PwzoCKMn
         63BZEC+OWNnPRkj01L6+W1yxm0In01UT3+KM88N7bAWCcGPRiuIR7X8Phnqge5Jzba5m
         XT4nDS0d+1oh4gfbVKO/D+x2RW63m/IkaEYDKl+DMOE0Lkrq15iAbm30ym7oYpbK0LCa
         R4giIcl73qvkW92bVBoJC8z5B4MaklYVXDT1X/moJE3W8nBxSIhaBVI3H9ddt85dMgpQ
         Xkcw==
X-Gm-Message-State: AOAM533oGIYsy8XYXjvr8ub2ct68VQxWG5tOJjiANRUGkV8gP/sc1rdm
	o3vUwxaDPP55dCq+uH+PW8YkT9Nje1JzDA==
X-Google-Smtp-Source: ABdhPJw8ijB3QRnSHefJXt1Amam4myQRZET+qqpDE2EI8zkz0zd4vMxruXZWIzzgyfbYzULmQ6ojYQ==
X-Received: by 2002:a65:52cb:: with SMTP id z11mr1208433pgp.201.1623872391935;
        Wed, 16 Jun 2021 12:39:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id t13sm2963405pfh.97.2021.06.16.12.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 12:39:51 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] linuxloader.bbclass: Add entry for ppc64 LE glibc loader
Date: Wed, 16 Jun 2021 12:39:48 -0700
Message-Id: <20210616193949.1153981-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/linuxloader.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index 1b64be6405..4447c8847c 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -40,6 +40,8 @@ def get_glibc_loader(d):
         dynamic_loader = "${base_libdir}/ld-linux-mipsn8.so.1"
     elif targetarch.startswith("mips"):
         dynamic_loader = "${base_libdir}/ld.so.1"
+    elif targetarch == "powerpc64le":
+        dynamic_loader = "${base_libdir}/ld64.so.2"
     elif targetarch == "powerpc64":
         dynamic_loader = "${base_libdir}/ld64.so.1"
     elif targetarch == "x86_64":
-- 
2.32.0

