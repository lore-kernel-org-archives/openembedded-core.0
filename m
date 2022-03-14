Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC02C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:05 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.3441.1647298143861992740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M5HvYJCM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id r64so2475643wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=i24LLvFQyXs4uy8AhoQDo8+uRnFpsI0anFM9rMLq4SI=;
        b=M5HvYJCMb2WZYgVi+uR0qZQZMKfLmzTtk4GIcveAvAh1FWJU7/BQ9NQPo5DSeEtXM9
         lvA67FH+P6x7s5iLx1btAu9JW+L8XtSDdNprA4fP/o6NjvUOfxDwIhihk2CXmQKo29ft
         WPmh6UsanTaJ5DHkxccuLL5K9wrhKkZoa/8FM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i24LLvFQyXs4uy8AhoQDo8+uRnFpsI0anFM9rMLq4SI=;
        b=CibQAkN2583m4t6xP2NifP9qksY5y1aprCYUHgxvK8zCt2rruRAcyrZfAOUkiss1TY
         jwAijdIR6OIW1XRpOVrNQBpHkTNC5/unotowko3zcxrnNctx+0qdYRg7Xx7Ec7pUXQnP
         pJsv3Z3TcHYEcV23uM3K2n3dx8Qr/Hc7HeYTWea00EmOahLL/torwols6WniTortPzLZ
         Av0ytdxoeNAmAY26Ue6BQ+SwDDbYTzcQRczgN9dnfSITvBNU0BnlGf6SV5WU/CwewROM
         8p9dC2QwTCyZ05kVyHbPMmIYOD9qUL9sFJ7afNrz3DzRRvBpwf2d4wl3S/6XQXOiBtGH
         qKqA==
X-Gm-Message-State: AOAM533fPlKIqYZc8XWK+le85ODeq3tZOfg2jCpIBj7olHHqSy1RLjb8
	qAomARL8KaLKtunInNMawGAO2V3saJyRYyID
X-Google-Smtp-Source: 
 ABdhPJziLhDSVe2VL8zcNwQ0f+3Rvs117+XFAQEHLbM1G6CW6oIZoUjT1XWGD/baK/9y9yI3O/bMoQ==
X-Received: by 2002:a1c:f30b:0:b0:380:e444:86b9 with SMTP id
 q11-20020a1cf30b000000b00380e44486b9mr1001959wmq.81.1647298142214;
        Mon, 14 Mar 2022 15:49:02 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.49.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:49:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/33] py3o: Rename to python_py3o
Date: Mon, 14 Mar 2022 22:48:27 +0000
Message-Id: <20220314224837.834776-23-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163189

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/{pyo3.bbclass => python_pyo3.bbclass} | 2 +-
 meta/classes/setuptools3_rust.bbclass              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/classes/{pyo3.bbclass => python_pyo3.bbclass} (96%)

diff --git a/meta/classes/pyo3.bbclass b/meta/classes/python_pyo3.bbclass
similarity index 96%
rename from meta/classes/pyo3.bbclass
rename to meta/classes/python_pyo3.bbclass
index 6ce21329c2e..10cc3a06457 100644
--- a/meta/classes/pyo3.bbclass
+++ b/meta/classes/python_pyo3.bbclass
@@ -13,7 +13,7 @@ export RUSTFLAGS
 export PYO3_PYTHON="${PYTHON}"
 export PYO3_CONFIG_FILE="${WORKDIR}/pyo3.config"
 
-pyo3_do_configure () {
+python_pyo3_do_configure () {
     cat > ${WORKDIR}/pyo3.config << EOF
 implementation=CPython
 version=${PYTHON_BASEVERSION}
diff --git a/meta/classes/setuptools3_rust.bbclass b/meta/classes/setuptools3_rust.bbclass
index fb11f08f89c..fa8508fbec6 100644
--- a/meta/classes/setuptools3_rust.bbclass
+++ b/meta/classes/setuptools3_rust.bbclass
@@ -1,4 +1,4 @@
-inherit pyo3 setuptools3
+inherit python_pyo3 setuptools3
 
 DEPENDS += "python3-setuptools-rust-native"
 
-- 
2.32.0


