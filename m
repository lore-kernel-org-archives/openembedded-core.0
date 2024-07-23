Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A712C3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 11:53:51 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.42245.1721735629887257442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 04:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NgoMm80e;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4266ea6a488so46998105e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 04:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721735627; x=1722340427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXXeRNeEmoq/p3Ku0ko9Jhovzn3sLGnI24diyCyHrsQ=;
        b=NgoMm80emIlE/K/yKbpUDptnfrI1z1wxogEsDGlAS3L3cU85I+EpvKH2S3yJbs70ce
         tu1/OFEHw8EKa0Bs3O6r8sU4rEB/J8DfiblQw3FdDHsMgLm4I16dKkWbWNaaqircFjPv
         DWI+TdHqWebVT9Z/ZXlfk7fUp3FmHVXDMIbYW0ObEp/tnyGa8xE7gLcVNQ9kniawC0Vl
         cH8mCh/ZAnQw4aCd2uG58jOFSjSWflErpTMgigbXhZXjzbctATuSrOJwnsW+aAxrIV1R
         qF5UE+y4zMqcRjuJq10GnDUZgseUTNgFCom8MKnF/ECdH+n2vKPV6wuhh7mml3wTu3EP
         +q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721735627; x=1722340427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXXeRNeEmoq/p3Ku0ko9Jhovzn3sLGnI24diyCyHrsQ=;
        b=jM7InUhRz4qKtzYdcvPUznKGvGkB/fCC6NLgRhGyLCOpv7Ro68IYzMXafo4Sr7z+V+
         tMKWe0o/2hZ0YV2hYAjbVmr+7Sq5fR4+BUcIzqZ55KOfRlNtIrxk26aJMf2yhjIz2HFV
         ImJDrPL4jGctrwrtoItKKzMgGyractRJD6G7Au+Q9QXdrJkvNX1UL/pmNt+xHklUwfLc
         IbADhwhBo6tUvBLpzwara1eLLEBqNniAD4S6YhteyGD6KDpOvsd3FgFgpOH8EejtgQgS
         qrqQo4teD601lyVHAxnNs29sJK2c93AOS4wa+DIEjCEg/QAVbbaVmi8cXiLuHB+SX/Im
         7EuQ==
X-Gm-Message-State: AOJu0YwJttuAUTRLbBfgppLye/2lwuMG1LQyagtxnCkgHz9tHT78JLN2
	TGakI4oBQxHvqte1VufHNZmppo/FOv4gRAlL3vM+gD4wo9R0c62yzk4S1g==
X-Google-Smtp-Source: AGHT+IEWdYKw6RAFR/TMweRw7+yMY+0hhg4gR3NmivaOvHk0hX/cSDINL+5ce2VGswU6bS7YPCEkPg==
X-Received: by 2002:a05:600c:468b:b0:426:6714:5415 with SMTP id 5b1f17b1804b1-427dc55bc31mr74838915e9.30.1721735627562;
        Tue, 23 Jul 2024 04:53:47 -0700 (PDT)
Received: from localhost.localdomain ([80.215.234.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6900caasm168537075e9.11.2024.07.23.04.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 04:53:46 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [OE-core][PATCH v2 5/5] cve-extra-exclusions.inc: add deprecation notice
Date: Tue, 23 Jul 2024 13:53:15 +0200
Message-ID: <20240723115315.207013-5-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240723115315.207013-1-marta.rybczynska@syslinbit.com>
References: <20240723115315.207013-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 11:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202340

This file contains CVE_STATUS without machine-readable information on which
recipe it applies to. All entries should be verified and, if appropriate,
moved to their corresponding recipes.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index fcef6a14fb..71c5bc31f8 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -1,3 +1,6 @@
+# THIS FILE IS DEPRECATED, DO NOT ADD NEW ENTRIES
+# All entries from this file should migrate to appropriate recipes.
+#
 # This file contains a list of CVE's where resolution has proven to be impractical
 # or there is no reasonable action the Yocto Project can take to resolve the issue.
 # It contains all the information we are aware of about an issue and analysis about
-- 
2.43.0


