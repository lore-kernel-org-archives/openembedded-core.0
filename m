Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.17627.1585329931169674178
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VFS8HI5Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id f74so2266566wmf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ls1wLNiYH9MY++ehFIHrnSjDGfQSdQ5SYm5fjSuX4oQ=;
        b=VFS8HI5Q+TUzKdgnvSfTxOViiQ8qXA+OHT5fUcitOI8SRTjmwbQFzsQEa0noUIPd2o
         mbAzDPwIyvlcDQGD2CEoNYd2ROIYgprAl3lNk9IvNlipipNHP9Y1Daw5RGsoeAqdtOsc
         SkfBq/kv/kCIHFFQIlDDvN2xV/skfTWtoq+0dXeJsNp86FM3XaCMlr3IO33dhEhxiBii
         zZdEW+zTYIKZf/9VTW7RFvn5QMtHkXManiW/HxqVsrr/kEmjQIloJ5zaRs1cvDRDNCZj
         LvBLGiP8ux1IeK9s4rqv9j20bb2UjTq6priksZi1z/F513QOqzUViLGqmnKqCZYnfs8C
         Slkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ls1wLNiYH9MY++ehFIHrnSjDGfQSdQ5SYm5fjSuX4oQ=;
        b=jNxz7R4yPFi/Q6pgsUfA/ES9DgL2CzenFDori5irWoFuyiP9hZC786RNizmi4jjc2t
         5Um3vn+l7XjZyjz5TOMGSZg5PVqh/VRLk7Nax4NqBSew8KcdYgHd4/UDT4qXHkDh+1BC
         KTroBR6HDvfawj6piYRka5ouemM6yGlfJIv/Baxw5hCExqoyZK1yEJ525zmi/E2ytrnV
         kvVbGakbM3vvgqCxCfVy40Btu3whhbosekr1mDXqH1PJ60IU6cSpM62qrEDduMzOXBn1
         foqqTAnGtFwFuCMKa9mjUY0ZZ/gxcQmRrRTd4sqXIyQK+cbOV96/T+Yl++yVtnGplQjm
         LLxA==
X-Gm-Message-State: ANhLgQ20JE6cO1+QTVkk8r7OR1L1hD5ih3zqw1JZMknzn20toByRJukK
	Phs30LG8vJ191GOFsPakm7dcsxbf
X-Google-Smtp-Source: ADFU+vsbo+TNE7S7igsn/I00KWshputsGfP6AX9wjrUIfHtIwpWRfUfFjWHYT7NCRkCCCKxjxg041A==
X-Received: by 2002:a05:600c:2747:: with SMTP id 7mr6164318wmw.187.1585329929605;
        Fri, 27 Mar 2020 10:25:29 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id g186sm9281419wmg.36.2020.03.27.10.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 10:25:29 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH v3 05/13] systemd: Add sch-fq-codel to RRECOMMENDS
Date: Fri, 27 Mar 2020 17:25:12 +0000
Message-Id: <20200327172520.62888-6-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327172520.62888-1-alex.kiernan@gmail.com>
References: <20200327172520.62888-1-alex.kiernan@gmail.com>

systemd sets net.core.default_qdisc = fq_codel, include
kernel-module-sch-fq-codel in RRECOMMENDS to satify this

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
Changes in v2: None

 meta/recipes-core/systemd/systemd_244.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 4ee20f85c21f..bb75aa0b9b2b 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -567,7 +567,7 @@ RDEPENDS_${PN} += "volatile-binds update-rc.d"
 RRECOMMENDS_${PN} += "systemd-extra-utils \
                       systemd-compat-units udev-hwdb \
                       e2fsprogs-e2fsck \
-                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
+                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 kernel-module-sch-fq-codel \
                       os-release \
                       systemd-conf \
 "
-- 
2.17.1

