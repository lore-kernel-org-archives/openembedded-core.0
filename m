Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A96C04FFE
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:12 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.19252.1713529202310882995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XzkxwUTM;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56e1baf0380so2537478a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529201; x=1714134001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptjZui/QugPi/nHaaw/AKY/5aFSFar1t0hRmL7dvSgs=;
        b=XzkxwUTMXQLJBtUvt3zF/FV22s/uShPlyfdtu6TO5/DegAMncvgzTtYIa1bJynvJHN
         gUqqiZl1scF5SMkkZ8gIYTGsTVqAG+NtJiWG2w6aUH1nl2cA0Iq+JI33R5tDnxEMiNy6
         rrGFjiJNhj/ua3DOOr0Vrl6+vKCNAyMSg6Zeos0mRAOZ2RCaDtJ9yYfDFjaxkX5w4qhw
         n2nMyv+yhL4UWYfubh/qXL8DRdXNuE3oMUrSmWULvIPj7NK0fcfGqtivGWZOJQ1RrohB
         x2tLDPDgfpg1rckymZxcu4lIx6c9gVSgu1fu7d8sNFSLv0zJxvK7yJneosoLCWzmob/k
         roAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529201; x=1714134001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptjZui/QugPi/nHaaw/AKY/5aFSFar1t0hRmL7dvSgs=;
        b=H6Mpe+X+oKqU44T54sHm4mJ3F1Gawtpg1JD6zGIXp2tsZTDnVfLyvjHYOtNvXQPrTE
         t2Q3SJVrAqjP6eMhOcGasvXT8xKVz90LcURkSN5DulK0C6rd4OCcv8ydi33lTbcleeKi
         Zg1kN3Wtu/hTcx6yY6wtaxsXNINgzcGfFPGk9yX74wlxCu+KOAjvY9euk2RmGUrhEv2w
         X+fOZzp2zZCUBipElw1j46oehEHIX5x2XpNjtM9FZvBYrCagOgpezr700vmBvXsCbRvl
         XhLGXx+JeDjEzHpKbdAAoIkSEtRc5TaKflm4QspnYbyEvMcbBUgVVESeLkjTmlKh+Jxv
         mCzg==
X-Gm-Message-State: AOJu0YzOf7yJbib1GM+yF78ZbsbA5yv8VoZnuNMbrnrAVEL5I3p9BhZ5
	+QJXeqnwYBdoaZtCBQBuexKB0XpHRP+nGceev0hWI5YbGlWAcHMbuGwd/w==
X-Google-Smtp-Source: AGHT+IF0c5lS7tgWhFjJMKOYhCJuBpQrezXmFvKrgc4hhZBQVIuHL2CnRGEZX7aKpf31kmUg/fQ/6A==
X-Received: by 2002:a50:9f6c:0:b0:570:374:d6ab with SMTP id b99-20020a509f6c000000b005700374d6abmr1555117edf.3.1713529200533;
        Fri, 19 Apr 2024 05:20:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:20:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/19] bash: mark build-tests.patch as Inappropriate
Date: Fri, 19 Apr 2024 14:19:43 +0200
Message-Id: <20240419121945.1920944-17-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198545

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/bash/bash/build-tests.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash/build-tests.patch b/meta/recipes-extended/bash/bash/build-tests.patch
index ea38bace9b7..c1b9b8261f0 100644
--- a/meta/recipes-extended/bash/bash/build-tests.patch
+++ b/meta/recipes-extended/bash/bash/build-tests.patch
@@ -4,7 +4,7 @@ Date: Wed, 19 Dec 2012 17:18:31 +0100
 Subject: [PATCH] Add 'ptest' target to Makefile, to run tests without checking
  dependencies.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [ptest specific]
 Signed-off-by: Anders Roxell <anders.roxell@enea.com>
 
 Rebase to 5.0
-- 
2.39.2


