Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.35337.1612792496924642754
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sekAHmPK;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id v193so10191945oie.8
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HprVWHg8rK7PZO9glOLsq1XPia+q/qusLx/bYKP7HQk=;
        b=sekAHmPKh9zR/DnSBxN2H1+kaLkc/8aJg6M0lecmADYuE37vMG3ctgWMPNEAoh1GNa
         M20d/XLXcTKS7jtYm0q2Y7Jlc8VMqrzqbfLWsULg0CE/oI3UajBx7edHBm8KZy4cJbqW
         3UC3eA9fSZ7nvW7VfqpRTclsq6jyupNkSV7zRHED6aCeb1kGOgMJzmW9eNdOTvxddbXh
         9jSHfF1FWgMizAr/142pDP8AyTJ8gfvlzFX9YGFFWXRPJAYnLFzx90MEsD+vMPWRKpKz
         KKECPFI395VqJpA4Usv7fsqrbSRk55OLYOSNiFzZlKhq9pwcu+O9L2sANFQKtx+fntJM
         Vz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HprVWHg8rK7PZO9glOLsq1XPia+q/qusLx/bYKP7HQk=;
        b=W6Ak48SToiRCu8SmOKCZ1sWUAWHrbiWeEWtSMXhEbQJ0xBHAkMwrdfXnBFVpM6KDGk
         WIvzsYl0RuDHjBfOWmhlm5/VDQAiRJzjUaxz0k7aAallzZV4lRbCIPS37+JBfVk1fIln
         BRs6WVd2G1sDakIJHz7smRYI4JKtaEq9vt67hAKalyowfFkViIMDNwuRr6bBQwnkhUOE
         0waKvsz8pvy4SiZB8VyGDS6VhdnzOfFxndhVE3fNzmeeritPTH6FYDwVnV+vKPr3qGGZ
         yBRDwbcTUAlXdiEIbroT7fSXyBcKqgcNCjt4yHe60E0cJteWbdxtSN1Z3upDbYYpmPtS
         PLDQ==
X-Gm-Message-State: AOAM532RiqyPK5kriY20E2BlA5C8lIJ3j73InwrkiftZEaRl/6dXfJOo
	hmA0tRj6s6nuNleJJcFNMhU1swdJeJTQxDSYe6s=
X-Google-Smtp-Source: ABdhPJzdx6JH8//KsZwlk8i+3bmpQJ7tb8qf9hKm16p3rMb6TnjULT/Yd4vAtnIfgYJmVQ28wVdgYQ==
X-Received: by 2002:aca:4ccb:: with SMTP id z194mr8781649oia.1.1612792495886;
        Mon, 08 Feb 2021 05:54:55 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.54.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:54:55 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/28] qemu.inc: Should depend on qemu-system-native, not qemu-native
Date: Mon,  8 Feb 2021 03:52:11 -1000
Message-Id: <ce5feb016e777b493f3e3c8cd74b669117f3d321.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This looks like it was from before the recipe was split, we'd expect
the system qemu mode for running the images so the dependency should be
updated.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a4fed4ae0e8a0d1bd62ea5fa1ef12925e1f20f5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/include/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 8dedb1a42d..7d0a6fe458 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -21,7 +21,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""
 # Use a common kernel recipe for all QEMU machines
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
 
-EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
+EXTRA_IMAGEDEPENDS += "qemu-system-native qemu-helper-native"
 
 # Provide the nfs server kernel module for all qemu images
 KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
-- 
2.25.1

