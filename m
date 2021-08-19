Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.65451.1629350312685315777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 22:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mq8MuwAo;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id 7so4406631pfl.10
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 22:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5bUxpHhbQUU0uya8x433lUZa1Jqt/YXltudb/tbOGyI=;
        b=Mq8MuwAo1dD6H6K1YZKYhaMn0vYjXCkm3sTSW2uVX7+LPLpdNv5jEUgFR2TKg91i4I
         mreSbghQApW+poOmIQ0PhP5G1kOkgZvYCSFYSEgwmCKVJYsriI0jauLqzprBzzf8mPOI
         kWsR29RywqZImMOzmeyN8d75Y/la40Oh3To1t9wYW/C5YCKgA0lpcuTzarjg30+Z14Pj
         IDmpPK3JP0OrTA+kf0Bz81LG5VKbhbi4n8xRH49QaA4ihlt6gd5nAKCYi20j9mZBeYnG
         NtyyGyGMJHrnF3NCLMLA7egW6uZ+xm4J+pGHCXdLFzC2S+jsjE1etW1UCF5hUP6LwQhE
         yMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5bUxpHhbQUU0uya8x433lUZa1Jqt/YXltudb/tbOGyI=;
        b=i7h7AgzK+UyoPsCQoszoVHrr5kjQ4/jkZ0A+lqZFwDtILaWt47oeDkONCGWMQa3xEV
         cXWAnopMddYdV9OR7JdJKunagNWpWiScYR16DbWZGIq3Hb9Z1X4webbyXKfGCMx8q44+
         5V3idjo1i4ewduUOm/ui5JXFgAtheaEi+MTqEVhMgLfNBN17LVhKRyhXMzn6BwAP4Zrb
         bRpeC/ipm09QLwTtvu/3gLJi9WXpZn/l/ZFl44kslfaXNWUuc5y+wtTF984LlTGtDfUc
         o3dz70nIJ/AcEg4y2Bc9L7Ab4nm9K8vui720bybivVtBGJrojN4o2+e1kzIJtk1QO26B
         CQLA==
X-Gm-Message-State: AOAM5333eo4okT23s9RAz15lH+to2W3awiyjdx+Z2uKxJhFVAG/ANtAh
	Cg8yHjnP/St+8ujcw1100b05XFh/8Eg=
X-Google-Smtp-Source: ABdhPJzhm9LwLz4ZsNYEYPuiDytrw5DqBc8VzkucGtNa8kh+B1EhLK0xj/WFVwbT3B7WbN6zDXXjHQ==
X-Received: by 2002:a62:d414:0:b0:3e0:fc4c:6e68 with SMTP id a20-20020a62d414000000b003e0fc4c6e68mr13082366pfh.77.1629350311942;
        Wed, 18 Aug 2021 22:18:31 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:1830:8209:a97b:7f2d:5bd9])
        by smtp.gmail.com with ESMTPSA id b6sm1700969pgs.94.2021.08.18.22.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 22:18:31 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 1/2] python3-importlib-metadata: upgrade 4.6.3 -> 4.6.4
Date: Wed, 18 Aug 2021 22:18:24 -0700
Message-Id: <20210819051825.3577665-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4.6.4
  Issue 334: Correct SimplePath protocol to match pathlib protocol
  for __truediv__.

References:
https://github.com/python/importlib_metadata/issues/334

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...ib-metadata_4.6.3.bb => python3-importlib-metadata_4.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.6.3.bb => python3-importlib-metadata_4.6.4.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.6.3.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.6.4.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.6.3.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.6.4.bb
index 198138af7b..e5aad991e4 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.6.3.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.6.4.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "0645585859e9a6689c523927a5032f2ba5919f1f7d0e84bd4533312320de1ff9"
+SRC_URI[sha256sum] = "7b30a78db2922d78a6f47fb30683156a14f3c6aa5cc23f77cc8967e9ab2d002f"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.30.2

