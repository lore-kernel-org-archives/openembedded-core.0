Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FFCC5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 16:25:46 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.1043.1709137543941332712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 08:25:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uefiPZmZ;
 spf=pass (domain: konsulko.com, ip: 209.85.210.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e57ab846a1so231298b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 08:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1709137542; x=1709742342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w/8CWDjPgSnMwTQTfB8usxaNPQdTLVawhCa5QvQQlY0=;
        b=uefiPZmZ0fzcYmCiJCfHFrqXyyBdWnRjLBkvP3BS1mw+xKt2Sg4bL2lRJIK9HXii9A
         GnAXgPtPJvh2wl7cTri+B4dKEGxNZxC7hkVl/M8C6PF0k/C07Bt27Po2LWRy75bJWnuG
         uLeD8lOuDLrZgWy5/iJ5vhJXXzf4kjuzjczKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709137542; x=1709742342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/8CWDjPgSnMwTQTfB8usxaNPQdTLVawhCa5QvQQlY0=;
        b=v8wWTzIyshY1rZFMUr98+B96D368ruxHSyVrZbkqnnuHkMTtCPQ3FxEeNdwu3Xa8Rq
         hXfm3pqHWbg0PZQJKBL2EMMDzJxc5Km0CFMkIo1chRB9ZkgvMQATy+WFGls60Mu6GwEV
         RYkbfR2BWKV+PR7HGZTpKHJlcULINpfZfdoF/6oOCjjEmFqByjPJtX7kcm724MYfSxaB
         OQhdCXzg+pJs/1LLa0fB3BZ+yhDz+21jUTLjS3bXxHYwWjd8BSAns8yPcH7LltSXXzdl
         lY8iW7tMvKW6FaSRkcAZb6uQsSfMqYe8EX7jaMqveWbfLQ6rKU3gnl0TxWuSNcqOj8jR
         GtAw==
X-Gm-Message-State: AOJu0Yynoni6ETgLs/3jPUWZweAuqhzir8zvRmFgZDbq7yoiJWVzCto3
	cytgWCqp1JCYVuoMZuxP1LE4zXSaARSBVKYYjOzNn28htaEXiCCYXO4RPoGQ90Un9qzUOiN1q1L
	4WYI=
X-Google-Smtp-Source: AGHT+IF864FxsG+8mEacBhGiHBiyT0Z7vrhYaWcgo7M0YBJY7+eEkpvV39n1v6IeB/xdC5PvtxjfdA==
X-Received: by 2002:a05:6a21:3181:b0:1a0:726a:6e44 with SMTP id za1-20020a056a21318100b001a0726a6e44mr6840588pzb.3.1709137542580;
        Wed, 28 Feb 2024 08:25:42 -0800 (PST)
Received: from localhost ([2601:1c0:ca01:19f0:66d:9357:18f1:1e88])
        by smtp.gmail.com with ESMTPSA id p16-20020a17090b011000b00299e946b9cdsm1898386pjz.20.2024.02.28.08.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:25:42 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 0/1] python3-cryptograpy upgrade to 42.0.5
Date: Wed, 28 Feb 2024 08:25:30 -0800
Message-Id: <20240228162531.543971-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196395

This upgrade fixes CVE-2024-26130 and also upgraes the pyo3 crate
to 0.20.3 which fixes builds for ppc64.

Supercedes:
"python3-cryptography: Update pyo3 crate to 0.20.3"
https://patchwork.yoctoproject.org/project/oe-core/patch/20240227175138.2843184-2-raj.khem@gmail.com/

"python3-cryptography{-vectors}: 42.0.2 -> 42.0.4"
https://patchwork.yoctoproject.org/project/oe-core/patch/20240228073818.2520528-1-soumya.sambu@windriver.com/

Built on top of current master-next, sans "python3-cryptography: Update pyo3 crate to 0.20.3".
All ptests pass on qemux86-64 for core-image-ptest-python3-cryptography

I will also sanity test ppc64 build, but am sending this now so it can be added to AB builds.

Tim Orling (1):
  python3-cryptography{-vectors}: upgrade to 42.0.5

 .../python/python3-cryptography-crates.inc    | 22 ++++++++++---------
 ...=> python3-cryptography-vectors_42.0.5.bb} |  2 +-
 ....0.2.bb => python3-cryptography_42.0.5.bb} |  2 +-
 3 files changed, 14 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_42.0.2.bb => python3-cryptography-vectors_42.0.5.bb} (91%)
 rename meta/recipes-devtools/python/{python3-cryptography_42.0.2.bb => python3-cryptography_42.0.5.bb} (95%)

-- 
2.34.1


