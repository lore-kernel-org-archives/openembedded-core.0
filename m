Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83661C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:10 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9292.1647518229392068491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hmhxFj16;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id p9so6979353wra.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EYvbuHVS4gDa3sccCGC2EERTrDsrcNGJfabytey/AQw=;
        b=hmhxFj16ZTqdjZQ3yANOsepYbkst4xnBOyx37CHCNqnZpNQCWwZ5CHJcSgqZcOb9CI
         4QhDaXd7oDOuZ08a3u3piYMQ26E6wKheR+Km2P/rh6OJf9WeTsJ3ikHbVTFtq9Y+uJmw
         OsvYuVxqbooMZM2jLleUvIWfgE+5arFANOrbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EYvbuHVS4gDa3sccCGC2EERTrDsrcNGJfabytey/AQw=;
        b=fb48pJ2/12CaubD+cKsxVZDfd6gX9fU21EhC7lx+5ixepHl8MflJAaxx6QjkoXHgo9
         6Hmx6mTBUzvMa8Pu7opRfE8pb4utZcplSshpqcIUx3uFVkS3SnRIKNdMlTQLcR+7ESws
         ++B8V+UhVGdrgG2WGhnOe7ACYwa4yfmZuMIMdNjaw2OoVv+JCBvzhYWsatvfVeueVInB
         b7ze+XyZhamUfKsJb7khWysXNyeKcCkz+XIMf0h/GUChU9b0CSxYQMfAeQa5Lvqj7TAh
         xOkpnbuL1+cSVqC2rehq8ItKwZqVbjvtw4D6x8ZhGDzlKEYLtaVGbI3GMt54T51y1uq0
         pEjA==
X-Gm-Message-State: AOAM530wo9RY2rf/db3nOxaMHs8DQ1kEA4PWWLTBCfx0c9PcEsfWBQOj
	z7CWMClixu6E2B9KPuirwQYXcFtA1f6/IqtE
X-Google-Smtp-Source: 
 ABdhPJwsWw+rdLPqx9tUY3gZSPAXvTjcR2ilTxNlG5Df3OWVcsJeYsOmlDHv8oyggCBnziXxrur6mw==
X-Received: by 2002:a5d:598b:0:b0:203:95c0:7b72 with SMTP id
 n11-20020a5d598b000000b0020395c07b72mr3842842wri.172.1647518227527;
        Thu, 17 Mar 2022 04:57:07 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/26] python3-chardet: Add from meta-oe/meta-python
Date: Thu, 17 Mar 2022 11:56:41 +0000
Message-Id: <20220317115700.993924-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163393

---
 .../python/python3-chardet_4.0.0.bb           | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-chardet_4.0.0.bb

diff --git a/meta/recipes-devtools/python/python3-chardet_4.0.0.bb b/meta/recipes-devtools/python/python3-chardet_4.0.0.bb
new file mode 100644
index 00000000000..75fe4df8d77
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-chardet_4.0.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Universal encoding detector for Python 2 and 3"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+SRC_URI[sha256sum] = "0d6f53a15db4120f2b08c94f11e7d93d2c911ee118b6b30a04ec3ee8310179fa"
+
+# setup.py of chardet needs this.
+DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+
+inherit pypi setuptools3
+
+PACKAGES =+ "${PN}-cli"
+FILES:${PN}-cli += " \
+    ${PYTHON_SITEPACKAGES_DIR}/chardet/cli \
+"
+
+RDEPENDS:${PN}-cli = "${PN} "
+
+RDEPENDS:${PN}:class-target += " \
+    ${PYTHON_PN}-logging \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


