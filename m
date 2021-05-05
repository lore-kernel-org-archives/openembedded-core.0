Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.9840.1620227968217127129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bd3ZcLtc;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id zg3so3446816ejb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mUZFetM6X0bgYrUqMfTKe2O+a54cD+SC0ORKG3XSudY=;
        b=Bd3ZcLtc99kTBmUZh00Oit0sHHifSKCPCyzsFTWC/xGE6GblMwzsyBE0+r9jRPzeKu
         j+N1U5M/O7m4eDd+XrlBhjb8OlfxymWpUqJwMSTnq8EE/uwHpE+aax43GX29TW7/Q+gN
         ZJ9TXV7sGVCsbGm971bJ+osvrHFq2NP8p69MagFm6f27i25rPKRKx9jXqwWzfkYfJDx8
         84Y6bvfT7waaBhUOs/kAJYCAfLR8pw7h229Rh42yjpcCRQbaOB76OI5i2w/OEhmsHvem
         CdtHFJJKOMxlkAL2Fxa1uAT4ZOoZMb/h1HBKgSDVUMvj6IfKuxLIVjUHECgANDXCjNNi
         cEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mUZFetM6X0bgYrUqMfTKe2O+a54cD+SC0ORKG3XSudY=;
        b=VcYs7N1uxv0n7ZmnUZHrwWh2AvgPvT+1UOkxZ3u8kAuzTyn/your4Qw8B38RO3CzlF
         o5xDz8oi+j8gZHCGV0lXGYeaoFBf7wzEW7fgbrQZSzzbbL/zBNyx7c3l9f3lFouMBnZC
         dt9RlFqq8G00HMhU3DuAZsjuv0QQO0EaFOHwWQvJ1w4TlTsVK9Cpo5izwxtfVco62mN1
         e5JzQhe8P3NtoaCnp/rJ60kLIWAy4Ny8megtY5IAspDBENJnMMBrfpo6QA2/56FvqxMT
         kvbwNt0xJt0gzKlcz72T19Cs2YCUxc4ZBRkBCSVhfmlGc/4owEmCO2Vy6036h5RJWeQ8
         9Wfw==
X-Gm-Message-State: AOAM530cFkDIjRViacsr6lalFRzquvIO7/MH5MLbQxDkSUhfjDsEVlQn
	TgWgroWktcHeNPEBPwkmQv5EBw7+4taGVA==
X-Google-Smtp-Source: ABdhPJztR8jgt/g7q0CONeFq6LdXarG/6kzJzBr8mtBlSXul8nJI7v+UxKv6BLkUbFXnsH28Cd19QA==
X-Received: by 2002:a17:907:2075:: with SMTP id qp21mr28577677ejb.421.1620227966874;
        Wed, 05 May 2021 08:19:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:26 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 39/61] libinput: upgrade 1.16.4 -> 1.17.1
Date: Wed,  5 May 2021 17:18:28 +0200
Message-Id: <20210505151850.660512-39-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../wayland/{libinput_1.16.4.bb => libinput_1.17.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.16.4.bb => libinput_1.17.1.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.16.4.bb b/meta/recipes-graphics/wayland/libinput_1.17.1.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.16.4.bb
rename to meta/recipes-graphics/wayland/libinput_1.17.1.bb
index 17b73e3827..9ffb22876b 100644
--- a/meta/recipes-graphics/wayland/libinput_1.16.4.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.17.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "65923a06d5a8970e4a999c4668797b9b689614b62b1d44432ab1c87b65e39e29"
+SRC_URI[sha256sum] = "e51c50f3ce253961bed452d9f93102cc26128406975ab88ff9ec9e6c3b875137"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.31.1

