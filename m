Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.4119.1609193799265240384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ysYNJphV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id h186so6975147pfe.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=JXJckKKUraIppam3ygpangO2/safnUVeMUihIMi0ELM=;
        b=ysYNJphVJ6lriqt6WeRPxWBGEt49O06cSmq8o1l7rqroViBnW6G70bsYCHDs+r+eCe
         Rg3A3J4oghDl5p/jlQWEFx91qrTWwBX+5xHgTIv14UKMtIDcJyvgVmJuo6CEgWdhToPa
         XxbjA7i9z9mY+URwR487XoIfLF9rHLi6BvBSeWdRqOtX/nfKBpgsyS1xpkqYGT5kAW00
         1r1jQiQbHBcqWjFFLoVqeDd6m/imO6SUirT1khIQKxF6+bdxEgR3nHjA7998SdOkGo2d
         vfUUDh5xGlSnszIE5l4NpJmbUp2FyjEN6P6Jph7hIE6BPwrPWOJTN/qresI29L8yk0G0
         la0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=JXJckKKUraIppam3ygpangO2/safnUVeMUihIMi0ELM=;
        b=rL0IVHdp7pnIW7QAS5LBWa2Y6qmDSk/A48TwVbopf6bb69fyhY/PaHBpz/TACoCftn
         JVMMy4+QhvSvDNvmAQpHpvhtsM+Z/GXk3EWaG3tv2wm5YdvPyfkssnu53ZCEyG19xEE6
         ZcwSxfHDHw/FR9A80Mew3g/Rnz0GW9TKKzZDxYBpdD7RVxMSA7mCSXCab56iFsYP6mBa
         1WfJYDnDK6FBpIIrvzh7AD1NT4uNu8kgP8/oT/9dma9HTlxommATmj20GnM9d9h9cK6w
         WeJ8W/hlUaRfaWStRSWIHHyKyA0c/TNQLHLDmM0SjsIxSWtnQxAWvggdezxC5QTiNG+3
         pBSg==
X-Gm-Message-State: AOAM533Tu83X/XmCJVbY1HrtJgHdhuw4AYiVkvvg6mzgq4TN8HEnuZOP
	l/UGP4SXFN+9sPLdakGX/Oj0xpxOv9kXuxCOuo8=
X-Google-Smtp-Source: ABdhPJzHtpLmxliYQG/HGd4jgGLX2qwFkDurTHnxDj2qwd1OARcT8VwG/CdBiSOHLvFn9YQFCrHJgw==
X-Received: by 2002:aa7:9e52:0:b029:19e:6c32:30d4 with SMTP id z18-20020aa79e520000b029019e6c3230d4mr42302011pfq.21.1609193798498;
        Mon, 28 Dec 2020 14:16:38 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:37 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/17] bash: Rename patch name
Date: Mon, 28 Dec 2020 12:15:50 -1000
Message-Id: <579efc30ef4b7ad81b24e8b04baf18a71322f9c9.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

From: zangrc <zangrc.fnst@cn.fujitsu.com>

Because the name of CVE patch is wrong, cve-check-tool cannot get the correct CVE result. Rename the patch name.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 422f9af7d0f7de7a2e933154853e7a281f98ab93)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bash/{bash-CVE-2019-18276.patch => CVE-2019-18276.patch}    | 0
 meta/recipes-extended/bash/bash_5.0.bb                          | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/bash/bash/{bash-CVE-2019-18276.patch => CVE-2019-18276.patch} (100%)

diff --git a/meta/recipes-extended/bash/bash/bash-CVE-2019-18276.patch b/meta/recipes-extended/bash/bash/CVE-2019-18276.patch
similarity index 100%
rename from meta/recipes-extended/bash/bash/bash-CVE-2019-18276.patch
rename to meta/recipes-extended/bash/bash/CVE-2019-18276.patch
diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-extended/bash/bash_5.0.bb
index 257a03bd8b..53e05869ce 100644
--- a/meta/recipes-extended/bash/bash_5.0.bb
+++ b/meta/recipes-extended/bash/bash_5.0.bb
@@ -30,7 +30,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://run-ptest \
            file://run-bash-ptests \
            file://fix-run-builtins.patch \
-           file://bash-CVE-2019-18276.patch \
+           file://CVE-2019-18276.patch \
            "
 
 SRC_URI[tarball.md5sum] = "2b44b47b905be16f45709648f671820b"
-- 
2.17.1

