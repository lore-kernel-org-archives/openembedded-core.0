Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web09.247.1631025896913548818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 07:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mJXbTos8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso13074386otp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 07:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LR/HyaWDD7vH/+xyu495IyaZklQwChbI7klSvr19CbQ=;
        b=mJXbTos8IbncdzQFXqyigx0TvIRYHcY7cf+hGX4ugFJgg4QLZP8Gm2Epnozw/dpORZ
         3rBjdwHAqBdje1eNpALl98e9FmkZUQpuSsjWSGHzHHemmhiWETqeFMh38STbHsLLwl1+
         y+1bwa+tIBvtPTp0bRTgREO572eOsCUIPg7ggrcCPBWl0gGzT2DuK1EX3yIT/qwxlwt1
         bNiM/ybGC+9WsL68igiM8srP2jW0g94dEsYfIk4raUyRKdjIWCyJKV/ahAgMymQA81zg
         Wm16KAdNCZPtdJVVQvSrKTWdLN94HOsTuMI7MGh15CKX089oLFnSg9DT60O/D/6kTQbB
         W5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LR/HyaWDD7vH/+xyu495IyaZklQwChbI7klSvr19CbQ=;
        b=U0tM1SZxVZFOm3Lm92HJiAU9jcKxfzrDcgMD7ouVS4+ZTGj0wsBqP6k87pksBGDzDP
         cxGP8D7phXJJq92P4lkzFKGDMW2g7LkePXajHFOiiGqIg11c0z3LWdeaRyzltxBoZ3gp
         6Cj5SkH6/KOjawIBvYITFt/jNgHh9/WUL23bBDREbuCxYjFr4mRUbeDo/VRersOYP51u
         KQqjpm0WesNiBHqXcOvf3vIbmh+7kRbpyegDsZ28AGemGM22Lm9QgqtgzY0xpKU9nv1p
         YUMLx9PKlyGcv5BHxsSQuFrrAuJZr265f1M4Gie1Iv5xBO7KWUzrrvr9Tv7WYzBu4Gr0
         DGcg==
X-Gm-Message-State: AOAM533p97XzH9JL8hfukhBLybmhsP/4TQm2XZRNerUSuTYbamu6XEls
	REgAuClj9RCFfWwk61o2DMzTtlXxfn/jJvdk
X-Google-Smtp-Source: ABdhPJySM42pPhlN5ccEReMFRqMOHYm1IMFePLOV3vcl9jvd1ERih7bolouD5MOLxy90MJikW77SUw==
X-Received: by 2002:a05:6830:22f9:: with SMTP id t25mr15152939otc.344.1631025895869;
        Tue, 07 Sep 2021 07:44:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id q22sm1313761oof.14.2021.09.07.07.44.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 07:44:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/5] oeqa/runtime/parselogs: Make DVD ata error apply to all qemux86 machines
Date: Tue,  7 Sep 2021 04:44:07 -1000
Message-Id: <0770a9153dedd618ebf4a966a2cbfcb1d8780db7.1631025627.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631025627.git.steve@sakoman.com>
References: <cover.1631025627.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This log checking fix is needed for both qemux86 and qemux86-64 so move
to the common section.

[YOCTO #14528]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2475ce68f0bc1f342c75364dfcfaf7f30499badf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 88279c6013..138fc306fc 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -90,6 +90,7 @@ qemux86_common = [
     "glamor initialization failed",
     "blk_update_request: I/O error, dev fd0, sector 0 op 0x0:(READ)",
     "floppy: error",
+    'failed to IDENTIFY (I/O error, err_mask=0x4)',
 ] + common_errors
 
 ignore_errors = {
@@ -97,7 +98,6 @@ ignore_errors = {
     'qemux86' : [
         'Failed to access perfctr msr (MSR',
         'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can\'t size)',
-        'failed to IDENTIFY (I/O error, err_mask=0x4)',
         ] + qemux86_common,
     'qemux86-64' : qemux86_common,
     'qemumips' : [
-- 
2.25.1

