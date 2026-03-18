Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1D7103E17D
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:47:09 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14414.1773841628994759940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fgpr/tW5;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d77b179b52so5887732a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773841628; x=1774446428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxzrZp1LjKbEzkovZzvYqu+W5DOt8PCBhIjLmqSvOVA=;
        b=fgpr/tW55J05Sy27AT4DSNTc57YILJzmOsLVuGsYGWsOtZCaJnQkdLQNBS3aChnJIz
         otiZ6dofRhzb50wY4IdrfEEZFc52rH4zWR+D0JLzWTfHcANZzfE5E/D4m+z9/AEx/P3r
         sLv+BHyoHOLmIs5SL3y7RiZGLrQbMrHLuqxzc87wh200iLq50uhQZlfpswAMmnpxKc5M
         QgppnzjIGUukXmRIX0gZ00/oWhE8qCzwZY/mF2ngnL0cr/7M3sG4F0sboJeOvRsNki8t
         LqB7E+tUzg+719dgRycAf2dMYkrxw8OfE2s39clBrd8Dj+s9YvR0v7KHQ78EJMsVG72E
         Fd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841628; x=1774446428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wxzrZp1LjKbEzkovZzvYqu+W5DOt8PCBhIjLmqSvOVA=;
        b=OlZ/kzhcqrAYNcVW+LyNmZ1xj8Z4plLvNM3K3QCX8H8IUGRt9XOj9TaMKvUgqGi4Ee
         5IXCPthv9pu7mCUI+Vj4cq3mgjlkMc4nYdTFiV5exVe+aN9xXhrFp4BZgz/8Tf8YFx/w
         /ZqyYvbQF7GTSb+XcHINdi8kVgStgmB8tElPPVF1plKE5rcWGvRxJw3VhCnn6zzlXZEA
         BT40SISJHNxxHciudNzzg0+Uj+pW/BzejCcDF1OLyfEirUDU7O6yOeIp+INHxNN6khOC
         TWDaNqdT+0JckROrMazbua7FkyKMcNguGmforwJWyuzUcDHuNtQBD70XdyRGwEvXLv5D
         zsKg==
X-Gm-Message-State: AOJu0YzYZlulimhYA/Y9Zgtgw+dEn7pFH7zSJ2JiXfRM3jcipxRMBx14
	I4N/tjK3bh52mPZBhZ46phspzatkbQEaWy1rGlRBeRrx/HSbfPh+JaIZZDA36Q==
X-Gm-Gg: ATEYQzwhdWeykFjdz1V2Snd72yGSamOtI9WRR1kkSLhvhLyNfZ5eFF0L0+rOkzo0ZR7
	eWBYAV/VLPctOYv5d4ZIqO5HqHmsI3laVkp810bsfpWwDmoJV1/PCAv6UoBQFvXjt/QxOH1wgXy
	SKPqzXgEmaKpdHeeXHYAkXy+iCAJ/hgFpsltzTNHNdLxmESuOhODvVPQ+fya0NmnyUfHYHKqzHG
	mHe549lwP/569X6Jltn2RlogGhgDOCc9Z6c+15OzuPJKf60FSQjUMcp4PYnm6rxanjbfWHvjBJ1
	CIKYWbXJlPrcjy0sbjLYeFKoNHcygYfOLyKAnEVVmNZg42YNN4k8rd3J59+PScj41OxcBeWrxp2
	q5dE29plxsdIWv/PgPUhp0l6AqPlNhXJ32u+XX2AA/nX2xMmmV81PcUTQnByEPCnT+4dvvpoRra
	pv273ebi+eg0C5ZVpK1kGB
X-Received: by 2002:a05:6820:2981:b0:677:4fc0:a852 with SMTP id 006d021491bc7-67c0dae9889mr2325661eaf.34.1773841628068;
        Wed, 18 Mar 2026 06:47:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::8279])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c0d89c739sm1763625eaf.13.2026.03.18.06.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:47:07 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 10/12] glibc-testsuite: Do not generate SPDX
Date: Wed, 18 Mar 2026 07:44:38 -0600
Message-ID: <20260318134655.953233-11-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318134655.953233-1-JPEWhacker@gmail.com>
References: <20260310184058.533343-1-JPEWhacker@gmail.com>
 <20260318134655.953233-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233400

glibc-testsuite does not run on target or factor into the build supply
chain, since its purpose is run tests in Qemu at build time

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/glibc/glibc-testsuite_2.43.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.43.bb b/meta/recipes-core/glibc/glibc-testsuite_2.43.bb
index 28af6961c3..899955adfb 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.43.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.43.bb
@@ -64,6 +64,7 @@ do_check:append () {
 }
 
 inherit nopackages
+inherit nospdx
 deltask do_stash_locale
 deltask do_install
 deltask do_populate_sysroot
-- 
2.53.0


