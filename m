Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AECBC87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 17:16:26 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.5034.1754414183456903820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 10:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h/XzceDc;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2403ca0313aso47480165ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 10:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754414183; x=1755018983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MbENLHvypT9rMsDYM7E6TRvJdFfRb/TA8CBHHgqGzf0=;
        b=h/XzceDcSAqZX5SPdlcKcZc79j3CJ1wwFmd/5l9QlPcaW/u3CCwR3dpL3itLCHvaVO
         otzYhdceiH1m0xSHsj2hJrUMMkLCYHS0hTImtYYtFeWv7xtNZmJJkG7oyZfc4pgwk8Zp
         JWsoY4mW20Xmff0zZ0m0cSgJ3bVJQPJy4KCARSEN0mnCXYGZ58GwTAe6fZPb5vF7h74u
         tNRhtTXL6B/UKyaAMJRKxjM9xwBS+GwPHHHIxVsBl43eIZX0mKqu7CAzhEyiuLo4nnXh
         dgy0BahQyi3X1tmUpcqsgc+DOSEDWWTh7gSNQaiK0zv9rB56bBXpRfUlpyGKjT6mIfm7
         YOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754414183; x=1755018983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbENLHvypT9rMsDYM7E6TRvJdFfRb/TA8CBHHgqGzf0=;
        b=C+ZDAFSiEoaZt2oJ+DE8bH8klWzLkUe9hmjyy51tJYbGeNJKSlIRnVlO01LiEfs5JZ
         TcTSGE6SiJ/WWyRKRufzQJt96kuDfEhDNz4r7T2zc9F6WwpTtfMILsQ1mER9S56Qib2D
         yCI6VdZ7xOHv+b9z2DrAKIbEkp6oVBaB+iJIGjzr3jlfOPpzOKQ56AbFpU8wfeH1w52B
         KSyEzJMI98EOX11cUhG0ZB98CZmpPSH8z59QR/6xfm8FwI2l4pe0zwQrm3EcQaACtbPF
         vvLcX6kEkp25GBZvrfPU5bjrZt82MrcISfWHsuSY9MvWOpfXSwMPcEKit4HBMhH4EomH
         Bnog==
X-Gm-Message-State: AOJu0YxRbnCg4vwhaboQdHlMnitwlBmmGoHdBtpkW2+a0WCIQngo6hEm
	kE9kkt/zHlsVSKUffvrP375E+/nv9weDNJIPsszhDw3PClpnnQ4Byse8crAISPNe5fg=
X-Gm-Gg: ASbGncu0H7mAIMdwwHlK5ppSs1UP9sHgywd9LRyU1zCVsJ64g67r/JTep8BA15DL8Jz
	FQH2kTKZEPJbu4AiEv2TEmI/UXGblylASi8F+NItggD8UApt59HOUvnv9yOhGSJ0nd3Ri00PU+k
	SaOfrXHkh8DPUZJJSC719zRw66jT+otiO/EwFZFi+miynouRlcRSztdyR7Oysl4PtSbBSUhVfy5
	hsXUG6F+KH+Xk318dTw3lUnAwaJiuHeF4GQUo8+9+BDr2cz+hGEczL3iBszx1R3yKkYYg+5YmxU
	kop+IEVb09u0vVh8yT3EQxEV6y3ZhLbJiO0CzjrRkMz554+q3RSm/cw9k+LJS0vKbn7AQgjKk37
	z1g6KLjPbxUNmN0HKDbgHvw==
X-Google-Smtp-Source: AGHT+IFcREnZIxQfO5axqRV/O8SbrPd6EixeSl0yZdPAdjQx5/WPzWs3UfOUh1fpEPhvWU6KpyUNQA==
X-Received: by 2002:a17:903:32c1:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2424701ae4fmr224522735ad.38.1754414182444;
        Tue, 05 Aug 2025 10:16:22 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ccc5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8ab3da8sm137740385ad.175.2025.08.05.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 10:16:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jon.mason@arm.com>,
	Ryan Eatmon <reatmon@ti.com>
Subject: [PATCH] machine/arch-arm: Append TUNE_CCARGS_MARCH to TUNE_CCARGS conditionally
Date: Tue,  5 Aug 2025 10:16:19 -0700
Message-ID: <20250805171619.1357193-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 17:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221484

With [1], we now have a non-empty else block for arm-features, uptil now
feature includes only appended when feature was set and unset case was
appending empty string, which hid this issue where TUNE_CCARGS_MARCH_OPTS
could be non-empty but TUNE_CCARGS_MARCH is empty, this is possible when
a tune file overwrites TUNE_FEATURES and does not have a feature that would
add -march or -mcpu at all.

This changeset adds a check to not append at all if TUNE_CCARGS_MARCH
is unset.

[1] https://git.openembedded.org/openembedded-core/commit/?id=db1b355b2b15ba57bd89c2dfb88c2c667551863e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jon.mason@arm.com>
Cc: Ryan Eatmon <reatmon@ti.com>
---
 meta/conf/machine/include/arm/arch-arm.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
index f1e92e19c61..ae661b1ab4f 100644
--- a/meta/conf/machine/include/arm/arch-arm.inc
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -17,4 +17,4 @@ TARGET_FPU = "${@d.getVar('TUNE_CCARGS_MFLOAT') or 'soft'}"
 
 # Some -march settings need a +X option passed in.  Since we cannot guarantee that any specified TUNE_CCARGS option is set in any order, we must hard code the order here to allow for it.
 TUNE_CCARGS_MARCH_OPTS ??= ""
-TUNE_CCARGS .= "${TUNE_CCARGS_MARCH}${TUNE_CCARGS_MARCH_OPTS}"
+TUNE_CCARGS .= "${@'${TUNE_CCARGS_MARCH}${TUNE_CCARGS_MARCH_OPTS}' if d.getVar('TUNE_CCARGS_MARCH') else ''}"

