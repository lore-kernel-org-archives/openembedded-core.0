Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55314C54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 10:14:03 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9259.1664273639223587574
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 03:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LjbFejg8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id r7so14252821wrm.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=bvjAz4uk/eg1ndOqIa9yCPK7L8qnhybmv4DB9wI6JkA=;
        b=LjbFejg80CrYTe0lvC8PIRlbZohkG+JvWN9WXQGJLudfK1Z7ei2O7OPaOdPzn7/0Vj
         GeJGmKt1HKeDqtweOyAMMg4EKH3LbZEfReKgHWd4pgCkHg+7Dj9tH6dcdT/We8rXe8IZ
         HI/XBOgMEoo0Fg3Jw2YLHHLS2z2ur07Z6VOyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=bvjAz4uk/eg1ndOqIa9yCPK7L8qnhybmv4DB9wI6JkA=;
        b=s2ZTJVI+UM+thnNQdKZRcrVz4yhnpqBz+7QdZVfId8WB8uNoyUkvEc8u2LcBQ8FxDz
         +5ekBbYH1EHvxq7YIF0U3WTvyt5YYTzRFiMNr4NDbnZNqTwbaUs1+RwB7O0MWAHlxMt0
         UyfjbedceMr2T+ToabVGcuRNuDSzqVm14cAdF9Zl+GsDEYsPV6N3Yoc4IrPVQJSm9FNU
         zuZYEMK8SOs3dzlmSTmi31KT4kBM2WckImXW6oRDLh+iI3sm4X4OVb4MPsm8htthrwp8
         c+nXOBb4QMb/8R7AVjYusO9GgKoJ9WHgvIhMhZOPlep0p19nCRq8aLT7QyM7JBh/zm+j
         L+cA==
X-Gm-Message-State: ACrzQf0tG+SCGgjAr8CrgikplnbgpCbe+Xo/e4ChASXtTGrbR7S+DzsR
	tnbolVkzBjK497PqPlxGJ0SCNqz0bYc6OA==
X-Google-Smtp-Source: 
 AMsMyM4kpKMmP9f2lFHCw6YK2NskevtZ5+9hfnUlAalrRaWXdQCNc52u9hQFRY5WevoSoc69U1kp7g==
X-Received: by 2002:a05:6000:1d8b:b0:22a:c046:946d with SMTP id
 bk11-20020a0560001d8b00b0022ac046946dmr16307187wrb.249.1664273636973;
        Tue, 27 Sep 2022 03:13:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d4c9:c3bb:4c2d:18a5])
        by smtp.gmail.com with ESMTPSA id
 r11-20020a05600c434b00b003b27f644488sm1220916wme.29.2022.09.27.03.13.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 03:13:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: Upgrade 9.0.0541 -> 9.0.0598
Date: Tue, 27 Sep 2022 11:13:54 +0100
Message-Id: <20220927101354.1952811-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 10:14:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171086

Includes a fix for CVE-2022-3278.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5ff60f84953..cbc370100b2 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0541"
-SRCREV = "ee7c8d999beb847457f768757b1bdcd76391c1f4"
+PV .= ".0598"
+SRCREV = "8279af514ca7e5fd3c31cf13b0864163d1a0bfeb"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


