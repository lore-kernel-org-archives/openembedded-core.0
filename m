Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEE2C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:06 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.3518.1647298145359953718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h6/GHUR6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so416024wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Uh6k7oMI++7rqlq4Jy3u1CTTd0PNTkmGowoFnVFngFA=;
        b=h6/GHUR6MmcsfCrtfxMUyFcuiqJDPoq5wqpVcRc2WjL9S6oNOq32xlwtd1bTdQM/pr
         UaqPm/Kq9mpzDLvl3sEnjV+nDq0b4E86SyWpKHGcF04HZ7Gu8cKvjWUc3G4BipOPnpWP
         qIeGvi4+DezFM7tQW+iimbTSmxeHTZS6piciE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uh6k7oMI++7rqlq4Jy3u1CTTd0PNTkmGowoFnVFngFA=;
        b=IRb2Ww/4zAa0uVy8IB8q1nDNiH9+2MKOTwZ2RukYPeZgQK4J7GW6u2zrNVRtvKoFYj
         BIGrmAfKk58jtKhFUxHoRPtp6q91oiBAWb6e3ALxEY/BgIgh/qNiWQTuALyF6sALxuBJ
         AcoGoo0hFwDE9TD9mkb0eFfIXqG54t7mg2zhJWs+SacEZvC3uFHTHgZyc58ejQDKP7XK
         VwolGGtBGxMZiRtqz+PJcYFF3rCM4ms26zK4CTy1SQJm24meaXqHgrVqdcvRAHyOuYVJ
         u8SUT6hROLGplVksv6o9ql0OekjRI9kkf/u0LH2aFLz12V2zvStOVTtDiIHzWmkWWsza
         rReQ==
X-Gm-Message-State: AOAM530YQTxvzGz768WTurRF8As8cqU/Yltztwsj0Tcv6rb1Fpgmm6zj
	RNdbt/hESNOqnBJDy4LxlrzxZK/92IALOTek
X-Google-Smtp-Source: 
 ABdhPJxZpgzglK4IG2nFcImlq0HhHZ8ZMoxSslxdsKWtXwPl2c+p2TnViuDm6PlSLEmpD4OFZdlFnQ==
X-Received: by 2002:a05:600c:3b9f:b0:389:cf43:da5c with SMTP id
 n31-20020a05600c3b9f00b00389cf43da5cmr969349wms.198.1647298143606;
        Mon, 14 Mar 2022 15:49:03 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.49.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:49:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 24/33] setuptools3_rust: Rename to python_setuptools3_rust
Date: Mon, 14 Mar 2022 22:48:28 +0000
Message-Id: <20220314224837.834776-24-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163190

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...tuptools3_rust.bbclass => python_setuptools3_rust.bbclass} | 4 ++--
 meta/recipes-devtools/python/python3-cryptography_36.0.1.bb   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/classes/{setuptools3_rust.bbclass => python_setuptools3_rust.bbclass} (70%)

diff --git a/meta/classes/setuptools3_rust.bbclass b/meta/classes/python_setuptools3_rust.bbclass
similarity index 70%
rename from meta/classes/setuptools3_rust.bbclass
rename to meta/classes/python_setuptools3_rust.bbclass
index fa8508fbec6..f12e5d0cbd2 100644
--- a/meta/classes/setuptools3_rust.bbclass
+++ b/meta/classes/python_setuptools3_rust.bbclass
@@ -2,8 +2,8 @@ inherit python_pyo3 setuptools3
 
 DEPENDS += "python3-setuptools-rust-native"
 
-setuptools3_rust_do_configure() {
-    pyo3_do_configure
+python_setuptools3_rust_do_configure() {
+    python_pyo3_do_configure
     cargo_common_do_configure
     setuptools3_do_configure
 }
diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
index 00791dce2de..11466ecece6 100644
--- a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
@@ -18,7 +18,7 @@ SRC_URI += " \
     file://0002-Cargo.toml-edition-2018-2021.patch \
 "
 
-inherit pypi setuptools3_rust
+inherit pypi python_setuptools3_rust
 
 PIP_INSTALL_DIST_PATH = "${S}/dist"
 
-- 
2.32.0


