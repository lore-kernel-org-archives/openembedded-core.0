Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC86CCDE002
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 14:17:17 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8225.1782310636725302593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 07:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fSQG193n;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6a1160a2c42so804596eaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 07:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782310636; x=1782915436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpsYoeOlWwc6S1iXRT4VT4/fOHKq5cefAdhTFN2GVmg=;
        b=fSQG193nZCHRQBog2lk9x7sV+cEH18x0PcbcgG9jsS3puzJjASvR1fUo3vUasfw1UR
         Yt6oVzQHxaobdM3iULzpY0l0N+svfK9wm/5o3dWCWuYorim+djnguza5Uam00RTdHWOO
         nkkfx5EpGXWDksL4VmAQDx4cX8Oi0cKhSx61N9dFKm2o4i7Ajqpti0C9WFyNOJ6wyPp7
         gxHEiKwCUN3+TA4xrEHgaYI+SEhnYAruObIvYYPHVXgjBhCK2jreGCYOeN/Wn+ChX3TJ
         6sPlS4nPZi/l1PXXCMWoMkUgyoGM8uJet+armW5UMR/VlCfQgw6BZnFAsUVC8FAvqHjH
         r7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782310636; x=1782915436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OpsYoeOlWwc6S1iXRT4VT4/fOHKq5cefAdhTFN2GVmg=;
        b=KYbrpq9ZeTPpEE57KTRkZZdAbmpz9Es1sUZ4siqvtsB51yGkebdwNZTGw6ihhysZCZ
         UKE8wRGD0i8RQhBLnfZXnnYc88pV2YvkhJeP7V7NMU0nxMBi9yLC2KALTLMnsah/sfye
         zigRieERn4R+0j0xTz7UgHRILMJEzyOolwlmwcwa04qTnIiKUErM4Ix3A1rYZ37og2z6
         qI/BDNIJusc41eCv6n/KHyckRLs0tz13zJaMFWcQuaf8NlzSCpZUXEaeodi8jJYXY0tS
         qp8Ew/RdMYmfeEMjoBJPJaFKRZizNOFMG00Xcp7r8GlYgWnQjmdggXkNuqho0XxpsLEt
         aS3Q==
X-Gm-Message-State: AOJu0Yww2redFMx3oIsWq1fnRlJ0bwQzrBylpWezhaX4z2bvRefJWvcd
	+h/7iY887tMmQSwnKAcBk3kcpBHRdKvsc/aAjcnljA0ZsRyb0QbOoRM9ZHVilg==
X-Gm-Gg: AfdE7cmUoXuvWQCpRW83k+PGiwvqhsYbKZEm1iyjyVcWWZG/2Apm34165i/x0IpyZ6J
	rfvVY6ZOYEV7bmMpwVYt0WnHM8ftxQY04bLXMlH/QXTOwkFQLe69ZwQXYw/4IZBoasrSLrJx9Sj
	7+JED+ACZ1AKX+spm6SeIq4Y9NbsPyMrsZVpvNv3BcDT9R3H6FrjI78EP2V1cqjnYMzdwJY/IaU
	PjjqzO+toP7nujhPiAamwDhY2/pFKYA0wwJOABMwETrW/ylN6xqSeO1J89koHuTsii8hGPPVnUD
	pPv3iVFLIV0+vAoUG3ir38BzLAFZljH47tkaNNCZPaaQLsU1IWjdcm9xigPUF07Kch+CuB6rCPa
	dJxxWGEvx8ZSBsPW0Lrpo4VnwXHN2317oJeMzK1z6crn/hwncvQ+GUC9VFnibgYSw85tD1aSGgK
	ARWd9meUiOsQ==
X-Received: by 2002:a05:6820:a29c:10b0:6a1:1d07:ffd7 with SMTP id 006d021491bc7-6a11d0810d9mr2629021eaf.28.1782310635889;
        Wed, 24 Jun 2026 07:17:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::87cd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0e9f2a4e9sm8946149eaf.2.2026.06.24.07.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:17:15 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 8/8] systemd-boot: Change to MACHINE_ARCH
Date: Wed, 24 Jun 2026 08:15:25 -0600
Message-ID: <20260624141706.2164567-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624141706.2164567-1-JPEWhacker@gmail.com>
References: <20260618165032.347436-1-JPEWhacker@gmail.com>
 <20260624141706.2164567-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 14:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239517

Machines can change EFI_PROVIDER which changes the way systemd-boot is
built, meaning two machine may not build it the same way. As such, the
arch should be MACHINE_ARCH.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_259.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta/recipes-core/systemd/systemd-boot_259.5.bb
index c887835806..787d4652a2 100644
--- a/meta/recipes-core/systemd/systemd-boot_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_259.5.bb
@@ -8,6 +8,8 @@ DEPENDS = "libcap util-linux gperf-native python3-jinja2-native python3-pyelftoo
 inherit meson pkgconfig gettext
 inherit deploy
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 LDFLAGS =+ "${@ " ".join(d.getVar('LD').split()[1:])} "
 
 EFI_LD = "bfd"
-- 
2.54.0


