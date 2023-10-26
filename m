Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83BBC27C46
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 10:51:35 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.67715.1698317488051200511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 03:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z7zI4Bzt;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-32003aae100so1158399f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 03:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698317486; x=1698922286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTp5QA5TbDz9Q0jXvySpmALbirQj/0MbAjRJ8lkpiBo=;
        b=Z7zI4Bztv4+iFc6N4rRdSdwDZoqXLLBoOhzAEcLBYkHb74rohQP1DzVa5t0KDvrc/6
         gXA946GbFcA0ih3nYrdbSiTqCuco3KEExr5n0SrAO4Q8KL9bFTMaB4Zj9uGwvIwqDrKL
         y6g9hGdfX/lJukOUlSZ6OEaCxETg+Xy3EfDCq/f3miSWmWMtC3Yq+qDmvigWW+3dRSVo
         r6K0YKQUhb75/Ll3xfqcvNUnchLgzmz0/VPrQBp6gqpmCPVDxrpx8f+lN6xcBzc5PPd1
         aNN0+P8BrkGtu2YUD4WD5WQqH+FEsGsHzhQwBJ7weuqeL00vh6aV5m2xqEvvKo/FSpQV
         JcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698317486; x=1698922286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTp5QA5TbDz9Q0jXvySpmALbirQj/0MbAjRJ8lkpiBo=;
        b=Q1u7rNPQgQVCaQfCyro9q74kwwymr897S0OVJaxUteHUmDbmtEOpPI+ZxNEcjvFp6b
         Bfn+Hsb9bA/9UkxuebKbkZ0hsTBnIstlXTPNLJibmyFWEbDeW8nGY5UjMYLusjgHS81+
         M7UIXI4HV8xujFTxngbSOoFCVSmtnjot9srod7j8WtQ9GD32nttoFIjPIQyZmjUxXS7X
         03EiTI8Nael5xZT1yOmjFnIOnrm1aBfD7hubqMlGUNMr75zcaJ5oYMCYwftK7IFMcHFL
         iHYmIIF928kyQEtAqMiWEwEr+fsftT5vQ+a0tI51KfzN1hN4FBZ4IqyZ8+C6vy/Y+IX9
         OXYw==
X-Gm-Message-State: AOJu0YzSwivHsVNEqJyusDV8R6i/a0IkrnPivn3mCZpOqB59XHwwjdhT
	FWExSc1dHolCZ9w3AMft8u6whqjwNPz1Vw==
X-Google-Smtp-Source: AGHT+IE306tgMR9DmYZD1vMX48YNbiWgdMGkNC+K09dM/mOTqt4KnzfQ8ON7OegLcxz3Xk0NWKWAVg==
X-Received: by 2002:a05:6000:2a9:b0:32d:dd36:3eab with SMTP id l9-20020a05600002a900b0032ddd363eabmr2531846wry.19.1698317485656;
        Thu, 26 Oct 2023 03:51:25 -0700 (PDT)
Received: from localhost.localdomain ([31.32.81.187])
        by smtp.gmail.com with ESMTPSA id f1-20020adff8c1000000b0032da75af3easm13936004wrq.80.2023.10.26.03.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:51:24 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [RFC][OE-core 6/7] README.SPDX3: add file
Date: Thu, 26 Oct 2023 12:48:46 +0200
Message-ID: <20231026105033.257971-7-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
References: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 10:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189717

Add a specific readme for SPDX3 with open questions and other notes
related to the PoC.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 README.SPDX3 | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 README.SPDX3

diff --git a/README.SPDX3 b/README.SPDX3
new file mode 100644
index 0000000000..57f98756ab
--- /dev/null
+++ b/README.SPDX3
@@ -0,0 +1,42 @@
+This repository contains the Proof-of-Concept code for SPDX3 support
+in the Yocto Project.
+
+What does the code include:
+* The SPDX3 generation with JSON-LD serialization, still using .json extension
+* Implementations of the core, and software profiles
+
+Here are the known limitations:
+* At the time of writing this code, the SPDX3 specification is still undergoing
+  changes. Especially, the root element has not been yet decided. Because of
+  that, the code might require changes when the final specification is
+  released.
+
+* Some parts of the SPDX3 require clarifications. Current issues:
+  - Software.Package.homepage is sometiemes also called homePage: need to
+    confirm spelling
+  - Core.Relationship.from needs special care in Python as it conflicts
+    with a built-in
+  - should suppliedBy be serialized by an array or as a single string?
+  - In examples, SpdxDocument has an attribute namespace. It does not in the
+    documentation
+  - what is the equivalent of the documentNamespace that was in 2.2?
+
+* SPDX3 introduces modular model, where content depends on the profile used.
+  The configuration of profiles to generate needs to be reworked. Today,
+  generation is gated by variables shared with SPDX2.2 code like
+  SPDX_INCLUDE_SOURCES. In SPDX3 it could be done by enabling specific
+  profiles and variables like SPDX3_ENABLE_LICENSING or SPDX3_ENABLE_SECURITY.
+
+* The implementation includes data similar to the YP SPDX 2.2 content. SPDX 3.0
+  has additional profiles and fields that did not exist in the earier version.
+  The project needs a discussion on what is useful to include in the YP SPDX.
+  Additional profiles and classes might be implemented to carry that data.
+
+* The security profile implementation has been prototyped. However, some part
+  of the needed data is necessary from the cve-check database (for example:
+  CVSS). Obtaining the information is possible, but will require dependency on
+  the cve-check to download the database, then refactoring of the cve-check
+  database accesses so that they can be done from other classes while keeping
+  correct locks. Also, VulnAssessmentRelationship requires classification
+  of fixes as "Fixed", "NotAffected", while YP cve-check has only one category
+  for both. At the moment of writing this, there is a patch on the ML.
-- 
2.42.0


