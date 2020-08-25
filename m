Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.458.1598393893332926371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 15:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jJA+0Lze;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id j13so208706pjd.4
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 15:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mGDVYdpT4XoSy2QyjBJ5/ZlMAlh9dzOurHnyclFExg0=;
        b=jJA+0LzelzbxifDYBSr9OjYPiHj0rpCZCquZb2ealmKf/SfyrxtDrfcBGRC1DNsNpH
         OuBRBSLg/PHqOY+biV446+ZThcNyrn/jzVsniPh/puYhCGfi0lQyIuszODf3B3MROfOT
         BYzp6wbLnHoyupdMWvwnWy6P8b4UQIfhA79a9fvKZEFPSS8JLul2KakRO0Rz+LLgh0VG
         aUDVtVGGtojPxRTIvBjBtWFAuMvnoZAN4i9Hdpf9fWXbsXefqH3QqMmkgJnSCqWUfRUj
         d5H1Gh+s2cJz0cw9lVxi7oLuxtiwA2qXU1WUcndi0zIHJOMlbgemjT2iCFiqJBKkXwZl
         CkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mGDVYdpT4XoSy2QyjBJ5/ZlMAlh9dzOurHnyclFExg0=;
        b=DLo4NRZ+StoVb1dtRCGt8ib6kSIxAbG3f/glICGe/BnhOZKxYfodduO88XZniy82CH
         ZCBL11RemDiUvftnAt3s/biieIlAKCJwo+wY6KSkhdTkln+fszr8+8RBIVBdjIqnT7xZ
         uhIwBKd67xSc1ohjSB3Hv2f6TJ5VZajmEFAiAZvR9U1VCEKrye4I30B8uJeiqd5fwu/F
         s58tNcEUQEq9ExE8Pl4hXAtjoqCfH8wffYNpzMWnSZA0Fm31LDQWCteDoPEgOXacwwK6
         c+ARfkfMbHB0XMQ/92dbvjnlpavGUEYZ3bbJptl2vaI8iralpPa8nI6E7DvQbn9zuhtH
         Ahew==
X-Gm-Message-State: AOAM532lABfCjmMgPmd4H2Qz2LdNNLvRMhyLZjLlHRbla5rbPPmHo0r/
	sdzHwO7XixxjZlVyQ/XsFgN1Z+ojsI8/+w==
X-Google-Smtp-Source: ABdhPJzXerRtiUFRyfztdzXxPBkVGRu7ts74tVQnOoDqtcqCNLelbrfGak7dIcJuWkq5XIa+b4nTXg==
X-Received: by 2002:a17:90b:4ac7:: with SMTP id mh7mr3057030pjb.99.1598393892570;
        Tue, 25 Aug 2020 15:18:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4fbd])
        by smtp.gmail.com with ESMTPSA id q201sm255023pfq.80.2020.08.25.15.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 15:18:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] kexec-tools: Fix build with -fno-common on ppc
Date: Tue, 25 Aug 2020 15:18:09 -0700
Message-Id: <20200825221809.671196-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825221809.671196-1-raj.khem@gmail.com>
References: <20200825221809.671196-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-kexec-Fix-build-with-fno-common.patch         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch
index a3ba0912d4..31f4d00b53 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch
@@ -66,3 +66,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  int bzImage64_probe(const char *buf, off_t len)
  {
+--- a/kexec/arch/ppc/kexec-elf-ppc.c
++++ b/kexec/arch/ppc/kexec-elf-ppc.c
+@@ -33,7 +33,6 @@
+ static const int probe_debug = 0;
+ 
+ unsigned char reuse_initrd;
+-const char *ramdisk;
+ int create_flatten_tree(struct kexec_info *, unsigned char **, unsigned long *,
+ 			char *);
+ 
-- 
2.28.0

