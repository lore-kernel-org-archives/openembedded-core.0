Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.1439.1620316616706414142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 08:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ERrNEV+0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id d4so6164072wru.7
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 08:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0EIk1CyCg244ZljzOEuH5+zKVToWA9uHHB43n3BeGwA=;
        b=ERrNEV+0tS2ARu1EuahUUNe23e1oMwgNMYR694xjEdnafptOUWqC4Od0+//yvgCl/E
         ZskA0NULuvb3ZsK3CdNEPWFfZbJjrKQEUAUXfkp3YPKMHKebHuNAk/F0JXe8OVFF3X+P
         kp4slRT/KNYHVh8tuGdiiiCguryJxyeC7AST0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0EIk1CyCg244ZljzOEuH5+zKVToWA9uHHB43n3BeGwA=;
        b=tlCEl1KJKEASACsk310TOQ/d/ERTrONdqCPEpDu13tSz5uZC9DPgs97iww5yGNKT0G
         9HR2/VakbbyRhHZUx93lHKlNsQSX3LHvMnyWcfh83bZT9sp8wjQHCUwCRT8YSyB6b++N
         Rraxkdn642sO6WjC4QH0evWwv8uvNEp2bsoYyTBMhaPH5XIqUxjCvn7eei9Kqlk+pg2G
         wezpdwqVvAYu3OZpstRqnGlOIapHoczeYTLoxm+v0YMnln3rrccF/g39wgcrWn2Cy17s
         nzM3UZOAxPaRUmSF79SmD6Rjy3QJGGI992FhCBPjOWphj/mWQtFKAKqyzOcZn81IRHWl
         yjRw==
X-Gm-Message-State: AOAM5327Ivrq0Tz7ULRwXekVSZD+jlRBtNP47ALCgMYVvcICUbiZoc6n
	fpCDnwQKhrT+iDbfA/eCQprtSd50f9W57g==
X-Google-Smtp-Source: ABdhPJxWBVd+OH1ektAIar4EfJ29e7EDubAHX7+Hw/tY4+M3SN3M9bcuCza4uawGs/URFb4d3/13uA==
X-Received: by 2002:adf:f1ca:: with SMTP id z10mr6147939wro.271.1620316615170;
        Thu, 06 May 2021 08:56:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e])
        by smtp.gmail.com with ESMTPSA id a15sm5599471wrx.9.2021.05.06.08.56.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 08:56:54 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ptest-packagelists: Add expat-ptest to fast ptests
Date: Thu,  6 May 2021 16:56:54 +0100
Message-Id: <20210506155654.2006163-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ptest package was accidentally not enabled. The tests run quickly (2s) and
pass so add to the standard test suite.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e0a876dbdc7..70d5fa8877f 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -14,6 +14,7 @@ PTESTS_FAST = "\
     diffutils-ptest \
     elfutils-ptest \
     ethtool-ptest \
+    expat-ptest \
     flex-ptest \
     gawk-ptest \
     gdbm-ptest \
-- 
2.30.2

