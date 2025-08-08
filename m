Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E0DCA0EC0
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:07 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.17940.1754643003101057433
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lq0EXhoz;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-240763b322fso20982745ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643002; x=1755247802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBk/jbk5ST5LKcMR3zmKPcmEr5eDfHb92Kbmt/x5pGM=;
        b=lq0EXhozxFTkGrzOhT0+zHFomc/3P/5GtdCL7IzXF5eZ46L7l4yBrEZEcqz5/92Ue6
         9MF7WtFqSdDZYbiH8DtTkSznwvQuthD1SZ8flFUiaBPVZGbxAlyzV+kPSqYB2tCBv5ar
         EByjbfGX6bXfhr66bRfWXh/tfcwEgGe25kZnZdsek8futjxJASNGCQnbsRMHsingaVVy
         dSel/MGl6/C/cYPPdcmc6aVLR6x5JAO1dJZ+8JlOL+5bcCsXhBZcB6OeS3HH6A5XYhwT
         GTg5toU0IbdKhzrwglyPuzjoFKlEUFDOZ6RmxQjrBc81MliubMcu4Iw+o21/bZjiAhFW
         XGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643002; x=1755247802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBk/jbk5ST5LKcMR3zmKPcmEr5eDfHb92Kbmt/x5pGM=;
        b=b7bOwNADtHUO3EQJTTqObAyHTqN76qmp82aAbFT/r1G/Cmq0jiOLpoXl3sxOSo4iBQ
         zc86QhRtEfyuJu4qCZQHXvywq/QfXltRAjsFXCxxsP4vTwA8Ho5Kxg8sGUO3kgMi6eml
         j4jR/SBhGNa70FSymvI1GwgiUBs1qZXWOOGie0vNza1AX/hIRhLxZfNiWU9gsRkbKWqi
         cv0cZLNbIIVbiLPrBUXhWYyeLY175wLG6czBaLiWnolHlIXvKf4Snh3F9yBiZ9JIXgAW
         EWibUIhuwdzzr8ZfDxXsy0+TpwO61KRv6Cw8h5u1igmJSMEOQKJTntQrXX+aogS+s/M7
         AUTw==
X-Gm-Message-State: AOJu0YwojSYaPMKVVzVYWeUNr1z7gAajKdhQjRvfziB6HlBAzOuXHjuw
	JBCnF6TJHMMlPHEcGkd2HJ1r/8CzGJrEOCM+hCefvBoRYBxIp/BP2nS0NB/M5g==
X-Gm-Gg: ASbGncuv89Khzd3q1dCcmhxvs6exfjPFQQt0EzFIMDZUgVgKPleYqMx04FPfDdRk5ld
	s9oGytIZ8HaXhRYQ5ukRw7w0W4BLS3U956bWWWtw9mB29SNuI3pbdlFhnrQkYyjhUMQXyfwawo0
	QluSoJ+lMgRJUTx/OEJpn1YCnnjzqgELr8359bp2XRrDbVGxb2kt7vCUxdsNTA1oxoAdiAzZhuM
	54VvqmsTjv4jaWtWzGyrpvB3sW3NQ3SCSjzrkJmH3rl5U2c0gnv1P61KvLowdEKPw71CxM3CZip
	y3LpPy9aL4GvJ4P293cWClAteEnqujPuEfuTOprUNSaK5R4gLKJ4/EeoXvalxablZDp1fF5onk0
	a46AmBXXMucCX4DQeWVjH9UKFrdGdXj9i
X-Google-Smtp-Source: AGHT+IHxAZSTOJ+h3+AnX+deUsnuXlHL9GrWvcmsk7Ij2PpnDW8mE7v4SmpXB/ZseagmS7tS1gtneQ==
X-Received: by 2002:a17:902:ecc4:b0:240:6fc0:342c with SMTP id d9443c01a7336-242c1fdb15emr33262025ad.11.1754643001982;
        Fri, 08 Aug 2025 01:50:01 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:01 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Koch <stefan-koch@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 09/23] bitbake: fetch2/gitsm: Unpack even when `ud.clonedir` is not available
Date: Fri,  8 Aug 2025 14:19:17 +0530
Message-Id: <20250808084931.2156763-9-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221606

From: Stefan Koch <stefan-koch@siemens.com>

(Bitbake rev: 13d76361ec37faecd84e7b81da22ada7d4e0ba90)

Signed-off-by: Stefan Koch <stefan-koch@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 22728acd78d65e993215a7f94cbf692d3111a4c4)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/gitsm.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/gitsm.py b/bitbake/lib/bb/fetch2/gitsm.py
index bab1bf2580..1c58230eac 100644
--- a/bitbake/lib/bb/fetch2/gitsm.py
+++ b/bitbake/lib/bb/fetch2/gitsm.py
@@ -150,7 +150,10 @@ class GitSM(Git):
     def call_process_submodules(self, ud, d, extra_check, subfunc):
         # If we're using a shallow mirror tarball it needs to be
         # unpacked temporarily so that we can examine the .gitmodules file
-        if ud.shallow and os.path.exists(ud.fullshallow) and extra_check:
+        # Unpack even when ud.clonedir is not available,
+        # which may occur during a fast shallow clone
+        unpack = extra_check or not os.path.exists(ud.clonedir)
+        if ud.shallow and os.path.exists(ud.fullshallow) and unpack:
             tmpdir = tempfile.mkdtemp(dir=d.getVar("DL_DIR"))
             try:
                 runfetchcmd("tar -xzf %s" % ud.fullshallow, d, workdir=tmpdir)
-- 
2.25.1


