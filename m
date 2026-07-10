Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BDBC44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:24 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1863.1783701435970363023
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bMpUTN7l;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so10621445e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701434; x=1784306234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YJHWdpgu7PFzXZMwbAXv/3DOATjShrsoUnV6hnTwxBY=;
        b=bMpUTN7lk7J847vv21qvAXfP1qxY7l1KNWvT4zEwxj0/HcmsxEqn4/x55xUacS9wQi
         /NNppFitHw1mKJkqShPm7cqhRDPnojg477VqsFGmHZP5j/IVJbNetDQfJVwoToIX7wvq
         Rpa/fIfb/sSTyxNOAMNAKQpGPUweAEDpvnaHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701434; x=1784306234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YJHWdpgu7PFzXZMwbAXv/3DOATjShrsoUnV6hnTwxBY=;
        b=bQwkAr9Uwx+hpy0NevV2CMi5NoN43cdteUrLe3nCeLjTl2zXedSR8G4Rds8eaNg74c
         JZF2FSxRnrutqPRHmrdHUzJeFTVm31vVMBVGWi77ScLjCXoZ2CEMA2KK7cQmX/h8teWi
         /s0vuIyxhTWs5X878wnic8Z1HrxTEUPVOwbA01iPuretbC30+99xfycLaQGW8X4tH+6o
         FjXNojr/hIDWJoa/yg9v3ilLW22MNH1uyAR2fVQJLVFF8vZPasD36kVvxct3EB0Az8uD
         NoZI6IL1IIqqkiE+VT1tnvy3KjbHtxuneEZp31I7M6jLERGgpyWfHq3TwMVCSp9wRyyq
         Ynvg==
X-Gm-Message-State: AOJu0YzN1GBNs31yq0L1fGsVIVtxYqKKyuVG8eUzm6KwEajDOqKHoHW3
	+lJoTowBQxWCbUPo+0Fn5RvZAzB6vHeOPm0BhWgPpjpnACi3nClZPBenhfCd2UeZv+rX+C/uXxJ
	1/KmAMjA=
X-Gm-Gg: AfdE7clhcTjp/iXkQlAPc6S81y87e1UBOnvM3EbRTqDhlj7AqE1d0ldpxNgAmjjg6Xv
	mBqkzXPeynBIzt3mPbZ1/lNzWs4gxPO7YB8pmOedRDTK5jxdFbZlySf4pMaYA764G/OAOr4x/zy
	FYjdDJLKIvHYoO3B8zpqilCbWOCFt2GugrMj3640OLsm9JpZuXvIVXR+PAPNllWeVxuHq1eITOb
	NVFoFKaJAZ1mpTg6kHknLmOaJEe2yyDwPbaxK4tUOK1Xm1GbIOLrPcUjCb1FRCWR0D92+8Wpfdn
	ypEApCjPj6Jx12EGLIvtOcswy9+Ztsi8XWO+Zg8g83PA1NlopaJtrkN4Hum9P3Eea3u59CKANr1
	E7GLNtfrgub/Cc3+O5OMGrpqa4cMdXZqeP3gVDN1DU4RB4DnDwBOr6XOomvC9Sq7H+OMn8thBKh
	1uHhsl8CHexXjE/qI0Z5Zqc+tabYW70YwtOkyVqyakfSrZ5J84bpbY4ZkXwi6Z3egm1rqf8vEYW
	mE5LC7VyTBjXVkRk+8=
X-Received: by 2002:a05:600d:8444:20b0:492:66fb:5dc5 with SMTP id 5b1f17b1804b1-493e68df9c2mr93183525e9.24.1783701433641;
        Fri, 10 Jul 2026 09:37:13 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/18] socat: upgrade 1.8.1.1 -> 1.8.1.3
Date: Fri, 10 Jul 2026 18:36:30 +0200
Message-ID: <225abf67bc9f2ebcf3b3c89c1f27b47e47554855.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240676

From: Sudhir Dumbhare <sudumbha@cisco.com>

According to [1]:
this upgrade includes the fix for Socat security advisory 10, CVE-2026-56123.
The issue is a possible heap overflow in the SOCKS5 client code that can be
triggered by connecting to a malicious SOCKS5 server with knowledge of details
about the client binary code. It also introduced Test: SOCKS5_OVERFL as well.

Version 1.8.1.3 also fixes a false positive in the SOCKS5_OVERFL regression
test on platforms with a non-bash default shell.

[1] http://www.dest-unreach.org/socat/CHANGES
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56123

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../socat/{socat_1.8.1.1.bb => socat_1.8.1.3.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/socat/{socat_1.8.1.1.bb => socat_1.8.1.3.bb} (94%)

diff --git a/meta/recipes-connectivity/socat/socat_1.8.1.1.bb b/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
similarity index 94%
rename from meta/recipes-connectivity/socat/socat_1.8.1.1.bb
rename to meta/recipes-connectivity/socat/socat_1.8.1.3.bb
index e662c79a754..636c75b1172 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.1.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.1.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
 "
 
-SRC_URI[sha256sum] = "5ebc636b7f427053f98806696521653a614c7e06464910353cbf54e2327adc1b"
+SRC_URI[sha256sum] = "25bc6476292b2e614220989c77b0b6fca87bb2525d9747b31a6639b1fb602418"
 
 inherit autotools
 

