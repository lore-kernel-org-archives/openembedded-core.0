Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535B5C021A4
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 23:56:33 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.40123.1739145389358220473
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 15:56:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U++xfIoj;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-46df3fc7176so35678601cf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 15:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739145388; x=1739750188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgW0N6zXE+PqXdHxXz9bVVn7ocF0ysQwOuz04fFHOeA=;
        b=U++xfIojqy+vP1p25GbgTXzgX1DQasdKsXtnEr8J8KK8E0mT6O+K1449ApRZeaGst3
         TU1PyuHXdQeZ4LCks+7uwTo95f7lW+AN/U+30eCPXl9mraZOQDzEAKtbhshCtxbEB+i8
         iph/kfELjVkSk6aPZ5lO3WEZLkio8NwPiO5eBNizX/ZuMnGa5JhmTxSslm4FlqQcc8MU
         TH3nSlDPyH7PXVxmr7n0QLwNj9+NVrwRiKiiK/Nmxf1IpMezVBhSeFpqsT0uLGJ6pDSD
         o0ECSYbJSCheGsGl4ZT3p/DiHyPrcSL0Srg51524LVQEzzuNIRiD9SNELs43zNNBKfI1
         nMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739145388; x=1739750188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgW0N6zXE+PqXdHxXz9bVVn7ocF0ysQwOuz04fFHOeA=;
        b=H5+2Dsna4gA0Zg+2lrsR5yWw+c2/0oe6vbLTP0q8GdOX5fJ3fQfp8AD9kaguly9DLC
         jvFhWLD1+Ko6gt+5gSGPkla2A1im++4aAqh2FN+hMtDfHui/L11zOQlPD3uHzhVkUeyK
         QjxzmlZ+Q72WQrRH2TxS3DSaClvD0lGx40JP4mWSdRu+5LofkaekMOovEhtHoB6BZHYR
         GpVl0x6mVwRn3QufdssSlaBnQhEfVrxv29/wngECdFUUra45KSHe0wQ3BrorY8lMsICW
         uqcsKAIMYC6qb+mCcOoMHcJU9z1QfXVBni5JirW2ukMuK3nc3RX9HGpbH1aeeddsxcDl
         pyyw==
X-Gm-Message-State: AOJu0Yw7B/qEkjXRwuyUg266r4lbB5THOz3p8dlVBT/dag3DNUspQCQD
	ZRYPCEtjavEW0ih5HUN+KioMfZtzs7Qn3otZozCb7TtJsjK1KPbqwAmhsCjRsK4=
X-Gm-Gg: ASbGncuG6fEX6Og3/Og8QsvUKOCs7/y3u1Rn3H4MI6Mvf6iDJELluObQoisFwGC5ArN
	rLrT3fl/wEQdsdgkXY328QhX1J2hPfUi0QKct/V4fuh0Xo+1jQQhktqyOBxv1/zzdcDO2COz/VV
	Dg8FBWKCt2ppYM7tZfZT4J3iCEk8+7cpt6agnfJUFLZllD4Cnxd+nIxKLOxnwEHgrdDIc04IuZ8
	WvLazvoui9KkH+1muNXvvERcyktRIOmCcez7zjrsmzVZMF2JlopG1nvS7EMn4M6/NT2AWLe9zz9
	PBWF//NqUFbzBzum4ge5Xv8lHE7FjIjyNXw70X4qurzLE0P9Ym6wFoYBOB01bAw9r3AlUsSFTJ2
	qbWmHeYiT84iHhCLz
X-Google-Smtp-Source: AGHT+IGh++lpSnOORO96WHd6N8iPbGwMhbPcgLq1Jl5fas/s3r5Jp5puhGUlqOL19lTfp4VORAHppA==
X-Received: by 2002:a05:622a:6182:b0:467:4b94:cfaf with SMTP id d75a77b69052e-47167b067bdmr130380851cf.51.1739145388258;
        Sun, 09 Feb 2025 15:56:28 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47153beaa5csm40754181cf.68.2025.02.09.15.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:56:27 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] yocto-bsp: drop linux-yocto 6.6 bbappend
Date: Sun,  9 Feb 2025 18:56:14 -0500
Message-Id: <5916791defee3381e969e526baadc5163ada9f33.1739145061.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1739145061.git.bruce.ashfield@gmail.com>
References: <cover.1739145061.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 23:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211062

From: Bruce Ashfield <bruce.ashfield@gmail.com>

6.6 has been dropped from OE core master in preparation for the
LTS release, so we drop our reference BSP bbappend as well.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto_6.6.bbappend            | 21 -------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
deleted file mode 100644
index 3f33ec991d..0000000000
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
+++ /dev/null
@@ -1,21 +0,0 @@
-COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
-COMPATIBLE_MACHINE:genericx86 = "genericx86"
-COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
-COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
-
-KBRANCH:genericx86  = "v6.6/standard/base"
-KBRANCH:genericx86-64  = "v6.6/standard/base"
-KBRANCH:beaglebone-yocto = "v6.6/standard/beaglebone"
-
-KMACHINE:genericarm64 ?= "genericarm64"
-KMACHINE:genericx86 ?= "common-pc"
-KMACHINE:genericx86-64 ?= "common-pc-64"
-KMACHINE:beaglebone-yocto ?= "beaglebone"
-
-SRCREV_machine:genericx86 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
-SRCREV_machine:genericx86-64 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
-SRCREV_machine:beaglebone-yocto ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
-
-LINUX_VERSION:genericx86 = "6.6.21"
-LINUX_VERSION:genericx86-64 = "6.6.21"
-LINUX_VERSION:beaglebone-yocto = "6.6.21"
-- 
2.39.2


