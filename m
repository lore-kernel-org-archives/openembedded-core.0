Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85320C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:19 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.9219.1647518238717236109
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JRfKJwIo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id a1so5639722wrh.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ril/0pITX/6kMOV4fK2in7wFvTnbWiJq2DeNZhQPL94=;
        b=JRfKJwIoI8TdNSr7x0dpPDTDR0q3Kgrbs18vtJUN+Fa0MFQCvLyb9zL19yhqBYxe3W
         /ICbtzNMl2YNrZw0jP2d5ifVhtbq3RdF5fL64osygcFPdRzpJDWe7s5hMnsX/9qMa1oY
         qw4ZY8S0PZ4MM+MyCcJeuNzqZw8nyRb278C5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ril/0pITX/6kMOV4fK2in7wFvTnbWiJq2DeNZhQPL94=;
        b=qkf527iZxE7G/rRM23KHRr3TVjnu3GM1cWM3sfFSjMWS/7GzAA/4IGNby7gSo3++Rs
         /yN9OeBQOH4oZx4lKFZoqYONOuOYbB5Qj5665aWPksYqkd7Tupe9yYYTERYj/2vVgmYi
         dJv8+jUYTBiOxQ3LGbVxzLcJv/50Y5FRhHKfwNdRW/3Z0hwBnggieJruODTjql2BiQ2o
         oDon2daYOHtavaYB+KCfJPe+YBVMP0LSVHsr6oLz0lvuek6mNY8mlfEzOeSijkw9KJtJ
         oOfixNvV49nHZ6AYaNAb0cYeWCbW6AK99FVnvz6gTz3SdC1NCWngE94aXqAqWisUyv4A
         4nmg==
X-Gm-Message-State: AOAM533FWgaBPCJdQ1oOxYvJTUxBBh5VqTeExmSKhJqq2WklEwZuHx+e
	OVkyqmLxw0IoM700PIGLjRIVmXT9knS4FjIK
X-Google-Smtp-Source: 
 ABdhPJwSghdHr5wiZNWT5XXT2If+aEPIxBhBaVtDnUJB+ZGOj9v14yArfLlpp0jnFRZTvrqQ26tYSg==
X-Received: by 2002:adf:dfc2:0:b0:1f0:262a:d831 with SMTP id
 q2-20020adfdfc2000000b001f0262ad831mr3498584wrn.589.1647518237053;
        Thu, 17 Mar 2022 04:57:17 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/26] python3-urllib3: Add from meta-oe/meta-python
Date: Thu, 17 Mar 2022 11:56:47 +0000
Message-Id: <20220317115700.993924-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163399

---
 .../python/python3-urllib3_1.26.8.bb          | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3_1.26.8.bb

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.8.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.8.bb
new file mode 100644
index 00000000000..c2a51b91485
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.8.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
+HOMEPAGE = "https://github.com/shazow/urllib3"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
+
+SRC_URI[sha256sum] = "0e7c33d9a63e7ddfcb86780aac87befc2fbddf46c58dbb487e0855f7ceec283c"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-certifi \
+    ${PYTHON_PN}-cryptography \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-threading \
+"
+
+CVE_PRODUCT = "urllib3"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


