Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB8AFF5136
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 19:06:57 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89102.1775588812831210558
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 12:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UmOO7weg;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-47018d341f8so2702476b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 12:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775588812; x=1776193612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GltBsXRXBGPAJVjmbCuyN/XFwwybwdqN4bFV++Wu6oc=;
        b=UmOO7wegoDVxAnfIHrh9/yuxXpeZuWDWLfrG08IX5QXvO9Gnqk3ibPAXE0QI6vq4F4
         zo0hrY/RmlJ0XrFDID/9mIrf0qDrWe+exuyCeuN77Syo3gn5nK52uotXBsORyNez2wmm
         krdkNtigHS2sHVidSrncw1pPdovzYfoHJ6Y32mNh5bvdJ8BqhbbmpY9pi5e5SjnDqfEC
         Q+TFu6Ki7OaxFSeLhdDrsYXw4TGrAzxwAm5UNRCHaAadN+gsUOz5oXWHxHlNLifdbYxM
         0RwlmmyhFc/fbyo07JiDgYyVo0tvMr9T8N0FMj0if9O/tmk48FfwjLJY4VRhHHxsVEs4
         efvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775588812; x=1776193612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GltBsXRXBGPAJVjmbCuyN/XFwwybwdqN4bFV++Wu6oc=;
        b=XJr5H6RI5uA1p5FMBE/UOJme6aUitgx7pQ15tOIcD25/s3N00VXjUPA5Qj5JPFHNeT
         slPNW0dCh3pY1Dwg164ddCpaeDsMNRTNOgLwCJqDUOLYmPFZsZ9BRqVLkoupN7DNzevn
         nA2+BGRM5ME349sF3F5bL2hGqoBxw/rFZrRzDxv4kWVoinOgEIbGoBx6GOS976S1ZEHz
         4zYMT+GeCdnxeDCvAcDRCRC0ZAYaRWajTUTWFCD23BJPgBnxUCNV5+i+gS238vMoIWP3
         nnDkNT4WJpgysL+uzSTra4KetQZCt6EPGg3W2xIDnfbjRCO1viSpi7JLEVTQzmxyj28m
         mSDQ==
X-Gm-Message-State: AOJu0YxNJHhmWdWNMozOxi1nWhIHxIEQ6scTc/zjrppTXB/H70nRtkty
	nYY79RIzr/wJfl8y5+d/aiJlHdKqPaIgufUi4uhg/gIqyyIWJDP0fP1zn1kchw==
X-Gm-Gg: AeBDietrYgM2ekUZZFuP5qaE5ka6yF1oE0ZbCwL8SfhEZ+O77gZXECo1R43fMibGzB2
	W6IqneUsGYaHPZMh5X0UvZ8ZzzlqGOzQMmkNs41J6UdGW9rrTJEAwJ06wlYELor4b0KCtg/jAc7
	aQgaY1N22N45N6YExMIGIf5ab8q79twpOHCQGyZrg/L/o8y54vhtprUORzWyoMQpNxa2sndljcX
	wV6RnjmQnfy1DvxU/Gvg/IhAT5MR6tpCT6NRfxo5zj8psdBMLxlEuzzHS2PBqG86f+6mzO2Ewxp
	UA4tEuoFYbRoeu+KJWhDlIw9gHFjxlBQ2JgWzIXHUQW2LcMf8Egv/iIZNSqbaAGCMSoIQY/JOWT
	DpMNkbYr+Vm8TI/EjU+4SWXtHe4PM7tTbt4QShrEVGwoujrdujXwsDTF2IBAMqAjEqFYBj1Te1G
	BWMVnp8gwInJqoQ5tOwPCQ6g6w8KOqew==
X-Received: by 2002:a05:6808:c16e:b0:467:5571:1b0a with SMTP id 5614622812f47-46efb1cf759mr9529752b6e.26.1775588811878;
        Tue, 07 Apr 2026 12:06:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::852])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eb42db1bsm16502825fac.17.2026.04.07.12.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 12:06:51 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] libgcc: Fix license with libgcc-src
Date: Tue,  7 Apr 2026 13:06:47 -0600
Message-ID: <20260407190647.840624-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 19:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234777

Sets the correct license for the libgcc-src package. Note that even
though the package is not in PACKAGES, it is implicitly added when
PACKAGE_DEBUG_SPLIT_STYLE is  "debug-with-srcpkg" (the default). This
was likely not noticed sooner because the fix to allow the code to
detect this was relatively recent in 1816c5a5e7 ("lib/package: Check
incompatible licenses at packaging time")

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/gcc/libgcc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index a3f0f947f7..74e8746b42 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -35,6 +35,7 @@ PACKAGES = "\
 LICENSE:${PN} = "GPL-3.0-with-GCC-exception"
 LICENSE:${PN}-dev = "GPL-3.0-with-GCC-exception"
 LICENSE:${PN}-dbg = "GPL-3.0-with-GCC-exception"
+LICENSE:${PN}-src = "GPL-3.0-with-GCC-exception"
 
 FILES:${PN}-dev = "\
     ${base_libdir}/libgcc*.so \
-- 
2.53.0


