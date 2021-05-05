Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.9837.1620227957643623054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ek2Hn4Oj;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id n2so3453096ejy.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wlSTBmqZ6JGoSII3HKScCOl4myWPFgYtBm/x8LyKYEk=;
        b=ek2Hn4Ojl7gkISRZcM42cDMWYqJnft25s0OZfAc6V4D26zX/8eOsheABCtWsDFg2XO
         6CFUsrQgrKZwgQXK7MmI1ywkM2YeVSen1dalWi6eYbr9HsKWv6fLf6+RslP7aam53xHX
         x4+ASMCn3sCY9BlyLYEM1EnKAj53EeYBBC9RXQ7F7hqnCiDcbG1diVJjUoUmq28ivlGk
         MLU9bQ4WhxdoUAxy1qi/m6zC0cbI1J9I65B8n35WlSau+p0xusSfhODw02zbF1CrfnDr
         VQlYajBy2hR6q8f+ZpywG6X05D9qwui8pxjj5knxNGZAFsmqNJiWwRBoa6m9Qr4Cpuim
         VeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wlSTBmqZ6JGoSII3HKScCOl4myWPFgYtBm/x8LyKYEk=;
        b=kQNZ2Cu+CDLlTb7/0DnD44B4IkhNCi8OZQoBSpJaiJMORdfHcNmeCF60TCN3kZSjoF
         LVZ2/M9TujZ7vpP5ViLSQVJWGXOf+YxXHn/K3FxK0rVtiqi7NJ4uVwujw1iyQwlxJClO
         i8I4uJmfx/bZCIGfiw7kK7QrLKJTnB7Syei04H6MSZ9pCu77ig3wGfo+QYOXjygrin0L
         aPrJWdWHPwxd7IHQmOWzbLacp/Prc9HcgnCuPszJrBC0/WtBhSDLy9k3pmQyz5qjcmMd
         N4yfxllg7faQsVM2RgBkidh2LCWpuPApBCD/hX02EEelxit0BIr7VNFn6m02/+ojxuhg
         nx/Q==
X-Gm-Message-State: AOAM531GvQmTstRyFeXYAUQMOcVk1qANPY46/li35cMgnJD6bTUeB9dm
	YMIrFMOuKpgPGY+fFEefGz8v/8jf+2PH+A==
X-Google-Smtp-Source: ABdhPJz8r+enGFPC8f42HCDpGnVWZ1mt9eeso2VILRAojhbv8KxcIO0z2lhK3/nIsGmekW7RWvo7Fw==
X-Received: by 2002:a17:906:7189:: with SMTP id h9mr28121050ejk.71.1620227956277;
        Wed, 05 May 2021 08:19:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/61] acl: upgrade 2.2.53 -> 2.3.1
Date: Wed,  5 May 2021 17:18:14 +0200
Message-Id: <20210505151850.660512-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/attr/{acl_2.2.53.bb => acl_2.3.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/attr/{acl_2.2.53.bb => acl_2.3.1.bb} (94%)

diff --git a/meta/recipes-support/attr/acl_2.2.53.bb b/meta/recipes-support/attr/acl_2.3.1.bb
similarity index 94%
rename from meta/recipes-support/attr/acl_2.2.53.bb
rename to meta/recipes-support/attr/acl_2.3.1.bb
index 7cee45948d..7f6cbf5c43 100644
--- a/meta/recipes-support/attr/acl_2.2.53.bb
+++ b/meta/recipes-support/attr/acl_2.3.1.bb
@@ -21,8 +21,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
            file://0001-test-patch-out-failing-bits.patch \
            "
 
-SRC_URI[md5sum] = "007aabf1dbb550bcddde52a244cd1070"
-SRC_URI[sha256sum] = "06be9865c6f418d851ff4494e12406568353b891ffe1f596b34693c387af26c7"
+SRC_URI[sha256sum] = "760c61c68901b37fdd5eefeeaf4c0c7a26bdfdd8ac747a1edff1ce0e243c11af"
 
 inherit autotools gettext ptest
 
-- 
2.31.1

