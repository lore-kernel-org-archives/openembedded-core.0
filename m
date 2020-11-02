Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.1199.1604335823185093004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ac5cKSxV;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id a71so9661560edf.9
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7gtwEHa+vDIlzuuEd5gawUiYxlaZ0U392zhh8TE3cvs=;
        b=Ac5cKSxV0unLgFz0OhRhIIYGXDUAiPNxez7ZyVL4hiJdmWpCc61WQTm89J7nZ5A8FL
         JVXfcyZFEtWtM2nti3Mb86h/dGRhZo0uoF3jLM+5jOE/NE2lVB8LpRz9VwvzYY3Mf3ad
         28GSchKRC0Ob2GSaMyw+PPLq0x9ri0g8pPxPij7Ed4bra3c6xUXn0OrvN2q3bd0HcWkz
         SXtxaPOBaXsBrSZFIIz//AvFHQnEmcZHZAFOAt5uYCSSYRs7Ro4DDI2lQhi0nrPYId2j
         8/skBfax9bXXX7sYdMOEbW8ZFpWF5ThsU3CeXAC0v8/+eehutW9XL7hVdCIMLZo3nA9O
         lUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7gtwEHa+vDIlzuuEd5gawUiYxlaZ0U392zhh8TE3cvs=;
        b=VZ8f6zPF5HAl5yquxaOZ90NmYC8GE29iuhpmFt9BKjuXouwNKB+/oMNno4g5F1fI5I
         eGnhmyzp1b/OvEs2vlVQQiojaq/4BGudAxNAyKJKgYylBtvhgK1HNDgwFPmWHzkkVCrj
         8QSbvVVm9eLRSxkHIagCcQb5GlBLKC1kuiqyKxHDmd7eV6etHXqtSs8/JKGdQgCtW9eK
         SrqPUmu2q+U/J2hhFEAK/t6hM4wqJckewLVoN1NB54qL++4STInObNCgARwDzLiEXpp+
         HpSUoQQ/bcW6oBS9OMOSkBfozWbwaeK8m0+xBVhPsu2f4UuxkjLRY9PArp1dd1li0ouY
         5FBg==
X-Gm-Message-State: AOAM532N/3NY9rac7GFFoio+2iKTJ3invB3FKnUFXb4ZI8xP1n/GO2av
	ka6aEhbd8Tmp93Qq71eq7h0Ct/oQzGEUjw==
X-Google-Smtp-Source: ABdhPJy465TADmI1d3pgTYjQXR9D0exqmKtuekaDeGqwGlIqwAvSVhXwqxYcMn4QCJnXSarfo7zYvQ==
X-Received: by 2002:aa7:c9cb:: with SMTP id i11mr7331381edt.100.1604335821546;
        Mon, 02 Nov 2020 08:50:21 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:21 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 72/80] diffoscope: upgrade 160 -> 161
Date: Mon,  2 Nov 2020 17:48:59 +0100
Message-Id: <20201102164907.27572-72-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_160.bb => diffoscope_161.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_160.bb => diffoscope_161.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_160.bb b/meta/recipes-support/diffoscope/diffoscope_161.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_160.bb
rename to meta/recipes-support/diffoscope/diffoscope_161.bb
index 2c3da3bbda..0f566a3ec7 100644
--- a/meta/recipes-support/diffoscope/diffoscope_160.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_161.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f164b5e74cc11f6238ad8d62c92d3a819fa4c8b618683fc0533e04f21acae6b2"
+SRC_URI[sha256sum] = "9c27d60a7bf3984b53c8af3fee86eb3d3e2292c4ddb9449c38b6cba068b8e22c"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.29.0

