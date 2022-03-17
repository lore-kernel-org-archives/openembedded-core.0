Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F95C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.9293.1647518230848805866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K+VcJWJH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so4841976wmj.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NrXIoTNxvaiX1WDVKLlwGtaacAjxvrcbOjGAPbnEb5Y=;
        b=K+VcJWJHevM/CnmvS08NuXF7iY9U3R7fEJpQcfq6MJoy3A5sOJQo+3TrrKei1TljjQ
         RPKtIOAsJGcqOwCynXOmXFDEi2alTA8pnkOUyW4P8oNhhm5C0hDrH5SMdq5YW+8gaKoT
         JtMSOGOWFNpBDDE/20pvCafmhkGpRzNA7ybqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NrXIoTNxvaiX1WDVKLlwGtaacAjxvrcbOjGAPbnEb5Y=;
        b=kKecAqsU7hqnhR2g0Bk4MJuyK+EvWPE8wrz+87Y9EmQ/pB3zvhsNoWBZk5m0FGJ64N
         xLIqfQ2qWua9RgIWb7A0NVCJFrg9vjNHB+4PoutlfcD+uj+C5tTrE6ovTq/4fleg3L07
         qgQdyWnZOAnolQkyz/S8ql5SolmHVPEE16BrfuvwmNLjrDsjJhpZk430Dpp4xWEwSj8S
         XL6Zup0Q1ZHkFu8JUh40sbozS7Fxp35+LTrHxDOSP+L/LwLpbf7bz/8GFh1dgaHOOLj8
         JcW3XdhDk+ZCmioNmpFCKRql0sKojJlnKUSUCsIT7CKe9sKQu8xCsCzPiRPZgw01t/nb
         +E4Q==
X-Gm-Message-State: AOAM530uCd5YjYsTxRF21lxZ9oN+LlgEjmUa7eEw/lcsc/vXvUhfAozn
	dh7vnQR01P2cvMS3w1AR8vOHPBWDgnRZ+RXy
X-Google-Smtp-Source: 
 ABdhPJyLiHjDlaVdGIx98tqfTytGlgDmQho6kj0qmIW0OqGt3YwwgZ5sc5cC6TOIQ0xRr+q7+lFGjw==
X-Received: by 2002:a1c:f20b:0:b0:389:c99a:4360 with SMTP id
 s11-20020a1cf20b000000b00389c99a4360mr11224682wmc.174.1647518229101;
        Thu, 17 Mar 2022 04:57:09 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/26] python3-ndg-httpsclient: Add from meta-oe/meta-python
Date: Thu, 17 Mar 2022 11:56:42 +0000
Message-Id: <20220317115700.993924-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163394

---
 .../python/python3-ndg-httpsclient_0.5.1.bb   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb

diff --git a/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb b/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
new file mode 100644
index 00000000000..6f3c096cf0e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL"
+HOMEPAGE = "https://github.com/cedadev/ndg_httpsclient/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0"
+
+SRC_URI[md5sum] = "b0fc8ea38f87d2c1ab1ed79a95c078f9"
+SRC_URI[sha256sum] = "d72faed0376ab039736c2ba12e30695e2788c4aa569c9c3e3d72131de2592210"
+
+inherit pypi setuptools3 update-alternatives
+
+PYPI_PACKAGE = "ndg_httpsclient"
+
+DEPENDS += " \
+    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-pyasn1 \
+"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-pyasn1 \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
+UPSTREAM_CHECK_REGEX = ""
+
+ALTERNATIVE:${PN} = "ndg_httpclient"
+ALTERNATIVE_LINK_NAME[ndg_httpclient] = "${bindir}/ndg_httpclient"
+ALTERNATIVE_PRIORITY = "30"
-- 
2.32.0


