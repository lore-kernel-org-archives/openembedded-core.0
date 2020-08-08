Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.3862.1596887392280660669
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2020 04:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=b1xisKYL;
 spf=pass (domain: nathanrossi.com, ip: 209.85.216.45, mailfrom: nathan@nathanrossi.com)
Received: by mail-pj1-f45.google.com with SMTP id 2so2271326pjx.5
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2020 04:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=35noUsVKuNaBQK9ep5fuQVWHJ/jkW7Wq9Xs4Bp3DZuw=;
        b=b1xisKYL2SxqT1ynYLP12Z/Q+i3CUDKbZtZFI9EHePec/sv/Wd/ba1FMGA5VzpqEI2
         zWhsef0Ll74RppHPcHBBcKiBc8hZWdBJrLZ1dzQF5CwJLnCIg49BG7iuiZEK9xlhRohi
         ppaWMB61yblzKDirTs36IsYQG13+mgnwDLMoyZtygB05NiKtgA4JxMUsQGqWMOWhj5pp
         usm6UfDrcT4IWmp4kkjiXm0nXCUlRwqHndlrsMFucDRVq+CtpxR6G8oILkWv+HKDCpew
         LV2k9hBkFAfn0+O3zxbghx3Lh409gig/9YOwpCrCRIPGjqTLJfBNtyzk5sVOViTQwB6B
         ONPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=35noUsVKuNaBQK9ep5fuQVWHJ/jkW7Wq9Xs4Bp3DZuw=;
        b=nPAdPUMrj8QJcVjytaXm4eaiA/u/YFqDZJB8FfuNObFPSXq6P16Mw3HpUS109GZs2I
         D5uTddf0w9kqz1ttTX4jTCRXgnpsdsSesdA4UDMDGLORy+dokg40eGK7Ji0uwniBGu1p
         i1ADIo1dI3ts+rjwkSR1Ikk9jkzfxII6tN+bseYtoC5mPNLDbTLjMe+4rWO9azMwj7cz
         lPGLyo4ukEjIlpQyn9dCsRa1+eWMSmLiLmlWwxLc3iwnS/p5l4mkPAk5pK7U8M2yMEOx
         BTd1Swy9sGqb+WFl8kB7wjbmxAfrOwH3mjgxnKIrARGzLZak8vG72l6hVnqdrACPh/uC
         UvSw==
X-Gm-Message-State: AOAM533mbRjEjxctZk+KNlUOkN5qou/SMgdz9mceRZOUezQ6LnWIlWts
	9qVGxkCj7zOnh4H2F/IQRyja/URuDQiUaw==
X-Google-Smtp-Source: ABdhPJzCOO+SnTZnxrINDW3p07OaPxFByj5u/IXewwDWPT0RB4eHc1DYqfbWnfCd66xCE6gD5nsAIw==
X-Received: by 2002:a17:90b:1985:: with SMTP id mv5mr17177089pjb.43.1596887391519;
        Sat, 08 Aug 2020 04:49:51 -0700 (PDT)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-68-14.751444.bne.nbn.aussiebb.net. [117.20.68.14])
        by smtp.gmail.com with UTF8SMTPSA id u24sm16088868pfm.211.2020.08.08.04.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 04:49:50 -0700 (PDT)
Date: Sat, 08 Aug 2020 11:49:45 +0000
Message-Id: <20200808114945.297135-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] libexif: Enable native and nativesdk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/libexif/libexif_0.6.22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libexif/libexif_0.6.22.bb b/meta/recipes-support/libexif/libexif_0.6.22.bb
index a520d5c9f9..2478ba07d8 100644
--- a/meta/recipes-support/libexif/libexif_0.6.22.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.22.bb
@@ -17,3 +17,5 @@ UPSTREAM_CHECK_URI = "https://github.com/libexif/libexif/releases/"
 inherit autotools gettext
 
 EXTRA_OECONF += "--disable-docs"
+
+BBCLASSEXTEND = "native nativesdk"
---
2.28.0
