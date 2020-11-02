Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.1226.1604335762379747832
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ogHjuOrA;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id v4so15064606edi.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t8hL6BUY7jTdGxcxw3eJrr3E21oy/zGIRxHoAG/cPuo=;
        b=ogHjuOrA2MZlkxrDTeiCcrOPIAcuHl5uwf95npw262kz1hObMAW+cGCwRAuA+z0Lrj
         p/HCXkgnWAz9BrPd9a/7CHXLRKM2JbHCboHJdVuF47dUn/6gjbN0j9dj9I1eQTNAiDk1
         9gUef/bKADjD5ARN3HkJqmpKlJlw8cG9KvqfHRgHO+WCnkJez1xHSZbHcqDf9CnuHNTn
         eljKlnI5szKQ2p0qZaIDMHYrrBqjy8pDnH1Tq+VDWBdIRAb/iu+5w9sdc/KqDpJR3tyt
         Bu1VbKAO6ZRLnQBWi6jgXT/d6KKw4DBHQm5X8hRG/0UgJ2vu4E7sbX2WX2CSKD1eFLoj
         DjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t8hL6BUY7jTdGxcxw3eJrr3E21oy/zGIRxHoAG/cPuo=;
        b=pPvnR3J3Cf8qsNvzJDxjwIe2aodHtcDIUmEmtqfXt9wXbSmIqXcjsqxaXZrUzzrx9f
         Z5uD8MYCVdpNI7xscqXodBXAaZl3GBAn3YUIDUlzfUDqZQGPcRmHpSlm0h8IWViToStJ
         cRZQcCB7FhjplQsiktxjfUQJH8RiUYJPTnhz+IVrisrv0nAFvomsruhDHY29xzaXVTMz
         mr2+pls95zAs3Isz8bAlCmFoR/hSXjVmSrpiVIPi/mUM2d+ludUiik4N0WYCBdDwNbW7
         UtgU7HtoZigA6sqa/RaS7nthAlk7MH5a9E36piFRp37gSK4bAOE7u3xOLTgehM8DkXKO
         oYKQ==
X-Gm-Message-State: AOAM533GbyjeXenhPuoIWsL/jf6FCVMXN8Ip68820PxC0tWFnShxfr5J
	QHZiYejPEyhjr1hg4/J9l0uQK1xdrapD9w==
X-Google-Smtp-Source: ABdhPJwU49+YN65JbnUMcUpmQqS7v5zvM4ZVUX7IWOg3+bIOj65KrIUViDgOrJwhma16cciLDYfm3w==
X-Received: by 2002:aa7:c9cb:: with SMTP id i11mr7327480edt.100.1604335760779;
        Mon, 02 Nov 2020 08:49:20 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:20 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/80] glslang: fix upstream version check
Date: Mon,  2 Nov 2020 17:47:50 +0100
Message-Id: <20201102164907.27572-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/glslang/glslang_8.13.3559.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/glslang/glslang_8.13.3559.bb b/meta/recipes-graphics/glslang/glslang_8.13.3559.bb
index 6d92513bd9..f4014f637b 100644
--- a/meta/recipes-graphics/glslang/glslang_8.13.3559.bb
+++ b/meta/recipes-graphics/glslang/glslang_8.13.3559.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=918e668376010a04448a312fb37ae69b"
 
 SRCREV = "8db9eccc0baf30c9d22c496ab28db0fe1e4e97c5"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
 inherit cmake python3native
-- 
2.29.0

