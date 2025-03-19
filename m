Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A2CC36005
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:28 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.2942.1742372182124399620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cjtb2s1u;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22398e09e39so140413655ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372181; x=1742976981; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPSfqcsFYCmDEIEBHfIYCnL+AQbT8jQB7KG0eCEwLOk=;
        b=Cjtb2s1u9vYP0Wa87fLmw4RRHPpsm6Ma67TEoaNVPTJbW5UhGLYrX16eYiCXQHEYjn
         oqd3zVRLc31/mUlKUxIR5FSgXjuE02DMAQduyjE06lnhjtTsXFhFU9l3zsoHrH7+zPYf
         UMgrxqNEwUlLAsMJdV64pWVv+wAbf5dHwILdpqO5sSm5Y4QoL5SHh8sr18Ac5nfV/Nx/
         FjCclZT4K7T8rHRS/Y0jSxKQZOZTFAcMIxNJdv/d0GEdL/GY3bbPlCSZTiY8odHx32i6
         eOs6XxPnXa0lfWqTjk7klXrGvVznvfmeULZlnoub75aYq//XIZ0YO2OTFzmRsh6p7s6R
         xNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372181; x=1742976981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPSfqcsFYCmDEIEBHfIYCnL+AQbT8jQB7KG0eCEwLOk=;
        b=Z1aPIvpaEX4dM/I4nEUWPspxssz4ABQdM7QtDmfYYWh91GqOG7C7GrBGFwYzL1pTI7
         xcF7KYNuqcO2oso36SVFahMo8XMAUGWZ99X0Lsbq+whmxkDTVx2E7ovEKe+uD+/90hmp
         DNTCDU+dNcqXnsVgCR30qdDNFq+tMfy0u96kN1I94o5X6z7SOld1Ei/Km+qZZfrI/Q6C
         d2RpmJFHsJaDQ5xWxHtU/6exrh7Mc+zfzpexIMMzp6QnN7ujozkLWt0Vq6msXdC+4ob3
         dEpwT8Bk3SA9aI31qbLDZm0x2ZZJ3UVGVjHDirNc1/ixSy7yrN4rFAzraAvUZ/D/lOOT
         f0Hg==
X-Gm-Message-State: AOJu0Ywr8C11ERd4sLYbtLTeVH8hSl9O4C82HN5TVmAxtM1SchyHPZ6v
	fQrqCh27rDr6wz/YmPLM3KTpRVcVLL41eEavsNwVAqV0USPKDGJ6XhNsqqfw
X-Gm-Gg: ASbGncsMhaIeNGLZOKH/4djdsJVIo37x3wFlho27ufp4Pvq4SLd8SJeKoQ7sneVOD5V
	R5RMNru3XnVKTkrhQfGuujWTpLeZTKuUFKlMEdg7mixjAo3yN9GZj6Bktg/PMq940n6ZAsUlXTU
	Fg4nT7ofqu12VGJvLyAavc6L6WlNxR7yzK4D2Te/4DYaLDJ4BXCT/93Y19/rgVkoNLbF0U3j2hI
	+AmgdbO+kD4gXnlN5kHhWGZq2/Ce7CmZ6/1PcwTdNdT8zrFo5wxSJ6u8Q2t7qoCEhTHLxYUbto4
	4u5b5TB5xo1nT0QKzWkZKxPIXtmcyXaTPgKw
X-Google-Smtp-Source: AGHT+IFTEhcNNmgEJsj+2rPVPY3fFmJdMbVlrDC7J587bNtxXTaXrvvvlYP08baWiyMJp7BK9RumLA==
X-Received: by 2002:a17:903:46c5:b0:224:191d:8a87 with SMTP id d9443c01a7336-2264992dd5fmr29590485ad.26.1742372181225;
        Wed, 19 Mar 2025 01:16:21 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 09/27] tcp-wrappers: Stick to C17 standard
Date: Wed, 19 Mar 2025 01:15:37 -0700
Message-ID: <20250319081610.3536475-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213275

GCC 15 has switched to C23 by default and tcp-wrappers is old code
pre-c99 and would need to be fixed all around to get to work in C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 8cf927153f0..05644b7db95 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -55,6 +55,8 @@ SRC_URI[sha256sum] = "9543d7adedf78a6de0b221ccbbd1952e08b5138717f4ade814039bb489
 
 S = "${WORKDIR}/tcp_wrappers_${PV}"
 
+CFLAGS += "-std=gnu17"
+
 EXTRA_OEMAKE = "'CC=${CC}' \
                 'AR=${AR}' \
                 'RANLIB=${RANLIB}' \

