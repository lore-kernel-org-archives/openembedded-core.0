Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F53CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 14:33:00 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.127388.1697466772338239710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 07:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BQSHTxCJ;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ca6809fb8aso5813275ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 07:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697466771; x=1698071571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HKk4x7ynHgsL/3mIZPBIdgYQPIqXzK6ws7JubzCd7ws=;
        b=BQSHTxCJLvhKj+eONHwEA5seGy3Sb8HXiAvxak9muVJvOsBs/pr/cWDFaQhyGo8Jul
         mb7ct8qoAyibd3D+1xCxWfoT0cqiO2y7sV1/bvqxWbMwY1pzmiPqG7HeiynwKZgsM6C0
         ZrhpWnpOZIbYEcT+mnttpvCQuU6VwyqvpfJy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697466771; x=1698071571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKk4x7ynHgsL/3mIZPBIdgYQPIqXzK6ws7JubzCd7ws=;
        b=V4ndo7UmE9DcVHH5fr9RLXzUWUKGExydoQI6hu56ODJMh+Gs8bODcdsHvVbsRqhoeF
         pF3DBXO6SkZjsDvx8hB4ggBQit1RI3FcGkGcKfmswSXG7Nstu7G6n2BOMVUwALiOT3yM
         CUfpSOr8LLe5hWQpQqiqvtWJXjs2ubJT9Tfgwc9VqUWtfid18k+O3Z9EoEcfCDKuRAOE
         XZ6sZ9eq5FltlptkwduVtp0ht+JX3S3nOlNCjkblUjQz4Y8aA6BEgB7MrDQvZ9N0fH8z
         dDAq7PwnpnhwkOMFr+Ga8YM7GtH+rIGom/JcrIsDXOL+DlEMipWGc4DuNIXKtsR2DPCm
         SYAg==
X-Gm-Message-State: AOJu0YytPOCpr6ir9BYnT5g79fAFKU9deMaSROv4yUFAJj6hV9JOwLRz
	v78LcpLTsYfeojgJKsOkjUYmxQxool9an/v7cjs=
X-Google-Smtp-Source: AGHT+IHPF0ByBGALZkSwM6rhM9+bX0l46eEeXjsCDAr88Uohq9rMOmwhb27uSElV7Rgn54reNMovWw==
X-Received: by 2002:a17:903:230b:b0:1c7:3558:721a with SMTP id d11-20020a170903230b00b001c73558721amr39834537plh.58.1697466771324;
        Mon, 16 Oct 2023 07:32:51 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.79.139])
        by smtp.gmail.com with ESMTPSA id h24-20020a170902ac9800b001c3be750900sm8588138plr.163.2023.10.16.07.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 07:32:50 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [OE-core][kirkstone][PATCH] libxpm: upgrade to 3.5.17
Date: Mon, 16 Oct 2023 20:02:43 +0530
Message-Id: <20231016143243.311750-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 14:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189294

From: Siddharth Doshi <sdoshi@mvista.com>

This release fixes the following CVEs:

- CVE-2023-43788
- CVE-2023-43789

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../xorg-lib/{libxpm_3.5.16.bb => libxpm_3.5.17.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.16.bb => libxpm_3.5.17.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
index 28a775c5f4..7bc494a690 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
@@ -23,6 +23,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "e6bc5da7a69dbd9bcc67e87c93d4904fe2f5177a0711c56e71fa2f6eff649f51"
+SRC_URI[sha256sum] = "64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


