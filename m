Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332BAFB5EA3
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:03:46 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65244.1773705817203042781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dVOXG0Q8;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9358dd7f79so844715966b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773705815; x=1774310615; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyUaOOrXx762eE5LTNf6llsxzsmc3JRXIfUrSdFJ4oo=;
        b=dVOXG0Q8m75PbnbiwuGX36Tr8bx2CJwT8UPKEYULJ/i/RvS8LWBc0e1Gz0KkhAKyGh
         bnVIupYO+p3JyU06ZePuBdemez5wuEmI9Qtg0KCYbmKPUYxu/bQ78dTOqInKWaLAz8WL
         ueTFw22ghxRLQdg00Ho5wjdMrR4yGJH3slAuUPiSmk95CGGFmR/ZrwuZDJegmXlLABX2
         Yb+RuX39s8oJAam+LFKFw751nd4dGXC0Gb7h2rJN8xSFyDVWB7cdsmPWhlwXiJHGh8BE
         38Z5a5ujR4M/v48mHs4OUMDZPSQPtXqd7lsbcJrIDAy4N3Xsmx4AUbvD8Dr+/RPS0Fyg
         cDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705815; x=1774310615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zyUaOOrXx762eE5LTNf6llsxzsmc3JRXIfUrSdFJ4oo=;
        b=nII8D/mLJ8I8V6k4dJsfzRshfGCcf60MLpIw0K5NzOCRVW46RodUqRlV9K9sqPzX4F
         2rdslYo1tVPlWQUF++UQ+bptmfZ1y1JbllIPDBp4J/gSJQX2RgnI8oDdwCLjTCA2GUSs
         RGsB/MGyEeXPi1XkzzNfaKs1Wu3BBU26LA2fhaX22Bhb3Vm1ppmXydtPhxdaH/Lv1H/b
         TgpD94zgqRGxCsctVeXlyGt7vVVQwtiGQNt3WHHYETOPwDmS3qnEd0Hc6DWW9AR1HdoY
         BDu42IHl6uuOGZvIG8CCMDaPPYS+CeuAcAYPRaDnBFkrIcJxeCzEbuPimJYRAhYf1zNJ
         cUXg==
X-Gm-Message-State: AOJu0YxPaGNYxRdTSSJW6LwyDNQxFSDWuIFyqeWPgr5VmQaWod+Ki5Wf
	UhkYJ/NfotRlW9Uve4fy0hsFayFtAbt5TjqR8HHvb58SYAOy7zOL+Ew0
X-Gm-Gg: ATEYQzygwwNtq3n4Zq8lFEx8lKsvgitMudaW4tyR73746Erisvmpuf6RxivZRerxFCn
	7x+rWBmZNQfzL2EkbM+jFXzdQSHUylcwKwquJtesZuHxoK2GtbuVXJGaExz+UIKABWkdLD75QYI
	BljX4/24Lj6v5ggNIf1KpNGfCkRX8tu1wbya0/Wtv40RXpy3Hcn9VYcD7vmYEBVK/PtDEozPoKG
	RRkxbnRcfs4mtcEgfM84aMysjoRcR6K/kDdxtJLiUElVREbm6O02NEkoeUKU9TcFjo+QX3rcwF1
	DFxXhBrF8qmEBYxPDSNIuyMIyvLlCXoojbz5Wyoh9ogyLEFrC/k95P0t1uzRkEK6olI/0SB5HTW
	c/EqF3R/5mEM5v70tk0uG6FaS7CSkGv2nAxtyN208P++cKgWHcpMs7xz29ychRqx+EHEH01U/ju
	7XKS0FSoX+0EutSfOMNs0Q31FpM62DKNij+IKm6t49ph4PQ/VFw6GDXDM=
X-Received: by 2002:a17:907:5cb:b0:b97:8506:204e with SMTP id a640c23a62f3a-b9785063e5emr642960766b.27.1773705815344;
        Mon, 16 Mar 2026 17:03:35 -0700 (PDT)
Received: from [127.0.1.1] (93-159-20-97.cgnat.inetia.pl. [93.159.20.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm654584766b.58.2026.03.16.17.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:03:35 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 01:03:06 +0100
Subject: [PATCH v2 02/12] coreutils: Convert confusing append to override
 syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v2-2-5c65ae5787d9@gmail.com>
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233275

:class-target overrides for PACKAGE_BEFORE_PN and RDEPENDS:coreutils
were being appended to with the coreutils-stdbuf, but instead of being
an append only for target builds, it was actually overriding those
variables.

One could replace `:class-target +=` with `:append:class-target =`, but
I don't think there is actually any need for this to be :class-target
specific. RPROVIDES:coreutils few lines below doesn't use that override.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_9.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.10.bb b/meta/recipes-core/coreutils/coreutils_9.10.bb
index 984c5b5292..fb254d047d 100644
--- a/meta/recipes-core/coreutils/coreutils_9.10.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.10.bb
@@ -66,9 +66,9 @@ sbindir_progs = "chroot"
 # coreutils-stdbuf without getting the rest of coreutils, but make
 # coreutils itself pull in stdbuf, so IMAGE_INSTALL += "coreutils"
 # always provides all coreutils
-PACKAGE_BEFORE_PN:class-target += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils-stdbuf', d)}"
+PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils-stdbuf', d)}"
 FILES:coreutils-stdbuf = "${bindir}/stdbuf ${libdir}/coreutils/libstdbuf.so"
-RDEPENDS:coreutils:class-target += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils-stdbuf', d)}"
+RDEPENDS:coreutils += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils-stdbuf', d)}"
 
 # However, when the single-binary PACKAGECONFIG is used, stdbuf
 # functionality is built into the single coreutils binary, so there's

-- 
2.53.0


