Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210E6C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 13:01:58 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.6836.1639141317578033056
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oZkzO/Ko;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so8946820wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pvKfVOTcbU397aBsNGOgQSy4hE0CveVv9ErsYglMtQY=;
        b=oZkzO/KohFgtWWwfDvFkgQvXfOk5mFL6ekdy2huS5zFkjxdtEf9I2JoxYzFWq8kSh4
         submV3pU+iI45gmDcQtaEb3hrFLqjK5kVPcHClL7GAipUIN0Cp3JZ1xnXpQScudmIF7T
         LbFs4ZjiP3QicN59D3gABhdyk7YBEz0C7fUV93deYq5nzM/Wa8+0P7KFeHIsfvx/3Kv0
         ZsSXYYIUmOdNLHnSO9kTQ1j/oW38Jj+lgl5+kCh7dWiW34bFRtvmgTRnS1F6O2R7VYoi
         PFXqyjMq6D9S46Aq8x0+6SDT2dB5aFVuQVGTy7indroBigIRk+ZI9J62dxJrHp5nfZ27
         J4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pvKfVOTcbU397aBsNGOgQSy4hE0CveVv9ErsYglMtQY=;
        b=vmXXwajHvZiXLt+u6PPI+OWyJ9CZ7bpty0PQRo743IEId+AhWoHdkQvoWVv+vj/PMB
         7hvf9KU8aBxCFcOkZ2p8L+hwBONDY9XLF3AqynOmCrf+XKyyFGpqn5oRx/sQD8D0pooz
         G/21u/xhYmI+KRSU5qjASv8iTZKQUKY9XL7fA1RmXre2aN/fU+ADPJgK12vfKeAl2wqn
         fbiC3zlVzvfmmC0qnRXzmAqHyXQF/4Q7YlQyN8p/NqNfDD8jxWMGy5lsfUXGPXaY7Sqr
         YstY5WjWtnKw52iFi8o5SbwrcShpIM3eKh3HkrT08oj0V3DhWx/dtruZEZeir/XS3zc2
         N8Ag==
X-Gm-Message-State: AOAM530m1kJkpHQQUq/prWRDj/s3nNKSgotYgZlzlfwY78cWY8CCFfUV
	LydLwhaJMotD8kH7pLRed/IOBSddn/QWcQ==
X-Google-Smtp-Source: 
 ABdhPJxgyCVtXkBoysMlgl1y6HY41PDNEBlK2ef0dIxT+9G9zXO5LAy4VARWMXqMDWuEpS7m8G/g8g==
X-Received: by 2002:a7b:c157:: with SMTP id
 z23mr16386767wmi.113.1639141315914;
        Fri, 10 Dec 2021 05:01:55 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 d2sm2899653wmb.31.2021.12.10.05.01.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 05:01:55 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] overlayfs: update notes on /etc
Date: Fri, 10 Dec 2021 14:01:44 +0100
Message-Id: 
 <b5292877770eb95b9bab6a36ca77b4ff4596c325.1639141237.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1639141237.git.uvv.mail@gmail.com>
References: <cover.1639141237.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 13:01:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159516

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/overlayfs.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
index 3c0f4dc882..f1b8086ea8 100644
--- a/meta/classes/overlayfs.bbclass
+++ b/meta/classes/overlayfs.bbclass
@@ -31,6 +31,7 @@
 #   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
 #
 # Note: the class does not support /etc directory itself, because systemd depends on it
+# For /etc directory use overlayfs-etc class
 
 REQUIRED_DISTRO_FEATURES += "systemd overlayfs"
 
-- 
2.28.0


