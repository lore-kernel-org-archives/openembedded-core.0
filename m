Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.1219.1590530251746126330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 14:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cfSm9bRG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id k26so673757wmi.4
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 14:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PLrEYAqzj2duTOacFgk8J/Cwqn2NYcR5+o91VKUQr+I=;
        b=cfSm9bRGzAjqY1+kiTz4SfjB7YAbFc8XSnvoNAB7Cl0RozFAk5mGg/bcncbiBONTJg
         yQp+FGK6yx4IJL34Li9X1Rk6pgLAPFemiT8mkWtMwkbJBm0k+rXapVJ4+1rSwDFG8I+X
         wzVn+MHBe2CGqOL8igAQSmGFvFd7rLjoK2tPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PLrEYAqzj2duTOacFgk8J/Cwqn2NYcR5+o91VKUQr+I=;
        b=KTvngp2I+mzljAOTaClqyFJtBbYCMyONxsayX++kbR9vEAzFFQr912CQ8eZNBBOHgq
         AHVreeqaOnXMthiQt5eFecyBsSz9Dvc9m8nHPfq8qi9gGHEiZOSW5jmcZ0/CTFcFMlEb
         cUG3O8FP4KBN4VJdnBzSEliqodTcYKr/WgJkVYNiIGa1l03a7OjQBgAH+VI0k0pql0Tl
         aKQWQlxvGnRvkN0ehhWNN9hLDF1b0xhViOsJSf2EXvfTTNUE0Fr7bUzw/qPzTSOssrLt
         R1V0dLUhLckd0lHhLOaitQBWWAVDLkDo2fs3tpHwFIbeuDGkqPp1op3tLeuzNLoS0c/J
         uMPw==
X-Gm-Message-State: AOAM533HZj+KcIshqJb4+EA9OIzI4aL50kD3dZuNG7wRjG4zX+w8tol7
	ZTPDJE1CfTUjMXKd0jOMr5lGW1xP/2oeqQ==
X-Google-Smtp-Source: ABdhPJxIyB5IXYOQIojGwu5hGe6qN4/SSLzxhOsWpocprLd72Dn6hfhz1vLUWs7d2flSECGEwbl/8w==
X-Received: by 2002:a1c:9654:: with SMTP id y81mr1127687wmd.46.1590530250054;
        Tue, 26 May 2020 14:57:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z132sm901291wmc.29.2020.05.26.14.57.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 14:57:29 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] resulttool/report: Remove leftover debugging
Date: Tue, 26 May 2020 22:57:23 +0100
Message-Id: <20200526215725.992258-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526215725.992258-1-richard.purdie@linuxfoundation.org>
References: <20200526215725.992258-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've long since wondered why there was some odd output in result reports,
remove the leftover debug which was causing it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/report.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 7ceceac802c..f0ca50ebe24 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -96,7 +96,6 @@ class ResultsTextReport(object):
         if 'ltpresult.sections' in result and suite not in result['ltpresult.sections']:
             try:
                 _, suite, suite1, test = k.split(".", 3)
-                print("split2: %s %s %s" % (suite, suite1, test))
                 if suite + "." + suite1 in result['ltpresult.sections']:
                     suite = suite + "." + suite1
             except ValueError:
-- 
2.25.1

