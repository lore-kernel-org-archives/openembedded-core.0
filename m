Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.25219.1591602513498082842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SsdihbLj;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id k8so12576660edq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/ag7mf0pjmJGXn61FXR3bI/3IIpTTc95ArgdYXSw+Nk=;
        b=SsdihbLjZhmvtjdZdGsva91ozQaLG0wtX22fXwsplfHnxprVL0450qTKdDIcicePSX
         U6VgSjnpNoTPbl/DQ0G0Ga1KmdMHNft7ARsUcUB5Kk+qLkcUYw86puwr4FYFn8cHpFMr
         k9/Hox5prquMvHmSkpQLtlLq09VinKmGcfj3/8sKKmWOFYbTV/Y845hBNjOQCNW7GlB4
         b0R8qWUf0xkJ5ZGgnZeE8/3UgkW+2wxk3MBXnCZPl061iqs3xqZR8sT0zmj5pCS0RDny
         zM97vnOsND9RuoIIGllCWfpv8s64Xo4RrQGV7FFFOhkgRgpbckoigpKUOIZe+kVBaSTK
         qNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ag7mf0pjmJGXn61FXR3bI/3IIpTTc95ArgdYXSw+Nk=;
        b=F46mPeLmiEjTHCa7GTgyZI7saS4vq4tOUbY+jBWI9iL8NWBnxfF0A551pMMZmcwhx8
         EjIKvqGe0ZKEF1Q56YYZxxn1KnJcVtBvqFMQJzj0etUxTDr8zAzyBLpyLAN41w99W4Gj
         YlcblnaNyyAQB3hxPkwPSlVqAsU3rnGrIWPJG0lVC/wpXpoDSDiUP1a4s31oqtVAoT5C
         I8uixuuzMOXgZMk06S5BTQr4a3yrPHRxd7XRshsI6G9Rk6zBUwu51cjVh6q+gdlOEDCv
         DUro9nscoWBnZJudMxQ9R044VAmVv1pawl6Pk8tt2hOPKnvPhPQImok9hFy5gmP9x1t7
         4T1Q==
X-Gm-Message-State: AOAM531WEuJOqB98c6VLEgiuU1b/vzC3lx7YkkNyD2/o+v8VoR+O2yHp
	J1ClsoxON3bgZYnaFlQjEBjm3D9KEg4=
X-Google-Smtp-Source: ABdhPJzVT38J0Wb0fjP1UL5pbpiOzTIvs66aqFhfpDe/i4YNUa0lb5VU+E8rkanHv4blpAqrZIrUUA==
X-Received: by 2002:aa7:d6c1:: with SMTP id x1mr16424877edr.154.1591602511852;
        Mon, 08 Jun 2020 00:48:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/42] lttng-tools: upgrade 2.12.0 -> 2.12.1
Date: Mon,  8 Jun 2020 09:46:38 +0200
Message-Id: <20200608074659.7051-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../lttng/{lttng-tools_2.12.0.bb => lttng-tools_2.12.1.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.12.0.bb => lttng-tools_2.12.1.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.1.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.12.0.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.12.1.bb
index 148a7928d2..094e33db71 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.1.bb
@@ -36,8 +36,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-lib.patch \
            "
 
-SRC_URI[md5sum] = "4592201ea981f0722438345fb1f009d2"
-SRC_URI[sha256sum] = "405661d27617dc79a42712174a051a45c7ca12d167576c0d93f2de708ed29445"
+SRC_URI[sha256sum] = "0de7afc1f40a5acbede933cdfd6cf47b32ff84d02e170a1321f7fc86141585b8"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.26.2

