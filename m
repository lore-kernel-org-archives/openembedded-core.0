Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7565FF6E70
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:35 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86400.1773779366059367942
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BmHqBTzz;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-660a58841d4so8068653a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779364; x=1774384164; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsxFsFSxDiT7lKS3iSmZWYcgf5tUkqLE/rmRetGcm1U=;
        b=BmHqBTzzxNgrICcMhBrYdIc7MqUgVQTYNi/1kFcLntOPKVksNhaX/oe6nLZ6D0R6zT
         GJY55FV03FdRD/WtTFs1RRspQedk3wfS3QFF6SV6DBz8hjJqip9omWOzckxVWPPzIXZo
         LXhP8imrlGwDSqn9g04nqXQ3HT0r+4WCVHFPOTlO5MVcW3+j4BmXwpgkG/51rR1gf7f7
         JK7+3AGgbR/caBiecMU1oouTaVd0kB7vHWPNhq0YvqEtg8/OUZ5HeJye02YJ/H5HzeGV
         WLzCaAqYxbV2Sf0L+etghIN21oED8DRqqCYnkpFOCuskByyu60IFzvJSz/g1jGmHNw88
         yYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779364; x=1774384164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bsxFsFSxDiT7lKS3iSmZWYcgf5tUkqLE/rmRetGcm1U=;
        b=sO/CNLqG3kwpLkWFWwfW7kkhu9Wu2//qnWh55Tp+AeZGCpy/xP6C9kDtYCgd5Rorgb
         9oSjhCiqADZAv1cV+Vil0Q1saxEe8AfMQHgnXTxZRySvOo6Enuju8PtZGmq4JLvkoJAU
         /FIS7RA0qoFwVK+xY478rzVUO3XwI0Ip7LQhDUOsms2b3SAPx7hN30GE/asIAmayLouk
         Cts1HA1uNfVy7PCCShmIUbPtKbWjIU9rA9IRoP57SpmrhrixE0wcQcErjRbxQErXEvmR
         uMsbMlgCXXGhMgDm52/F0giXdcom4zhs5cJ3rz7Gd1P7h0ncYDVscAIuRLSu2M5pwoth
         j/xg==
X-Gm-Message-State: AOJu0YwGxywGfWVUOVK7hg2fQbAWujm5ojtJ0XBd3fyLmTfVvURF9O/c
	MMy6sYU1IFgqnR+EpBHRd+KvLIl+DFhrewKgkZwuE75e2YHqPPuwQA9B
X-Gm-Gg: ATEYQzxfXBW0+0ZxBa8PJF27KZ63+MzscBkjarNnReujulKi7blnR7bqFQbsUPXQfJf
	1J1Ebxe0b84xhQSakObkO+hTwEnxF1PsKlRYvRqp5ObQxpd9FHddLkq41NwLsPEMckvSTEf3BJZ
	tR1qF73F6/Te/NV7vVKXo1jeWQ6frnKKXiT/Ner0pF2z6PhXNz1PmW4L0fpZgvvMpGsJBPGE5li
	oZ748k3ebTM+E+mvaXyprJ05klImBqmnKair5l5u8cyoTPOvmSFLDyj+MSSVNdrbDKgjbqbomtB
	uqTEF0hYA33YfOLE1T+EfxQaR1UnAqlKHsJkm6zUe5RbtmawMnmmalqoyDSWMC/qMFj9w14+Zf9
	QqIU23VejX+gBoUENQlAcAjZZ1e9fGw4GEvUb+ALx6h4hwuxMr0+973JE5EhTGFRMHIijZm22jG
	uL6pgMglb5xL9foljoxjoMpaKHvkFpuQdP+kojfF/nBjWPTyRq+ja/gyk61whtBJY=
X-Received: by 2002:a05:6402:46cc:b0:667:2e6:ff84 with SMTP id 4fb4d7f45d1cf-667b234277dmr602047a12.10.1773779364386;
        Tue, 17 Mar 2026 13:29:24 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-154.cgnat.inetia.pl. [185.164.141.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm451909a12.19.2026.03.17.13.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:29:24 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 21:29:09 +0100
Subject: [PATCH v3 10/13] dnf: Convert confusing append to override syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v3-10-59452f073f31@gmail.com>
References: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233345

While in this case `RRECOMMENDS:${PN}:class-target +=` wouldn't result
in any unwanted override, there is no guarantee there won't be a change,
which would be hidden by this override. To avoid any surprises in the
future let's use `:append:class-target =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-devtools/dnf/dnf_4.24.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.24.0.bb b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
index d40b85c4b0..832b96c929 100644
--- a/meta/recipes-devtools/dnf/dnf_4.24.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
@@ -55,7 +55,7 @@ RDEPENDS:${PN} += " \
 
 RDEPENDS:${PN}:class-native = ""
 
-RRECOMMENDS:${PN}:class-target += "gnupg"
+RRECOMMENDS:${PN}:append:class-target = " gnupg"
 
 # Create a symlink called 'dnf' as 'make install' does not do it, but
 # .spec file in dnf source tree does (and then Fedora and dnf documentation

-- 
2.53.0


