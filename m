Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.7180.1588683745023279983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YuHPwYGM;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id g12so2230424wmh.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A+GU9CHHLS5VY26mdBdj4DGD/zK0rlEcVMmMfCWJZHE=;
        b=YuHPwYGMf9xJq3Eh9yx+Zmzxb/8MnK4ea/g5zKIfE3/xIqlXcBGjXnLLdEcAm5wu/4
         UpK0YsIHsBt7OxIMnn0jPX7yBrgXNs2sJ42HZkEfZQA1Tsx08TTzZbfHXM04bzt+lfhh
         RSqFx3NQUmB9O0gvXYeU3SNeew7am8cKkKxQb0AKAasGAFqemkKNK1N2+vhl8WU4FlBN
         Dkc7VcfNyNdfto+2zmn3qsixPN4ARxrZsihKhNQ5sS0AbxG8ZqIURTQrS3MuFdk6qUpM
         vDSlq0PUqliRdhMogh3zTvR0/8wPgNbDDY9wNMrDwNBv4zMZSRnlEjUSC4y3oGwsD4tI
         eYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A+GU9CHHLS5VY26mdBdj4DGD/zK0rlEcVMmMfCWJZHE=;
        b=S7Kcjf7LqIAeHVn+yo7XD89gEyefiN/aKwn896lja/zqGmlH8Vm2c4m9bQxv1ROWiC
         Zbpt60oHP5h9Pq61tjjCKyKusvrjmVBhggk0aQD1SzWl/NIX+QBeCxPo5dTJTqudU7Nk
         U/6jx1BaIpixzICFMXO1Uljf8XenNxN/7F82n2VIb7LwZLF3nIwakAABpS7rtsWz9hJ/
         2uq7O8cNfKrLQSN1AL2yblcS9R+kszjPxskvtuHpQ1O1OiI4pbN6QSHmHK8gku/Y+FZE
         g58dGaXeNDkccCXF5Abs2qnqex1o41XNtNP+G+1w3XPsFmmduUMlsrzD9k/iD9YMU2LW
         PxWQ==
X-Gm-Message-State: AGi0Puao68n36/xN+VbQ1rOZLAd9vtO4gPY7IXnpKtKg1CSHS/He05rB
	859OOX7R0IbGiXuzdwOFbGpijnmr
X-Google-Smtp-Source: APiQypIqd4Iy/rd9IGfYgnHSAuYi3jlEKDpy8CBLGmZtBgB45M+LHqSg0gg08SbDqMgmXHgJXo4pfA==
X-Received: by 2002:a1c:48c:: with SMTP id 134mr3159079wme.47.1588683743446;
        Tue, 05 May 2020 06:02:23 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:23 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/24] re2c: correct upstream location
Date: Tue,  5 May 2020 15:01:33 +0200
Message-Id: <20200505130133.24930-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/re2c/re2c_1.0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/re2c/re2c_1.0.1.bb b/meta/recipes-support/re2c/re2c_1.0.1.bb
index 4ed8d257ac..35200ecde8 100644
--- a/meta/recipes-support/re2c/re2c_1.0.1.bb
+++ b/meta/recipes-support/re2c/re2c_1.0.1.bb
@@ -5,9 +5,10 @@ SECTION = "devel"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://README;beginline=146;md5=881056c9add17f8019ccd8c382ba963a"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "e2c6cf52fc6a21595f21bc82db5324f8"
 SRC_URI[sha256sum] = "605058d18a00e01bfc32aebf83af35ed5b13180b4e9f279c90843afab2c66c7c"
+UPSTREAM_CHECK_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native"
 
-- 
2.26.1

