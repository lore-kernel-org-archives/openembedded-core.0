Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F1FC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:17:16 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.48527.1655842613447796271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G8qGT/1o;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id sb34so785820ejc.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZJR5Qn08cdn8uFFMP5KXOsafcJNNZyqizLp/p4+n6Io=;
        b=G8qGT/1oOjryLDNMYiOwH4RobyK0Aj8xPaSOPAbaz5+HPyKN0PcJqzWopBeCZEzzlB
         CWRlqVi4ouIG7/SN5eiGuIk7Mx0re3s0ncV/8Wgfa4wRiDXL66BXqlcRG18TVRO4PY1t
         CA9MWArp4/lxp4LPtwItDcW7AFAnaNQ66gy0NXuC0QIxRD2/6LjBYAk0ImCF7coKuYi4
         CDey5LyAI8SArmHbD5Z+aiXU9i5LM097W64VbbonwRUgri2y7w9MXphguuEbUBfUZPmY
         bCrl1J5QYucEb3r9wv/xV2+75sXun0qsSm46fIu9nTIQobbjIIAavBnaEB6r5VDzxBui
         ebmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZJR5Qn08cdn8uFFMP5KXOsafcJNNZyqizLp/p4+n6Io=;
        b=20khTNVVO1UQx6s7XmxHmMJl5ozWRD6A2A989ivp93x7v9gCY7ZgD6ZQwbS7rdALb2
         oB+mfNqIv4dcQMvXgqYGRjVawzvs16eO5mixTxyVq/FH3RLV1wz2kMlncsGCvGetFzmM
         9l7CuFWlHryUGQDUqu8DkOeTtY9UfLNeY7NgmfJYG6xT2HYk+XQflzSpuUm7pngJcb2K
         3PDJkuagih+WYzyza42KY1kQmM/ekBS7dn6PKYQhUQnL/3HxlMr8+Ir9J9YAj/hCngB5
         9o6Ilat5Uc/lIaCnrXIiFX8gV+4LlWTjKWbclRcqSESZ3ou4M54KDCU8x3uWwUZN9jut
         KBMA==
X-Gm-Message-State: AJIora8jQw2bFajFzZwKo4nehEb9DATb5HNTzwR0gkTqINWhgRfn0CbB
	c6AbPBhnS1Oc/rliD+QcobJbpn2oKpM4kA==
X-Google-Smtp-Source: 
 AGRyM1uO+58zuJqGfzc5N2t6yH0EzWgFFm6QI46aS+1nOGNfVPWgdn3LItcqE0xMrL9090EIKxrAtg==
X-Received: by 2002:a17:907:1c18:b0:711:c83b:8a14 with SMTP id
 nc24-20020a1709071c1800b00711c83b8a14mr26377612ejc.379.1655842627374;
        Tue, 21 Jun 2022 13:17:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:17:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/18] python3-requests: upgrade 2.27.1 -> 2.28.0
Date: Tue, 21 Jun 2022 22:16:37 +0200
Message-Id: <20220621201637.1378306-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:17:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167186

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-requests_2.27.1.bb => python3-requests_2.28.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.27.1.bb => python3-requests_2.28.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.27.1.bb b/meta/recipes-devtools/python/python3-requests_2.28.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-requests_2.27.1.bb
rename to meta/recipes-devtools/python/python3-requests_2.28.0.bb
index af52b7caf5..f71763565d 100644
--- a/meta/recipes-devtools/python/python3-requests_2.27.1.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.28.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "68d7c56fd5a8999887728ef304a6d12edc7be74f1cfa47714fc8b414525c9a61"
+SRC_URI[sha256sum] = "d568723a7ebd25875d8d1eaf5dfa068cd2fc8194b2e483d7b1f7c81918dbec6b"
 
 inherit pypi setuptools3
 
-- 
2.30.2


