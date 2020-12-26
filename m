Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.19122.1608974877192580765
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K7GBwud/;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id g20so8348521ejb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zkTusmkC6WWSLV1K79BTZ2C6qDk90Jg1L7c2B1EPl7g=;
        b=K7GBwud/aNIN38KtWb9oUhvWgIORxKcYryCPZtVi+/KOjMPfuLC0ClaK19Li4fP3bl
         +8TZ8+7sVFCdL87crW5FcdStfrC4DTVyJddvMJX1QoBrIE391egAokPoMHUQNEnxzRaE
         FbhpEe7LsZb4joxWZ9WMznixuTtUMFCa1oGgy+HK0THG7yP01F24AqU4RuuMO8CR8oMV
         YZpVKcjpcV/1Ik+58LMUeaCeYfNFxq0joYEjbhCVBA6ziZEyqdYYQu6RLbo5KhKqYdUB
         DpxomomHn+PF00bzhh0HPWByt5ZTJjmg0yvtZZmd7ugYeYVyE9H2F9v3AC1isaY+2fX0
         gJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zkTusmkC6WWSLV1K79BTZ2C6qDk90Jg1L7c2B1EPl7g=;
        b=YFEm6qxf1WJCVVteCScJ9vHjsIG0pjetjEqhw8497eAuHlD3MsD18xmWSHsm3RB8KR
         JABOJ1vM/bRDmET2eQjoposHy7r0Le0q+sTyWdPteGHPXMIRXcQOVefOzpP4jNZPVLHZ
         n/XCEHxqF7OdbqI8GXE8QcudtW9csS6vxMPjwFhqLwl4b4sXti2d85dR3tZ2mUx+ffA0
         vAg3LviuwYAWAMoNwxJfmRk94k8v4KvvCYvKbrvFFkyrMZaLQecOaR2vCe+/GMwPw66o
         DYPQjxBYp0AcXzNEUmkkQoFS7rk1xf51gojoKM4aL5QgDXZ450okqh2DAtm3eQ7o6pMv
         O7Pw==
X-Gm-Message-State: AOAM531z6p/WUzWmsp3+UNd/gW8+EHGCHPE5tyk+CgYuwc0hD1DrJKEi
	a3BRO4f/J5fqWcB+mZwvroi8M9Sk828=
X-Google-Smtp-Source: ABdhPJwxvdwEjf72us3V1uhoAzO7OaAkELvABMdGBq3TQQ9uxpb+SvtRVChhn7PC9rDlMiEWEKNDZA==
X-Received: by 2002:a17:906:7a18:: with SMTP id d24mr34787721ejo.324.1608974875876;
        Sat, 26 Dec 2020 01:27:55 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:55 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/48] libva: upgrade 2.9.0 -> 2.10.0
Date: Sat, 26 Dec 2020 10:27:01 +0100
Message-Id: <20201226092732.52323-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libva/{libva-initial_2.9.0.bb => libva-initial_2.10.0.bb}   | 0
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 meta/recipes-graphics/libva/{libva_2.9.0.bb => libva_2.10.0.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.9.0.bb => libva-initial_2.10.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva_2.9.0.bb => libva_2.10.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.9.0.bb b/meta/recipes-graphics/libva/libva-initial_2.10.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.9.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.10.0.bb
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 7b6f11674d..d251afa125 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "e344c1392dde92696c9ffd9cb3c7277d0a3b912236eb4e0fdedf7f375434584b"
+SRC_URI[sha256sum] = "fa81e35b50d9818fce5ec9eeeeff08a24a8864ceeb9a5c8e7ae4446eacfc0236"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.9.0.bb b/meta/recipes-graphics/libva/libva_2.10.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.9.0.bb
rename to meta/recipes-graphics/libva/libva_2.10.0.bb
-- 
2.29.2

