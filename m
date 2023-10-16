Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C640EC41513
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 19:45:02 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.178233.1697485502043268961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 12:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=GZ/oFM/I;
 spf=pass (domain: baylibre.com, ip: 209.85.160.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-417fc2da919so34609481cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 12:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697485500; x=1698090300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0Zc41nDmTLgp+bYVmAlKp+Puq60bP+gQE4CLKgUpKY=;
        b=GZ/oFM/Ih+kFM+ZoyuJbEvanQn9kr4GAoWpg5gZT/qmKbguSeKINMLr6y06go6Kzhm
         46/vzpTQjm4zRjuC5U7Tqe4pmmzUhTGlJKMUYPFCPIr1B3fCsscdjgGK5ibVMUotbbob
         7j2BpHmfI4Usd0yZNRuh1f96OgbybrL9hlMUiULqmE1fSH9JLEKxTBP2pBT3bwdUuso9
         oev8YSgYe0d+7KWQqe1lt0w/FTSZR6m8QdYba/B3tMghO2ncIcA8IDvgCni4Js1qlUTg
         rdzAXa6H+A63ygEbNGTN6s0oOW+Q0bxcQkJGZ0sq6ymp+5x+9L93znQ2KLv+lz5v4IRi
         LLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697485500; x=1698090300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W0Zc41nDmTLgp+bYVmAlKp+Puq60bP+gQE4CLKgUpKY=;
        b=fzqNkvZsf5ui6uij5Uxg+oShFCQcuhdnFVqtqrQikfvyCmOc9uQuejMHdf1+yMhqwm
         0o7d2bRIvtpqpwUJ98Ru4CX01nYKfxVWHE1IdTPBc32dQq/60fvSE6n8d6F8x2lbUB7P
         bs3trcRJceO7yde4Prv+B+BdC645fpqWWm6tHNFm+GlPiW6y+Vbf32yGQVlHcT6LfFlI
         Qca1UpNV0s+pp+BTGlxlw19b3pYuDyRSsOBuESUUUzqKmJtZYJKsO/iiphDQ/UeEFICP
         Q2/idVoB2rODwBFjBLER2r2XKnTo24Yww4yhe05CCPPDPcpevLcMukNcDTfm9pNuNGjc
         JGPQ==
X-Gm-Message-State: AOJu0YyudcAFouxkBvbrzK45HnVJbQ3hjuMhtB/Qp0InBUd4867zVQOq
	IC9Jm51zMiZHMcng6t0V2pSLzS3ZySne3IwgF4Yf4w==
X-Google-Smtp-Source: AGHT+IGmDFMtGKPEEEF5Y0Eif6v+ECroKFSRHNqD8ZkXaszfhyDOVgKEOX0FxjqdWeeZ3MMzjVnezg==
X-Received: by 2002:ac8:4e84:0:b0:418:bdf:f4b with SMTP id 4-20020ac84e84000000b004180bdf0f4bmr479639qtp.6.1697485500652;
        Mon, 16 Oct 2023 12:45:00 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id l22-20020ac87256000000b004033c3948f9sm6733qtp.42.2023.10.16.12.45.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 12:45:00 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/4] patchtest/requirements.txt: update
Date: Mon, 16 Oct 2023 15:44:55 -0400
Message-ID: <20231016194458.2243201-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231016194458.2243201-1-tgamblin@baylibre.com>
References: <20231016194458.2243201-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 19:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189310

Add git-pw and boto3 to the list of requirements for patchtest.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/requirements.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/patchtest/requirements.txt b/meta/lib/patchtest/requirements.txt
index 785aa469f69..ba55ff905e2 100644
--- a/meta/lib/patchtest/requirements.txt
+++ b/meta/lib/patchtest/requirements.txt
@@ -1,3 +1,5 @@
+boto3
+git-pw>=2.5.0
 jinja2
 pylint
 pyparsing>=3.0.9
-- 
2.41.0


