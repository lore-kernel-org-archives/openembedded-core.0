Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09302E784A6
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 01:14:02 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.72661.1696209234223713824
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 18:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sai2Bp7X;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-690f7d73a3aso14433808b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696209233; x=1696814033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+saOjQ3vDLTi6H7u49XV+59yvL9X5sAkBWsUS+JEyg=;
        b=Sai2Bp7XSAzOWiKKVCJSx2fH1y9jLYlbJIaelMgxZl2r5tseCWNRC6r44f7eyNGxjY
         H++MwvP0ygcmARHyc5cuY0DXuQpYT5a3jumP9phmTI+cP8tlY3xXBtWeNHaJCDOHzTTS
         3TQpHT5Eb8EoCx7t4C+rX92CSAHdF6P7JLg+viBM3jvyQzL41+/kulKEeLekJ6Uu5ksO
         SrwYZNm1aUGgfUx7EpCNOpTiPSnRzJIR8+rLnlsa8UQXk4gvUb5tg1/HinWb01bLls+Y
         wxYOhjymVbFw5yKBdkXc2G7SJQSOQVzY6mwvy1+zDWar1xHBe80MTjASlfjz+UuMvWrF
         j0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696209233; x=1696814033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+saOjQ3vDLTi6H7u49XV+59yvL9X5sAkBWsUS+JEyg=;
        b=HXaQdaA8BKBMMhkY/q2H9BQLi+fC+0Cny0/mo7T8DsUQxrDP2B47bZT6Gc12ng7TCA
         umym3w8+FnojwMaf6/KnLfQxKzVGBsk0rJdJ6zO8qX834WKFYz/4R9Y7g3GtCDi436mS
         WQG7u4zoefsT5i6x6L/jx1qDJL7R7HNA3vabPN0R4iIYb+xTRfUhRMG/uF9LzJX/pHTW
         bD7RjI0Cr2zW/s3GcCphJ/PFCAaRkCQ6YW82UgxH2wtZWjehpXnoyV99iTNfg3oq4vX2
         +8ucJNno4y+5DUZoK2Fna7EeURGdRwU8Qr97k3Dn72ZrfxX1L1ungoIHAnCDK6RxENIu
         +ssA==
X-Gm-Message-State: AOJu0YxBuiFAY0ujCe+exIV21V0mBASvWcqKQ2LvXtJ13lBUJRKFr+9D
	txhs/Q336HYAH6hmXi79xgDgVp0OXrnLLg==
X-Google-Smtp-Source: AGHT+IEboztdSQt21x0E8BvuwPXGEmX8XlkDOIibNFL6Ty/p7KnkCbu1zpG/ZVI88Umnd2isI97Mzg==
X-Received: by 2002:a05:6a20:ce91:b0:11d:4c79:90ee with SMTP id if17-20020a056a20ce9100b0011d4c7990eemr9983623pzb.25.1696209233210;
        Sun, 01 Oct 2023 18:13:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id v13-20020aa7850d000000b0068fb9f98467sm7781658pfn.107.2023.10.01.18.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 18:13:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-docutils: Rename utilities to their canonical names
Date: Sun,  1 Oct 2023 18:13:50 -0700
Message-ID: <20231002011350.1195482-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 01:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188591

Packages which use the utilities usually call/search for these tools
without .py extension e.g. kernel-selftest and fails to find the tools
if they are having .py extension.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3-docutils_0.20.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.20.1.bb b/meta/recipes-devtools/python/python3-docutils_0.20.1.bb
index 65ca55e07bf..6038732cc4f 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.20.1.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.20.1.bb
@@ -8,4 +8,13 @@ SRC_URI[sha256sum] = "f08a4e276c3a1583a86dce3e34aba3fe04d02bba2dd51ed16106244e8a
 
 inherit pypi setuptools3
 
+do_install:append() {
+    for f in rst2html rst2html4 rst2html5 rst2latex rst2man \
+	           rst2odt rst2odt_prepstyles rst2pseudoxml rst2s5 rst2xetex rst2xml \
+	           rstpep2html
+    do
+        mv ${D}${bindir}/$f.py ${D}${bindir}/$f;
+    done
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.42.0


