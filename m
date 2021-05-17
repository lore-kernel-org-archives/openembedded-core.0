Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.16699.1621244916785372505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 02:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gTlvtflV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id b19-20020a05600c06d3b029014258a636e8so3194661wmn.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 02:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IT76IJqJnv2L2x/PCTYNJysv/JYzpubJhAKZEBNsQ+A=;
        b=gTlvtflV9PlY4fEJLJpdO7OTF606Wn8xRYqnTJQEX8nioKAkXaajYKe+Oc3Y6ff3/v
         KvTpNSfwFMSqVhWtM7tWBgOEx+uLDCxjaZXdQ56reLjv1dNGh0PVqk3TduG4i3RD95/9
         5lIR+4bQgVn69KjTYXZMVHMCNVI3eQkW3Fggk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IT76IJqJnv2L2x/PCTYNJysv/JYzpubJhAKZEBNsQ+A=;
        b=RiFPwnV0S145Z/D2c0voWfqbol7FayUbGXWJ8heB8NGuEXOH3t4oXHOD54IJpUFD7b
         bQ2atspvLRUvSrtgPnAON0k0juH2aM4f7sSWvH4V3JajX4i/q06HjBT8Dz955VTiHdbk
         aRBBu6QCJ0pOF1qbUr9mjtGspzDq+YcMAJ1RQ0q8Ra9hHDBroa3JR9ZIw0fLhm2xTgGO
         txX5KcDsyXUUfYTlPs5KKFl3LXsSYEHgkLVatJjDY0lGSa3u3ZzogfnFjOZ12OOI0+kB
         hAaOz9ZwRTyvqH65C43BkBm2LEMI2PthULFHTvDpECmbmJBPwULBBd9mP65fh/1JvX2G
         ExEw==
X-Gm-Message-State: AOAM533MU62Lv2lQl1pp9GLehDW5cCIBLUxEfipLFJpCh7Xn3lsmQHAv
	TiNVlg/HG/o2RPTUP//x6AryLDVuqCYYMQ==
X-Google-Smtp-Source: ABdhPJyoMwC2O3BnPSdm3/mDY2ModUkHPt0wrL41MTyjffQ0N5s6ciRxtCX5x4pQ8LKguqUjeFhdoQ==
X-Received: by 2002:a05:600c:4f8b:: with SMTP id n11mr62133437wmq.11.1621244915120;
        Mon, 17 May 2021 02:48:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id a129sm3382343wmh.20.2021.05.17.02.48.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 02:48:34 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rpm: Exclude CVE-2021-20266 from cve-check
Date: Mon, 17 May 2021 10:48:34 +0100
Message-Id: <20210517094834.2415783-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is included in the release we have, it was the reason for the last rpm
point release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
index 2857cd730c4..760adab02b5 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
@@ -51,6 +51,10 @@ S = "${WORKDIR}/git"
 # included in 4.16.1.3
 CVE_CHECK_WHIETLIST += "CVE-2021-20271"
 
+# Fix https://github.com/rpm-software-management/rpm/commit/2e21a178fcc76565c09ed3a28624ca8aeda1880a
+# included in 4.16.1.3
+CVE_CHECK_WHIETLIST += "CVE-2021-20266"
+
 DEPENDS = "libgcrypt db file popt xz bzip2 elfutils python3"
 DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
 
-- 
2.30.2

