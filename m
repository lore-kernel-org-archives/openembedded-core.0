Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.9142.1621603772024231755
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 06:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fgbZ3Spz;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id o21so20107958iow.13
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 06:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0+QZehCLD0cxturYQTyBuZnGddCpLtbbc5aH3vmJTgc=;
        b=fgbZ3SpznrH/Dpq8MkqxUmCKvseG7reLJUQLPTYVTpMpzHRrLNX8gasK6yiSuFDRSC
         RxbeFUphS+fByjkmRfuAlmhJFETNDkQLj5BJ7DTEfVXXDLQdAR5cpoAvhNXhlShKyz/R
         mp4ksX4i1v7Xv4pr/OYXT2cECj5m9xyyb0M02DPfYHCXfNReIo2rGJ6v/zbZC/klCvyz
         LVtUChaCs8wRupKC2OwyFRxwhOZZiqAEIn0YitcP2KN9Jq5pwyOw3ieqrjMQC5W0eSlE
         itDKlEMNHgXWRUcztSS8PFMmnK+GmvCG3J+klFxJMhIAJACT2xtYU93hiCFcAuxkiYeF
         2Xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0+QZehCLD0cxturYQTyBuZnGddCpLtbbc5aH3vmJTgc=;
        b=nQ0DkD0QiAcIV13vWKJP1G4K6WJOIv/NDUZSjXMG0Q1DQV3VzpM4CPREZ2rxusMXOq
         Zbb9eRB2BZP9RkSgts3v8pZslmpqpIGkT1I435/GrJI+OhDfoAoIRZkGy9rjVwYsEiop
         MF4rDVMzt08vDSRDem5tB8O+J2iqJuB3tiKdkXjQlwnKCxJivTAVBpkCoytK0qcr/mFF
         jIxkTw21pTLikxpa+F/seL0BKQLg4H6tfRtP1YdTxK2R1wrru6Nn8CcJvbNiDrKmfjpc
         Fm1WDPDt+4a9aji8tBMVavtY1FqYykNqtIzVU68/7ScjvmjlxHPz2LlizWHn0LEFCx0O
         1hcQ==
X-Gm-Message-State: AOAM530f7skiQMHpVchUDtyDEWQGCho9HRs0EUsaVynOQlKfGyKH8WCD
	9ITSu7r9veCGZIwLNSaG5xhfRalx8C2XtsuI
X-Google-Smtp-Source: ABdhPJzqB6ztOEzQDtqvu7+0IUGJ683TVTEc7Ks+XjAvTQDBmeWfiRKuIRJ9Q0sqGIgiVmyPN/MxTw==
X-Received: by 2002:a6b:630b:: with SMTP id p11mr12434716iog.133.1621603771063;
        Fri, 21 May 2021 06:29:31 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id f8sm1165202ilr.12.2021.05.21.06.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 06:29:30 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v3 2/5] Add rust testsuite for 1.46.0
Date: Fri, 21 May 2021 06:29:11 -0700
Message-Id: <20210521132914.140884-2-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210521132914.140884-1-vinay.m.engg@gmail.com>
References: <CANNYZj-yODhEEFErtUxBeiw3O1YvEfV-hGOOW_uPNvo6x8mNYQ@mail.gmail.com>
 <20210521132914.140884-1-vinay.m.engg@gmail.com>

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb

diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb b/meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb
new file mode 100644
index 0000000000..ad758b71f4
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb
@@ -0,0 +1,3 @@
+require rust-testsuite.inc
+require rust-source-${PV}.inc
+require rust-snapshot-${PV}.inc
-- 
2.17.1

