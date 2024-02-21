Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFC7C5478A
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 18:17:11 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.335.1708539422914331681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 10:17:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YLXyJ+ib;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d93edfa76dso44905165ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 10:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708539422; x=1709144222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BYX9++S4oFE0ZNpjZxjnuw6srX7cCfufHb/abT0I8zg=;
        b=YLXyJ+ibbEVuq8Fims3nEgd0r9JfEGTdEEUSGfcqjPZkgZmKp+XmAEU8ZjR+nzdOnx
         pQ5vF6LALltb56RRbOOMTloVxuQf/XNLD3JCEpzBgL6CHDbTIGRB0ALaGEBbOrlfEs8g
         G67qjLvX2z6tUBY/PHUOJn55Y/2+2qwvb6vK+UnjThGMBC12piaN7i4e9KAGgKr5xebw
         qvoSe0Fv5z92hljR+UAjMYLY4LxW3kvA+9V4OpCxMkfN425pb+hB/iVD1aKhhDoLem5G
         MptnUnRKzbl61sB77noKn6w150rwBxRfBVWEejSlHf8H5PAUa8ezzrHMbxaJOOH29TKD
         XEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708539422; x=1709144222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BYX9++S4oFE0ZNpjZxjnuw6srX7cCfufHb/abT0I8zg=;
        b=et4b7e3RsCTah4+wzuYsZ14ZcpFOdZFKuEWupzvrtOygre7NawLw0dfbqWolgdXDEU
         0bU8pL8av6pZZOsUW7kXNEumiYtRRdscmv0P05aoASlwOdLHSISBPfjeo3qpp7gBTfoh
         Lv/QDSBVhE7+pbyopBsRjHpP99SsBRn26vRSaUO2gAvm0kbAmDq3g1CFWvbFMCQc//aa
         3MLPJDIyV5UqqvON/JECVla1eGpQkdvc+pprDIRWI+Vh1qwsACFOMP0WUx55tEYKVfxN
         SCkGp732ypQJCTJ9j+LkUaweawIBtdsZdG1Ueepg0OKElzP4JJzIyqihyM3WPEkYGC1C
         GDDQ==
X-Gm-Message-State: AOJu0YyKC9Y9v8Xhn+UPBc7ervq1PZLE8eZoQTydLvAtaPQgRaM5xFQP
	9aDsj9k5n86Gjen3VF+OtCj3Da6IflWj56jcbM0ylUNbJnOOIIm8x2lHy15mqDw=
X-Google-Smtp-Source: AGHT+IGlXrG3JqZhu12CDJKm+uAFGwVsh9XiiVjYquPeWQeIAAEk/oJZJXV4fiZhb15J1E+v81aY9w==
X-Received: by 2002:a17:903:11c3:b0:1d9:a4a5:7a6c with SMTP id q3-20020a17090311c300b001d9a4a57a6cmr26119929plh.57.1708539421983;
        Wed, 21 Feb 2024 10:17:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::67c2])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902748300b001dbcb39dd80sm7891392pll.183.2024.02.21.10.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 10:17:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] linux-yocto: Remove unused patch
Date: Wed, 21 Feb 2024 10:16:59 -0800
Message-ID: <20240221181659.1060755-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 18:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195982

This patch remained after bumping from 6.1 to 6.6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...cpumap-Make-counter-as-unsigned-ints.patch | 69 -------------------
 1 file changed, 69 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/files/0001-perf-cpumap-Make-counter-as-unsigned-ints.patch

diff --git a/meta/recipes-kernel/linux/files/0001-perf-cpumap-Make-counter-as-unsigned-ints.patch b/meta/recipes-kernel/linux/files/0001-perf-cpumap-Make-counter-as-unsigned-ints.patch
deleted file mode 100644
index 2bfc40fe04f..00000000000
--- a/meta/recipes-kernel/linux/files/0001-perf-cpumap-Make-counter-as-unsigned-ints.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From d14450f9e0f05ea7177c5404a7a9289352caab77 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Jan 2023 13:04:10 -0800
-Subject: [PATCH] perf cpumap: Make counter as unsigned ints
-
-These are loop counters which is inherently unsigned. Therefore make
-them unsigned. Moreover it also fixes alloc-size-larger-than
-error with gcc-13, where malloc can be called with (-1) due to tmp_len
-being an int type.
-
-Fixes
-| cpumap.c:366:20: error: argument 1 range [18446744065119617024, 18446744073709551612] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
-|   366 |         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
-|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Peter Zijlstra <peterz@infradead.org>
-Cc: Ingo Molnar <mingo@redhat.com>
-Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
-Cc: Mark Rutland <mark.rutland@arm.com>
-Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
-Cc: Jiri Olsa <jolsa@kernel.org>
-Cc: Namhyung Kim <namhyung@kernel.org>
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-perf-users/20230123211310.127532-1-raj.khem@gmail.com/T/#u]
----
- tools/lib/perf/cpumap.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
-index 6cd0be7c1bb4..d960880dd903 100644
---- a/tools/lib/perf/cpumap.c
-+++ b/tools/lib/perf/cpumap.c
-@@ -351,8 +351,8 @@ struct perf_cpu_map *perf_cpu_map__merge(struct perf_cpu_map *orig,
- 					 struct perf_cpu_map *other)
- {
- 	struct perf_cpu *tmp_cpus;
--	int tmp_len;
--	int i, j, k;
-+	unsigned int tmp_len;
-+	unsigned int i, j, k;
- 	struct perf_cpu_map *merged;
- 
- 	if (perf_cpu_map__is_subset(orig, other))
-@@ -369,7 +369,7 @@ struct perf_cpu_map *perf_cpu_map__merge(struct perf_cpu_map *orig,
- 
- 	/* Standard merge algorithm from wikipedia */
- 	i = j = k = 0;
--	while (i < orig->nr && j < other->nr) {
-+	while (i < (unsigned int)orig->nr && j < (unsigned int)other->nr) {
- 		if (orig->map[i].cpu <= other->map[j].cpu) {
- 			if (orig->map[i].cpu == other->map[j].cpu)
- 				j++;
-@@ -378,10 +378,10 @@ struct perf_cpu_map *perf_cpu_map__merge(struct perf_cpu_map *orig,
- 			tmp_cpus[k++] = other->map[j++];
- 	}
- 
--	while (i < orig->nr)
-+	while (i < (unsigned int)orig->nr)
- 		tmp_cpus[k++] = orig->map[i++];
- 
--	while (j < other->nr)
-+	while (j < (unsigned int)other->nr)
- 		tmp_cpus[k++] = other->map[j++];
- 	assert(k <= tmp_len);
- 
--- 
-2.39.1
-
-- 
2.43.2


