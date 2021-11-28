Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEAAC433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 22:00:06 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.53182.1638136806023293979
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 14:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7hEPWSgY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id b13so10510326plg.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 14:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6s0mjnSLVzObIa/bz210mboe5cmYWbUGlLKlHgkANaA=;
        b=7hEPWSgYe9sMn/+gn1g2C8GuMFIEqMSB3AGFRPtp4FnEZ+y5TyP2RVnZn2+UGGq0rX
         CCeerrt4UKWmz+FMlBafibPjARvSLVkUXAPcv4phmuEyL29TUXMFgaYj+NKoWcugGJOd
         NtgmvQ/Ha2+Liab+cTdZE3ATGahznTyoOeenxTuhqCrVno1dRgmO5U4V0utJJuEZR6Qt
         Iz243Db6zjMK/Kl98SahcGrhhuZXHLHRRK5VHtJloGfQZo8pvsRzbHFehEgFehas/1BW
         rRJVOLOrpOmXZ8MqZbojSjaMYy43LqNxBWuLdiA7J4FcnEYLkAa/TqncCKw2cIqx1QFC
         z9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6s0mjnSLVzObIa/bz210mboe5cmYWbUGlLKlHgkANaA=;
        b=qyYZVvrH5oyiuh4uFL4Xg6rhGsebZOLzZKs+kKfMdAsYZwRyJBNUPc/zBNXnumRaQU
         7Mo/Ush8pwFUDUuGq/lPKSmxGavgBO2RVz5WWw0gYV0eMr5ogZiyeBLZTsarfdy26/2x
         yf+LQ2LeSxRmf3E2M7uYSQ+gtvNQ9IiErsH5nt90JrdU9BeVDSi8n4OtmDzqOYulnt1+
         P9ef7V37jSmL9R44h2AptCwndz2ndu1HGGl+luYunkHBg6UMaItk50Q4hEiphf+xUbvS
         yywTrpy7vUOmQ6PcsfQ2dZ1mKxb8jyNuWNa8FSV3ObKO3wixwDisG+3t5Jw3+n6e18j6
         yEHA==
X-Gm-Message-State: AOAM530EBGlH+oxs9OQ5cQdHF42esfS3x5JR4wMzz06uLGMJ1YTCttJU
	FArnYEept7kD+eTgAowXvw7xL8U6WtnpV/JY/Ss=
X-Google-Smtp-Source: 
 ABdhPJwUQN+WEjibyrVoFoY6Boa5XYPCGaI0OWbMmwrS1AdpNgjv6gYKOHlY7cIurI68QZ1JcNnLvQ==
X-Received: by 2002:a17:90a:ca11:: with SMTP id
 x17mr33110453pjt.61.1638136803906;
        Sun, 28 Nov 2021 14:00:03 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.14.00.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 14:00:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 42/42] openssh: remove redundant BSD license
Date: Sun, 28 Nov 2021 11:57:54 -1000
Message-Id: 
 <45ac839a6982d2ea4cb154ada02969420b9fc043.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 22:00:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158924

From: Ross Burton <ross@burtonini.com>

The license statement already includes BSD-2-Clause and BSD-3-Clause, so
remove the redundant and ambiguous BSD license.

(From OE-Core rev: 5c0b03cda19bcebfc71e1e601a4336fcda4bfc2b)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
(cherry picked from commit 7eaab4b261017ae49926b4f18228a3af9906c19c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index 78f1669240..b60d1a6bd4 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -5,7 +5,7 @@ Ssh (Secure Shell) is a program for logging into a remote machine \
 and for executing commands on a remote machine."
 HOMEPAGE = "http://www.openssh.com/"
 SECTION = "console/network"
-LICENSE = "BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & BSD & ISC & MIT"
+LICENSE = "BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & ISC & MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=18d9e5a8b3dd1790d73502f50426d4d3"
 
 DEPENDS = "zlib openssl virtual/crypt"
-- 
2.25.1


