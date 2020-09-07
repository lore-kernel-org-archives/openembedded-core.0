Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.6535.1599512013352875712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gGPviOZp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id w5so16956296wrp.8
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PGaE7t9IfBlMcs52rksmlzr9mAK5FZyZ1vx42FlN5Hs=;
        b=gGPviOZp9rLgSWXo8/Ls3kpqJSu4VCUIm3APD7WIhxAlb5Wzt4GnxmZIWPP0NtltQN
         67pBofP1CZbDbW4ZnZ6eajgNfS0ceOYL2fLUZ/TXlF2G4vIOWpODQOjubHEiw9ShKANT
         5A7NCjooOcpTUFPR6C8jLPC1LARbHWEuIKFjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PGaE7t9IfBlMcs52rksmlzr9mAK5FZyZ1vx42FlN5Hs=;
        b=H8QNHKW9Y3ypOUfIXri4MOm/4Se12kxarVL9/3MC2JW3qW2rMLBYayjvOuJSqCR6Xc
         bAuOvfhZFOFclVxtyF1qijVZaMJPFLcIbGXxHWz/PoyEUvK7PfDPxyIiFDNuDS8z2xJz
         C8wMbqCXa4+RxadZYIjjHdKVO3WfS1dbyly2R4DxoP5g4Zb+4ZC18fhs3hO/eXr2UGcy
         aMOwlGQspXOqKsU27v9rZjVc2TdCZ14gaqeAEJBSCMv3wLhOL5cSIjMmexgGBge/GJGG
         H302fP7tAl7hpds8afspcnVVa/wYLHYM4aW4SSSGy9eaCjFhxtg5g2wKNInNTm3rjQLx
         Q9sQ==
X-Gm-Message-State: AOAM530nvc+Inn4DsqH8YVpBW7Nk2LEFpaavIAFOGn8c6VJ0fg07VpIB
	ZSjV0XCdcwGtFH0wLu0+EVZPKZZcRktrQA==
X-Google-Smtp-Source: ABdhPJzvO09qJOURoeE1S1l7+PAa0bTQgpFSNpvyEuLmCaswTIj7UmiFxXgHBw1W13SgbkUob1eSmQ==
X-Received: by 2002:a5d:6caf:: with SMTP id a15mr23432458wra.344.1599512011654;
        Mon, 07 Sep 2020 13:53:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:31 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH][zeus 11/19] buildtools-tarball: add nativesdk-python
Date: Mon,  7 Sep 2020 21:53:13 +0100
Message-Id: <20200907205321.1941682-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 37f97056139..32a10198c93 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -27,6 +27,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
+    nativesdk-python \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
-- 
2.25.1

