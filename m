Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.33808.1607949310840852512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 04:35:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gJFviNkL;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id k10so13484360wmi.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 04:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6NLF2Rr4SSBTb6hj686HROvh3sdWF2Tqkm8Xq8eCgoA=;
        b=gJFviNkLpi4VV9vRMzDPbtBU8KLmWXZlzLBC4pKg+fTrUaUjfBm22PefQTluca7IBI
         Iu3BjdBXLY9u+Iud1clcItCAqwKZlQ80AV2eEEPIBlkbqe3MdRGa3YXkefWTwKSqYk5k
         VBgBfOqJOtaWJKWL8SqIOoCaz7OiAXt/GnyAfbBm0NAuvPR97RA38nRZiv2ySQCWD0P9
         YamLHuzsJQTMUhWVcP7BoUnWzzPFU9/EkG5Sc+2YzabmCJmzMOf7tCOyRp+b0x5yk+CB
         Ayv4tHZ8bS770KI5BZcukHAz3hpP5PDx/dLC2hvX/phBoA7XVt9KwvAOTYQHp59Ulb1V
         HV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6NLF2Rr4SSBTb6hj686HROvh3sdWF2Tqkm8Xq8eCgoA=;
        b=gru6Bw6PkgNEEzuNFMjLvAUZSVtBqaYE8lQc1+XA0b93BBClr2dF2dA1Yqb0CHvbQl
         xkGy9/B6JXkbklFA5ExpdcOdrZ+XGnAy6mvgUDBA6a6pNQBMrzzPg6H3rDWcoy8Nb2jG
         7WUrufYSaQpJLs9A28OhD3Z8WH2aTA8I9E3DDB64/JRC/6CkY0M0uzuH6eo7BXfQ5oKb
         awAp9dvvLI7x/A0yDeCeEsaIJb0bd4xB1xeh0znaiHwHkXR1O57n3qKQgYK0Pf+dFm0J
         CaYKDgrWRk2u1vJ49j+1/QxfEXrZd1DNTpLS9/ioRDuP9omrgveWGlI7PZzBrToWLdQ1
         Hwhg==
X-Gm-Message-State: AOAM531aJRSbpYxDHEOwyeGU3SkE0kocqGhypJPtVlv1FuDqeyZV/UhN
	0ljj5ynRlphfBeiDAVvrkW+U90V6SlMBkQ==
X-Google-Smtp-Source: ABdhPJxHjqeiYzJp9ITTCR7zuN6d5VfH+o06bCF0bO1IwSROzNXkzLlE9X7VWx6v6BHBcISuMTVxqg==
X-Received: by 2002:a1c:bb06:: with SMTP id l6mr28402599wmf.112.1607949303075;
        Mon, 14 Dec 2020 04:35:03 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id j13sm30058216wmi.36.2020.12.14.04.35.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 04:35:02 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/5] systemd: add package config for systemd-oomd
Date: Mon, 14 Dec 2020 12:34:54 +0000
Message-Id: <20201214123457.122655-2-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214123457.122655-1-luca.boccassi@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
 <20201214123457.122655-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Disabled by default

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_247.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_247.1.bb b/meta/recipes-core/systemd/systemd_247.1.bb
index bf73630569..f20c2cffb7 100644
--- a/meta/recipes-core/systemd/systemd_247.1.bb
+++ b/meta/recipes-core/systemd/systemd_247.1.bb
@@ -157,6 +157,7 @@ PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
 PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false"
 PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
 PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
+PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"
 PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2"
@@ -565,6 +566,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${bindir}/resolvectl \
                 ${bindir}/timedatectl \
                 ${bindir}/bootctl \
+                ${bindir}/oomctl \
                 ${exec_prefix}/lib/tmpfiles.d/*.conf \
                 ${exec_prefix}/lib/systemd \
                 ${exec_prefix}/lib/modules-load.d \
-- 
2.29.2

