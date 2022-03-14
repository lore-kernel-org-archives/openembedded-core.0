Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7D2C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:48 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.3511.1647298126737507492
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EJCsWWnz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id j26so26344911wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qKU4lDrA8uckb7vSuOhV7uzzWfnHzCz+G7Fo3Ommglw=;
        b=EJCsWWnzYvNJohxtDFuPyniGLgenX8pNBr3cVTwTNJabcaEk9RDb/uVqJeWnMfub7E
         3dwgAqoTjqVuuNIV+RrWrifCuX713Bqtd1QF/9FgZcf0tI2fyCFHW/eklxuN+yUmMCTU
         X+zChDIoJ1LBpe9fhW+xKA2jz2YJzLgwkv678=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qKU4lDrA8uckb7vSuOhV7uzzWfnHzCz+G7Fo3Ommglw=;
        b=EWENX1i/YFG01Slak0oKhCcKiUWsSDGrKL2rbqi5JXyDaBldu9YidAgmmA+7CCE5dX
         M/w8Aw4o1jRc1BMVAs8FiX9RF8RBW2kDkSY4cWhhbplHSfkuf0sNYC3SDUBc/P2SBrpD
         f9CgxzA78V+2AGIn/m/Uj4UYwN20tuWJYLB1O5tI1bi/VJoO2C3iD1Xy2Jc/CG2D/IYs
         /dxtYQ7AT3fAzlsWdwZ/NoSn2tvhilVfn5iAH63kliBH8OApjaFpiai9BrOb6qkVqjMd
         zlRKIdrQBbuePlxLPTE5cPgglitp8KrA613SSTVUY61ItFyBigFe2jD8WhrkGHY+p8GY
         vIMQ==
X-Gm-Message-State: AOAM530FmaRvqQ6Xpc9526fnOIwGj2DWoCLhKMUvsDFOpILQzgjqJk12
	VcN+si5LyXeX7HsxkT/YQElw9xOcOh8f8a3r
X-Google-Smtp-Source: 
 ABdhPJxUd+S8JKxjluW10xMa+0VwG28p21pkquZ2wJ5bN8yZQ+fu3a2vCRFpFeIO2wX5z+GS/ReKbA==
X-Received: by 2002:a05:6000:1868:b0:203:732e:6a96 with SMTP id
 d8-20020a056000186800b00203732e6a96mr18366602wri.39.1647298125060;
        Mon, 14 Mar 2022 15:48:45 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 07/33] python3-cryptography-vectors: from meta-python
Date: Mon, 14 Mar 2022 22:48:11 +0000
Message-Id: <20220314224837.834776-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163173

From: Tim Orling <tim.orling@konsulko.com>

Dependency for python3-cryptography ptest.

This recipe needs to be kept in lock-step with the version of
python3-cryptography.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python3-cryptography-vectors_36.0.1.bb    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb
new file mode 100644
index 00000000000..b9e6b811c37
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Test vectors for the cryptography package."
+HOMEPAGE = "https://cryptography.io/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0 | BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
+                    file://LICENSE.APACHE;md5=4e168cce331e5c827d4c2b68a6200e1b \
+                    file://LICENSE.BSD;md5=5ae30ba4123bc4f2fa49aa0b0dce887b"
+
+# NOTE: Make sure to keep this recipe at the same version as python3-cryptography
+#       Upgrade both recipes at the same time
+
+SRC_URI[sha256sum] = "fc8490afd5424342b868215435bd174dcd76ab396b4ea9435498be5721dcd598"
+
+PYPI_PACKAGE = "cryptography_vectors"
+
+inherit pypi setuptools3
+
+DEPENDS += " \
+    ${PYTHON_PN}-cryptography \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
+UPSTREAM_CHECK_REGEX = ""
-- 
2.32.0


