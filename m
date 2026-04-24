Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612C8FED3FE
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:50 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32570.1777064200509400573
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1xZ16Ecp;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso82756515e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064199; x=1777668999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTbHO/EIJ5szmwYdNUhQOMlbAkQZ3OZy8i+BqtH2owA=;
        b=1xZ16EcpGCprXyegCkXK4YbJqIagcwCdJpOjjnO74KRrjifurFjvPjzQ6ewhfGeIzy
         6eHEkr2+Lof8Oa6q19/HVlFM4mEti0jjyZemWu0HBPJxoHymTZ+p4/PT23RCA9qvwBqf
         9lgiGHG3AKovFKULdvSKFx4GmjD3M7JXu3RdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064199; x=1777668999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GTbHO/EIJ5szmwYdNUhQOMlbAkQZ3OZy8i+BqtH2owA=;
        b=cS3yDXRYO0WUrOPHPsMMeeqA+AB/GoNIQrPOQZpFTCVobLDggGqf/ch4NpPn/vNTg0
         z2ztBhEu4FiktE61k6g+IRZsMAycVQCb58qIFxHa8Zu7qd6yadyTPqpoBqrVU5mrs5yF
         Tmj0/Cl+R1DW10dcp+UoIsoy0fZszwmGtHro2TpcJjeJNmU861dPHQe1/Yx49napaoWJ
         iAScUI5WzL+Nwch87kEMQEY0svbv3mgTikWQXfnC9/cIEHP64fObEy6AUUFQsys3J2zB
         a0aL+DeuU1TlWOVDe0Q8cv1+QfDoB8e18MiRdRb1VPnkxAh6+wckgDUKqOlMjXn3El6b
         hT9w==
X-Gm-Message-State: AOJu0YztpVVN37S0m3IevTPkDcHxwdGGjI5P1xnTzUJhTJDZQgD9dwzW
	XnVk/dWOTghMNPn4VKjnt5myI9vxCpy1PuPnOMrjni3q3Qeb8yaiT6jRcPdrRWMhWcun3tmcRu6
	N679rZuhXXsrY
X-Gm-Gg: AeBDiesC9FpN9Q9Q/3jQ8Wx8xVruNN4am0Gj7CdkLPV1zM89Sdwgu6IR9K69x+R8W0M
	/7+Gpb+ml4Rj0OyLMtVdhEnBDXpaUG0E7ZtqF0nl+5RFEO4uF9UKKYPcCHo2Yr0wu78dQBi0vPI
	Gab6MCA9SwJNK0x642hqvG/cyq3+GaGVWmEgGQUEUgKAXnTpurlmx4pEYnM4k7Zu84Oc5yWJs0g
	hHqkIbINhMguI9MFC2BnxQp3BpMu140idHLGi7NGrQwsyT5fjE/6AZ585VccizfJc9QDAij20wB
	Wqcwai25/C4vBngiDMeSNdw7h9SEviy+GoAKy3NOmH8DkmqWytIYgWI1JKO60dvgmjrfUVNUNNw
	cRIJE79j3MH8KB4cWGieQQCq/9mBpIm/ZT126X6hVebkZfFNi3y4qwzSFOTqadC8I8c1iP29Ggn
	mo+B7EQCQLb0IBsBuhr2xwrPSomErihFNXP2WoNcHFnig7tgZz6FlG+zF5VYBGVT1YytUIZ19y0
	t92oQCObzJHuV2dAfZGoBBASicK7jseMw8Xyg==
X-Received: by 2002:a05:600c:3b2a:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48a534af0ffmr267687945e9.1.1777064198698;
        Fri, 24 Apr 2026 13:56:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/66] tzdata/tzcode-native: upgrade 2025c -> 2026a
Date: Fri, 24 Apr 2026 22:55:01 +0200
Message-ID: <d6562c14947cfa84c42c2936e7eed3755fab4c05.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235875

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 217ede26d64901d9a38fc119efa684487714c08a)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 35f22d5a15a..71b034d1581 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025c"
+PV = "2026a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
-SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
+SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
+SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"

