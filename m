Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F51C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:13 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.9215.1647518232713133068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P0lcsqkM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id h23so6413916wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Cr0W8kHUGvFzYlk8otTZiMXukGQwoDltOiiLjbyB4lw=;
        b=P0lcsqkMM8bK0esS2q8gn/r3+4IbMgpTPWqB94cV6vhDPuvBDvZ7AJba57gfdoB0lH
         +abf0n8zVhglHIDsvC+sfHJspg62pbvKenXFYvFyQ/FUjWK3iEwut0dJvdoVbELb0XBw
         y2nn2Y24CK3I1yCSgZPcdjKe3+XqjC0hvRHpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cr0W8kHUGvFzYlk8otTZiMXukGQwoDltOiiLjbyB4lw=;
        b=sjfiwZ5s/wOhNkVFX8hhY1H5zmTgzl38GNryvjjjCgj5zFdP7CCMH0rDVE28iJcHyn
         XsM6lpEQuYCtIkIk6Z+xV/qSZdmYw7xK5jznAjujnklMUCjnzcCK27ji/FMHIiqhQ2Bk
         ulLk5Xh6vf2rwkANUbmBGF9wNpDqX0TW2v9IpM86+SOY/RpgtfnIPMQFOrrg+W3eqD11
         RX5gjE3zBLW72r/Y4DWqkve3HVSI6crNBwV2zzkzrX1/wbvuLRQNDgNXBU0KuqqXv4up
         NK+UzDoHPrTUNeM+nMcqwHgRBJf1PXkbSlvUffeBDqGI5enBhO9r/HDD82Tp3ZUFogTD
         CUdg==
X-Gm-Message-State: AOAM533q+xMrMV8E6uTYF2XzaoNyTFNlY8pLFvDJ0C3WqY6cWhEurHKO
	q6OOpAdavqOAVCocuatjhToS/CjOPuVd0xf7
X-Google-Smtp-Source: 
 ABdhPJw0UWrw1UdpwXqA5/3o4qRSqZS//9OFzZg20IjIIS4q9CLcZn84XC4hsRgbJJefAcq+yv4BNQ==
X-Received: by 2002:a5d:6e5c:0:b0:203:d18b:6aff with SMTP id
 j28-20020a5d6e5c000000b00203d18b6affmr3735952wrz.131.1647518230953;
        Thu, 17 Mar 2022 04:57:10 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/26] python3-pyopenssl: Add from meta-oe/meta-python
Date: Thu, 17 Mar 2022 11:56:43 +0000
Message-Id: <20220317115700.993924-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163395

---
 .../python/python3-pyopenssl_22.0.0.bb        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
new file mode 100644
index 00000000000..db0e809ef54
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Simple Python wrapper around the OpenSSL library"
+HOMEPAGE = "https://pyopenssl.org/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+DEPENDS += "openssl ${PYTHON_PN}-cryptography"
+
+SRC_URI[sha256sum] = "660b1b1425aac4a1bea1d94168a85d99f0b3144c869dd4390d27629d0087f1bf"
+
+PYPI_PACKAGE = "pyOpenSSL"
+inherit pypi setuptools3
+
+PACKAGES =+ "${PN}-tests"
+FILES:${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
+
+RDEPENDS:${PN}:class-target = " \
+    ${PYTHON_PN}-cryptography \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-threading \
+"
+RDEPENDS:${PN}-tests = "${PN}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


