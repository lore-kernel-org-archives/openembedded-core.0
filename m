Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web12.10000.1614349663518478231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Pdy487E3;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.48, mailfrom: steve@sakoman.com)
Received: by mail-io1-f48.google.com with SMTP id k2so4341389ioh.5
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ba/hZct3vooUAOqP7O03Pt3EDTrY+gVyMD33QBHJW64=;
        b=Pdy487E3sjXnDxaLss/R4XgVciK9yub8kWhDZ+y/p7ngQaxEC6AKuZMJiS5G8wzkg6
         EvSakuYjQyMehGqIAPfEd8FE1PnfqsN1ICngwbPDog2zIyCN+jjvUXeWL0FGmQTfSHtV
         qdLU1/Ek3L1UzY+E6j7FUSx4nntiOTt+rW4ihinDvYZCYyvfPIeWq3my1vh4x6WI197O
         tg0FxsT2jRf61RXxSPYyRIpINMszsiFsCk3hso7RWifg8o93K9hlChrDs404q7lZIf73
         cuH5AOJoQNAGnAEqgEPdZP+NKzZJD0PNhT/nK57Awn7T0HMqRJLBrirol0FHyxBgLKPc
         W/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ba/hZct3vooUAOqP7O03Pt3EDTrY+gVyMD33QBHJW64=;
        b=RIWqDiBG0b4VbeIRq/+GFuJ7KtQyiLy56e8spiUxgPgkQUG5fNLEq2FrcYaZzkGhiQ
         1UQWOmQwcscL76i8wcBHeRYz5wKJcpzV+EkzLaiZKDUAUT+NrblPBbQ3BNzgOowQmfrz
         B1ND8bYaco7SEAQu2+qp8Dn0TFxx9apx95z2QkGL8K8CtldjZQFn0+6pf9cHQcKwsXMu
         fYQ4yXvXgdOWoed5Fbm8inUOzsMj6ICX1XAAMq32AuAf/PIvFH+sjxehGFhn01VoMKrI
         ugJCyN/e8WyP/Qi+hglVMBPlfjEOvC/10L7Q1IjHf8JxNc9IUhNtuoa1ELVW8OURty4Z
         zt5w==
X-Gm-Message-State: AOAM532QOy0YU7nSwA1jqGTBsAiZEs6p5kxI2+cXw8GS5dRmbQBqGOBs
	Ax8qoQq75V0TekHDi/FlPa/mKPIoCJOlMvJC
X-Google-Smtp-Source: ABdhPJwgfst0czytKXJ9jxvDm//3wfLPrpB5qNiTD2vfM+Pf5wBaaNrJFcF6DxjgDb+Ptln0rBhAtQ==
X-Received: by 2002:a5d:9343:: with SMTP id i3mr3032605ioo.138.1614349662475;
        Fri, 26 Feb 2021 06:27:42 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.27.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:27:42 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 32/40] mtd-utils: Remove duplicate assignments to alternative link names
Date: Fri, 26 Feb 2021 04:24:15 -1000
Message-Id: <1b4633efce16f7cb917b4b701117bc853b6bf259.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thomas Viehweger <patchesThomas.Vie@web.de>

The two duplicate lines are not needed. The existence is confusing.

Signed-off-by: Thomas Viehweger <patchesThomas.Vie@web.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 36bdb4faa90dc18bc020481eba82ee570b968c39)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index d1658a739b..67cd8582b5 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -43,11 +43,9 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "flashcp flash_eraseall flash_lock flash_unlock nanddump nandwrite"
 ALTERNATIVE_${PN}-ubifs = "ubiattach ubidetach ubimkvol ubirename ubirmvol ubirsvol ubiupdatevol"
 
-ALTERNATIVE_LINK_NAME[flash_eraseall] = "${sbindir}/flash_eraseall"
 ALTERNATIVE_LINK_NAME[nandwrite] = "${sbindir}/nandwrite"
 ALTERNATIVE_LINK_NAME[nanddump] = "${sbindir}/nanddump"
 ALTERNATIVE_LINK_NAME[ubiattach] = "${sbindir}/ubiattach"
-ALTERNATIVE_LINK_NAME[ubiattach] = "${sbindir}/ubiattach"
 ALTERNATIVE_LINK_NAME[ubidetach] = "${sbindir}/ubidetach"
 ALTERNATIVE_LINK_NAME[ubimkvol] = "${sbindir}/ubimkvol"
 ALTERNATIVE_LINK_NAME[ubirename] = "${sbindir}/ubirename"
-- 
2.25.1

