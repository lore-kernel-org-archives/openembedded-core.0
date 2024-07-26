Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF189C3DA7E
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 15:59:29 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.64870.1722009568027530294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 08:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JPSa+tiQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-367ab76d5e1so1061255f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722009566; x=1722614366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pw3ORyn9L4lB/5Cj4QABCSGww/mtfwxWXp9HgjyxvZA=;
        b=JPSa+tiQ/Pfdoc+18ljcvm4ORgo5aoBbjURRpz1fv3Y/IiWCTSyk17QzaYuuutguP8
         Ak8lLJxOMRV6iwh+IAp5GdYdPed+WbjmDdjFShulVp05azyaLDp55Yt8k286H9zquJfE
         QkoVb/P9k9PLVYt5o8zaQV+D+76vhA/UiUzT7BOjMkhOuVCIWYEPiXxyRPqeOjJ2Qkiq
         BANLPSQopxEPVboodUoys/cI73w+pkb24o0kGwPc3sGgk234Z7zwtRbdEP0WJuBozfCm
         EFDJb7To/HZlykiMyAHzR76p3DxLJ6iRGY4xfYgGY9uwesGFJv/wQlMVlQ1CZ2zbVJ/J
         DM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722009566; x=1722614366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pw3ORyn9L4lB/5Cj4QABCSGww/mtfwxWXp9HgjyxvZA=;
        b=hmpulfzsg6IRsDF6Vffzodqh0p49YCq1fOcz3Z6xwOvcisJcu1yYV/vCO3jdgEeIyz
         YVk3pgt9/lMkktYbumoiR/Nja/nJdBoDNXGMyrS3wlohYFUgP1uxQcpK6Y7ae989rKfD
         IgxUftZmtPVtidzLOO71nWvqJh+npQNWF6/UAuglJkT+tCmk28LAl9vyEE18As3pZgU6
         tfrIN+MnCGjcWTUOWfjtuCYl8KX8eB4eYnBOxR3ToCecHvXraZ1FdygXysoUK9n1jAD8
         ZJHyQrwqJvXNifaZFfCJY+zbmPmBcO+j7QQDgaDcc6IfdJCKaQMFHC7rBR4ayQ2UtDBH
         LUCA==
X-Gm-Message-State: AOJu0YzsKSWfcm0zArPCrBgwZWIz4Z473Vi+XbuxeBQAFRM8y24XOPyN
	R8ErMiTzVf/mz2hyDNf10h2i9i2/V2UelKYpRMTBd3TMvzBzzw1VRdvCYg==
X-Google-Smtp-Source: AGHT+IGwVV+b9upo6ZuiD4Lt7zK6t0zmijLGOZCy0TJhBi0QBe7Rush/Vd4AW+yfuxV5L9RtjaD/Eg==
X-Received: by 2002:a05:6000:100e:b0:360:7971:7e2c with SMTP id ffacd0b85a97d-36b5d0af196mr67460f8f.54.1722009566003;
        Fri, 26 Jul 2024 08:59:26 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367e49bdsm5535308f8f.44.2024.07.26.08.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 08:59:25 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH 3/4] openssh: systemd sd-notify patch was rejected upstream
Date: Fri, 26 Jul 2024 16:48:37 +0100
Message-ID: <20240726154838.1731195-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726154838.1731195-1-jose.quaresma@foundries.io>
References: <20240726154838.1731195-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 15:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202547

From: Jose Quaresma <quaresma.jose@gmail.com>

Still side effects of the XZ backdoor.

Racional [1]:

License incompatibility and library bloatedness were the reasons.
Given recent events we're never going to take a dependency on libsystemd,
though we might implement the notification protocol ourselves if it isn't too much work.

[1] https://github.com/openssh/openssh-portable/pull/375#issuecomment-2027749729

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c3403bb6254d027356b25ce3f00786e2c4545207)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...001-systemd-Add-optional-support-for-systemd-sd_notify.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
index acda8f1ce9..f7a1d12e8d 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`
 This is a rebase of Dennis Lamm's <expeditioneer@gentoo.org>
 patch based on Jakub Jelen's <jjelen@redhat.com> original patch
 
-Upstream-Status: Submitted [https://github.com/openssh/openssh-portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56]
+Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56]
 
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
 ---
-- 
2.45.2


