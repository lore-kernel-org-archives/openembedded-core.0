Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.19930.1591292844424743084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 10:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=NPKrf+hB;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.210.195, mailfrom: rahulk@mvista.com)
Received: by mail-pf1-f195.google.com with SMTP id b5so3578350pfp.9
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 10:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=HSK08U+muU/joXr3MEuspOPpv911yvbfpkv1+xsBO7k=;
        b=NPKrf+hBZYvf6nvbniFAJS9FluaBGRie5kGfc2oCQBfAFt/jJH7qYAPY3TkyYkVEzs
         8zfZLmQ5lPK/mqaLWPaJ1n6xqLH5P674Q66hY21mjO9Vulrxj/v8zl94020DWmuVCFAc
         FJhcrcVOj2WCQhoJbNZEKXGjAeI3l+2LWevLk9MVrpsWw04beheI5pbGwAL+eNxqjUlw
         QJjAvovP6O/L3WnsYoVYdXRCIv3a3UzMdZvPeXSLZSri70jrR9GEK7Z7jOi3YpiR0oVd
         2Cxj4/Of5mZvv1OIiEVhWYZkO27XDbP+woOmPZmHVnmRsZloA/Qs/Sib2j2skqhg1JCu
         O9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HSK08U+muU/joXr3MEuspOPpv911yvbfpkv1+xsBO7k=;
        b=XRrst68zMkn7SRCvibNAFWXaXaTBGHUzKcPRlCqW95EtdYpXKYtQjZkzWdv0DZ/P4l
         bepnMHEYKZvn0B8peJSGIIfV736SYAPsHy2Oz3ttO9BwggP+S5gC86WNRGvnZDFaT6g3
         jpHZiSMSjlcin7VnGZfLbmNusSAriqSwXvC83lqjRfQ+pbhNDfc8pgKHB3jhg5Rkqv0z
         KxZsMWz2PP/Rip2loEm8FUq3YtxDDW2W3lcRxbwwSh583K57YYUs5kLfPzt2WDjLwk0G
         My6dokeVeb7jxWcGuM38lBeTN58H7kVr+SM7lr1QeREWDTP0qr9mloXZ1V8H3JAy+du/
         TE6A==
X-Gm-Message-State: AOAM530gvsV9y/2vrBy8XB4azPiymqObmwCtqd+crO/P6mc/1JNahrcl
	xVnY4KIXeCEtMG9b4Zq1AYcEkzy8EVInbg==
X-Google-Smtp-Source: ABdhPJzbyEwmqjI5ILf8n0vIGC1hIIXBgLEOi2CmcU0EUl0axYG7DRzd2xzCOdNfwqp6mU63kjxpNA==
X-Received: by 2002:a63:cd0d:: with SMTP id i13mr5596875pgg.292.1591292843585;
        Thu, 04 Jun 2020 10:47:23 -0700 (PDT)
Return-Path: <rahulk@mvista.com>
Received: from CelSys065.mvista.com ([36.255.87.199])
        by smtp.gmail.com with ESMTPSA id fa19sm5864286pjb.18.2020.06.04.10.47.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jun 2020 10:47:22 -0700 (PDT)
From: "Rahul Kumar" <rahulk@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Rahul Kumar <rahulk@mvista.com>
Subject: [meta-oe,zeus][PATCH] tremor: update SRC_URI as project moved to gitlab
Date: Thu,  4 Jun 2020 23:17:08 +0530
Message-Id: <1591292828-25442-1-git-send-email-rahulk@mvista.com>
X-Mailer: git-send-email 2.7.4

From: Armin Kuster <akuster808@gmail.com>

It appears Xiph.Org is now on gitlab
https://gitlab.xiph.org/xiph

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cc6e59fdff71e47ef5b9b40aab3bcd9438960ea4)
Signed-off-by: Rahul Kumar <rahulk@mvista.com>
---
 meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
index beeb23a..d2ad961 100644
--- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
+++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
                     file://os.h;beginline=3;endline=14;md5=5c0af5e1bedef3ce8178c89f48cd6f1f"
 DEPENDS = "libogg"
 
-SRC_URI = "git://git.xiph.org/tremor.git;protocol=https \
+SRC_URI = "git://gitlab.xiph.org/xiph/tremor.git;protocol=https \
            file://obsolete_automake_macros.patch;striplevel=0 \
            file://tremor-arm-thumb2.patch \
 "
-- 
2.7.4

