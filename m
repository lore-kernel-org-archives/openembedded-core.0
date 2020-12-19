Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.3535.1608344627460334887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 18:23:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o3QI2eD4;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id n7so2476982pgg.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 18:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=81vsqqR+0WECSn0Ityy/IglF7seKjAIwkjMqcLpSVEE=;
        b=o3QI2eD4ZOTnz9rCkmAQG9y6NeVpmyrmeVBzOmviesVAhm52117P+MNNF+UgD7vu09
         WR87Afy7X7Bllzxoe/nsr2LUTK8bcOfOPZuGmRz5M8VPtb+8quXSyR4t983w4+dGfokO
         8hJw+IrAdRuBnNaxVtO+zQHNysbPWK6Ud3EjcGmpmiv6So6BrbvEPdambVFzOjk9TtCz
         6S+1p/U+Zo1EqbKIgUrLD52x5xw9eiW64eN4kwSGl5ZvwzrpWD5wxDsNuxK3R0N1hOTA
         kYRpDRl15uP9rKqMa/uUbJR+IHZBLj03VuVfH2HsSZsxXS3+w3F/KDEeqpEaoR/4TTPR
         UANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=81vsqqR+0WECSn0Ityy/IglF7seKjAIwkjMqcLpSVEE=;
        b=KhiHuXX9j0RNmS/kjy6o8Ucp6P5p1giYnyPKm6cWnaDObNgTwEoYsJjY14Figq/T3p
         bFLo1y5cWwDXni4UuNj03y9GzuBGspsMEmQPYjcN19jTPdgL6ptYt2RrKs4UVRdHJMOd
         jxjgqInjF3SVWSBdx5lO54CXkw40pj9ertmssa3nKn0Rwa3ppWQFDlQ+/LzIUHUBxGF+
         TPeqh+GfQt/MAaj5biJMI9A0le84G7jJ3kiaHLRA1ZQR6nJXGqeTDRz2Bf4PSHVFabua
         MQbU7xZrM7nCDWH4bNF6G/JCesYadSAKHHu+TwNI7y6XMb4G1bj7uG7MQHwPamL3P0ru
         14pw==
X-Gm-Message-State: AOAM533TG8Sh1XEURl8abWGx3JefT8sQVClDj3ic3F7HYsCvdylky8Wv
	lqDufi3JfbZsoIaEXz6HK3wys+5BEeAbAA==
X-Google-Smtp-Source: ABdhPJwaDhBqTs+2VIXj9ifn5yHLqgHCJWbQcEs1zVGoa2wFaIxixgeeeL6AdLJ6Pgq4c924Lnk61w==
X-Received: by 2002:a62:6456:0:b029:1a1:e39e:cb46 with SMTP id y83-20020a6264560000b02901a1e39ecb46mr6946857pfb.0.1608344626652;
        Fri, 18 Dec 2020 18:23:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9ac9])
        by smtp.gmail.com with ESMTPSA id s7sm9936514pfh.207.2020.12.18.18.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 18:23:46 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Sinan Kaya <okaya@kernel.org>
Subject: [PATCH 1/3] rcS: Define identifier for init system used
Date: Fri, 18 Dec 2020 18:23:41 -0800
Message-Id: <20201219022343.3362531-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will help in defining init system specific portions of initscripts
which are shared

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Sinan Kaya <okaya@kernel.org>
---
 meta/recipes-core/busybox/files/rcS.default     | 3 ++-
 meta/recipes-core/sysvinit/sysvinit/rcS-default | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/files/rcS.default b/meta/recipes-core/busybox/files/rcS.default
index 262cad7d2a..66513daf2d 100644
--- a/meta/recipes-core/busybox/files/rcS.default
+++ b/meta/recipes-core/busybox/files/rcS.default
@@ -1 +1,2 @@
-# SULOGIN = "yes"
+# Indicate init system type
+INIT_SYSTEM=busybox
diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS-default b/meta/recipes-core/sysvinit/sysvinit/rcS-default
index 709cdf6ec5..e608a77c75 100644
--- a/meta/recipes-core/sysvinit/sysvinit/rcS-default
+++ b/meta/recipes-core/sysvinit/sysvinit/rcS-default
@@ -27,3 +27,6 @@ VOLATILE_ENABLE_CACHE=yes
 # Setting ROOTFS_READ_ONLY to yes and rebooting will give you a read-only rootfs.
 # Normally you should not change this value.
 ROOTFS_READ_ONLY=no
+# rcS is also used when using busybox init and shares initscripts, some initscripts
+# need to have specific behavior depending on init system
+INIT_SYSTEM=sysvinit
-- 
2.29.2

