Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.4375.1612602259313383884
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 01:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cYsgwz81;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id j11so7909042wmi.3
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 01:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dDKN4fvalsmzohptwt5n/kLe3NHN4rytaNrsTzHAvVQ=;
        b=cYsgwz81VPGMlI/iFHt0D7uYfNvCcr/uL53Dhft+Pxm+k+hMaE1wykWKhPN5hzHQJH
         Cj4vj2axaH/JjXHvOhU/BtXHJMZy+r+rBfv/wzGEe49BalIiyj0TAUfcp6QoFsFhRbA5
         zr/fWDBTdTXXJNID1wlu2+rTpAiF+hzyh4V0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dDKN4fvalsmzohptwt5n/kLe3NHN4rytaNrsTzHAvVQ=;
        b=eee6wIPkUAQKZo12Fg6zqtb59MaATStloOxKKqWc/naNhdrbgW7hFLILyusJrdKrED
         RadlMkjCoPICXg1NRkZpc3Cifl3kLYBjzBVczApeYY+7x12KhDYCuRfnqmHu6COFg+m/
         Q5YtPsnbrtVuRktXia92NEqCiTNIdiusCwHfipLi5j99GJHPvKHiqYYlsPjBwKeZGdu+
         Jo10xq/Ug2ttpyUv2hCs6V5HdytwCg4iHCTgmEprBaWxVvsTiSHi2qpF8cu51n7NKWDj
         h/CxlLJupCW3MCjPXIFnWM/rVBb3W/vig6EvTY/u4o/k+Y/3rUqxBPOU9PLlEp2NMwXR
         yv5w==
X-Gm-Message-State: AOAM532QbhPT195ZuKdEQeyTar1bg9efi8VZb2BIqOcV857jWGZuFHZG
	D/psYw4ccdd9hWwi1dBuTwdhP3/gTaEmVg==
X-Google-Smtp-Source: ABdhPJx71Bb9ObaTPxJJ7lqSHIhjLpY7ZFLVlxNFqS50Y7dQs+ZDyazdKSAP9ZGM5vVXMqQQklf+zg==
X-Received: by 2002:a1c:a9ce:: with SMTP id s197mr6920565wme.146.1612602257865;
        Sat, 06 Feb 2021 01:04:17 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:be75:a088:9c76:71df])
        by smtp.gmail.com with ESMTPSA id o124sm11332678wmb.5.2021.02.06.01.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 01:04:17 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 04/10] gnu-config: update to latest commit
Date: Sat,  6 Feb 2021 09:04:09 +0000
Message-Id: <20210206090415.1707868-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
References: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Update gnu-config to the latest upstream commit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 32c1499a30e..b4e71418acd 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -8,8 +8,8 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "c8ddc8472f8efcadafc1ef53ca1d863415fddd5f"
-PV = "20201227+git${SRCPV}"
+SRCREV = "6faca61810d335c7837f320733fe8e15a1431fc2"
+PV = "20210125+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.27.0

