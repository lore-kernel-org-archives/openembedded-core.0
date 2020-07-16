Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.3259.1594933704393302660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TojGnYLE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id f2so8575317wrp.7
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JdV9d6yeJbUfcVARKURuSif0lLiY+J67LzjXPrc3nVg=;
        b=TojGnYLEz3I6zRt6st0NCCl9hhxFISXIy64PqjShNIw/uU7Th4L/IFucgD6de5uK0H
         48M4T+zzCsZYN23JusvuD2N6pB1WmXWloaVpQFSMZ3rLm6AKKo9y0u0WOH1n+3Nn/skt
         d/ncWGSisW1R2O6QrzghmuB3R8pMNx4E8A8Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JdV9d6yeJbUfcVARKURuSif0lLiY+J67LzjXPrc3nVg=;
        b=BeYKgzgQQLXAJjbdq0RnDc+2DHcj/ycaIdthaTR7cpeWF+UFHPGx/aJnlmXfRghjiQ
         SbLU5e5lL4UIJSZ8N/s3V19qhyWfKfzJQmgKRMdC5WCg5u7jsN3b11VnGvZOEN0lOr8+
         oRrRGsa7dABcmVwAMDc69i5xVE1ujv88HwUkQRfCFA+VlonLfoA0RpK+i6L+UERqCAuB
         mUpEZlXiX4hglcMQMZ2EnR0vDJRuoXnJ24JJYlb8oumWwf7/lAGgkCgXHIkuF2sfpJQZ
         Il56XCb8civO7TU/hMvsZ3lckyTC2sKXVt2ajoU9nQyyV1VaZ9n/e+tR8cS8djnea35H
         F7eA==
X-Gm-Message-State: AOAM530K+7lG9V62M4K2Fv8Az31VQS1+KYL8I3B/W17Q2uxHyl0s/FZg
	vZhpqrKBKz9LmgoM8Hgbs9JuRG4mCHaTjA==
X-Google-Smtp-Source: ABdhPJwhXgLg1GLEYhUx24R7GqzNYbSH6IyHnTqvLaJNtRkZwldp16+O6x1Ier65XzcfB6IR6w1J4g==
X-Received: by 2002:adf:ec90:: with SMTP id z16mr6821681wrn.52.1594933702742;
        Thu, 16 Jul 2020 14:08:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:22 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/20] stress-ng: upgrade 0.11.14 -> 0.11.15
Date: Thu, 16 Jul 2020 22:08:00 +0100
Message-Id: <20200716210808.7438-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../stress-ng/{stress-ng_0.11.14.bb => stress-ng_0.11.15.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.14.bb => stress-ng_0.11.15.bb} (89%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.14.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb
similarity index 89%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.14.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb
index f1d91da2b48..8ea0476db5a 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.14.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "b21436fdbd9dc482a3fd95ae27cccf0097d0f226361ea3785215f7a4ad50136b"
+SRC_URI[sha256sum] = "6a333650fb5c85c5221f10d2cf890e9fc56530696e118d975fbbe96126c06963"
 
 DEPENDS = "coreutils-native"
 
-- 
2.25.1

