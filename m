Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2C6CDB484
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:23 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.51164.1697234000070154942
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PMgTK5W5;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.46, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-57b5f0d658dso1398539eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697233999; x=1697838799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Af2iQh1Giec74SifKfAE8V3fhososzB5a+GbLBsL1i8=;
        b=PMgTK5W5hvFZ9RSZw18yShy5cEUqtx1N71vl0OMsQ9/R2dnex072ZKBx32rAX0gJYF
         UIHrKzcFCucAbTnytHnckRfOsX3ylfnVotVXd4bcJn5U5biV2ypA0emfrtWuXC6YJPxc
         8Vt/XhU+pa/7/XqsnrICaQGY+HaPNzCyGEVrgYRQCAerzFsa0Z4ZYsZMlolIhqU/bSR3
         Cl5HLaZ/pFxZZbskw0nDRYgeJ+lTIPYLYHmaIaa6PXx0kquW+fQeCCT888/je4H9SM+X
         nEGA8Hy5AM2QJjQ2mwQtHfKHSyAJiDE8t0oFRYnt5UZFWCfnDxo8mg2S24vq3ddw8Xpd
         MJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697233999; x=1697838799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Af2iQh1Giec74SifKfAE8V3fhososzB5a+GbLBsL1i8=;
        b=nKlJe+OeeWlR0D02R8JeCBI3hEuuNxGcSLL5Lwf55TcE4K8QL7rzLX+/LCIAtm38+F
         nZhr7JlG9exTqVBv6ZSkmKsDZkCry06vhYYEw6PxM92vb8TvLaPoMmNz0PAMNNYLn6vQ
         EL3PI2TQEQpIMQ3+d+agj9fXe6GAQO2pftB6SkxgPfs21y0+7i02ETXD1leaBIePJX0E
         JN8+uq3pQrlD+LpEWDiT79999aVoailDABDQnoQRUAwnkNxWo8cdEkHo+q+FSu/e/fSZ
         9BpfhF9MELGCGNUyNseAxXZBYeDGr4HNnL9oS6g9dl8oLMGy+CzC4/vzaB6qttdojElX
         JFVQ==
X-Gm-Message-State: AOJu0YzgQA7PGU8eIIg+W3TFXQh7BifEFfrhgA2N8bZqNfSdmJ4BTtSU
	pDFljt6L4YwisSPVCDnlmQb3vijTTAEsWq3vSck=
X-Google-Smtp-Source: AGHT+IEXKFjSrNKp+ZF61KRuzrsRcGsLPk1vN+78/MiuasEroA9CMGRJ1MGphbYOFonVwZric/qj2g==
X-Received: by 2002:a05:6358:8a0:b0:143:27e:d3cf with SMTP id m32-20020a05635808a000b00143027ed3cfmr33620387rwj.4.1697233998976;
        Fri, 13 Oct 2023 14:53:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/27] vim: Upgrade 9.0.1894 -> 9.0.2009
Date: Fri, 13 Oct 2023 11:52:34 -1000
Message-Id: <7166f503211c39542d828aa3fef5006dccf2c07a.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189087

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE fix for CVE-2023-5441.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5f55f590e6..5e06866692 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1894"
-SRCREV = "e5f7cd0a60d0eeab84f7aeb35c13d3af7e50072e"
+PV .= ".2009"
+SRCREV = "54844857fd6933fa4f6678e47610c4b9c9f7a091"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


