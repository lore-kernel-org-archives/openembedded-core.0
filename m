Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88C1C46CD3
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 02:18:23 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.13133.1703038696825160563
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 18:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RCwzOil/;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3ba2dc0f6b7so4166558b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703038696; x=1703643496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlv9p/RRwVFk8POifBFEpodEQPLsYjS9NTtCOyLeThI=;
        b=RCwzOil/xyRsYIUNo0Lv6GJ3gOUgFiZlYH2H7dCoADTjBdON7KOXS2gWacoqxp5VwG
         V7bOW9j2YC8byWZDVhHW/iU0LPGji9URLX4ojzdk0LAjK5l18h12wkxW16R4P+igb/Xw
         AsaZoxnwOj4M9wetgQinYs40UGKpRp/xXlcwzb64kcmz9mDT68VEg+MDNWYSCZWxy7af
         zxddDPtfuiqDxjZZ4cDr0+wMrxllJHF0KVb7vUvFrNsQeVBsvmLkoDQKvW0/77X0mx6L
         wJ1X9JoyD1fB7kwZKowKVhgWgJM+fWEpb56SROvQnPr1UBE5s3aH8HjB2LAIE78UchXH
         B82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703038696; x=1703643496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlv9p/RRwVFk8POifBFEpodEQPLsYjS9NTtCOyLeThI=;
        b=bo9k3Wrhhbf3zD+h+18RP6zGh3Ap09YqrXpEiq5JKbvgfDItVcxi2gorv1lqY8aV3e
         N+UEc0LdmssG0/XMu6M75jD/qERF6IqW5A5osnV6gmQxrdVP7GXDTBqQYsDNbzmTrjaM
         f8N1IJcJpkqcPeVchSc2XU4kgFQiCAbpz1gCWcWxcGtUjQLy94nhaikHDordWSWxHMH9
         S7SpqsnO0ueGsbeNaXyghN/mDZKbZvaGGGDP126D2eaufviWhInX0GxDfr2E4tcciA8S
         XDk5byOlaE/m14XYqIms7CSw6NSZFYl5evY+FqxT1qPXRUHdEMjEaxts+CfHbH4iMsKf
         yV0A==
X-Gm-Message-State: AOJu0Yx5fubdu5CHRN9Zu8droaVgyx/qUD1Bgv59WE2Akq2N1WSc05f8
	PFZFJudqQf533kjKFCRsE6624408vofg7f60WTudjA==
X-Google-Smtp-Source: AGHT+IH9Yf0AMZmSgxbXmzf9K8loQfwdLHDaBhy8Zg6ffWP3GUXz5zLqtcTM4LMP+SDQyBh1u3SqvQ==
X-Received: by 2002:a05:6808:bc7:b0:3b8:b063:5048 with SMTP id o7-20020a0568080bc700b003b8b0635048mr23619819oik.73.1703038695836;
        Tue, 19 Dec 2023 18:18:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78146000000b006d945660076sm367103pfn.59.2023.12.19.18.18.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 18:18:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 5/9] perl: 5.38.0 -> 5.38.2
Date: Tue, 19 Dec 2023 16:17:55 -1000
Message-Id: <d429d25beb8d4afba106b6dec957269356cb57ef.1703038443.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703038443.git.steve@sakoman.com>
References: <cover.1703038443.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 02:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192764

From: Lee Chee Yang <chee.yang.lee@intel.com>

update include fix for CVE-2023-47100.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/{perl_5.38.0.bb => perl_5.38.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{perl_5.38.0.bb => perl_5.38.2.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl_5.38.0.bb b/meta/recipes-devtools/perl/perl_5.38.2.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.38.0.bb
rename to meta/recipes-devtools/perl/perl_5.38.2.bb
index 639664e355..a9d684cfc5 100644
--- a/meta/recipes-devtools/perl/perl_5.38.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.2.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "213ef58089d2f2c972ea353517dc60ec3656f050dcc027666e118b508423e517"
+SRC_URI[perl.sha256sum] = "a0a31534451eb7b83c7d6594a497543a54d488bc90ca00f5e34762577f40655e"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.34.1


