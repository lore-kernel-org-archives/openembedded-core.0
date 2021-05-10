Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.31240.1620650182178102159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 05:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dL3sPOZB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id t18so16467031wry.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 05:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1qY8nLMB9iQ1JdWsCws88KAFmOrHUey24nAbJiQwTNY=;
        b=dL3sPOZBALqrXYsDcSK5vx0iETxmJER4VhMqSO3iAvQahai2HdbWjXXXItHQ3Cz83Q
         1+1QWIvFsMmCXEWzHJbeuBw2lzwL6BhWVtG0MMS606Chfm1LUI7xJ3KIlMehPNPXP3xX
         SQ251NLbwiVAetfbFUQmxmFwX654MnuNlhnmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1qY8nLMB9iQ1JdWsCws88KAFmOrHUey24nAbJiQwTNY=;
        b=D7iHxGigQvnO4UxhN7R/PPfMU29hqFLGC0m24fsC5zeoJj6/pjrnZdkqRXvsGVitMG
         bePTCbsV+E2DTTNsisEQ0hQMyNn8ciYnPllP00S5PTGewzlkUru3uPnd98pHIdI3p9HX
         ARpvsyCwsLcm+w/5r07wGBzL/hMdz+SZ8ZnpYwtl8Zv7kDzS4/TipjkNPM3mmn8NzRo/
         K0822kaZrRNxXknCRA0mMfE3yuWJSxpZPePRiwLSNJ/w3QkQtDA7BywzI5l54soLyCgp
         KWtZshO3RU4Bdw4WwYPliOkOiJW6Pp4ERMZ+mailDaHFkC8uMvhBLpFAmLrajkt0R+2n
         9D3Q==
X-Gm-Message-State: AOAM531M6AGn8AzMB4m5EZ1dYwh0zo1U95UZlLrEqWYgqWFRRvWkC58Z
	4f2veXEkGchBMh9Yk5vlikm5R7NhHBuf8A==
X-Google-Smtp-Source: ABdhPJzU4Sq3d0HG947lGT39JTeeVh9lUK5LVJdwas58RJVEN8jnYO+zeJGYEAUCf3mR32PVUSKUxQ==
X-Received: by 2002:a5d:4688:: with SMTP id u8mr29835789wrq.427.1620650180450;
        Mon, 10 May 2021 05:36:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id z8sm22303622wrw.74.2021.05.10.05.36.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 05:36:20 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Exclude CVE-2018-18438 from cve-check
Date: Mon, 10 May 2021 13:36:19 +0100
Message-Id: <20210510123619.2160436-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The issues were investigated and found not to be an issue therefore
exclude from checks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 32be057d0ed..82d1cb5566c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -72,6 +72,10 @@ CVE_CHECK_WHITELIST += "CVE-2017-5957"
 # enable it by default.
 CVE_CHECK_WHITELIST += "CVE-2007-0998"
 
+# 'The issues identified by this CVE were determined to not constitute a vulnerability.'
+# https://bugzilla.redhat.com/show_bug.cgi?id=1609015#c11
+CVE_CHECK_WHITELIST += "CVE-2018-18438"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.30.2

