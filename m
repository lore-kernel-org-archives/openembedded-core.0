Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4402BC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:34:40 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.7870.1749130477677029718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 06:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PGauN/Vg;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2351227b098so7608185ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 06:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749130477; x=1749735277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d0ZReBYI8pP5bBQGF20tdHeUapZVf+kXSZ60ABhWFOE=;
        b=PGauN/VgLretVcE7UYbstgHTxVJHt7Z9Jwp0/q4AKrCnm8dX23S5X8fEg/T12PwdOP
         iHYbbGAAqfuizStqVNHR49vUDt+OP0vVYKAq8+EZ/osT1Xgmp6wgbUZCu52SDAgk/23O
         DbA31Z+vsSmeIHFQ0K3gT1+1igHtKYcyCdsPKc9MKKg5OLylJ6FXq0X7pLe+KqK8vqVr
         dyfFGave007bLMbAaXIccxi+yR8vmx45ynOIew2SnuWoJzESv1GgHcfpcthB1yDhXbmi
         QT1JXRkXurgSsdtnHJlsyzA05NjU05ds4pltuEb8D5BjtY/Ht4gY18C2CPHO29jRkjtb
         IkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130477; x=1749735277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0ZReBYI8pP5bBQGF20tdHeUapZVf+kXSZ60ABhWFOE=;
        b=DvyfxJ6BVg6NcBlPBcKcQ+pu+gbVGpg/x0ljTylzcbFXFYaqK0yRG7egKWObRCULY4
         nxchFkg7A02y5wPXURmbdWa+bqE+tcGo22pCJ6MaS3st5W154avk3osyXcSWQ0/jfmXL
         pbDBe4zcv0Oa2FBe6AA5+ImRVZdBNK/L4wvXIHFHn5OVNLdKt7BWXv9Y2ylMuZH6wTWH
         DNc5af27n5/UzR7Ik/xKyKv6QISxkAt4itWtv5FXOW6jfrnGPWcv/E7qPMX4IBt39kIS
         qou4V6+4s2681NR5Wh+Ulhp+4PB56ejlilw1dhWsvbq5hCWhF6SiNF8VTT6/3sTPfKI+
         vEjg==
X-Gm-Message-State: AOJu0Yy//GCfgIowaASuSw5xqmrwFIk7k9d0lT4DZowuVYmvHf0eKxA9
	zGZRuOh3T25ZRIvoFm/KfmqmEGov0OBWZ5+WwBrIazluEV/CXwIe1UTQ6xTCEw==
X-Gm-Gg: ASbGncsDAewOLUVwcmRU+qtwQK59zKBrx+SEBpPbD/lL4iae6/HraIR6RTNXU92z8o7
	BTveQMEzKgY1GOqB+E0mKwL8s2oX1tgHMen6XmHsIn4O5O+A1mJkhvHcYzbpI5VenIjLDkGxeir
	7fDYPXYPusB4xBccpzZcJLcbqFqcYCHuN0rhR9SY17Fa8OVYlrFyeorZjnGNKqEF9YVX2EQrKRz
	0RPHCcCeWveSUx7cbYjwLcS5E88Qh5NNdnbfB1mtFpkkmZnobs/fPiJJuRWK6Uc9RDqKdVwXVg1
	wuhIPBupFb1HhnJNMWvauRH/8uAvbWMAUtkyZnR/WSITqbUWWEZ2ZbmPhZpq8A3TFQ==
X-Google-Smtp-Source: AGHT+IFELEyF1j+7hUvvfHAKFBKrv42K9balN9lQHYjZ5J9dDMDEZ89MEKYrvJlvRixShthqjNxKVQ==
X-Received: by 2002:a17:903:1110:b0:234:9375:e081 with SMTP id d9443c01a7336-235e11eca33mr102663595ad.42.1749130476774;
        Thu, 05 Jun 2025 06:34:36 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c44:a779:7fef:8c20:c62d:6de3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d219afsm120373035ad.225.2025.06.05.06.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:34:36 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH 1/1] ref-manual: document KERNEL_SPLIT_MODULES variable
Date: Thu,  5 Jun 2025 19:04:29 +0530
Message-ID: <20250605133429.367629-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 13:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218019

This variable controls the kernel module spliting.

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9768d8f5b..592401eb6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5359,6 +5359,15 @@ system and gives an overview of their function and contents.
       the :term:`KERNEL_PATH` variable. Both variables are common variables
       used by external Makefiles to point to the kernel source directory.
 
+   :term:`KERNEL_SPLIT_MODULES`
+      Allow opt-out of split kernel modules. For some use cases, a monolithic
+      kernel-modules package containing all modules built from the kernel
+      sources may be preferred. For one, download time is shorter and
+      installation time is faster.
+      Default set to 1, one subpackage per module. Setting it 0 will generate
+      a monolithic kernel-modules package containing all modules built from
+      the source.
+
    :term:`KERNEL_SRC`
       The location of the kernel sources. This variable is set to the value
       of the :term:`STAGING_KERNEL_DIR` within the :ref:`ref-classes-module`
-- 
2.43.0


