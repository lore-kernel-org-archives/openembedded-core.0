Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B11DC433EF
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 10:17:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.13595.1653733020798096102
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 May 2022 03:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MLCZrD4T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 v4-20020a1cac04000000b00397001398c0so5820984wme.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 28 May 2022 03:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYgKoWVtlEZNz4HvLANgUAa3TmrrK0F2tkgnX8eSKMY=;
        b=MLCZrD4TuYJAPVjylgXWNR8iQc2EeJyGAB6WRKoaWVmN/29xjDK99nwhIy5HnFwssb
         tperO6hL2PEA7TVyCicEmO0V4sRJSiwXdWL2t/mh9m4624WWVJ+cfZY0dvMIg1IAlwXz
         HJ/wdxPKLd+WKqaf+0VN7REJsGpQVEqbnUWzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYgKoWVtlEZNz4HvLANgUAa3TmrrK0F2tkgnX8eSKMY=;
        b=6fBMEP9ec5Yfx2e9BxUIG4HwlmAKVDsZva06R93dHPwM1F26wlts77ijwddnqyGV37
         Fn/k+yZCzcZ5ZMfizsTi4hw0dDJ3Z0tRz+b0xjPojvMVZyVXPL+WnHjhDtXwThUqU3IR
         KVQamdChCMf3mB6vQyWZMnS3T0hj3CWfOGsZrWJes5Yil6PIooFsymsembxebKOxGqmw
         NUsWJSRLdC2hS32BhzLXim2LinFpRQerC1SEwGoa5CGSezftjSx/POl436P6cPppcMkw
         5cQKZx569QOWUyGSM9A37WFpBHGMAbwNknyGVQkEmDP6+vknhefchXiiDVu563hRxEKn
         yhOg==
X-Gm-Message-State: AOAM5324FxjeRcRS9TiDnObJphwEAP+MQkwbGygyPS8aHJTvWpVbLCGT
	dkbiiP19ZaP9o1FHrUoq8z2VpC+ENaCEOf7Y
X-Google-Smtp-Source: 
 ABdhPJzFDA3NwWAJH3zUNVAWhp+FTa//cU0asquq08yCz4duL2LQMxhkuEO0Qql53FEWV08ifOQQTA==
X-Received: by 2002:a7b:c14a:0:b0:397:8672:61a3 with SMTP id
 z10-20020a7bc14a000000b00397867261a3mr8162728wmi.136.1653733018851;
        Sat, 28 May 2022 03:16:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41b6:b722:6b4c:6704])
        by smtp.gmail.com with ESMTPSA id
 t22-20020a1c7716000000b0039749bab534sm12865038wmi.1.2022.05.28.03.16.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 03:16:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libxslt: Mark CVE-2022-29824 as not applying
Date: Sat, 28 May 2022 11:16:57 +0100
Message-Id: <20220528101657.508831-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 May 2022 10:17:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166226

We have libxml2 2.9.14 and we don't link statically against libxml2 anyway
so the CVE doesn't apply to libxslt.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libxslt/libxslt_1.1.35.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
index 51cfb2e2811..2fd777766cc 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
@@ -19,6 +19,10 @@ SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
+# We have libxml2 2.9.14 and we don't link statically with it anyway
+# so this isn't an issue.
+CVE_CHECK_IGNORE += "CVE-2022-29824"
+
 S = "${WORKDIR}/libxslt-${PV}"
 
 BINCONFIG = "${bindir}/xslt-config"
-- 
2.34.1


