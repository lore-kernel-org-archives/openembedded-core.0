Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953D8C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.9297.1647518237050607590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PRQ7SouN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id r10so7049391wrp.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y/sEBAN26YD8SR2Nb4K79W0z3ZTn13gSppjBdrZkEGA=;
        b=PRQ7SouNrYnP1xX5nZjyqPkDFm0y1azKoi2jel3AYw5p8LQtURzKCgF1I1boJINewV
         0F6s78gZCV+mDZW+9NdHNCktn7Y1t2TyOZ7y2qvZEnXCAmamSeae+ynYUVN7Ra1fOpx3
         mr9EO7BufcVxwULcj+70hMSM6Y2eITwkRFCUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y/sEBAN26YD8SR2Nb4K79W0z3ZTn13gSppjBdrZkEGA=;
        b=KEadA/AtZ/GgRkQrvKHANjG5KxOaI13QY8Eo4GYFsRYYgz2kHBRLxCkHbJOxOcpd/9
         AnhpAwwAkT+kMXM1wI2RJ/9UTgmV8ZbLCWUMvG2IxdPtIWyY6vB91pl5EPoY8bfja404
         ziSE5O4l5C/zo5bmtMd/huO8W33KFkn4tfH3mVJcifnMVVROol71i3JjV5U3INbE0Yda
         64DL7r07elPpo45V7+GKlOIZET9/aL5HHH+jySIpNpqfr5c7S7TU7W7SXjBuCFOQ8TNO
         AkUm/1pECmyMzez7PqFI0F/9x8Oq9Bsdf9IztRktfR/H6Obh6bTWRLV41i1u0lzbGyrE
         Kfjw==
X-Gm-Message-State: AOAM532ArPKxT4NuiJ8+DSKGT+6ShiJMmXJUd1dfAlaa2zpqlq2p5tVj
	/e1pJjKOvCCPAAefQTm05d+RonQfOcaMWWi/
X-Google-Smtp-Source: 
 ABdhPJzmOkmwQnxgTbaHoNvBBgvJMg9+tQQ1NvULjKSGLlyvs0APM4erOw2NLvw4YDoL1ehw8VTJAQ==
X-Received: by 2002:a5d:5848:0:b0:203:a65d:1f49 with SMTP id
 i8-20020a5d5848000000b00203a65d1f49mr3525024wrf.397.1647518235288;
        Thu, 17 Mar 2022 04:57:15 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/26] python3-requests: Add from meta-oe/meta-python
Date: Thu, 17 Mar 2022 11:56:46 +0000
Message-Id: <20220317115700.993924-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163398

---
 .../python/python3-requests_2.27.1.bb         | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-requests_2.27.1.bb

diff --git a/meta/recipes-devtools/python/python3-requests_2.27.1.bb b/meta/recipes-devtools/python/python3-requests_2.27.1.bb
new file mode 100644
index 00000000000..af52b7caf5a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests_2.27.1.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Python HTTP for Humans."
+HOMEPAGE = "http://python-requests.org"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+SRC_URI[sha256sum] = "68d7c56fd5a8999887728ef304a6d12edc7be74f1cfa47714fc8b414525c9a61"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-ndg-httpsclient \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-pysocks \
+    ${PYTHON_PN}-urllib3 \
+    ${PYTHON_PN}-chardet \
+    ${PYTHON_PN}-idna \
+"
+
+CVE_PRODUCT = "requests"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


