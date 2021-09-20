Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.11071.1632141985273859993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MGQPvqKf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id t18so29389431wrb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=J1Wy1fs3FAPKyclnx2ul5iCgvarsPjyh3nalBmS2cOk=;
        b=MGQPvqKfCr3yKsPHzPiJI1eUuNPXdwrU8xrJ4d9YTRtMhahcWpnaodwkuVOQTGyx+H
         qRqPql8ePlAISUlclpJzh0Qao9BOIEIawjkEEplwkiajbBacWMp8neLRooh8k3nXfvBt
         0RNZ11R7L+wP1ezfurrO9rfQrPLRMJxu3pc04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J1Wy1fs3FAPKyclnx2ul5iCgvarsPjyh3nalBmS2cOk=;
        b=zidrYsbgLIimriv/Z6ahnFMT3huCI3uM0iuXpGXk5yHGabRNAhYYF2r44C5PiedYOR
         2n8E+66tatWEqJQgRyrK83SHZJMNxeELuskZAnMf1Cq9d7RBQq45xL0xPD379SS8yqQc
         gDK7ohBHv7o4XOPzclIA0TxoiGzgEvM2w5jIk00qrc4lpUuxVB9ll0LztvWBOoKYgPcv
         16WqCHNdfpkmekLik0KreO3brD+hFpwi88OYcNPqTte/olhSuAiWAgwcueZUob5+bRVe
         4JAsopOwYEhMPe9LoEaewB9t4O6e3kJPCWcSg8lsOHxYQsUxxC8rLOp/drIOOhaQY8Y2
         f/yQ==
X-Gm-Message-State: AOAM532XDT6B21ASiWtCioZ6j9n6RbAxzLMKVC5PVLNgJWY4peaID/9t
	OA9pSLYDSm1HImq9+Cvcv+eE3Oxrj5rg5AH2
X-Google-Smtp-Source: ABdhPJzbaFJ2Qszt0XIjGjggJbeThp7gMaf0ntjh/DfUAN81LlKd1NBG2BFcktswtAlDWY5VgVl3sg==
X-Received: by 2002:a05:600c:17d1:: with SMTP id y17mr29390839wmo.135.1632141983648;
        Mon, 20 Sep 2021 05:46:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id j21sm15773514wrd.48.2021.09.20.05.46.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:46:23 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/14] libgcrypt: Upgrade 1.9.3 -> 1.9.4
Date: Mon, 20 Sep 2021 13:46:09 +0100
Message-Id: <20210920124621.1576702-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Includes a fix for CVE-2021-40528.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libgcrypt/{libgcrypt_1.9.3.bb => libgcrypt_1.9.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.9.3.bb => libgcrypt_1.9.4.bb} (96%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb
similarity index 96%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb
index dee936dbc4c..4bc1dd85126 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb
@@ -27,7 +27,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
            file://0001-Makefile.am-add-a-missing-space.patch \
            "
-SRC_URI[sha256sum] = "97ebe4f94e2f7e35b752194ce15a0f3c66324e0ff6af26659bbfb5ff2ec328fd"
+SRC_URI[sha256sum] = "ea849c83a72454e3ed4267697e8ca03390aee972ab421e7df69dfe42b65caaf7"
 
 # Below whitelisted CVEs are disputed and not affecting crypto libraries for any distro.
 CVE_CHECK_WHITELIST += "CVE-2018-12433 CVE-2018-12438"
-- 
2.32.0

