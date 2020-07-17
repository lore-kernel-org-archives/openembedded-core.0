Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.12749.1594996696383258546
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OFh2paQT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.65, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f65.google.com with SMTP id gc9so6609833pjb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=tMEPooMfvxq/IzFaO92hbU3/DPL2W7Pc1L6Od2XZUZQ=;
        b=OFh2paQT8dElD2qqjh+4QJhnOrzdexj+Yf9dzYuB31sapWL0XKobeqd2TGtAg5Ok2/
         9Z/OXNQdz6JBeTDckcSlUs8siBJ8j7rMr3ioZbKYzBom9ZpG9FVp96/mSy9BvNu6wm5j
         LIp8ipYB7nl9RTES5VGUlQwXoBHuUhOhBHYp/naWtCWqeG2owjMbGSQ7/Psliq2dSpO1
         IssujjSldT2pgtOf4WMj8F8F3Q5HSEey7Hj82NFoH1r7XRq/YmDee4OstXIZNWjfl4WN
         LspoXyKi91Wf3hWJsAMVAvV3LFUVjc1pvsY2znoBpA7UH5Fzi40EEI9lj2VIKFOF9oAT
         iJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=tMEPooMfvxq/IzFaO92hbU3/DPL2W7Pc1L6Od2XZUZQ=;
        b=WGeiaJcTndBHps+4RCAab8if8VNdWKlf6EHPq3DQPz7LS6RiUmtTk3fLYSqzj34z7K
         DhrXOUUFWNA3+in1xlqrLcdl7wrCTk+F+d3Xo0qinbAgFlCgYyTkwecIQZWVniZOFGMI
         50g+3HQd3UHUObhcXJj6NdNrGnyQsUTaT4jhOkGcONF3B0U7BVjLln2l5PPB8F4H4P8V
         pr8ojE/uzz447W5qTwldV1/rv84rgxe7+gAdml3chLGJCAbqECDVtL2ywN4LrzAmSOWr
         7vJNza367dQYCamOEi4SAetL5tJTJFXFr+Z+YalD31oaHqr6GqKLgHm3hGnzo3VX+SxP
         0JBg==
X-Gm-Message-State: AOAM533KxiTCqrTdR+AfIe76Xruw4O+rrQMECSaTr7hQWJQMw89GTelc
	ggKfhp82CHt0zUASBmegzQA4++xZflg=
X-Google-Smtp-Source: ABdhPJz5+OY4+z8VdnTWka4pjNJDiOzMe8O8gjVBg/NQ1/c3WlAlH+PXqAWO7KQrRn7RCtrX21IHlg==
X-Received: by 2002:a17:90a:246:: with SMTP id t6mr10389205pje.230.1594996695476;
        Fri, 17 Jul 2020 07:38:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.38.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:38:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/20] subversion: extend for nativesdk
Date: Fri, 17 Jul 2020 04:37:12 -1000
Message-Id: <795781db8a82c9268fcabc93dd54cb6b07cbe9c8.1594996440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Jens Rehsack <rehsack@gmail.com>

For SDK environments where people still use subversion, let it easily being
added to buildtools-tarball to invite more developers relying on Yocto
based SDKs without much requirement to setup anything on the development
workplace.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 586a15b76f879f49c5224116cbf506b7ccf96cd2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/subversion/subversion_1.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.13.0.bb b/meta/recipes-devtools/subversion/subversion_1.13.0.bb
index 6879f1249f..b3c44ca9b9 100644
--- a/meta/recipes-devtools/subversion/subversion_1.13.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.13.0.bb
@@ -60,4 +60,4 @@ PARALLEL_MAKEINST = ""
 
 RDEPENDS_${PN} = "serf"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

