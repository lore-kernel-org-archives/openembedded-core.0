Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A18BE99079
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 10:06:01 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152789.1775815559331755199
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 03:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rNJ+XWyy;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso21366405e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815558; x=1776420358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4mFJU2HtVnzfIqJWLtaALRDMxIR5J59x1n90ESHOBg=;
        b=rNJ+XWyyb6kHZCYJIKygFFwZlCpySmN/p/tJT12yVElD1YNiLsUDoDhMg7wntakw3n
         8cntnjpRMGd8NS4sM3tTQRtslxrhQDpUiV57aV6SHLcwQpKViaLGC93hzZIcEpT54AfH
         z/M5t3ahqYtgDEpCySt6assPv2euucBx0bl5hQoQpTJ3/yxs/HbPKiue8Dg/NhcHP9Ci
         dKxvhIP/9pcsabafyNeWteMLAV/RVuLJWA8hD6RR65nuUnj8nX0snvSXnIeEI9gfMjE6
         s+XQfKHXXVS6ibm7yjeJdxDrFGxh4Z7wxg2HsG/ulhPAH7TwbtUKuTwjf8glJhe7/oxy
         IrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815558; x=1776420358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n4mFJU2HtVnzfIqJWLtaALRDMxIR5J59x1n90ESHOBg=;
        b=X0v2sCsgS1RlOaki5bqiftb7o/EwnHhwEabYHLd7yZKCbeGYsCFkXMbF6ZyQBnbJJz
         ncSmCeaFcJHjF3ETZRbxIB8FPf4sPKD329NsMYkeV7VcKrwEEFC6cApGS8TxHEZTZ+sv
         M+T/zov0+Qs2QqeEK2DNrK39ACyHpXalxWaV+ggeiwWBV6UFtvHCnhvcSikBE2OAbqks
         QQ15Masi4CNlK4GGglhuTh4KhZILktFV7pehKvbLSNS33t3f9fgRV0l3BMk5wnUeCyqs
         qdGohVn0C/1jmORl73X8I7oqo2AyY0xbuvw67qNWo+oacnjKJ/pAEHdbshuoTnOufZ+I
         308g==
X-Gm-Message-State: AOJu0Yzo3Ccm+zTzvtnE7t9hen2D6kQ8XVFS4mho/NMvTg8bRX5eawL/
	pENZG6VCTiCHWS/9aI6WIBLdo/9CgyDKxbIqc2Ha89uksTT0+HPzbThOymc2sw==
X-Gm-Gg: AeBDievqV3y//t96wuNNrfjm52YszyS1cFKyNCkSNfs8BiPlCBjclk0Pn4zcetLg166
	lWcJ8i4jHrKQC90zFHrNFF/Hw5weu8AG2UISOsePEVtKMKzAPHuCHUCsgFYJFe4OpMDjRiEjn7i
	Pa85mV2JEkaZjIYk0NcKsprpd7sgvSlugKxH2u19cIT9r+joZ4ATzBBq/2cNkBaPhrsOXZuNh1A
	rGHmQrhYvppn3ohsphr9ZicZZokDO91kaYEGH2jfHZVPNAQfbg0jfOaGd/P5qcMMRF6avsdjg7O
	EtGLWb+RaL5x+sHQOjdRw56fGpfNZQFGZQDs/qHiP+HgKdZIQ/TFEiE0gXXk8Y1ucwL4BvjFxDM
	qx+WysnfmH4Xj3x8ruvMKpNKOkL0WGjB0nrNLw8qFHDyCGMmKvpdEuwSajERheR3VtWBD8kgFfx
	TtJ/9OBD94dtZ3+f+78/E/IPNKbZYYMGcZ+HE10os37vAksA77CPSHDS4+ooZiTgWl8Jrp+EFru
	a07C3S+Tw==
X-Received: by 2002:a05:600c:45c9:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-488d689cf9emr26974795e9.29.1775815557602;
        Fri, 10 Apr 2026 03:05:57 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e462fdsm5921719f8f.22.2026.04.10.03.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:05:57 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 4/4] libxcrypt: Use configure knob to disable warnings as errors
Date: Fri, 10 Apr 2026 12:05:48 +0200
Message-ID: <20260410100548.3944487-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410100548.3944487-1-martin.jansa@gmail.com>
References: <20260410100548.3944487-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 10:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235010

From: Khem Raj <raj.khem@gmail.com>

Passing Wno-error via environment flags for target and nativesdk
is intended but is not effective due to command line ordering and
as a result some patches have been added to disable particular kind
of warning as error. Given the scenario, warnings as errors should
be disabled for all builds, this makes it portable across hosts and
across compilers ( gcc, clang ) and glibc versions.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 4e240f4d14..25c4fde813 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -23,9 +23,9 @@ PROVIDES = "virtual/crypt"
 S = "${WORKDIR}/git"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
-TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
-CPPFLAGS:append:class-nativesdk = " -Wno-error"
-CFLAGS:append:class-nativesdk = " -Wno-error=discarded-qualifiers"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
+
+EXTRA_OECONF += "--disable-werror"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"

