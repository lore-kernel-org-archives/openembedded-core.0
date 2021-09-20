Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web09.12749.1632148943017835094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 07:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=jBm9Kov3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id 11so2867830qvd.11
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 07:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gllp8iTl/pZz1AkqmWsIJTz06l+YKkt09F0ZH23fIRg=;
        b=jBm9Kov3irMCEZpZm/hRRJYQdlsEpZm/sa18llL/YMSCkFf+2SKYd+SMeQYdKlOB8s
         hG+hkkOHBbynSaTDDM0F74pb8SL7oW7JajwCI+sbKZ3HXeC/3U3KM2LXm6n+ct8xscUD
         LHge9aLE7bijeNABPiPUa1B+2kxLd4MeYmrEMLASYWb9BY3Q3lijJldK2eXRwbeu6AaZ
         GJjk2nCnx2kZjJRWLA9tfzwsxQ1pw/naqU/lX1cgktRTAEAL61MJvwOWaqyHwVsnkUH7
         ZHMdaNPTnVg5wCj5WtJyXnmqKv6esNVkJwJ9jopm/+YAElEa5lmyxQ9Qz7NVYuMD6qtX
         lYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gllp8iTl/pZz1AkqmWsIJTz06l+YKkt09F0ZH23fIRg=;
        b=BSXTlQSzoTdyCHKz1yaaDcgeosbfk+KOKPCQMws519FEuNo4DdrrJU87mkAZDuJF4Y
         R2U5jC50fCCA4BomVWnoXIYDD8UoNHpAuSbhP9pV8L1xsXx+Hf4EXWLjAU5fRmxKUq6l
         QsdvKt+5q+P7/dEOvmisorhAQhUgPlLmz/uAQMkcV++YOtdv1OA/uLGFfgcMI4f21V1D
         7sN/J39u6KPRuRzct+dXIrxJZGTt8lJ0O0XoSLbEL0ZAM2hmvx+ITZzI7lCUorMAZtKq
         gHmEs+pIEm2OTdOLIuXjfqDb+YIc2yp3uPSS+qFQSogjz6VOqOfW7KjusUHphELIVYPR
         XvEA==
X-Gm-Message-State: AOAM5305NIWGTD3CHJe62PGFgBCn3juIiWE4siUulooLO0Y3Bopm0NQN
	sV9+m2BEk0au+6WFtlyr7zmbtshG9IrQEw==
X-Google-Smtp-Source: ABdhPJy7h8hM0UWVafje18wJ42+rLTWBYqIulmyDSZaASUQp0h+T2ahVlBUrzlQHKnvEhfA65Jhmsw==
X-Received: by 2002:ad4:5541:: with SMTP id v1mr25382604qvy.49.1632148941558;
        Mon, 20 Sep 2021 07:42:21 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a650:b700:28e4:c1fe:577a:5f34])
        by smtp.gmail.com with ESMTPSA id v23sm3833351qkj.76.2021.09.20.07.42.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 07:42:21 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] testimage: remove aarch64 xorg exclusion
Date: Mon, 20 Sep 2021 10:42:20 -0400
Message-Id: <20210920144220.6776-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

aarch64/qemuarm64 has had graphics support for some time.  Remove this
exclusion and allow graphics tests to be against qemuarm64.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/classes/testimage.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 3c689aec9139..82dceedf067f 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -64,8 +64,6 @@ BASICTESTSUITE = "\
 
 DEFAULT_TEST_SUITES = "${BASICTESTSUITE}"
 
-# aarch64 has no graphics
-DEFAULT_TEST_SUITES:remove:aarch64 = "xorg"
 # musl doesn't support systemtap
 DEFAULT_TEST_SUITES:remove:libc-musl = "stap"
 
-- 
2.20.1

