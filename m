Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.9926.1602833534487150339
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 00:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gx0MbBPc;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id j8so968772pjy.5
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 00:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qMcpi7APKFjnCWz2uAIEIB4qyRSuXdILHw9tps8TJL0=;
        b=Gx0MbBPc/66VS4kBK9VcwtzCGHk3sCETm17EAEf+EViit7J/T/NVBEB7xD7yjsRfOI
         LAxRxZnEWIz4jOIphUzFNkc4jvOcen/DRoBIHyXp5gw48draT7TY7nocZQzI1H7EQTha
         c6RbFVJAUrPiETbpViz+uvfQZNT6uGhYhueae8QcMYLIGGhMSxltf/URgCFxuK302GvB
         A2wi+CGu/U3S7+klmAjzKD460nZdNrgpiqw/byTiSlk2m1q+PytTSyfxwhh1huxuuJow
         KWr91RnJn+S6er16HlMsUH5m5+MPGGsv2CNQFrCD8Dmwdc8WpcA3X8K/sb7FcGva2Qru
         rfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qMcpi7APKFjnCWz2uAIEIB4qyRSuXdILHw9tps8TJL0=;
        b=oybv5g6zPOytGjiWwXHhcqK8j7s6H4evAyEQa4O+n9I+OyS4qu9d22knnzT1c1InG/
         6oeWxw5RsgFqs8zMSPlxrFqvrnIXMj6CUP1EBweFhDSCtKKkQapNUR6DihezA9pkIRKc
         dh6YS3OV2eeOdG8ltLaMwD/3P/FJp0pJ64E6z2wgqp/TnBQIXx2VkceGUeplCaDo8CwV
         fhQrEda2ThMI8YbMifLaRaTmGSIsK1cz6IIZ3aCyo6bGQZn7+k7skNSW0lC2wEC6Azpl
         9BeQ6keT1rgcp2wk8NUS1HtjTpNH8ZxJvzBKeK0ICv+oJUVJaiVQCsl0vexUdUWr+qXA
         k/sA==
X-Gm-Message-State: AOAM532wlIT39ObOzGZ40jGUdpnG4NdlSjYexaTvyuedY0+53/2Jh4FB
	OXq5feT0CpLs3k6x8rsXmux/zfUbuH4PlQ==
X-Google-Smtp-Source: ABdhPJzX9s4tn+oVJMNyLbxTKzWI54xZJo4aIEs8j6xq5idJmw+wuzDxg8JoyiXnyVNFs64FYF/f8g==
X-Received: by 2002:a17:90b:ed3:: with SMTP id gz19mr2757843pjb.53.1602833533636;
        Fri, 16 Oct 2020 00:32:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id cv15sm1885422pjb.20.2020.10.16.00.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 00:32:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] packagegroup-core-tools-debug: Disable for rv32/glibc as well
Date: Fri, 16 Oct 2020 00:32:10 -0700
Message-Id: <20201016073210.392533-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strace for rv32 is not yet ported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-core-tools-debug.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index 283c1f1a35..542a02057c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -14,7 +14,7 @@ MTRACE = ""
 MTRACE_libc-glibc = "libc-mtrace"
 
 STRACE = "strace"
-STRACE_riscv32_libc-musl = ""
+STRACE_riscv32 = ""
 
 RDEPENDS_${PN} = "\
     gdb \
-- 
2.28.0

