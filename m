Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.1330.1612931530652058683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 20:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L0MYAcmw;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id e9so523085plh.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 20:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QGOCyhbUPKReNqQbC2+Fj4vKrjx4SG86vqQdNPbKL3U=;
        b=L0MYAcmw8fCPF2W7lG6zMpvyLwl4pgqFRoZhzVQywJO12PRryQfF0X6P/YPejatBFv
         WNEkbR9JmGRe3c6DJoOw68ME6oau7XMjW6ieMSdYlUZpt24FQhCamep6aqwvuncObm64
         9aT+FE8EF5s11njTTrQ3rOQ4ugkN9qD1hlRMYlBC2GLv8GwRJgSThpwQD/9P04sCcZ7M
         J1XRwATqUssKJ2EaLJrI+0K2KlMGiWQ4MGxIw8XWwDBRkZ4hOrCebVbyLNPlzlyQwBdt
         kczJoMqYKWoqkHSJY0DJ+rKNr5lvfvnRLLfMmbe1/hwxg0ymbzYyOSvfsAlZCSu1znVU
         f8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QGOCyhbUPKReNqQbC2+Fj4vKrjx4SG86vqQdNPbKL3U=;
        b=cf/7RCgjE4obm1FGNRIYUQeTBqz2P2vG9HyB4CRexPfPv6WRJ9L0WHDWYtPD9vJZqA
         VDSJQDtCxHiUMvkmry8th3P0JRaT9WGVq+PBl0MEc4+zYpLD5OVPl3B3cGt1uowsig3N
         Lz2IxVw5caTuzskaxu2Yd+py8lXR2eRn/MxilAtpqC8oXJva9atP99XV8idnFbqoNU4i
         SUrzJSRXPfD7ccBw6mzsIbHxht8vuPswLR2YoCLv3c9BI1rCqyYPNUAykGSbEJM3rZoP
         7L6UzjE7dY8aQLItDr7ml4sytIfhQdy7sRFL5x02p4EvbCA8LsMTQAcm2pMMH1xjdUCh
         d3Jw==
X-Gm-Message-State: AOAM532sWPWtmkA2L7y6xIIkYo3uLR5loQALHkym39Te2pbhwl+VoRt7
	53nMH1TvneGfCdkpl4Cl/jMMotUlojU=
X-Google-Smtp-Source: ABdhPJwaOyLzi0OMICVmD5lw9Wlr0Phh7AD4Hd7yUt+8dIO9LQr//1qKLZI6oua6o1zIjOrZtmqCkQ==
X-Received: by 2002:a17:90b:3907:: with SMTP id ob7mr1336296pjb.18.1612931529849;
        Tue, 09 Feb 2021 20:32:09 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id d1sm502504pgl.17.2021.02.09.20.32.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 20:32:09 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] connman: update to 1.39
Date: Wed, 10 Feb 2021 04:32:07 +0000
Message-Id: <20210210043207.3141102-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[Yocto #14231]

Bug fix only and includes two security fixes:

CVE-2021-26676
CVE-2021-26676

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../connman/{connman_1.38.bb => connman_1.39.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.38.bb => connman_1.39.bb} (78%)

diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/recipes-connectivity/connman/connman_1.39.bb
similarity index 78%
rename from meta/recipes-connectivity/connman/connman_1.38.bb
rename to meta/recipes-connectivity/connman/connman_1.39.bb
index 027c41e9afa..df42e9ffb8a 100644
--- a/meta/recipes-connectivity/connman/connman_1.38.bb
+++ b/meta/recipes-connectivity/connman/connman_1.39.bb
@@ -9,8 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
-SRC_URI[md5sum] = "1ed8745354c7254bdfd4def54833ee94"
-SRC_URI[sha256sum] = "cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b"
+SRC_URI[sha256sum] = "9f62a7169b7491c670a1ff2e335b0d966308fb2f62e285c781105eb90f181af3"
 
 RRECOMMENDS_${PN} = "connman-conf"
 RCONFLICTS_${PN} = "networkmanager"
-- 
2.25.1

