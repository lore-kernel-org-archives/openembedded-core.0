Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8666AC6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:37 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.44241.1676990495346702006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=pV7Ly7PW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id h31so2491464pgl.6
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmJ3SrPMIh5aoUp6COSk2CBEg/OLuZs4Kvq5bVp1Aak=;
        b=pV7Ly7PWMupgs2s3YGUyUWVh3hmwYflncfArw728AoYJTxT4yStRpbK0oe/FsnEaVF
         mUdK0ivXCQTNC01T/sSwgAv7dYwGcbKe0RCV6pAWvqLiR4wR1r2BtT6W+MxHjVwnISnX
         IuhOUlpwbRDgH7IUGc9d8x+LrkZwg9+6wCT1oYon3oR1P64RRkuSpCpMAjjpjz4YX8j5
         9L7y+fI/H52TI5+jfcmu9QsaEH4mcXE1ArF8dZ0LZqHhpFdjjbdvg0mWCXkT44SoUhRo
         ZMJ7/HukOAl0KFYctlnp1yFcfh1ejVA7Ot3ILmA3wDNL4rz1xMGg2Zwa0mW/aFDKzleD
         Tl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmJ3SrPMIh5aoUp6COSk2CBEg/OLuZs4Kvq5bVp1Aak=;
        b=c8qQ44640NSmX27jI4ARetnHH7NEEq7VePWJgUAyWT1k7qYHwPH1O8k7ve6YgLrGal
         AViNELLxYFyf03P3ARsGdgDDlJjheyeFlu3g7wlvgzdePV4s4KRZzCfb4FHHZdGrPQce
         M31/9e5GecIAPqkWwZrYTN7V9kTjvr3dz8Fp00DNU4dzRabP3jrCM2Jff8oufuwSA8ab
         95zl98r8UYXkXupzxvMbWeIMSdLTfLZupi5V57tqo3i6SGW5r4hXLLi2pgRAXnuIU7XE
         DB2jnU9tqu6wTkMiG01t6AMUSMWK+oaCfRUg3WxbgwBuAmq7q5evhtAb1gSen2F58l7x
         +K4Q==
X-Gm-Message-State: AO0yUKX0Dlgyx0JXYclBhOixL6SKNxFD2l3w4GGqsmiN2XaOUyKW+kGN
	EMpGrKGWz5MVBbgWVp1zXIsrBPoq+wCfrAyYEJY=
X-Google-Smtp-Source: AK7set8AlAGwqUtDIB1ZPLPxxxmvcvreEnA3hYjaQfHM8tOHDnxCdu+1l5Q202xS9sz2jjC3wkndXQ==
X-Received: by 2002:a05:6a00:86:b0:5a8:c044:663e with SMTP id c6-20020a056a00008600b005a8c044663emr5028425pfj.21.1676990494375;
        Tue, 21 Feb 2023 06:41:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/23] libgit2: uprade 1.4.3 -> 1.4.4
Date: Tue, 21 Feb 2023 04:40:54 -1000
Message-Id: <4bc31ac89eb0562bae37e2246e8001b4286f61da.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177511

This is a security release with multiple changes.

This provides compatibility with git's changes to address CVE 2022-29187. As a follow up to CVE 2022-24765, now not only is the working directory of a non-bare repository examined for its ownership, but the .git directory and the .git file (if present) are also examined for their ownership.

A fix for compatibility with git's (new) behavior for CVE 2022-24765 allows users on POSIX systems to access a git repository that is owned by them when they are running in sudo.

A fix for further compatibility with git's (existing) behavior for CVE 2022-24765 allows users on Windows to access a git repository that is owned by the Administrator when running with escalated privileges (using runas Administrator).

The bundled zlib is updated to v1.2.12, as prior versions had memory corruption bugs. It is not known that there is a security vulnerability in libgit2 based on these bugs, but we are updating to be cautious.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libgit2/{libgit2_1.4.3.bb => libgit2_1.4.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.4.3.bb => libgit2_1.4.4.bb} (91%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.4.3.bb b/meta/recipes-support/libgit2/libgit2_1.4.4.bb
similarity index 91%
rename from meta/recipes-support/libgit2/libgit2_1.4.3.bb
rename to meta/recipes-support/libgit2/libgit2_1.4.4.bb
index 7e27b5b018..a6f4d8d7f2 100644
--- a/meta/recipes-support/libgit2/libgit2_1.4.3.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.4.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e5a9227de4cb6afb5d35ed7b0fdf480d"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.4;protocol=https"
-SRCREV = "465bbf88ea939a965fbcbade72870c61f815e457"
+SRCREV = "3b7d756ccfaf9ec2922d2db22e6cc98f8ab6580c"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


