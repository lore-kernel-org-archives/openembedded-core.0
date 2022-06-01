Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57064C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 10:53:35 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.5968.1654080804111698858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 03:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qwSr1jeZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so1717784pjs.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 03:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=H9mK3HhfQZVXt5Noxn3bjUZm5RRfN+RNu8vJJkNzHv0=;
        b=qwSr1jeZDDR8qKi2PciSo5ZcOPMgt5OO9oWFRLheBbYFos/ZLxC4DA8pSF5scy/f2D
         W5/zD+hK/CMJWdX4BTfm6Uw8zUzllg1cmjFqb4Y/VfM8Saqsn1bA/4UZIWcAqJVnF/K9
         IwkQojkAbXlJ3CvNY/rv2n7u0ucMICRlSXO83I4fHxOHzLyMRsGICYdYT7wXmn5qbpH1
         UWaxtVjMCaTqam7qDrC8arMG8A3s4ocCJMZ94fjlW8yCXbCnWY6X2CJvsU/+BMUu/LqI
         6JLHYbSC55j0gmOdYonTNh5JmcF29XZwP7LfoRGdBJ9rWmr+k51s/lBYoPE7GDlypVKn
         jd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=H9mK3HhfQZVXt5Noxn3bjUZm5RRfN+RNu8vJJkNzHv0=;
        b=jxH5WjfC80riFfjSz88Go6aDoF5Z2HnfVFZQAsO8PmMrlJ3YH9WvDPsqW/urJc0RNJ
         ettEc4V4x9+Zd/DzqOMYbNgQVFu/Dg43JmbsXaIo+HNNfGsV2q0XZJaCWlispabRSVnb
         RnJPijrVJ7ImpVHH7wKKEKEyCmkQqh+0Y47d/52HC1B4SVQJRUpjDMu/+Blkk1rLEmff
         aOul2XGjoedAfFmxNsvmb1mojcE2pZDXxAcmBYVBbU+gIHVVn7y8wJyQ2FweHeFg5bMr
         y6Z8I7HTLTkUW+wumQTKUqNSzD8D0fZUTafmeRLPJE1EV5U+QsZQ0gUx3HmUNWbVGfEZ
         QJfQ==
X-Gm-Message-State: AOAM532bRwhgGgVDjferUvWO5XC7UTRo0s5qeVVoUO3jha7WMgFcDQh8
	l9K91+NoS++N5QSiYWoS7M1U5rXzx+L+3w==
X-Google-Smtp-Source: 
 ABdhPJw7d3Uavp0dkB9MM8nGzH2I8YkPalA+73pb1HRV0lNmkB6wcG4LV9fk+uwCv8/559uTryXeug==
X-Received: by 2002:a17:90b:1c10:b0:1df:f814:6beb with SMTP id
 oc16-20020a17090b1c1000b001dff8146bebmr33358897pjb.0.1654080807982;
        Wed, 01 Jun 2022 03:53:27 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:4ccf:3fbd:a915:cbcd:1d5b:5016])
        by smtp.gmail.com with ESMTPSA id
 q19-20020a635c13000000b003c14af50623sm1074166pgb.59.2022.06.01.03.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 03:53:27 -0700 (PDT)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-core@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][dunfell][PATCH 2/2] libxslt: Mark CVE-2022-29824 as not
 applying
Date: Wed,  1 Jun 2022 16:23:12 +0530
Message-Id: <20220601105312.29861-2-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220601105312.29861-1-omkarpatil10.93@gmail.com>
References: <20220601105312.29861-1-omkarpatil10.93@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 10:53:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166373

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We have libxml2 2.9.14 and we don't link statically against libxml2 anyway
so the CVE doesn't apply to libxslt.

(From OE-Core rev: c6315d8a2a1429a0fb7563b1d6352ceee7bc222c)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad63694e6df4f284879f7220962a821f97928eb0)
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.35.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
index 0f25043743..47a38deb13 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
@@ -19,6 +19,10 @@ SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
+# We have libxml2 2.9.14 and we don't link statically with it anyway
+# so this isn't an issue.
+CVE_CHECK_WHITELIST += "CVE-2022-29824"
+
 S = "${WORKDIR}/libxslt-${PV}"
 
 BINCONFIG = "${bindir}/xslt-config"
-- 
2.17.1


