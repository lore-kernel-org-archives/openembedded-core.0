Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.493.1621543756251592101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YkkKk5Vc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id v12so18959518wrq.6
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O8q/32Q5qqusaSTwJtES6pXZd8DEsSskifD0OZBjyWw=;
        b=YkkKk5Vcqwb4DMgR+wyEiE5fdVXZgrWgF8foFvpndjHnDyNiHXKJbZ5YZOrGHnPn//
         r/ydu3UBbo0LTaHLYcNVa4R4nfdkqTTYZkyzpF2KN2w9iCgwVLblZ/PsP/W94QTO7ko+
         nqfqFKFoTqzG8mmin3fXOZwuMAWkHBZKfl9gQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8q/32Q5qqusaSTwJtES6pXZd8DEsSskifD0OZBjyWw=;
        b=szdOX5NFFyOq8uHcS0usFUfkZnhdrD1Zjda8EeNz2b6Li6xJeSq9HUoj47mCwL0no6
         yHxf+6fVhD/uBSzfgQpGN49U4xzkxu58zgx5xG5zEsGx1joLTAoipkdh60MGr8Io2j52
         In5khB1GJfh8eRLRs4w0hFwkMnXEF1mJQcJPChNgsPV34mAVfaUTbP7WOHO9y8cxqpr/
         li0OGZCS4QMlh7X7fTVX9AY9VxyCcIoeOFPIzG7GGFz7WCFpqRXMKdOaX/4QmnGZ5SAj
         C8hHvRid02diEU3SG5A/CD/dpM/Sowq5lJAZlz0TZttyGcqD3jYOA7GWkDIj42NKSt0V
         DsZQ==
X-Gm-Message-State: AOAM531GLGZ3kY/fIRhbzyItoIUksTmS/HCSoZSictZeGNIb3315XQmV
	J3IoE+Ok9rjY3NK4OkFbPLYSI9YF9+/jZQ==
X-Google-Smtp-Source: ABdhPJxBIFltlu63d9epLJQNoPdY5NyoU5OdeXZ3fjJto7DffsKMgabqncmF/zoO+GLRwQPam7tzjA==
X-Received: by 2002:a05:6000:511:: with SMTP id a17mr6019636wrf.351.1621543754792;
        Thu, 20 May 2021 13:49:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:14 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 20/28] cpio: Exclude CVE-2010-4226 from cve-check
Date: Thu, 20 May 2021 21:48:54 +0100
Message-Id: <20210520204902.2527687-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issue applies to use of cpio in SUSE/OBS, doesn't apply to us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/cpio/cpio_2.13.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index 94d86100c74..f4df826ed9c 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -16,6 +16,9 @@ SRC_URI[sha256sum] = "e87470d9c984317f658567c03bfefb6b0c829ff17dbf6b0de48d71a4c8
 
 inherit autotools gettext texinfo
 
+# Issue applies to use of cpio in SUSE/OBS, doesn't apply to us
+CVE_CHECK_WHITELIST += "CVE-2010-4226"
+
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
 do_install () {
-- 
2.30.2

