Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.9832.1620227975758347862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KIhMWkNa;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id s6so2479159edu.10
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ynXqXJbckAJ25ImLa8cnKKq5Cb/j3dbvEH63Mps6k5M=;
        b=KIhMWkNagbjWjqp4vfZF/63X8bzl6/ARb7bPhQxEzX/T+JWGACmocfHy4u2n2U3BT1
         qw93tDHVd6GatVjjeF7jA+wNHZRQ0hl19mvNRjQ6h37q2vaEOgrLqZhoENrb4ii5gP8p
         CKpPj4AHuYWDq1IYrcgGWfb/knUUJkMpK2Dp2unUdnyjudG1K0MKL6GRibIyzHOQon//
         wTnAv41ZkarYHnRr/EyV0abSJPiJHltb27O4akubQEGxDE2SVIlXp0p3uoPsqkX0HmSZ
         4ydG0QkAKnJW+O+5wVL8WGY0dJTpHVx4UJi6BQGuvVeGEJuTZeOqmJb/iEaqqEAsIuxL
         VGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ynXqXJbckAJ25ImLa8cnKKq5Cb/j3dbvEH63Mps6k5M=;
        b=Go1HrhSEJrHdZTpvfEcVhrblmRj1FcMQPxoyQbMDoNMmi1MrKAnJzPBXnRdwX6dcRN
         HGxxbR6Qbm3EElmuWa0mmmNQWtZm+PRLhsuDoOl41A0AhHkmApeg4gw9FNW2Dt5T6+yZ
         2FGs+1nnPmx0dGY36v1I/xFukd2B/NQQdGYP+73tMKEp7DamGgwZh39n7GkactWaVJ1k
         apq5ntIH3SADx/CVSvQn99+DVfGtFGU5OdEe7skdcoLctYeAqcL32Ukjan0pGTP9JvKr
         VcU8alEV4RxI+xaYwRulXVdRLhkVwYgbOyfxTEyXNNr7+nLzPP+0NkoOiZvkXO9vBeuK
         MVnA==
X-Gm-Message-State: AOAM532txOEORVg3XKhw4C/nsG8PCdMpI3tGcp4bBI8VrJT/2Jm2MLnv
	prbPIhhJ07QVl1wsIPSFwG0Qt650u/EL7A==
X-Google-Smtp-Source: ABdhPJwzLiXDgjNp0HqrEqWaVGgERWERsTBVpA/H0GbiyV76+osqUbRtGUJRaZfKoyc+c5MFjWvJfg==
X-Received: by 2002:a05:6402:4305:: with SMTP id m5mr18002140edc.143.1620227974382;
        Wed, 05 May 2021 08:19:34 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 49/61] python3-setuptools-scm: upgrade 5.0.1 -> 6.0.1
Date: Wed,  5 May 2021 17:18:38 +0200
Message-Id: <20210505151850.660512-49-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-setuptools-scm_5.0.1.bb => python3-setuptools-scm_6.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_5.0.1.bb => python3-setuptools-scm_6.0.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb b/meta/recipes-devtools/python/python3-setuptools-scm_6.0.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_6.0.1.bb
index ead80da7b4..24409eddc5 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_6.0.1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "setuptools_scm handles managing your Python package versions in S
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "c85b6b46d0edd40d2301038cdea96bb6adc14d62ef943e75afb08b3e7bcf142a"
+SRC_URI[sha256sum] = "d1925a69cb07e9b29416a275b9fadb009a23c148ace905b2fb220649a6c18e92"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi setuptools3
-- 
2.31.1

