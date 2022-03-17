Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854D7C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:16 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.9218.1647518235451740110
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EqLqdbyL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id t11so7036335wrm.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6eTKvdwMMRTOoN6SwTM4M+ZSO5zjtehRJ8I3cq7LfiU=;
        b=EqLqdbyLVSreQWfRfS+VsOtYv2MXEcUYhKoi9NKVOlOYl5arBD5XSgPfUsOVJj0Wgu
         H+K/XguKP2Uvq8fNNLBFAijhu6AaN5FfDYpFL+gzFbvC5OCtR+my+0cTY8btDVmsKEa2
         p7SApzocvucDgHKLyE2qaYxZcPWqtWV1mTTLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6eTKvdwMMRTOoN6SwTM4M+ZSO5zjtehRJ8I3cq7LfiU=;
        b=TYK2g9t+zJ/PC3ttP6o0QprsE8hk2DP4ei2zZT79DCQbqT+MxHELLBlS9v4n4kIkC2
         dBBJE+3/GKAjEKS6zNbyj4D3OISlWfb/RTwcL7hO2KjTU/1sHCW+Y7f3SvzDyzrMrZ61
         C/GUgZT4iKnH4Vqfcc7PFgKbAmI/6irav/vMBSgRexcDyLZH6kmptvRPt/wIHTR1AJJj
         jS85gBjyjFwNe3zWjza3AxtbwaoigIPT6w8AWlzWftHcQmUU9C8/nPiefBJUBYGsLKHr
         Y1BCY6h2/RJ0IUwskLvhIr1W6UdH4gxCmvQHaKIIHtVCfSI1OicgBYrZPGDwKYiYKssd
         hekw==
X-Gm-Message-State: AOAM533V7+0KHL9oEGm13wAPzf8LEZ4X7Y3M1RTptVV8NWReR1Cxogq6
	chGRd7dGsq6EMaWIS/2+wQPrbfYH2HjANsw1
X-Google-Smtp-Source: 
 ABdhPJwAdSzzucfZhMWEk6RCKJeNlaVld/KTyICfaJHY9tHH7WC5Ee1ZpeubBb6rVV2kXts1riVkLw==
X-Received: by 2002:a05:6000:1ace:b0:203:d45b:fbce with SMTP id
 i14-20020a0560001ace00b00203d45bfbcemr3647156wry.673.1647518233325;
        Thu, 17 Mar 2022 04:57:13 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/26] python3-pytest-runner: Add from meta-oe/meta-python
Date: Thu, 17 Mar 2022 11:56:45 +0000
Message-Id: <20220317115700.993924-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163397

---
 .../python/python3-pytest-runner_5.3.1.bb         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb

diff --git a/meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb b/meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
new file mode 100644
index 00000000000..fed2d91140f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Invoke py.test as distutils command with dependency resolution"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
+
+SRC_URI[sha256sum] = "0fce5b8dc68760f353979d99fdd6b3ad46330b6b1837e2077a89ebcf204aac91"
+
+inherit pypi setuptools_build_meta
+
+DEPENDS += " \
+    ${PYTHON_PN}-setuptools-scm-native"
+
+RDEPENDS:${PN} = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json \
+                  ${PYTHON_PN}-io"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


