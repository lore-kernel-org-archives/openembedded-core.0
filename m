Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.32364.1608508573640027042
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 15:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KpmqKYcG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id c133so8230376wme.4
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 15:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jmxt39mniZuC8fwpi8yJAEMQKLLzvW+5MRUBylhLHak=;
        b=KpmqKYcG7nfSSsrTNmpmvgjgjCbzOaUFUd2HvwdqzT2T+QnJ+avOEIeu9fwsGzxiIV
         DYnpyVGWvRXI1HHLtHyhvO2UViZepzMXssZXmr8FRlh5X8RtGRwV3CfKW5I54wBvx4KA
         Z9/iBO6/auhNOKEigdFHZ+3Ut831YIZsqpJgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jmxt39mniZuC8fwpi8yJAEMQKLLzvW+5MRUBylhLHak=;
        b=uoIapVUbqz6+MAVWmT99AiJIRWGM6j1jHj7Ak2ciFfTomNeB6dsdJ1Q4UBL/VB1g5v
         +1mjP0k+CcOCU1ad1CKYszKKj5C4gIGMnTViszuK1B5kkqLmNz0/I55fUWA6JHbkVzcp
         pj4L/saSwaeJeKu9SBHbQ/CyWQ2ly6VXSl1vlSakyEBOYXxUyZQhse7mhsJbHyAiAcuu
         UylbTkm2bMD68cb8j3X2viZ1fcFbigC0S7nX3UxZkC7Vtyh2qtxbECIw6W/NDKf0/n9a
         UxODjqAAjylvwe+uK9W8NgafKu7CxybYgCEvk3/CDUL8VijxR0c7MG6qcXsAPvmkpriK
         SPMQ==
X-Gm-Message-State: AOAM530VKK04tYTq5RddI/1NjWcRJwC7j7JfMBr9CIEpQplHVQyegl8l
	KnYoqxj4stQ92USerFeENAO6ILyt4lQ7Og==
X-Google-Smtp-Source: ABdhPJzH0H45O8gmdAgOSd+on10yyZ613tuMsB5kRta4wM3Eix/0+fa6MFz1hpmim9KF4WkiGpphpw==
X-Received: by 2002:a1c:a5d4:: with SMTP id o203mr13997929wme.41.1608508571998;
        Sun, 20 Dec 2020 15:56:11 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (6.6.5.9.1.e.9.f.7.4.3.6.0.6.1.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:e160:6347:f9e1:9566])
        by smtp.gmail.com with ESMTPSA id z63sm4352086wme.8.2020.12.20.15.56.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 15:56:11 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] cups: Mark CVE-2009-0032 as a non-issue
Date: Sun, 20 Dec 2020 23:56:10 +0000
Message-Id: <20201220235610.20778-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201220235610.20778-1-richard.purdie@linuxfoundation.org>
References: <20201220235610.20778-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CVE was against a cups plugin which is obsolete and we don't include.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/cups/cups.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index df8d4d284a9..91e73d75e43 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -20,6 +20,8 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
 UPSTREAM_CHECK_REGEX = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
 
+# Issue affects pdfdistiller plugin used with but not part of cups
+CVE_CHECK_WHITELIST += "CVE-2009-0032"
 # This is an Ubuntu only issue.
 CVE_CHECK_WHITELIST += "CVE-2018-6553"
 
-- 
2.25.1

