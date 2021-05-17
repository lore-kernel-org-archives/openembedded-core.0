Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.19731.1621260865266195624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KgaycfQk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 6so4737119pgk.5
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VjbsWETIjzaZyPMJ1a+DSKoDMyKx81J+WH6KF8ebOH8=;
        b=KgaycfQkF18Zju3MTqEeMUCmblYGfpqGZTTSaRaYETqFxmxHdPi2CbpSwz0fXDjtgD
         S+07Y+SXzaiyAEEigfaBbtrsa3CcZBGPhgrZ+vCtOJpnz4qBZ0u9li8c9vHPvG96Bgnj
         X3TjbTFrGegQd7PFRDJVFSBvI3qgGmmy6huC3yv+E1CV3Y5l5BbN2Z3r2M7ij4Vhq9Jx
         a1rhYjLRSnVltKrDlPLQmwA+y588ed+q03RKfOtiNWRve/B+aoc+TcJFPx3emyr5oKde
         KuXVS42nTR4YkHg6RN7AdC9/6EM09Hj7yuHqmnjJy1EGno8PMmbz8XvGBffZUxBf0H6x
         dIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VjbsWETIjzaZyPMJ1a+DSKoDMyKx81J+WH6KF8ebOH8=;
        b=oyi0aByXIN18FTJdkIen3HCvwki7TycVgafTOa2OlY+K3Ic4OSLqmKORuw+oaqRvHf
         KiIrqMHEQljlQbxQmDW2EEQ0KEjmIbgj3fzwNL8IHkd+RvU/s2K7cMszFZwG/KLVK6LE
         CHXuCpK+zvzaoasfbwRpHS8qfLzvIawiH2cnw1SAyloicgaH2MTehZpT5jp/6Li5pKDC
         t5CIogeirJTWlMUvqdBIMJ3bvid6xkwTt4dWJdTSsWVLqnYEnnpOGGbRxXmSELTMDw3v
         Aar0cDxKNzkp7hZGxaXPn8bb60zfRF+c+au+nelU/rzTnuLIvQc8og9pcQ8qpB92fD6+
         /zHQ==
X-Gm-Message-State: AOAM530CnIQ6XrJahpFbQRQoYOwg9zWE7v2d4Ar4WQvZZTvqn9E81ec+
	gmriRlcpLkBULCYSdK6S2CDYenOo5UaRB7YCmiw=
X-Google-Smtp-Source: ABdhPJxPjPDstUreHPvsxTpMdb6iEnkT+T616CuK7E2Sn/MfPxZMnl1CYuiyVvT5HVaIda+4ASNvwg==
X-Received: by 2002:a63:4547:: with SMTP id u7mr15214187pgk.250.1621260864390;
        Mon, 17 May 2021 07:14:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/35] qemu: Exclude CVE-2018-18438 from cve-check
Date: Mon, 17 May 2021 04:13:17 -1000
Message-Id: <05f39301ab19a968916163b2d8f65beda7c09852.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The issues were investigated and found not to be an issue therefore
exclude from checks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee6ee9bd489c126b99d15c1011560df2f840a6e9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 396ff1c5eb..8f927bdf54 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -68,6 +68,10 @@ CVE_CHECK_WHITELIST += "CVE-2017-5957"
 # enable it by default.
 CVE_CHECK_WHITELIST += "CVE-2007-0998"
 
+# 'The issues identified by this CVE were determined to not constitute a vulnerability.'
+# https://bugzilla.redhat.com/show_bug.cgi?id=1609015#c11
+CVE_CHECK_WHITELIST += "CVE-2018-18438"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.25.1

