Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1AC103A9BB
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:32:00 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20285.1774438312893296948
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jyv/PCGl;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so37872245e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774438311; x=1775043111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDSBN3rxuHSRYHYYcOkM+7W52LvTL9Hs7ea/Tq8T9gI=;
        b=Jyv/PCGl6WaOQlESY/D7N2SKPftwyhujC3wOQk1JG/1wxsoh3ZrCfrqUJo1dZWfrkR
         k+xxWZ0YnKJElWLtO3IMCEx1F53G/nSBvklUQL8OBAVNbLcJsPV8WjK1lBiyI7bu0LQX
         abyvvHe+Mf/Lqf89SyXZyDwvNpsIflyE0EpVQ1r79qQW+RJfW5DjeawqG+OlWxrECZU0
         xkXlv5YuwD5S0YZNZ4osQ0iB17VdIb5jmTy0CH0DB5N/M+aPdsRuVQbuT3ge9uMo22ox
         Rp9fqKpDo0kMcmYh10eBB0sZk4Jt2P+wrZFbtlPMYw5mVSyV9cvBbMUZ7g9lGGbZA4T/
         sZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438311; x=1775043111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WDSBN3rxuHSRYHYYcOkM+7W52LvTL9Hs7ea/Tq8T9gI=;
        b=qO9NKeOBT9FYjwlbazoVUN7oJ5LaH1lVCANcrUOTyYzJntMiuN2iuauGM4pFmPYcND
         mQO8YVfXVv6hx5ChSu3NPwUZmEgFSzeTKFkzJDG4G8757SwQbeEW3G7Rc+olqK/sGYBM
         Gtn3Ucrk/rlgAfIM2E10S87lFCl6WP4Ukhd4FizitwzjDw+fIOhD4EGNGgvwp+wHjkqP
         JDr2d48i0rz5jxpHrOX8qh84qd3ImBmJBI87wqy/80nDaMNAVGzX0zShUyrqtmcKwRfy
         CNgWK+IgYILd0xQgB2ky6DFo3HcgkBAVoXxYWEsvz/dh/Q9yJnZpJYWq9wOqrZcI4F7c
         t7+w==
X-Gm-Message-State: AOJu0Yw9OQkx9JxGBbbwYxGAHeESXXrPxEwkdEJhPX56AL8H8k6jojSd
	stM/hMYoU2SgWJQoXPTXmtseI1LIJbtvB4JxmtoC9t49a0aq9Caw7xMcA38m2A==
X-Gm-Gg: ATEYQzx6jL/tcCJrWC+He1/hlx8udnSlC4/l71GQqiZ2TxWiGav9ZfZW9DYKsudVOda
	rQNQ18YDjoYlFabKkS7KldEDvGnEK4JXm60CcPI3x9tGebJzi0zIbae9h8VrVG7M38UpRRzU2uq
	P6uWBpwEEkbZahq/zlHs/v2TIw3DMijLgQCA1MvCdKlRKeSYEH80LOUgiwzu8Wu9Ske49CehY07
	eihKCE79RzUHky+1mlbrunNe5mXzArrMcHrhN7zbh1S2Ipq5oyecQTSpWGz8bQWCuv1opnhq9ZN
	1vpqMT+a+7cyiCqpS+GaJ2RVbZ7+WKRuZGEe3JDM/zL+T7IxIuRxhTCfxpNZIL5TMiABnE4hCFb
	1jXm5TG3ucpwTGNxtjiF97X91AnfFgQckIvkjwqtU8/BBZb+bYaiXOX2JhLiqpXmMLaMAMzLfO6
	w8MpATjysNAMP6lA==
X-Received: by 2002:a05:600c:5298:b0:483:6d4a:7e6d with SMTP id 5b1f17b1804b1-4871606c6a9mr50039945e9.30.1774438310720;
        Wed, 25 Mar 2026 04:31:50 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm170539955e9.2.2026.03.25.04.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:31:49 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 13/14] xcb-proto: Support Python freethreading
Date: Wed, 25 Mar 2026 12:24:23 +0100
Message-ID: <20260325113112.1163632-14-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233887

xcb-proto installs its python module into the ABI-less
site-packages directory, then in turn libxcb won't find it.

Move the installed site-packages directory to the correct
location.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
index 2a78a87e77..dd42dba374 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
@@ -19,6 +19,12 @@ SRC_URI[sha256sum] = "2c1bacd2110f4799f74de6ebb714b94cf6f80fb112316b1219480fd225
 
 inherit autotools pkgconfig python3native
 
+do_install:append () {
+    if [ ! -d ${D}${libdir}/${PYTHON_DIR} ]; then
+        mv ${D}${libdir}/python${PYTHON_BASEVERSION} ${D}${libdir}/${PYTHON_DIR}
+    fi
+}
+
 PACKAGES += "python-xcbgen"
 
 FILES:${PN} = ""
-- 
2.53.0


