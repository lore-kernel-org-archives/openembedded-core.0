Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.1205.1604335776797626364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TIFPXFqC;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id w13so6323801eju.13
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wICL2JKVxlae+1RVqubedqr0QniMTNf5oWz7aq9PCDQ=;
        b=TIFPXFqCXpk6kdG4PJZcD4AyZLWxQHg1fJJxumzLEPHZDa1Eq9dZ0VvFqboTHISDz4
         jUfOVElNE0ve/zOaSBmNMDMrLhNJShxyQXIXbMVkGwESDCDEXOrFf5wnwdQfZn8knP/7
         IcEUXAMlnYdmoki0JZGd0oqj/B4hQ30ZHwlbDcu14jxoFVrnHuHweY+7jemaDTvYG0Vf
         Ym0LzVG4RYfISOROfah2e1vQlkOt1R6ph5ptVK/9JhhrWRItmW2BTy+erl/Bf0TmMdvW
         h7wMGDTUciNW+nVbqz1NbHHDaZ3bkrCpZcR35msw5clYKY6SGfZln3mBjar/YAmPuqRk
         qt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wICL2JKVxlae+1RVqubedqr0QniMTNf5oWz7aq9PCDQ=;
        b=tWVPN89sukRE0kphcb+o8lg4yM0wcQPnTeeH/kGT9ay9Y70KA5nrqC5TP4WVM19fJX
         MJk/OgbfYFFy7Fjh0ocKxvcOUNLXMPl/JuWEZccPacXRTpDO8/R1ugBwlhbYCHFLdobG
         vm0tvgxMwFo19GcrI71sJrcT4Mp3ugUDtmMQyauRfM70hPrThpTjDibhF9zetzgIQ4vU
         7mv6t3r/YTl0GnTuom5iHRw3n8xCuyd3CpM7BAUPPuuMLnKmiRKzIr5/Fhd8mEijmspV
         V1iT+fDxZ9KP6YqgkwygRwLySyoYvWuNovencfkMNMr0tFD0MXQ+hI5N+fug7sBH9T9Q
         uVSQ==
X-Gm-Message-State: AOAM531Bn/82Md49/FMJVaWfpV4u+bghY4Otf/wYgSZNwwOEilRadTwx
	Huws/3sJMghHhwGCxKeAjxadOlJpStP6Yw==
X-Google-Smtp-Source: ABdhPJzNqhAcGYA60kOGlNh0hg+GoRVoI9k3Wupc6wC5PR5o8z03xU3JTn8Qh/AhKv6+7JBi3AIgJA==
X-Received: by 2002:a17:906:c18c:: with SMTP id g12mr2349939ejz.334.1604335775076;
        Mon, 02 Nov 2020 08:49:35 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:34 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/80] dnf: upgrade 4.2.23 -> 4.4.0
Date: Mon,  2 Nov 2020 17:48:07 +0100
Message-Id: <20201102164907.27572-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/dnf/{dnf_4.2.23.bb => dnf_4.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.2.23.bb => dnf_4.4.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.23.bb b/meta/recipes-devtools/dnf/dnf_4.4.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.2.23.bb
rename to meta/recipes-devtools/dnf/dnf_4.4.0.bb
index 8cfd4d0c89..dff6fe6c25 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.23.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.4.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "126d861812f827285960592359615ed7cb195aac"
+SRCREV = "b9b7623892f551da201bffd03187d703242b00e9"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.29.0

