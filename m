Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.20249.1597561700856400907
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 00:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S7IjB5Dn;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id bh1so5962681plb.12
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 00:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fIlrbVJS9f2JPmaEz23jx+SYGdA6TZ9tIExhTsn5oxs=;
        b=S7IjB5DnfrqL++xD4zy+ukmUO8JeS83oUlPSVGnm7Su40kXebgyM2xUQHMAe5W/duF
         tEMsWlfPWiUvr8wghTANcgOtSz2vJfRQEeHuG5gAiR7nDZh2qo8ROHr3axFUPaMbX9HX
         XgE5PyMs/ObACYipZPCrSxiJfk4JwWkUVprDhmUNvzVfgv+hoEOs82ZyWyvLXkOu6mLc
         atP+45zAg2QP3cIfgitJY9CD6V496M9aAqameoLSAqC/8cIFy9HBCaypuOwykz4n87HL
         N4tTDGYxiQ4SwIbhhvtc3P6I3fV8uggiWWkh84S5t/Lih5ecov0Zi9wMeQMa65f/BfqZ
         WOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fIlrbVJS9f2JPmaEz23jx+SYGdA6TZ9tIExhTsn5oxs=;
        b=GNfFICVwJfjMJu7SizGjFP7MgptL8Gqsc+IvmSzvvHifOnLdnLO+AWZSskn2viVtJe
         AYdN1a7EyjgS9Cr0c/i0kPaVolYpbgFzISn7e2tINNtWsUjtQA4LlaObDlJdAVUACGvF
         H8zAvUgpLUJ2AIFYkvK0ALvKZqJ8xOAj5KGn39bdWQKTXlybvEaRr6pPWQhg/58w6/4j
         2wASm/LfcV7+QSi8tWhrwpIOmFUlKMNxXsbZv8Bbv2FUXOZn/YFXFK8a9T0lkRT3pHUq
         BaD8LWa/CWk58aGbyy5iN7gaSy/u4j3hNfVaIMc7KWTmLj5/CF2dfr4ixlEwip6hXAt8
         K/0w==
X-Gm-Message-State: AOAM533sMbTCSrZRaemL6EdIwlVuz5Rp/SRYHSdWtPv1XB6ySuL5TrQ9
	BS8Gow6BTs5Mnmq9k0eY8sjX0pUduaW4eg==
X-Google-Smtp-Source: ABdhPJwhL2TH8H6Hu3TGzyLfVWR52gaq72zQ2RAxJa0Q61Sh1C1TQfgfEij2zfsy/5OFQCm5zWLULg==
X-Received: by 2002:a17:90b:f11:: with SMTP id br17mr8356829pjb.68.1597561699995;
        Sun, 16 Aug 2020 00:08:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id em20sm12646873pjb.37.2020.08.16.00.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 00:08:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] linux-yocto: Backport a patch to fix perf with -fno-common
Date: Sun, 16 Aug 2020 00:08:14 -0700
Message-Id: <20200816070814.1303004-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200816070814.1303004-1-raj.khem@gmail.com>
References: <20200816070814.1303004-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Temp fix until linux-yocto picks it up

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-definition-of-traceid_list-global-v.patch | 66 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  2 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch

diff --git a/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch b/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
new file mode 100644
index 0000000000..0fc9876501
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
@@ -0,0 +1,66 @@
+From 168200b6d6ea0cb5765943ec5da5b8149701f36a Mon Sep 17 00:00:00 2001
+From: Leo Yan <leo.yan@linaro.org>
+Date: Tue, 5 May 2020 21:36:42 +0800
+Subject: [PATCH] perf cs-etm: Move definition of 'traceid_list' global
+ variable from header file
+
+The variable 'traceid_list' is defined in the header file cs-etm.h,
+if multiple C files include cs-etm.h the compiler might complaint for
+multiple definition of 'traceid_list'.
+
+To fix multiple definition error, move the definition of 'traceid_list'
+into cs-etm.c.
+
+Fixes: cd8bfd8c973e ("perf tools: Add processing of coresight metadata")
+Reported-by: Thomas Backlund <tmb@mageia.org>
+Signed-off-by: Leo Yan <leo.yan@linaro.org>
+Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
+Reviewed-by: Mike Leach <mike.leach@linaro.org>
+Tested-by: Mike Leach <mike.leach@linaro.org>
+Tested-by: Thomas Backlund <tmb@mageia.org>
+Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
+Cc: Jiri Olsa <jolsa@redhat.com>
+Cc: Mark Rutland <mark.rutland@arm.com>
+Cc: Namhyung Kim <namhyung@kernel.org>
+Cc: Peter Zijlstra <peterz@infradead.org>
+Cc: Suzuki Poulouse <suzuki.poulose@arm.com>
+Cc: Tor Jeremiassen <tor@ti.com>
+Cc: linux-arm-kernel@lists.infradead.org
+Link: http://lore.kernel.org/lkml/20200505133642.4756-1-leo.yan@linaro.org
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+---
+ tools/perf/util/cs-etm.c | 3 +++
+ tools/perf/util/cs-etm.h | 3 ---
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
+index 3c802fde4954..c283223fb31f 100644
+--- a/tools/perf/util/cs-etm.c
++++ b/tools/perf/util/cs-etm.c
+@@ -94,6 +94,9 @@ struct cs_etm_queue {
+ 	struct cs_etm_traceid_queue **traceid_queues;
+ };
+ 
++/* RB tree for quick conversion between traceID and metadata pointers */
++static struct intlist *traceid_list;
++
+ static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
+ static int cs_etm__process_queues(struct cs_etm_auxtrace *etm);
+ static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
+diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
+index 650ecc2a6349..4ad925d6d799 100644
+--- a/tools/perf/util/cs-etm.h
++++ b/tools/perf/util/cs-etm.h
+@@ -114,9 +114,6 @@ enum cs_etm_isa {
+ 	CS_ETM_ISA_T32,
+ };
+ 
+-/* RB tree for quick conversion between traceID and metadata pointers */
+-struct intlist *traceid_list;
+-
+ struct cs_etm_queue;
+ 
+ struct cs_etm_packet {
+-- 
+2.28.0
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index f85c54e7f7..5a3180f36d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -32,6 +32,8 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI_append_qemuppc64 = " file://defconfig"
 CFLAGS += "-Wno-error"
 
+SRC_URI_append = " file://0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 LINUX_VERSION ?= "5.4.57"
 
-- 
2.28.0

