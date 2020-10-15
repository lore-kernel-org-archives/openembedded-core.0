Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.13197.1602771347501648737
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 07:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VNpUMQIQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d23so1695363pll.7
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 07:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xNsB1MjeyfC0TSAihkaoCCdILNfwkzaJGE+lOLHrxmU=;
        b=VNpUMQIQAKFwEBbFjZYJyJ/N4utHm4qt0RsRTan2J0FcePj4SdcEe4bp+XELgxC/0+
         VmXb/P798dVqJ9X9EmaygxNivdD+pV21uDFi34YZMaEv/kkK7aiQH2wSkQlumiNm6bAj
         lVW1K4uMnDgd6c1xG7htxr8z9CMBEPqQDe9wCId3n5c34Fr87jJAWEYpbvm5Dd2WaaRb
         s1/JGtgil6u9rJ890y5O7JCY0vUIHKM/AXgwbGwIgjvGkiWcyuCPsFsIA6mKWCDOEpoy
         TgYssFe93JXV/286m8dQ3/ZScvzgowqroTo2hdE6/MvqhGG4N05CBjQ+o+7LXDn2adCb
         Xegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xNsB1MjeyfC0TSAihkaoCCdILNfwkzaJGE+lOLHrxmU=;
        b=rHfX9qLz5B2eyxKkIVUTWv4qMPlFEK39X+GI9Qc4YQtPOmL6GChKst91O8V6D0AFQc
         U5yyQ7sK9jaEsuEtwpZRkwx9JQrNLNk7cPiyWG2lK7wpIM+CB6fACeAnzyP/hCBuwkC7
         CwIT+in8hOz/rJzjZJlH/sG5NFwGFcT0moiIf65+f1aNgsQSz+h+gJHI97yxbdmOlClP
         MTpZwHaIkWwaediTokSU5c9uYvMv39Ef4B6lSNuqPfsW2AxintSNpuDVSQwGaIgJghuY
         wdRE/FLIDblACT7/ZIFBtwQ5OgYZRlF7dVCtbTbUmo8tzrnljia5XiZaoq1S0okA/6lU
         o2mA==
X-Gm-Message-State: AOAM5302k8Rkpk9gvFYCGgEi/DR+AFl0fNV78r0RoSMke7T+COGsDM9z
	rj5jceg4HnxoPtyDyi/CiGZJBEtuHzzaJZ4O
X-Google-Smtp-Source: ABdhPJzYqLwSeYYPSVQAj/mpctZ5TftlpibG4JZngzgymZHAt46V83t5+d5nwRFCj5yPp3UIAopMFA==
X-Received: by 2002:a17:90a:e2d8:: with SMTP id fr24mr4489508pjb.219.1602771345839;
        Thu, 15 Oct 2020 07:15:45 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i9sm3565138pgc.71.2020.10.15.07.15.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 07:15:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/8] uninative: Fix typo in error message
Date: Thu, 15 Oct 2020 04:15:10 -1000
Message-Id: <63923b49b24014e2315f017af0ebbca6eb64da97.1602771116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602771116.git.steve@sakoman.com>
References: <cover.1602771116.git.steve@sakoman.com>

From: Naoki Hayama <naoki.hayama@lineo.co.jp>

Fix typo in an error message.
s/verson/version/

Signed-off-by: Naoki Hayama <naoki.hayama@lineo.co.jp>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc96db2e0b5b8a9cc2c909ea70df290e03a50b94)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 316c0f0616..1e19917a97 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -89,7 +89,7 @@ python uninative_event_fetchloader() {
         # ldd output is "ldd (Ubuntu GLIBC 2.23-0ubuntu10) 2.23", extract last option from first line
         glibcver = subprocess.check_output(["ldd", "--version"]).decode('utf-8').split('\n')[0].split()[-1]
         if bb.utils.vercmp_string(d.getVar("UNINATIVE_MAXGLIBCVERSION"), glibcver) < 0:
-            raise RuntimeError("Your host glibc verson (%s) is newer than that in uninative (%s). Disabling uninative so that sstate is not corrupted." % (glibcver, d.getVar("UNINATIVE_MAXGLIBCVERSION")))
+            raise RuntimeError("Your host glibc version (%s) is newer than that in uninative (%s). Disabling uninative so that sstate is not corrupted." % (glibcver, d.getVar("UNINATIVE_MAXGLIBCVERSION")))
 
         cmd = d.expand("\
 mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; \
-- 
2.17.1

