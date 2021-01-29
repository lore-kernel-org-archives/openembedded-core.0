Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.7905.1611915862496561500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KaIM6Oam;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f45.google.com with SMTP id n6so9928601edt.10
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 02:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8/MddSlVdG4NhtOdoOTqS47QALRyF9GwepZaPfCZXys=;
        b=KaIM6OamaiUiEyO0NZ9a6wh+3pLbdNh1U4Y0ZL+XtO7txaRcimobgGgnpMNktDj0mV
         GbXnrU09WH6rmut6dKAntHzAcQCXbwN8VoWXYjeZzyl0M4Wz0i2pVwY1iUYTyXh/QOL8
         ncU+OHP2rv2YQ9Hj3rGyYsx4LuZnYetvTTdtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/MddSlVdG4NhtOdoOTqS47QALRyF9GwepZaPfCZXys=;
        b=TsjqgLWQCg0tCIUgWCOADxsPCnJ2d8tMkChH5nH2CLDG8+KuJfnrO5i0BP/DRR+8GQ
         sJeTqyIYb3cqNbXdA2A6jRsAWPmz56AFWlN17JwUF0ZLeWEiB6rn74ZoVl/xW9wx4r9y
         sw00wV+zaUi1MfZMxRmuE2j9UOqnYlO0/tKKoTlZchfPcUYRQWIlscZ6j1dr+fGI7yH8
         hfvdVdbT4HECS8CWi9J/dVT7X+6GcyNFdUpTLdMRGwoZCDHLoEtGHm57agQR/RR2DdbC
         4F1Zjg4gdsw/Zv4q+HQo5V0VEpW6s7zxLiqUspBl5kXWL1Nuqtup8dhobbLTw2A2LWx3
         RazA==
X-Gm-Message-State: AOAM530XPBNcRPDqDlFlEpfbGH1qQrpLHfEY/PvlFLJ7h54hl15ZQSrh
	3h8UNpyIFmuB5vrzOEs7l7caXbR+Dii+kw==
X-Google-Smtp-Source: ABdhPJxQcpfs3S3ZQMZ4aYuuiz+TwGNdr1k5vlAeFF46tEoJGfrzcdsXIoQyAXIPuR+WnOduFT1Fgw==
X-Received: by 2002:a05:6402:3130:: with SMTP id dd16mr4413666edb.282.1611915861035;
        Fri, 29 Jan 2021 02:24:21 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id k22sm3554574eji.101.2021.01.29.02.24.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 02:24:20 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/13] nativesdk-buildtools-perl-dummy: Add missing entries for nativesdk-automake
Date: Fri, 29 Jan 2021 10:24:08 +0000
Message-Id: <20210129102419.1360572-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows the hardcoded nativesdk dependency hacking in the
automake recipe to be dropped and matches what autoconf is doing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index cfa41c4ae63..cce086caf2a 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -21,9 +21,12 @@ DUMMYPROVIDES_PACKAGES = "\
     nativesdk-perl-module-io-file \
     nativesdk-perl-module-overloading \
     nativesdk-perl-module-posix \
+    nativesdk-perl-module-strict \
+    nativesdk-perl-module-text-parsewords \
     nativesdk-perl-module-thread-queue \
     nativesdk-perl-module-threads \
     nativesdk-perl-module-warnings \
+    nativesdk-perl-module-vars \
 "
 
 DUMMYPROVIDES = "\
-- 
2.27.0

