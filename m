Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.11438.1621204378096929880
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GbCkov5H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id n2so4530010wrm.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uwGAiuC5omvjbhRaGTR+1LqYMW1F4u3p4svqxJ991QY=;
        b=GbCkov5HNTSTjY2w9JP5HEZa1jCpgPmwMkAWLMub6q71A7V9Zn7ATL/7Tllc4KGAl1
         DyHVrm9ISwH/L1Paaoy9lSItu05SJvVBVQcpfrZbgZGqQchMI8PLxDwZHU56TBIPxntr
         saa1tiwplcddce6GIrDl5Ym4g8eZxlWdHkEYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uwGAiuC5omvjbhRaGTR+1LqYMW1F4u3p4svqxJ991QY=;
        b=LrDYojRHzLIhxkIc0BNsKt7f9q1pPQuVCrUjlKqoSAtDNxUkjfbhxsQo5Z4jMLKeTG
         6/r4Hb1fVsfigM/0hu40PH3bo5Xwh8H3rQA3w0N20KkWliA7IjKgq4ZYul0IBBtQBYnU
         pNc2AUuqS6Mdkhe5POKq+RRegTS9oKo8tkX2NPK5tbL/2bHArVZYFe3U1xuXH52ZUDjX
         w/Go+pg96sJIrI+ISK8eRoT1rvsF8x5C09w7pam4gWhBEZ4Y8JvtMvRfI1xaWfdGD3mH
         zjE1qb2oHXNnmJYl2SKLbMco/kIe/uygXWMIr6Zy0oCzo0T6WBnkvy2sr0zvjz1T2HDh
         JdZw==
X-Gm-Message-State: AOAM533l2mTF6wqCMuctzGTxG6WonNpqwXZ0I4My1brVWOpln4koaDch
	pTDMJIc6aBBc1uT5a/+yTDnWt6BQRAIpyQ==
X-Google-Smtp-Source: ABdhPJwmkwFDmEUafRdAYSC+l2jTXXnTj6cjHzT9UJ5ODM1GlnRALCMOWy26ffmGtkRP7zfSBmmkMA==
X-Received: by 2002:a5d:5008:: with SMTP id e8mr69484730wrt.386.1621204376673;
        Sun, 16 May 2021 15:32:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:56 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/27] less: upgrade 581 -> 586
Date: Sun, 16 May 2021 23:32:35 +0100
Message-Id: <20210516223247.2401235-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/less/{less_581.bb => less_586.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_581.bb => less_586.bb} (93%)

diff --git a/meta/recipes-extended/less/less_581.bb b/meta/recipes-extended/less/less_586.bb
similarity index 93%
rename from meta/recipes-extended/less/less_581.bb
rename to meta/recipes-extended/less/less_586.bb
index 17f8dfb6b90..b300f2badd7 100644
--- a/meta/recipes-extended/less/less_581.bb
+++ b/meta/recipes-extended/less/less_586.bb
@@ -28,7 +28,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[sha256sum] = "1d077f83fe7867e0ecfd278eab3122326b21c22c9161366189c38e09b96a2c65"
+SRC_URI[sha256sum] = "09288d3ec515a21430ec1fbe1e97a2f741fdaf98afc95b114e342416c6a7dd99"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.30.2

