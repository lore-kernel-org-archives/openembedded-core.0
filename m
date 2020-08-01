Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.4453.1596317035981090264
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2020 14:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WxPxpy6g;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id w9so34823180ejc.8
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2020 14:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dwdwAGfExlF67qVLn1Ig6mGNRzSaxCEKRsFDYNjzd8g=;
        b=WxPxpy6gHFAuQ3ipEXtFwRVx+uIFitKeOO7UxPVG2QO87r9wmNnKEFzyPwEdCVbutL
         /cc6bzpBsknuezLbV1+kU09VcUIPFlFKMmR6VYXv/IEn39UBUz71Z2GvaM1bnN6QYQSJ
         0xfjg0LVKFbT1zgK/d4UDr3AI6dMApyuXmYa/0212spAR4lmk1ghkEs2EXE8RTR8eGKN
         ZdG7ef0oQi4pgjZq5yjQRjaJ3sVOl6IBLfzZNqcnhtHkgy2RWF5RcTGukM3/Pwi1nbGf
         8kNihBJi9QcugIaiZZnimWOnG7bx191dbqfK0Q5Z2Lv+hb/kW9+jQlP6YbBZWduSBjs5
         v+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dwdwAGfExlF67qVLn1Ig6mGNRzSaxCEKRsFDYNjzd8g=;
        b=dtAeSdUADUTvBa3xG1gZuBUbTU+O4Ungj4X3ZsNw4ZBlx2cFRFSgjfOwpo2ggybuoV
         pzaaDGPxbJ3AE+lpIAdfC7xtmM90XSq4FTNmFq26PQeDC2px5HD0HGUxKPhhCv3UgJ2W
         3HOQfCaQExq+ErfswvQ/Wgle2oQkFIjmboZFV5udtgb0mTcB5SMPc1937/0xOmhjwbe1
         kMIeg5iCxcA8XGwqLQic22b17fc/rTFWwMne9BXWcnDlEwm0blKQIqw7jBidvu1HVNVh
         CDVg1udllWvnKqWd1A+L9GImFRLuTD4IUYBtomBZE7JlTrzJbE8hYnrjNn2vkyJkQbhw
         cMkg==
X-Gm-Message-State: AOAM531f9Pb6rDFySbs6j9l+O1YrS8XY4evHcW7QRlliN1adNDQRoTBA
	xTfANZLs2XwfEpR8Zrr6kgKUezk6rN0=
X-Google-Smtp-Source: ABdhPJyoInjpQSvHDgvEqSBebYY4wfZ9yASSrRzuCmsLW+UmYlU5jc1ULXh/uUIeaIPqyyqAeMOvrQ==
X-Received: by 2002:a17:907:213c:: with SMTP id qo28mr6428533ejb.174.1596317034408;
        Sat, 01 Aug 2020 14:23:54 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id cm22sm12168803edb.44.2020.08.01.14.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 14:23:53 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/13] net-tools: fix upstream version check
Date: Sat,  1 Aug 2020 23:23:35 +0200
Message-Id: <20200801212335.14922-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801212335.14922-1-alex.kanavin@gmail.com>
References: <20200801212335.14922-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no tag other than ancient 1.60, so bypass
the check for now.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
index dcc2218e48..e97731073e 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
@@ -16,6 +16,8 @@ SRC_URI = "git://git.code.sf.net/p/net-tools/code;protocol=https \
     file://Bug_541172-netstat.c-exit-codes.patch \
 "
 
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 S = "${WORKDIR}/git"
 
 inherit gettext
-- 
2.27.0

