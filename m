Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.11635.1621204372577563818
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QKRDdZu/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id f75-20020a1c1f4e0000b0290171001e7329so2479017wmf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BF4S9U+otUTOK+pkcyNK3r2mN+IwvGGBxtiISCjcfVE=;
        b=QKRDdZu/imFMhzNZGxwpFJBAytgBxVMB0tGje8wfd6Yi9+rcRo6HubbXLL88dcUmdv
         YQmT8JJ05y8AE5UFAga9RQdnL3yl5jos387q9nNVrb1bw6Zx0ftqEQXb71bcWmgMt4sw
         6Lskh0UJjVn7ct6MfoDoj8YlzNfGJiUBOWMoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BF4S9U+otUTOK+pkcyNK3r2mN+IwvGGBxtiISCjcfVE=;
        b=CDBWoefxqOJ+W2pJHWkmyn0qONU1j8TFa2nCrUNOnhGjjWioem5kvuwnDN7mT+r61A
         BXz4o3ZC/nemt0KxicD88zi/K2gH0k+dORO4kPSY1ZioFLFg4UQJckgDIm8G421geqPe
         fnisFaHxEPE82q82S7QletYMsJG6GfKbxO1uZvMGe0lZr1J8lG6X9nVQ1Lp2GnQumpYn
         2e8VwDmi+QK6oe6RHpa9gm0Z5uI6JxoLns4A/f6fWqVwuKt3G0/EtGygSOEnZgvbM5o3
         PaFw41wJwzfttY9Jxq9pixz7N3r8C48iieF5Twybl1oySRUsD8Onm1FNubfb4m02gCdY
         o5OQ==
X-Gm-Message-State: AOAM530HSKBAb/lJs/VgFdO6gK3MrJKMIhY1BvTFJvVL3Wq8mZkGCHVF
	lwu1R7Du38R0O9IYPp1sczV0AGN4YGwVNw==
X-Google-Smtp-Source: ABdhPJx64UoegwIgHMhHRbheMBwfUrdkw/dh9x7QaLfR+evaEKOtf1le+bRX8cuU21WUbIru4b7+iw==
X-Received: by 2002:a7b:c92e:: with SMTP id h14mr329349wml.179.1621204371184;
        Sun, 16 May 2021 15:32:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:50 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/27] vala: upgrade 0.52.2 -> 0.52.3
Date: Sun, 16 May 2021 23:32:26 +0100
Message-Id: <20210516223247.2401235-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/vala/{vala_0.52.2.bb => vala_0.52.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.52.2.bb => vala_0.52.3.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.52.2.bb b/meta/recipes-devtools/vala/vala_0.52.3.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.52.2.bb
rename to meta/recipes-devtools/vala/vala_0.52.3.bb
index b8609623225..133dc9efade 100644
--- a/meta/recipes-devtools/vala/vala_0.52.2.bb
+++ b/meta/recipes-devtools/vala/vala_0.52.3.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "3a3c460803ba661e513be3d0984b583e05473f602c75fa98e91755503714a97b"
+SRC_URI[sha256sum] = "037ea1a92bf0f1ab04a71b52a01d50aca1945ad1017b6189d9614f84f5c9b2d9"
-- 
2.30.2

