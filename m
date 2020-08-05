Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.7930.1596636298331457893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EvPEqYhl;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id h7so41695548qkk.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6O8r2GE1LjEz0bRo3kNNuJfAdn+TEePjlVMx/mGPvKE=;
        b=EvPEqYhldhp3IQWb+zdtadnPbACkRWrOcqYq9lbJpAyrL/JKAmyj06kt5I5DyKB5do
         KSs9wzR8ii6/wGLPN0ZxxYJQ1K+c2+5xouR5eLJ0/K3QIlkqPC6vNV/T9iIjaPJhyvmb
         p16SD6lfARtdCbYmA7a8EkDHb1VRNcrebiRZTljglj1RNH95VKF8lFQswIlLISctjbul
         mQh5hIYrxxIoqU1pdqaH173UTs3+Z9Tv0Ryabw9TBpIXejjIFxzeIi7I1B2xms+Py4fp
         3U1Vmn2N0dsXvLlXyG6BNprLgwLCmzASzGbJa9CngKI7Ie6c7x0BXGkO207OX9dBF+4S
         HLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6O8r2GE1LjEz0bRo3kNNuJfAdn+TEePjlVMx/mGPvKE=;
        b=SeYwl6UqpgqGp4ldb+8SlAGwUN+dmrNb32PGEO2ZTttibH53lihhMb7cvef9J/Iq8V
         a47aCC/f2Nq9suEoPg83i85bSSfkFKsqMuRvCwedQSe3gmVfzIiPmok/c2N0PDZ6Gdr/
         rsTTQbvOqeyEZ6M2JMW9zN0yYF3aDuEiLdli3nZzIx+Mghpkg6bZZleJWwWwaTOppjfi
         XLyT+d8WShcOgutQCTSj1YPWzAEhCGLyi7TIaOmJiQvN6wXQry7KqcIoQvcq5MHdyQWy
         ZsjJmoW4XvbgBxgxbqoqSiaXUbwJF5dK424XjoflBKBLPBgviXM0dQIQFkjTaMfNzmTh
         5kMA==
X-Gm-Message-State: AOAM530z1y6JqZ688ZpQ5qR3CcOg21YoDqtJlBMThBJJZYJCDNZp3yDI
	eRK7FATS4XqzALSesOmCmg4=
X-Google-Smtp-Source: ABdhPJzxkv3ffYUmwY8QIptMkCCIVi7kYLc8veRjNOuz5nQ0AKgW29aNzmwDV2i+XBmfaMlpBSFsqw==
X-Received: by 2002:a37:9d97:: with SMTP id g145mr1602509qke.263.1596636297420;
        Wed, 05 Aug 2020 07:04:57 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 22sm1760276qkd.64.2020.08.05.07.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:04:56 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-modules: update to 2.12.2 (fixes v5.8+ builds)
Date: Wed,  5 Aug 2020 10:04:55 -0400
Message-Id: <20200805140455.39655-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating to the 2.12.2 lttng-modules release. This is the standard
collection of bug fixes as well as changes to support building against
the v5.8 kernel.

Changelog follows:

 2020-08-04 (National Chocolate Chip Cookie Day) LTTng modules 2.12.2
         * Fix: Lock metadata cache on session destroy
         * Fix: metadata stream leak, missing list removal and locking
         * Fix: coherent state not changed atomically with metadata written
         * fix: include module.h for EXPORT_SYMBOL_GPL
         * fix: __lttng_vmalloc_node_range const caller introduced in v3.6
         * fix: version range for overflow_callback
         * fix: global_dirty_limit was introduced in v3.1
         * fix: wrapper_uprobe_unregister is a void function
         * fix: prior to v4.0, __vmalloc_node_range had no vm_flags param
         * fix: vmalloc on v5.8 without KALLSYMS
         * Detect missing symbols used with kallsyms_lookup at compile time
         * Use exported symbol bdevname() instead of disk_name()
         * Add git-review config
         * fix: mm: remove vmalloc_sync_(un)mappings() (v5.8)
         * fix: mm/writeback: discard NR_UNSTABLE_NFS, use NR_WRITEBACK (v5.8)
         * fix: block: remove the error argument to the block_bio_complete (v5.8)
         * fix: pipe_buf_operations rework (v5.8)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../lttng/{lttng-modules_2.12.1.bb => lttng-modules_2.12.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.12.1.bb => lttng-modules_2.12.2.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-modules_2.12.1.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
index c0df0cab33..49b7a116bc 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
 
-SRC_URI[sha256sum] = "639c03bf8f0e920567f45c96cc7ef749a8fc29ff7fb3fb97263d67f66fb71aef"
+SRC_URI[sha256sum] = "df50bc3bd58679705714f17721acf619a8b0cedc694f8a97052aa5099626feca"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.19.1

