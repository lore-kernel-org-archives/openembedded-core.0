Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A52BC5DF6A
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 14:08:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13868.1786716503174645986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 07:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DWInt2aS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49954b88fffso13220175e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 07:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786716501; x=1787321301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWnQF9iOT2ZVIkcFlGzaXWmuihyMtDDAFuCqAjaLzKE=;
        b=DWInt2aSnP0H0Ol/TdUIvKgiZh1xkj3ONIUIMVFJYbhFIYYO/FoDWuCBW0yANMDefc
         wPzRz9cp74do3m0RGo9QlOSTuP5mKOL5xxql18iPx7DW7nI87N3o+CabUotpvghWhibb
         gVJo7YdcdjyFN/d2aqtHLwu/Zvf6xaSt7wDKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786716501; x=1787321301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XWnQF9iOT2ZVIkcFlGzaXWmuihyMtDDAFuCqAjaLzKE=;
        b=VyQvlNXa2tGdeEr/DDKjP9cXXKOanfHhBNUK5T3q50/qQ79nP/vTiSt1TxQal2Y9rS
         GcgqdhRkFu8aGHkxeFAcOEmYXdhoiaXqSa3pjKsyexA6RLGAC2FGqymGgJG+F9yTi22A
         IjjsBoFNH2HcY9+4G4NmT+QkarCR24iWlR5CiqS3FhU/ZpkrUcDSBrPRUkOzyqb0Er2X
         wJBjE+N6dvjfqFrqCWVQBvGXMPCgXzjRnSMXFATWdlu03stqNk+y/h7T9cSsNSPoR5L5
         /weUyoFxU0y7usKcf235awJcRAR/2wqlRInCe3YGlCuEt4zFlp6x1Ni+NuWycli0oWMj
         7zeQ==
X-Gm-Message-State: AOJu0Yzk2MNOzuOPdQK2gjcr+QSBRUgfazoLGthkP4w/KjOKRdjiYCaR
	mlMGiyBAj0oT1dwM1T8XpVXvGF2IS5KiA2ow9yMGQLKmdEWC/6qSlUibsgNH3W9jsBsoT5o1OiT
	DP75xQfU=
X-Gm-Gg: AR+sD10Sobjomq/X7gc8OZkaRhgy8xZlmhYHt6g+k2gPZIy3Y/LlJPWppPxRKC3rBH7
	ZxSvoOv8UkzTLsL+KnQG6pHS6m71YG67jlzBKxr/qQCYbYC3y/ngHihObE9KzF3cbDC0Jy2aiBD
	q1smf+1Q0yPez64MLjySK7ijhz5y9h4VVyy3DcOPXLKFmB0NuqQq7EtKm/hVFxACM36joabwf5n
	Dwqs8L8SI7SPodG5jRmD5BRf7GSSIDYDqEwKo1/4CU1d8Ke3BkhcM4Fm2f2friX7tY3Tp6L28Uj
	Vmc+/4+wye6lPCg/UNrhBUuvkYgg1I8VKhdG6ti307OTeIfwPB9/+Zr8Bq0xAvaOnTKgsv1vFgY
	ckKJafSfediulwZAPiAZOegGVwPQNA9m+CEgHAdqPo4AJkzpHQfQqvP08IsVuHim0XZqSNAa7ZJ
	tJY/ffhY2LzMzK2UMjD9TdU0igNgErlpm1SqvmFNFet6E4/0nBECRJkDVz9CRSNZ9fqi6IHRsZQ
	+l0ZDpJDRx2MrP7Hb+5HWZ82j0T
X-Received: by 2002:a05:600c:628c:b0:499:87f3:a2a3 with SMTP id 5b1f17b1804b1-49987f3a33emr97939865e9.15.1786716501135;
        Fri, 14 Aug 2026 07:08:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9095:412f:3012:ddca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21df13sm7072915f8f.15.2026.08.14.07.08.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:08:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] bash-completion: upgrade 2.17.0 -> 2.18.0
Date: Fri, 14 Aug 2026 15:08:17 +0100
Message-ID: <20260814140819.2840177-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 14:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243451

This release comes with notable changes to the directories used for
looking up and sourcing completion recipes and helpers, allowing for
more flexibility and customization and fewer conflicts between things
shipping with bash-completion and third party/upstream/origin packages.

Files that come with bash-completion itself are located in directories
reserved for that use, their names ending with `-core` and
`-fallback`. Packages should continue install their files in the same
`completions` and `helpers` dirs like before; these directories
precede the bash-completion "core" ones in lookup order.

A new concept of `startup` dirs has been introduced. Files from these
directories are sourced eagerly on bash-completion startup. This
replaces and allows for more flexibility than using the deprecated
`/etc/bash_completion.d` directory for this purpose.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{bash-completion_2.17.0.bb => bash-completion_2.18.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.17.0.bb => bash-completion_2.18.0.bb} (92%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb b/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb
similarity index 92%
rename from meta/recipes-support/bash-completion/bash-completion_2.17.0.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.18.0.bb
index 843b5b831d5..c14681bc966 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb
@@ -14,7 +14,7 @@ SECTION = "console/utils"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "dd9d825e496435fb3beba3ae7bea9f77e821e894667d07431d1d4c8c570b9e58"
+SRC_URI[sha256sum] = "88bcf85124f77f74f2f2f8bcd16ac4382d807a827ede742a64940c7116aea33f"
 GITHUB_BASE_URI = "https://github.com/scop/bash-completion/releases"
 
 PARALLEL_MAKE = ""

