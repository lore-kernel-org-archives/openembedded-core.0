Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233D9C54E90
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:14 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.4709.1747808407835857285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KUGvebPn;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74264d1832eso8182481b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808407; x=1748413207; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnJymeO+5C6F0iXhFBkktSLzFCfaoma57gfx4nYpQlo=;
        b=KUGvebPnDP/WGLZOZElY23FEMFRh5q9XzHj9NM5SWC6+pyP/EmP+iCTfJIWdg/FnJ8
         QagYF57vJkRfY8rTZHDstlMLWIMTM5j7picnxbU9xH6z4oXscXDlv6WZPMzEAJCSHACA
         FJ8Ff7fLwV5j6xwqFPDFgappPR60R3nFUqTZrUk1IUNND/sJRPIfZMvlpjhzIJMCILlx
         Ownh9aZkaryYNJ3z+W0bEyPtgjiWn3IrR/nZRO44qwjMFA0oT9nUggSKrjlN1ts5TC9C
         qNXTG6LsH/X7zvh2Ch50ZJxdS19Y49J2XeeJo4Gtt1RzkgvZe+2oDt4Ow7gIEB4I5CiJ
         pwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808407; x=1748413207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnJymeO+5C6F0iXhFBkktSLzFCfaoma57gfx4nYpQlo=;
        b=Y4cz1cPgr5X0hFqqQKpEdC/rsF4pe5Yyn8recDXGafUDMuZso5abQfM5dhxA4mIIB+
         skMc7ljQWlWsCZW+9oM+iL1uDKGozvuE8TKx8EuU9DCUVYp1imVtH4lLk2hwqwD31cSM
         relLQ/i7eJpBKJ0+iwsD2aFi/D1cAhHPhMqwjq28PYqwK6Ye0rXLQ2N7D5XNs2Bju/ym
         /n5T67ni5salptZJasehgmoGfeHSa6EIvn+06GYMJn03hPkZ1w5optJvLjz495li9G//
         JNR5nl5AK94B2sFt+Q1nNTH4RH8+wc3pPJeuAbrM4+Q7uIXDxNkzY9BD0pkFW6bESeNM
         2qvQ==
X-Gm-Message-State: AOJu0YwVhbyhEsqyk1m+QOs5Qqj3l3DfRWOLpYEl4BfOSTiyAbsI0M6s
	3onMReDCYvuUpUXvMe0LpsTygfnbZ4qvi9ve9uTe6Q5orSJQWbeonk92KggwQCPN
X-Gm-Gg: ASbGncuUxM3fcDyLw/Iy6OHiYojH7Y3A/Q5VA03oMX0IE0PBI/FOLg0tjcMO9VT2tU7
	yhhTEVk9KLStjTVfYhZMNTt2atvNWFldghtE/io8gVGmzukO8qvfMZKUKrLCzWcidP4g2CTdb/1
	M+9kPgHTUa8+Iurgn1Q+XoWFNGh6wF8IldQO9jHp7DwtYLoq9ELFvuUfed9KXudmzgouzBS4LS7
	SJBOGpeAPJM2IqFJ94hzsKywNJBr1ihvgEEUlmsv2xe+c/y3wwxSmwAxUodPM2QXZH6mSIZEPYS
	+rbBaL+0usZbR7q/DxXj2Fg6mNAkOvJwa3W6P4rsP5o=
X-Google-Smtp-Source: AGHT+IHKIeQrxDMAkgPya14o2IpuZRrIVow24H4N5vx+KbGQhIvncZ+aNZwiS9viXm6SE5Mbef9jRw==
X-Received: by 2002:a05:6a00:2790:b0:740:5927:bb8b with SMTP id d2e1a72fcca58-742a961837amr23312726b3a.0.1747808406999;
        Tue, 20 May 2025 23:20:06 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:55 -0700
Subject: [PATCH v2 19/28] syslinux: Pin to using GCC toolchain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-19-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216987

It does not compile with clang due to include_next stdarg.h not working
as the system expects to match gcc behavior

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 1e65616081bea95ff28f40eec362195cbaf77390..449a75ebf8abf1dd6865f641f696ac1b67278819 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -130,3 +130,8 @@ FILES:${PN}-staticdev += "${datadir}/${BPN}/com32/lib*.a ${libdir}/${BPN}/com32/
 FILES:${PN}-misc = "${datadir}/${BPN}/* ${libdir}/${BPN}/* ${bindir}/*"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# com32/lib/../include/stdarg.h:9:15: fatal error: 'stdarg.h' file not found
+#    9 | #include_next <stdarg.h>
+#      |               ^~~~~~~~~~
+TOOLCHAIN = "gcc"

-- 
2.49.0


