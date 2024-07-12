Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130D0C3DA4D
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 15:55:43 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.11262.1720799740391008355
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 08:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MMM422oi;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5c47c41eb84so1185876eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 08:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720799739; x=1721404539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jaj5/Y4FYyoNS82Th3K8+6fulE+vCyed3PQwoXuCe0o=;
        b=MMM422oiInU4hKi0FZvSr/sOAfbxowYVWNMJ+o4oslJBmd5l9DOzNaBgA1rRbuiM30
         IBX6CTqPTE2aw+cvtHqADfZOJRJIIeI6FLmYo2aWS899ku+GcZ+cz6oQp3PVm8kE8QgI
         MnGH4OhcK80ytEPTLEntttE9eB1pSivad6JJL5DL1JtaWLNtAEB9idGmb4tbyYPaFUX1
         CTG4B/b7SThPdIvWkRKIa/fInLRkVVDdbqyK7yxGaag0O3LDl6zK5aCyglLFG6ycv0/R
         3qvqlPh0RcjuqTVaFhIY0bpcMb1gZXo1/dXgEbmCoVRw0eEPAOPPlxc4uhko9eA6M1cm
         xVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720799739; x=1721404539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jaj5/Y4FYyoNS82Th3K8+6fulE+vCyed3PQwoXuCe0o=;
        b=USvdvrMUSJXtKmz2pzvq93blwc4UHXINunjXPTh/5LS3JKMcHIBHxKi7bTMJgLgp5Z
         8sxmWtJP6uZUOZ2ZGLt+6AYqyLxKsGzRguqZVQDMZMRivAn0NEdkt0QeybhJ35POZBsH
         lWAasdKs6GNV/Km+pAFn6H45hU+W7vANNJqsI4OfufnX6qTnW6DuvcW+Xsyo4lXklnQ5
         I5KUnUj7Pp1lzKIvM51NUG6j8rwiER7vumkTLCCSHc8NIBdHTxiOxGyrlslB99tqwy1U
         ZIOE59y6RxzFzzfdpHd/5hlRu08MibTjSS6kt33uIWJEVDkP511/X2lpfzu2HcYs/pwR
         D02A==
X-Gm-Message-State: AOJu0YxbFYSEXHoPsYx0UjVRYcw7bdB27uh2w6GgGeqEF6SU+oo1S3m1
	s0DOmNsX60LDb9POlD/lChCpDFrjrxFs+mM1eTsWzj27z9gkKHELjU6BCg==
X-Google-Smtp-Source: AGHT+IG4JUgFjAMtWTSVq1En2jwTm9phdo06Zs2pamA4IYg9x/sNWoMAprE8SSmuGkpKxPmeW+B+eg==
X-Received: by 2002:a05:6870:6109:b0:259:8cf3:9ec3 with SMTP id 586e51a60fabf-25eaec33c66mr10607015fac.54.1720799738960;
        Fri, 12 Jul 2024 08:55:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4a71])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70374f7987asm1620424a34.30.2024.07.12.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 08:55:38 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] perf: Remove SPDX_S
Date: Fri, 12 Jul 2024 09:55:35 -0600
Message-ID: <20240712155535.3512470-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 15:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201834

This variable hasn't been used for some time, so remove it

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 058f887b861..fc9f70f9f66 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -66,7 +66,6 @@ include ${@bb.utils.contains('PACKAGECONFIG', 'perl', 'perf-perl.inc', '', d)}
 inherit kernelsrc
 
 S = "${WORKDIR}/${BP}"
-SPDX_S = "${S}/tools/perf"
 
 # The LDFLAGS is required or some old kernels fails due missing
 # symbols and this is preferred than requiring patches to every old
-- 
2.45.2


