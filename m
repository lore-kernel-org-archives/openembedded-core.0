Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E97C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 17:49:43 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.45369.1660844976107351727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 10:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gC0QPU4E;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id a22so2214938pfg.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 10:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=8hW/X/MCjgfexBXakivfluSddZjw10KXj9PsfXilmBY=;
        b=gC0QPU4EAEd3TohvIKEf7DnnDbRKmip5fsGK75pL4UIUL3ocJnCUgt1kIY1FWPZbdp
         lFtNHiMQA4HR0AqxFCtTqt0U7cUpk6zpqfzYakF90/awMY2CQ39PxJgOZu7pRamtu9GQ
         Y1wGIzqzwiCDunQmbEXsjLp6F/gHTOqes2j3GXDCFwAqTvRj0hsEXvwB6yZZ5LYtj/g/
         3beaOSujbqlB6YMbK+Yz6prmCOKqdD7E1qIPyM0JxX1XBr+PfvAPv5a2wcPyVSKe0G5p
         emNJGsxl4Pf+Ukl/6LCqqNjmW8pRqY15XxewMSgGod+oJ4s72qwf3A6umnOdOI9LGbqN
         paGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=8hW/X/MCjgfexBXakivfluSddZjw10KXj9PsfXilmBY=;
        b=ABJwS9SOb12DxsrAFKbbZxL/0E8wAEjNLsfc9nBqPtufmxLOaEYnqQLfq7bybvCSkX
         Erhp7wUeFjp64jY2Nn8d2HWYJF5PtFRcNERWTOxfmVR5XH6P+fBZFNeMjd+6oH6IPMfp
         YGc8Wllpu0NDTDXPqObEFScxjgCYnYFUtwAQ19NUM13BIJPuYrFaA2oHnR6VQMEma0tC
         9Q9bd9JwcR/EFwMicghva9svqJBNtijLEo6IMMAKgTEZEcE7tyZkAb3L1LpEDkI7Zd0t
         9OPbggNCXq3TGFjsae6G8HZ//fjmGwR6tdLfsi7YLOhcHLsjsBU3lsi0EMb3igJiZRZg
         86ow==
X-Gm-Message-State: ACgBeo0TeNKHA2VspcbStzGiM5fq274PUP6WLPRjvuPxBdXGy/QRZcGv
	+L1uezROyPjhDlXSh4xDBY8EMHqucLmcvg==
X-Google-Smtp-Source: 
 AA6agR5N5LHTB7rwh/pN/ACbih/2kit6XKDdcM2E+eIu47U4YzH2dhFgnuXMRaNgytQNNp5WpQDyxg==
X-Received: by 2002:a05:6a00:1c4b:b0:52e:6c05:8f1f with SMTP id
 s11-20020a056a001c4b00b0052e6c058f1fmr3954673pfw.7.1660844975225;
        Thu, 18 Aug 2022 10:49:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d53f])
        by smtp.gmail.com with ESMTPSA id
 iw11-20020a170903044b00b0016d150c6c6dsm1636590plb.45.2022.08.18.10.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 10:49:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Upgrade to 2.36.6 minor update
Date: Thu, 18 Aug 2022 10:49:32 -0700
Message-Id: <20220818174932.56101-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 17:49:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169536

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkit/{webkitgtk_2.36.5.bb => webkitgtk_2.36.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.5.bb => webkitgtk_2.36.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
index b3fe357010..37b977f9ba 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
 
-SRC_URI[sha256sum] = "d5532fa884c943dc48f1911473dd663aba407a3b35caa7b04bac1419b41e5908"
+SRC_URI[sha256sum] = "1193bc821946336776f0dfa5e0dca5651f1e57157eda12da4721d2441f24a61a"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.37.2


