Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490BEC3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 10:20:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.34815.1721038842889963907
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 03:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gzDCtKbd;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4279c10a40eso24898035e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 03:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721038840; x=1721643640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtWJgKUb61qE/FZuvL7wui0wom2dEwTePn1otGcNhcQ=;
        b=gzDCtKbd4w+B/4GVMoepICnmjiiD1nVbgeEwODhNwF/H2qvA4MBCougYHu+KrXjYRp
         019Dk8ka7rwjdY6utIUWfwU2NGKnFxWhb5Nq2TFDqVHI91++iTo0JtlznKzWYAkFdM4r
         YnbLXkPbZG98s4xPTDlqlNEWzDpc7pCWl+uL35vrysx0QQubWLne9hL8S9cuip24Jt6K
         CFx+14KwfD4xjsPVFMkMpJ4aK6aSNblITxiw03A1WtIuJzBZLRUktp6h31knRGvusb+8
         CXXI9NLjDCyj9i5yJPgccmUpfnf/tr5AErcV0Pq0UJgBWMwtLJrwpQfcottlnC4rt6WR
         jOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721038840; x=1721643640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtWJgKUb61qE/FZuvL7wui0wom2dEwTePn1otGcNhcQ=;
        b=w3XpsJMLAQlPvDRsGsA1r4VsFMqVtYNt0beLKP4rz3eCcK+duZnVVcTTTC8hQC4r8I
         CttAjhqN2MHcyqQXQo6EW+NhG5fZDIWRHTlsK43HtqYIAf82fTkgTPHOhyyR6W8wyYTx
         5HzX96CTtKeSDw4OoAEQ5SKsx55dLideEVQVXZxkgBecExT+pGBpwtAl3SXy5RmDgfHy
         raRwWg5iBVfzvoPlv1WW2U1OAfmXnolATrfnWpQZeofug191QIPBeRQbGSp9isiRQ5xu
         1gnJGU1HucgYNQyu9CKjKjNpeGI8Eat6giI30dCF68OEgEc1vtzt1qqS9t0Ee4PVTjAA
         QmYA==
X-Gm-Message-State: AOJu0YzeG5z7vVm1xGCMfHZYb1j7zPdgGXdmuRCYim41KyCvqx1oat4K
	9aLv8WAVTB4VKuQqWSiSZyEjJwgkMNq8qvFECPhsmV0wmwtn41Pb7wARMg==
X-Google-Smtp-Source: AGHT+IFs9Md12ajxPrrY78wZKLhD4kb1kBoZElGZ/PAUZALUxgTrHDpGU5s0wkOKd93ddobC0GSF9A==
X-Received: by 2002:a05:600c:2202:b0:426:6158:962d with SMTP id 5b1f17b1804b1-426707db779mr122843245e9.23.1721038840367;
        Mon, 15 Jul 2024 03:20:40 -0700 (PDT)
Received: from voyage.lan ([2a0d:3344:23fd:dc10:21df:617c:1f86:7c82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf128sm5914732f8f.40.2024.07.15.03.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:20:39 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH 3/3] classes/kernel.bbclass: update CVE_PRODUCT
Date: Mon, 15 Jul 2024 12:20:02 +0200
Message-ID: <20240715102003.10122-3-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715102003.10122-1-marta.rybczynska@syslinbit.com>
References: <20240715102003.10122-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 10:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201909

Add linux:linux to CVE_PRODUCT. linux:linux is used by the kernel CNA
in raw CVE entries. We can't use just linux, because of conflicts with
CPE entries of multiple distributions.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 meta/classes-recipe/kernel.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 89badd90f1..2a4f3defda 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -21,7 +21,10 @@ PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot gzip-native:do_populate_sysroot"
 do_clean[depends] += "make-mod-scripts:do_clean"
 
-CVE_PRODUCT ?= "linux_kernel"
+# CPE entries from NVD use linux_kernel, but the raw CVE entries from the kernel CNA have
+# vendor: linux and product: linux. Note that multiple distributions use "linux" as a product
+# name, so we need to fill vendor to avoid false positives
+CVE_PRODUCT ?= "linux_kernel linux:linux"
 
 S = "${STAGING_KERNEL_DIR}"
 B = "${WORKDIR}/build"
-- 
2.43.0


