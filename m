Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.6515.1613475662759282976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 03:41:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZQ/9tUe5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id o82so1533162wme.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 03:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0xrPXzbu/BKmZBRUjX2sYN51ByR95f7GrVragV9/dsQ=;
        b=ZQ/9tUe5qZO+N8bHY36EfjckvHsh+TLITkMx6vm91tVX0vDERXnEs+AGAMI1RpT2nK
         E4aVlBQ4cT8fCcPWsI6pH7J5grXT3MlSjMqwS/0Jic87Zn1u+6mCN6mycHmE2xyc37Ya
         iyAnB3kI+bjIo1QF8EHTmtqRXKnTBxqMjHYMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0xrPXzbu/BKmZBRUjX2sYN51ByR95f7GrVragV9/dsQ=;
        b=cCkUKRQsffh9Z9oxnwo6X+ugVVYCLnq0dkG0A4/WXtGZJMizbIICPKBkGve/IAv0kR
         Ln+miBH8OWtdsomdR6DyiAFQsQEUk+bsRPxyxR/XtFXqT0ZK0LPHNXU+BmO8pe3LsJiM
         K6Oh6J3GAN2TcZ9EINfz76ujxmMP8xqizk5HcsHodkoB9jLcoSY4rVzAqENn1Bn4IqZg
         JXtsVVofqvTX3JonL0HgfROR9ZKWhFQwpmm3GFhubEdFW+TAhSQYqg6xa291vyKHksi+
         vbgiz1CqsQUUt/05J58iZZnr/drvdCwztPXV4RKka4vCK+6BpcXz/a0jdI2wQZ9Ip3Iw
         j2Mw==
X-Gm-Message-State: AOAM533hp+9LBN838SStU9ABXuT66GszOt5EzPHxH+J+PFEMy65kibB3
	OQT/KqjqT11HY/mcpLVPOLypRKzEwQbWUA==
X-Google-Smtp-Source: ABdhPJwM/+6ez8YDjzM/fOIqcabaNy+Z0aGclcH68EkqSwPiRK54/P/nuAyXxbfvIVrbsWBmpeywPw==
X-Received: by 2002:a7b:ca4d:: with SMTP id m13mr3051994wml.118.1613475661336;
        Tue, 16 Feb 2021 03:41:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc])
        by smtp.gmail.com with ESMTPSA id q21sm4215496wmj.18.2021.02.16.03.41.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 03:41:01 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-jinja2: upgrade 2.11.2 -> 2.11.3
Date: Tue, 16 Feb 2021 11:41:00 +0000
Message-Id: <20210216114100.2022235-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210216114100.2022235-1-richard.purdie@linuxfoundation.org>
References: <20210216114100.2022235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-jinja2_2.11.2.bb => python3-jinja2_2.11.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_2.11.2.bb => python3-jinja2_2.11.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
rename to meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
index 89538d2f272..19a4eee11a4 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone templ
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
+SRC_URI[sha256sum] = "a6d58433de0ae800347cab1fa3043cebbabe8baa9d29e668f1c768cb87a333c6"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.27.0

