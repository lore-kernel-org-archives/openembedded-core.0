Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.6318.1604890617262937939
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 18:56:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QlZ9sBWT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id w4so5769015pgg.13
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 18:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1970cwngL71YJp3hU1JAJqsX2mtpEbL096aZLbPuMb0=;
        b=QlZ9sBWTkX28g4oGe0mS6U6ZFQ3SenYveaPzSPH0Hut05F7Byuz5MSPLkPUZVIHDvK
         2lndNCGHKC/cWImUKmyElP0LF2gMmHEv4oJl8tMK+/NVnwE4D32UdkGiA/GAuMIlAwDI
         e4tjzecAwAIBSDn22VsCqE10tEpfRpSby6WW6jzrABi/WKhe1G7JRBK5rbMMBv5gSsQC
         j96Kt8//oGXBjuUG+Fxaj38LDmQXbrWTOIeTlOHVsZL/p91KTlA6VUaAknNsmVDNd22A
         gjaipiyL3JLn/uecjDIBAVh+DBPi7QMsWJM9KobS5rzxNfl1WFKXOdriWYktQRBKT+aP
         QlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1970cwngL71YJp3hU1JAJqsX2mtpEbL096aZLbPuMb0=;
        b=fgSD/jutZPE8ESVhd/8fOEoew+dzNKkj2fp+ThRYnqxLWOfsuXWpJFUpqOwMBNZ4z/
         SM6gntJGuu+ua7+HatynUGIycyySwcxyuVr2WwPeTdoHxV9yNF/aMUq0yz0kO985SVp0
         qmsg6oL5BvKhAlEJDiZJpSKxzaOxtKCY6o5coZ2UqcCDMetlWY0+QEndiMsm6g4hvJCe
         tZl0HnwifrUIG4q94bUcZSzOzbuERcCojjjh6eyLO3wazyPIuywRWyPIWeLO1e3a2ILc
         EL/JOxQ7z/N5AKslmgsLPsll4KjFncQ7bG9NSRER/ab/ASYI/Y6r5XfD4gcColbCsIq7
         k4vg==
X-Gm-Message-State: AOAM5324mqLUKTY+QMP5RZGaI+tW0XmpMgecIco3bOG8K972ZhWRybE/
	Zjh/zQRq9DlSAwAO2f/un1ADet2X5YsD7YnP
X-Google-Smtp-Source: ABdhPJyz+8iN3cGsscSy6UW4Jp4orPr74ByZ3Ltwo396f+nX0zbszTN/FE5CTQURqVEyTiaj2EfSkA==
X-Received: by 2002:a17:90a:da01:: with SMTP id e1mr10618596pjv.215.1604890616489;
        Sun, 08 Nov 2020 18:56:56 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s4sm9107037pjp.17.2020.11.08.18.56.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 18:56:55 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/12] qemuboot.bbclass: Fix a typo
Date: Sun,  8 Nov 2020 16:56:09 -1000
Message-Id: <04c13fc4670fb0b4675c8e714a9e61c9c8ea60c2.1604890441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604890441.git.steve@sakoman.com>
References: <cover.1604890441.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2b5fb66344432390aa0cc199ad3f9ec2a4da26bb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/qemuboot.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 99da543f9a..648af09b6e 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -40,7 +40,7 @@
 #                          QB_NETWORK_DEVICE_prepend might be used, since Qemu enumerates the eth*
 #                          devices in reverse order to -device arguments.
 #
-# QB_TAP_OPT: netowrk option for 'tap' mode, e.g.,
+# QB_TAP_OPT: network option for 'tap' mode, e.g.,
 #             "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 #              Note, runqemu will replace "@TAP@" with the one which is used, such as tap0, tap1 ...
 #
-- 
2.17.1

