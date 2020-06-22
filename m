Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.3267.1592856156871761220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 13:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u97t6yVq;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id e8so3474477pgc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 13:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YEfrG6houq3Zq3fcKb2eWx0Xvwyv8EuGUPgV9cBXdZw=;
        b=u97t6yVqkXK8q8gTVTDTxBqeRTWsRK3i5vEDQ6kAN8ItmHoaButBBkHWticY+HBpAM
         wS3jpfjoNtNCIANLIUmlLtZsdIVtAEgWbJcblNKkNFAkJfXITfd4OtPsLi+Hcf9Ls8UN
         JOAZL0xDkfv0/6lnatZRFDcoqboBekC+iBGQrbETL5Pj4LcmXQ+wvs7B56GGlB5hzsZX
         A9xCHi+J7YRIBmLnuxbRHZaEod97OE3RxgzvIAj5MlTsP/mq7TFtl26C3W20IKhbfL7S
         CIyssqEF0CTcDjYMwYCfxYXV3hwZKNDBIvbpJGC2SboRwyuFoo4X+dBxoTBON2UT9b8O
         rmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YEfrG6houq3Zq3fcKb2eWx0Xvwyv8EuGUPgV9cBXdZw=;
        b=Yd3Zrxh7b2rait3Zqv9PyahWe5tGdXShCvoVHJ24aikci32rzQzkYALHXJ1SPSX8gs
         kfTyW8C3N/FHPt8lwpvxTMYgnQr8mUJZKND5gJO0TncHpIpwvmbRpX6FEvDJoyzfqoeS
         huVpZhX7Vx/ExScJtyBMv6KcLSckxWHv8xKIhjbFFgPpEEjSZg2y9UKueIBuZ5Hf+teB
         wINsDaJzX3IwwKVzwxAFz0rMCFwQInJQ2h0xUP0Jd75EkK44ew+CZbYVGtjfeFipsA89
         x/Mlrm3q228j3h+6VKnkqfum85h7MQFYUwVutyEIPN3SYuM3r8hk0NA+/4/2Y0/K/EPr
         cSnQ==
X-Gm-Message-State: AOAM5323/RDkQPXwkFEwama8wePhmI+7dysOruISudNPK5VzNcOnqc+Y
	XLWryomcKIS16P76WS3djo5NcCHFMME=
X-Google-Smtp-Source: ABdhPJwG1nYk6spL8aiY8hP35qEbLtCB5DckF1qqjbV/b2pm44Kw3L8nwh/IGxvJH5Lca1yk95cyAA==
X-Received: by 2002:aa7:85c6:: with SMTP id z6mr22525175pfn.8.1592856156123;
        Mon, 22 Jun 2020 13:02:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::dedc])
        by smtp.gmail.com with ESMTPSA id 71sm15007937pfb.20.2020.06.22.13.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 13:02:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio.salvador@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 4/4] glide: Avoid use of 'go mod' support
Date: Mon, 22 Jun 2020 13:02:30 -0700
Message-Id: <20200622200230.54899-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622200230.54899-1-raj.khem@gmail.com>
References: <20200622200230.54899-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Otavio Salvador <otavio.salvador@gmail.com>

Glide utility must not use 'go mod' support, so we explicitly disable
it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/glide/glide_0.13.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/glide/glide_0.13.3.bb b/meta/recipes-devtools/glide/glide_0.13.3.bb
index ebad0ec60a..31295edf90 100644
--- a/meta/recipes-devtools/glide/glide_0.13.3.bb
+++ b/meta/recipes-devtools/glide/glide_0.13.3.bb
@@ -9,6 +9,10 @@ SRCREV = "8ed5b9292379d86c39592a7e6a58eb9c903877cf"
 
 inherit go
 
+# New Go versions has Go modules support enabled by default and cause the Glide
+# tool build to fail.
+export GO111MODULE = "off"
+
 RDEPENDS_${PN}-dev += "bash"
 RDEPENDS_${PN}-ptest += "bash"
 
-- 
2.27.0

