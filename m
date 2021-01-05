Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.5898.1609856798879047399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VjHHDSMm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id h10so17501201pfo.9
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=UB4rkOKGE8EmRtzU7v6XFcN/ngHf8qunOUhLih4cYPA=;
        b=VjHHDSMmbOeEVVJ/IiDXqxvg98CPU4kqvdRFH2k00ocxXDAVF/R3n85DTi1bF4VzKS
         WAQAvvu1kE5fbGM+I0a5zHLbSNiuvnnsoBkx/TbqqkCIuZmsGjt6Y7YMr+jyKFiOK0DK
         Sz1FcHLlWZp/EgIN26dxLX1jaKzX7NmyEW1aNZqLUETShmmMM4xBuOplA6vT9MyYKW+Y
         Scw3IzxouiPkqwckciQvEXCyXt++h2NNfWcIpY0ANWpRCpPlX2UxW2HSXMExJhsvTMCq
         BpwZ1RXjozDa1h5DRVA4BEc5+G5E7cSLQA8kagax8scqt93SKOU4diBQmS7ZFTHiVPAe
         pfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=UB4rkOKGE8EmRtzU7v6XFcN/ngHf8qunOUhLih4cYPA=;
        b=pWsA0Wdftv04McmphmbI2Fw6GnGvUPUrmhboUJrpRzqlYp/aMZPOI2UvJ02fivGGwQ
         sAIuddyTbvVVQtv1IpZb/ieJJx0fAHds5/xuRF2NciEMwe6sTjeSATHGu5jie+iC0HaL
         3sL4eIw67XS8iGEZqAP5Q+swpg0illqDS6SCePgthm7qCK2ZVZA0pQcewFOBYnL2smlp
         I1dwSi1YgKbYtCyVNxwetfENscF4S3zq9SaBug2duEAAZFGwjDRQlfIXS7R6bmgIJhil
         MqvTSfWxG9xBL2pNtiMtqZONTV0hk4EAHw/Hv21fAUOfG5r0gT4BwveDdR/EaArAFHil
         ma2w==
X-Gm-Message-State: AOAM53343JIeNfvl/zGuaYLCrzAXTwwRA+19rh+VJUNGf8qcovokwdIt
	pyVewbSsFLki2lM+d+EF5710DfoxROXOwJlcb5Q=
X-Google-Smtp-Source: ABdhPJw+yObRbzWziq3GJVoSt9cfkN1uHNiEVgXWFX4CBWPXX1n414/BO0a5nDGKe7l/hxGbCNiIgg==
X-Received: by 2002:aa7:9a86:0:b029:1a6:d998:922a with SMTP id w6-20020aa79a860000b02901a6d998922amr69911971pfi.80.1609856798068;
        Tue, 05 Jan 2021 06:26:38 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.26.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:26:37 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 29/30] grub: fix "CVE:" line in one of the patches
Date: Tue,  5 Jan 2021 04:23:54 -1000
Message-Id: <d686a3eb928d316a4e53979fda48b205ba9104bc.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Scott Murray <scott.murray@konsulko.com>

The "CVE:" line in the patch for CVEs 2020-14309, CVE-2020-14310, and
CVE-2020-14311 had commas between the CVE numbers, which resulted in
CVE-2020-14310 not being picked up as patched by cve-check.bbclass's
parsing.  Remove the commas to match cve-check.bbclass's expectations.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 396d5c0f9cffa4b54ae94738b1ef2b6fb545f082)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-malloc-Use-overflow-checking-primitives-where-we-do-.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
index 896a2145d4..7214ead9a7 100644
--- a/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
@@ -30,7 +30,7 @@ Signed-off-by: Peter Jones <pjones@redhat.com>
 Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
 
 Upstream-Status: Backport
-CVE: CVE-2020-14309, CVE-2020-14310, CVE-2020-14311
+CVE: CVE-2020-14309 CVE-2020-14310 CVE-2020-14311
 
 Reference to upstream patch:
 https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3f05d693d1274965ffbe4ba99080dc2c570944c6
-- 
2.17.1

