Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.19603.1621260904604523021
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CjDyLA37;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id x18so739086pfi.9
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O9MqKeIVwexnxS4mRMRcAJ03GafB0nrlkHm5RUn8Z8s=;
        b=CjDyLA37NThq7dg0zgF59r9lvC9xI0SUvzGB25ejL1V8KMJg089e+6V+zWYOc37Vow
         5F+rd6z8Zatg8sK1piMYmypNSQqLvRlI/hldZuRTvH5paa5hqGlMgSWK4zDszkCywXVy
         e1sKtK2HxOi2bx7gRNb1M2aVxdpbYkXoTw2kjTKPo7hZW44YcKqfDtjyi4APuECx1bO5
         VOZ603aYCpCcNbvLgRejxecKL9muly+DOKzw2L6GhgXXAAO0/YkQzv/T8rv0EfyYM/C1
         gmnaLfZThCoi1RXpoyGaHa2+eadGV5Hc6gt9PV7te1DUNAUhCB1mGLZd6dhYvih0lblj
         Xn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O9MqKeIVwexnxS4mRMRcAJ03GafB0nrlkHm5RUn8Z8s=;
        b=k+mpKrrKQOLH9FDRVfK9CDhRjo3892EvHMkpHv99nhqS1Be/KVKDztEezPjBXt/XkU
         DjrovRxv2bM7qmKfAjxuxIHnr+34ZpUPZIIGVFFnREkrXT9PGNJEOXAdptw/ETK93gnR
         QYFtrCaxRlixz4iJDa+RwrsRjlVmqvMwCXj5J5VhFB/4NR39xNUyZRgj5UebGlARHfxn
         b50Loj16iSqZt30H/Ox0DRulTmVMiEKwfqQzD5Ocg1vThy4DtQfNu1Rmh+u+zNPS2h3P
         o2laAMSvOHHKiMlX7kZzaKQ1I0BdTlWGl11wvmWgAXK1Lu+noYQEE1inlfOlTmNXMdq8
         OFrg==
X-Gm-Message-State: AOAM530sMX3CYgg7hk88f53ZiD28RnQ7NizqamiC/WvkwJjPEOnIwjGV
	FJbm281bn8Vp43/usIDrjEOgVcR6vsfHTnotzHA=
X-Google-Smtp-Source: ABdhPJy3iYZcq92lZHGuvxzxQFxmeel+tn9j+WjaO3IVCAmj2Z0wv9ZHwiZN282SURv1uSKes0gDvg==
X-Received: by 2002:a63:1224:: with SMTP id h36mr2044868pgl.296.1621260903773;
        Mon, 17 May 2021 07:15:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.15.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:15:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 30/35] linux-firmware: include all relevant files in -bcm4356
Date: Mon, 17 May 2021 04:13:36 -1000
Message-Id: <501cd3063af388dabd3329d2e69ac218ffd62a9e.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

This currently catches the .clb_blob and .vamrs,rock960.txt, and other
.txt files may come in future upstream releases.

Signed-off-by: Yann Dirson <yann@blade-group.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e332738a8aae0914c58b40faae8b9d7a82fd6a95)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
index 892455b039..1e32d1c8b6 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
@@ -656,8 +656,8 @@ FILES_${PN}-bcm43455 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.
 "
 FILES_${PN}-bcm4350c2 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350c2-pcie.bin"
 FILES_${PN}-bcm4350 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350-pcie.bin"
-FILES_${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.bin \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-sdio.bin \
+FILES_${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-sdio.* \
 "
 FILES_${PN}-bcm43569 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43569.bin"
 FILES_${PN}-bcm43570 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43570-pcie.bin \
-- 
2.25.1

