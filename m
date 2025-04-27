Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8304C369D8
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 03:17:35 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.20650.1745723818748522251
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 20:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eclA9z7u;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3054ef26da3so3159552a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 20:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745723818; x=1746328618; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wc/JZpb9I01WkScxZifDGeny+GfXjxdfvFxjNwbPxo=;
        b=eclA9z7uaUSI2vkljddPIvYnOGX7LH+9xe9KpbRvZsWu57IZnvNlV/aswU3yuXp7YW
         d0DXF7bhMoiYDnFukKV8HuTds6IRlE4bFX/5jEya+SDkNDe3aHFPsUFHAtPtTMLoHSIX
         SqCiNgCkkHxjrOU6HofGeY/ozn/JFjX8qpSt3adJOB2Ou1w7kLfPWQZhvOuFTTxjXBAJ
         u2nAOkrX/VFf8byltFOu/W9lWrF3ad809nPSTIWpJscb1kHcjZ2LQGjuBtWn/4L+ASzq
         4uBwdgCgZ3nPlqUe6O8CmY1mk1xood6627SFyGZWqrN/zevNQ3zmGVhUg7oLK0Gz2tpj
         3dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745723818; x=1746328618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wc/JZpb9I01WkScxZifDGeny+GfXjxdfvFxjNwbPxo=;
        b=I7y9Iw6Bw9BtG3hU9mPTZGu7+phktTg7A9ZPgU59uor+DpEHTb7BIQvoBmfc1vFgbE
         GxsC1V/1L1VYpwVH/npzKYy5E11vAPpmaBSvE2DkdmqdUnV0+8HXBDrH9h50+VHa83oM
         jBhk1Bn08+/R3r9Jng7TYmnszgdEWDUAI/aUAaNmnNe54Pq7WPNOGKs/4qdIqMpA1MdE
         5hoRJ1Qc6cWBKdlZ6TalnIJR2uJZ3dDuMTxBegV11MlR4aBZZw+AQ+9bDnTxbl8WQ7qS
         ZO3BIndFIOtPaD4DIg67L76HxtH4HSEHCIREjDigvwUYeXXJlyWizLdTr7CvTtmeRHkj
         K2zg==
X-Gm-Message-State: AOJu0YxjxWooH/gjiF/Cq7ddT8DD/y2UTPx9akCPf4+MOLoQXOKlnVhQ
	CcbV1XJoZOEid17uJsgWdLyM9nHq2p78lyElCR7opPBCMS9G7FId
X-Gm-Gg: ASbGncvAAdi/fob9gQPBTXtHnt/SWNrA4LEvAcu6h0HW8gyNHvHQc7bnBA3K/7naK5U
	pFFa3Zuuf/TG4+XoQBolkq+QCJsqp6pjz+ySQgNZTgciwpKlQXLxtmTBKOrWOXDHTzcrpV8xOOr
	UMvoSrTG44OD3Cv1XdOqNUfROCY114p5IGk/qJ8d8FfG2bWR/TUoT26IV6sGGIPHczAYiPIa5cw
	wi4rT4OXaL9OFBdgDxYxe49NlK+AEG+sdyLzgpk/KjpgUr0YzE4lNpriM18ELsriiJqKcmcnDOy
	teFiXyGb+kAp00xWqSJd4qNkWoefyrS2
X-Google-Smtp-Source: AGHT+IEzKH1mNMFJoAc/XvSUNttAwA4D6xzaRUXdQt0sKpeZu+eNo/DpBSh8MArAz3K7QNv7tiOjAg==
X-Received: by 2002:a17:90b:3f8d:b0:2fa:228d:5af2 with SMTP id 98e67ed59e1d1-309f8db2e82mr11472178a91.15.1745723818154;
        Sat, 26 Apr 2025 20:16:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f774e4ffsm4362452a91.12.2025.04.26.20.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 20:16:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Apr 2025 20:16:42 -0700
Subject: [PATCH v4 03/10] sstatesig: Handle special case of
 llvm-project-source shared-workdir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-clang-merge-v4-3-42d205904261@gmail.com>
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
In-Reply-To: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 03:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215534

bitbake-dumpsig or bitbake-diffsig tools do not work on any of tasks
exposed by llvm-project-source recipe. This is due to it being a
shared-workdir recipe.

Fixes

bitbake-diffsigs -t llvm-project-source-20.1.2 do_preconfigure
NOTE: Starting bitbake server...
ERROR: No sigdata files found matching llvm-project-source-20.1.2 do_preconfigure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/sstatesig.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 1f976067631f80d637ba803f49813323d17e7c70..826549948e24571ef57acbe6bc5a2442d6c49f13 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -418,6 +418,9 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     if pn.startswith("gcc-source"):
         # gcc-source shared workdir is a special case :(
         stamp = localdata.expand("${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}")
+    elif pn.startswith("llvm-project-source"):
+        # llvm-project-source shared workdir is also a special case :*(
+        stamp = localdata.expand("${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-${PR}")
 
     filespec = '%s.%s.sigdata.*' % (stamp, taskname)
     foundall = False

-- 
2.49.0


