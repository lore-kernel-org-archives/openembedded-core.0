Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.13822.1629891511652123059
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WIQTNnPe;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id h4so5757745wro.7
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cgBjIBHKVrC6zylyfoDJBXAap1kKSNJpJSfJtUzobzg=;
        b=WIQTNnPecpYbR342igjtvoMY/GJbAASA2/80xv3kvc5/gZF585+YGaLNpH3yYXZiH8
         9oY9zasOd6LZkZTnM7zaAwMKEOSIJz2cmjVLAhe0ys7hBLz9Mar73YvHkwko69WbBs1K
         hmT1IGa7IQ08BRW90UoQjshsTnJpcH7ztP1sWe0Bw4TOAlv/8jbVsB5Sr7GJXJ3ASbfG
         gxfpzBG9T60oHaNyJ3WZo5IQU5ukSK8DhGBG+Sz5WEuzphfKRmcq8mn1ZyntEqNXY55k
         XpQzDWU2J/t7LqnR0Lmj9DLpZzZPNpkoSX1qgrQkZPBVY9y0ReLR5gZ4sa27EiAMoABZ
         8VLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cgBjIBHKVrC6zylyfoDJBXAap1kKSNJpJSfJtUzobzg=;
        b=lgmVl0T+NbiQQvAFmku8JJ48qY8KoSA59NI6JP4UBtCA0Yxc4ooNIe+Ta5h6OhMyip
         Sw3/g7lxTdDttD9VBeCtkHENsk5w/7D02tPhk2Q8kDHTtx2jMvoZNp8B74NJFqIW8fqR
         CzyOxIEdW2wNd+AfF6+3SC4dmb+l1+1GSrvfYenO6MhG9hinoXeaQL9k/ILsssfDzE9u
         fIeYvhfOuzUcyMVFNd5xGNWkPITPMRGbrd2q9tXcWZn+GxTMfEr63nBAZ0bRLp/C33Qq
         hhWJpLp5MyO/Cz4asHZFUlJsVvh2+INARV7G9YO5yA3hRTo97m/WTc5pjyw00vCJvkEZ
         QWsA==
X-Gm-Message-State: AOAM531W9BnN6NCSJ1mk6jjxLMdqv9spUT0GwmbZZSBk4B3vG99RbNEZ
	aH1LluTspZjdKTpTpyV09Xuvxotbn9LMeg==
X-Google-Smtp-Source: ABdhPJzfgVJmkhpct1Zzhh4fD66r+GBQeT14SsNQPQjp2ewHgbyqTYyLhluV6HPL6HuH9T3wfCK+5w==
X-Received: by 2002:adf:e28a:: with SMTP id v10mr24173923wri.289.1629891510131;
        Wed, 25 Aug 2021 04:38:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/16] openssh: upgrade 8.6p1 -> 8.7p1
Date: Wed, 25 Aug 2021 13:37:57 +0200
Message-Id: <20210825113804.779395-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../openssh/{openssh_8.6p1.bb => openssh_8.7p1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_8.6p1.bb => openssh_8.7p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.6p1.bb b/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_8.6p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.7p1.bb
index 093214cbfc..c4a08f71d6 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            "
-SRC_URI[sha256sum] = "c3e6e4da1621762c850d03b47eed1e48dff4cc9608ddeb547202a234df8ed7ae"
+SRC_URI[sha256sum] = "7ca34b8bb24ae9e50f33792b7091b3841d7e1b440ff57bc9fabddf01e2ed1e24"
 
 # This CVE is specific to OpenSSH with the pam opie which we don't build/use here
 CVE_CHECK_WHITELIST += "CVE-2007-2768"
-- 
2.31.1

