Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A189AC5479B
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:31:08 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.37995.1747603862703165588
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c81WM8Af;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73c17c770a7so3961834b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603862; x=1748208662; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5fY8IJHzXMxLrAcngeOMfmbFGDVEfnjgLOWHaEIfY8=;
        b=c81WM8AfhVHIihZEMRLSJNE6PuHDuiHIgj5WH05wpevOucDKDhXj6I5HYcmw0u3nXl
         w2nmj28sPkDYMETyXSgYvmNSVKrnZkgMBngtUPr5T3Pz+6X3ZuJ6k608//MeKUw6urSv
         V8tt8tkFSe22lAEmHL+POk+UZilDloEX+oXq4n9bj5H6W4qNzYnHugi5dMEpJ/HBRRwH
         AHNVSEMmZ4lR9ForQ5cPgTWYZROGEaPoMdmdNDSyu0Dj7EIbBTOocg3QxfgSDmIMnEP4
         6yoFa4IBwrTFunWlNHe/mJFxr28fweGx5HQd36dM1mPAG7y/Vmq48OkrWUix1NrAtbGm
         +iNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603862; x=1748208662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5fY8IJHzXMxLrAcngeOMfmbFGDVEfnjgLOWHaEIfY8=;
        b=BsC9tKiDf1+bZW7ZS0LdlD0FNhgBPJiGwoq+B3LxTZahOjEZZZNb1q7GVmkcXnmQrC
         BJjQ00Vlxb1e//Cpm4H1fwqvJMQhvG4Jt+ftrh9O13487/QS+exWiujMb0iDSu9xd7uc
         wvMX7+iXjRvAKlcXCrJTYJ3b5A31BXR5oPR6ZgRyV08qVK283SBE5yxvX2bFj0uHTggC
         3pVOjsDuCkuNss61XRtgh7jT/qPfgu9rxpt4oQ0bXkYfjtkQAuRVL3SVhzsfFRXQHgRE
         fgcNuTf9UG2T7D3z6sgl4/SsipgjvfoYV7BCcGKTGGFZjTHfV8ZI20si3hLcwaYVChA/
         OioQ==
X-Gm-Message-State: AOJu0YzXKV1L4DQnq2UsWGTa7RCQvsFWCuc6Yu0zOhTw1NLLjazzRhAK
	BxGoY54i3Ax/JhOomyHGkCMrHNEGJfDSEH4qE+Sv/+7FiwrL08c7rkHck2NF3tYQ
X-Gm-Gg: ASbGncvOum2rtLDQ5KX8nNM8e0tMJMavWM30y5q6BYj3nFjoxgHo0exeJFnu7DMA1hq
	l05mi9TnJRSbHCeCCRfW8jUDgldgQNjSmSFk9MslVRPVDsk9jZFbfaXAJvCnzDWIIt/lJHfzfqy
	1EEqsRIcGtfMGSabc3OskzbiyqVRARObKx4Js0zlYuB7ADDBDd82vCaHid5fl4hCcaHibItm2nh
	AWhAJHybDL584qWKu5FP+yzWzjx15fRspVBeSgniLf2mGCr86tETEbNmybRTqZXyXoumTDgZIKW
	dn+hcNG29NMdMGwzKRpEBmq9WMovZiEMqwW2I0Z2Ebo=
X-Google-Smtp-Source: AGHT+IHcRL6i4lkGWkjiY/rMQMIL/qfWcZu5URIQnITPGQoGA4h7yAp09sXH8g4XsdTNrBX+WQTraw==
X-Received: by 2002:a05:6a21:3392:b0:1fd:f55f:881e with SMTP id adf61e73a8af0-216219f90f5mr18595247637.36.1747603861892;
        Sun, 18 May 2025 14:31:01 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:31:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:50 -0700
Subject: [PATCH 15/21] pulseaudio: Treat -Wunused-command-line-argument as
 error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-15-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216799

This ensures that it does not enble SSE when -msse flag is passed, clang
warns about unused option on non-x86 targets but it must be flagged as
error for configure to notice and fail the check to enable SSE on non-x86
machines

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 18c12ede630766bb9204bb1d5efb7cea8695dd1e..3c65aaee6e02cf417e3165c194353883c453aa00 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -71,6 +71,9 @@ inherit bash-completion meson pkgconfig useradd gettext perlnative systemd manpa
 # if using --disable-nls
 USE_NLS = "yes"
 
+# Helps tests for -msse fail on non-SSE architectures which is all non-x86
+TUNE_CCARGS:append:toolchain-clang = " -Werror=unused-command-line-argument"
+
 EXTRA_OEMESON = "\
 		-Dhal-compat=false \
 		-Dorc=disabled \

-- 
2.49.0


