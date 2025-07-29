Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB57C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 01:49:52 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.2932.1753753792125970627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 18:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ksn1obgO;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-748e63d4b05so3108358b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 18:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753753791; x=1754358591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3CGpbR8LnfespAnTm5fd2eay296OlcVuoNl7ePywiNE=;
        b=Ksn1obgOV6fL4oEy1qTBsMKHQ5Te3Hbyqgw55itf7E+pTqEm7LKCREIjsIwi94mYtG
         COG0oY0sSUM/CEbkQ5tcklZc6tv9NJ21BfwA/dWJU2Isa8MjAcwDVPnXBvM4l/LGpa5u
         rkWyV5O9YvkTpvsZFEon6ZO/0vNJHFGF3xObha7cAyfEZ+mrvPlyypnbgyFZSwx8/yt+
         4petq0t5ujXZTxx04OKPJYDucxkAKImejUIUmtgFxcZvi2fHwdPtj69N+0gVbjCoMN+P
         yB11HzbGvIloS2DX7OCJ4cX6PkfCPLS2/RRW2lMAkAf2kCKoMBvn+zsg/qxnWCuh23sq
         WA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753753791; x=1754358591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CGpbR8LnfespAnTm5fd2eay296OlcVuoNl7ePywiNE=;
        b=cKQ8o3EjOURbJQwr/v9pwuDGOkS/DStq/IhqgRYm+o8TlJgYgpQH+952Tge3s3kiYw
         CNvdXAqT6Qukt34W/h29/1VvUHktv/2dQFp2Wa6QjS4wjZgh2/jeWS8s25pkkkIA7wcA
         opxsYa5VTD2qlh+QG8H0i6FuW9rHMKZobYrESvr5eqOIduay9unro+Z5KkGGZI+XiraX
         AIf/2Y6TtXTUUfXG5+ElSdJG5PJNtd7dSv7K91AduKV1N+aKgCEQcKTMSORyWEqO915+
         8Juvc5N6EFfh52M8LZESD0BtljvxkLngGtMHqP7FaCkuZms6SnQ5GrG3e8ce9QhGlphj
         Qllg==
X-Gm-Message-State: AOJu0YxsB82xIa3f0k9vBRDRLNkEGlvEAnZUpLTX74GR5Y74H6cXIPPL
	wFOeG0mRBW0LluWm6lKikM/tS00NuWZCY/Y7XWK/bLuNv+pNk/F9wCh7P3EPYj1B9ew=
X-Gm-Gg: ASbGncuy+G8cWTHeJAV4uUDoWM2bNg91AJVVmirxo6SBmHRRLIcBQnrFt14VOG8yQXe
	52oqv+SAjndbgQScWIBFF1biYxyCh+8vOqBmLQ3x0mw9legGmUTlTYxYvrc5hI9s9a7aXqJ7zYZ
	dLTtw0pHN28p3F1nUgXXxNDjN1BOrUAU7LEQp3p+oteNrQXfJNj86UxTK6A+ikePqmpTQThHWYr
	ximk/GqqhzQnoCwG/OTq6NhA4IyfkrIBVRhhds2e+lKJ1Lz5BHEApAO2Y2jQVbx4jSQy1PHZdE9
	Z2c7qCOD0PNXTx0OspbeUCuhMAkgew6QHXW9BWuvw8OfN40BU/Or4GaWlCL+jD1cmquFXQznVXt
	2qwfNveEOybEoHw==
X-Google-Smtp-Source: AGHT+IHnOyvlSGxxnRWgKFtao+CUb2dJFxeMlRZ9Wom+QizHAR82/qRjpY+7SPjCyqM36wCQTPVFZQ==
X-Received: by 2002:a05:6a20:6a09:b0:234:cd25:735 with SMTP id adf61e73a8af0-23d701d6270mr22005019637.38.1753753791056;
        Mon, 28 Jul 2025 18:49:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b2dcdb4sm6490550b3a.100.2025.07.28.18.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 18:49:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Refresh CVE backports after 2.42 release
Date: Mon, 28 Jul 2025 18:49:48 -0700
Message-ID: <20250729014948.2625032-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221027

CVE-2025-4802 is already addressed in 2.39+ [1]
Other two are part of 2.42 release

[1] https://sourceware.org/cgit/glibc/commit/?id=1e18586c5820e329f741d5c710275e165581380e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.42.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.42.bb b/meta/recipes-core/glibc/glibc_2.42.bb
index 56d974e8986..f9c1cdc2f14 100644
--- a/meta/recipes-core/glibc/glibc_2.42.bb
+++ b/meta/recipes-core/glibc/glibc_2.42.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-4802 CVE-2025-5702 CVE-2025-5745"
+CVE_STATUS_STABLE_BACKPORTS = ""
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

