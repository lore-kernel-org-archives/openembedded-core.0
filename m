Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.22225.1622304398065196170
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 09:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y4wS5dwG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id y184-20020a1ce1c10000b02901769b409001so4008328wmg.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 09:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GdvdlwpGwZRr5Tc0azeO4loSLLcP77NaXgxanny8I4w=;
        b=Y4wS5dwG13jf1tvfusv9xtMkqQDgKEGGeRjR/Oj5/VWrPGI7vnCvV5FAbyhdXK+2j3
         Vh8evdfNmUTCpKePzKZiqh8nALYZCffuEEEZJlYjAJ+x0MfVEV3PDxEszMMBCaTFZLOD
         bZVGYSoVCswPOUa563uZv0/F8xI2W2p88ZmEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GdvdlwpGwZRr5Tc0azeO4loSLLcP77NaXgxanny8I4w=;
        b=Ih3W+ffjToiDZ75j2X1d6MAlV+/hqH2ItY5nLuBZVS9LlMD9kjuAhOy6FpazmiiKTZ
         tNomlJPOCGL4PQIbkK2vz3eM2s2eaA+dI8n2CmuLyaM32qKUOQ7JEsK3/GvPEJh70MV7
         vvxQw3oegfKYInr7iTJD+sGJ+XtEt+Tix3wbW2g37h6QuDOzbvQRrb+x39OR9q33m1Vr
         SnuR2kPyP5EF+cPfWF+AS7MyxXFGQSwE7tNgjJGM235vBIzl5H16Ep6cwapfwl6nB8la
         L7gGgmdlK0buXfSic6zSDV0E4JbKQ841Isr7I+3Vm3hjTk3YZ6T3/jV7EvuD7mTuQHJ0
         zh3g==
X-Gm-Message-State: AOAM531OFdfPRUsH5ZEZwvra8CAPTC94zSg80lnId2YgJkUO8GzIfyJ2
	i6bi4RCXGLZm4ukjtw45fZgA8nx2ihv1aw==
X-Google-Smtp-Source: ABdhPJzszTzFxg92MMIrE1UbkpCnU9iykqN9RrlgRHEjiVGhkeUDT7dsw0ZtBstdu3ouWhsdqKVcMQ==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr18540888wmi.117.1622304396663;
        Sat, 29 May 2021 09:06:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:314e:6a46:a163:7356])
        by smtp.gmail.com with ESMTPSA id q20sm20873615wmq.2.2021.05.29.09.06.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 09:06:36 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 09/10] grub: Exclude CVE-2019-14865 from cve-check
Date: Sat, 29 May 2021 17:06:31 +0100
Message-Id: <20210529160632.2796977-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
References: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CVE only applies to RHEL.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/grub/grub2.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index f0fa86b1823..3c6b434c2d5 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -34,6 +34,9 @@ CVE_CHECK_WHITELIST += "\
     CVE-2020-25632 CVE-2020-25647 CVE-2020-27749 CVE-2020-27779 \
     CVE-2021-3418 CVE-2021-20225 CVE-2021-20233"
 
+# Applies only to RHEL
+CVE_CHECK_WHITELIST += "CVE-2019-14865"
+
 S = "${WORKDIR}/grub-${REALPV}"
 
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/grub"
-- 
2.30.2

