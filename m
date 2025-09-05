Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72CECA1015
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 09:04:15 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.16882.1757063047455229858
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 02:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l+KieJOe;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6188b7550c0so2817933a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 02:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757063046; x=1757667846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BVN9fU8BuZ2pfcdNe2cUS0wjh4zCK36hi2WxIAkD4jU=;
        b=l+KieJOeQWPeNeEHXfmJ2ujsRHs3c5iiRXHGJHx8Tu24kn9E1An00zc/i7D2yDdl6i
         XXcd+A4mr3SmaVFb0JmUaf5EValBqXIBmXHMGBYer6LuN9DJrkn6eNz0kDEuykrnMJ8x
         LxZVgqQw4gBMuxG6+/Fb6L+r6xBvHk1CSYYkjL7awZLwe9Z4/YAge9atKMBUxs95IPSC
         omPiaVTyMf0oOTrsdIM2fCxoH0Omv10sMOJik29KkQkW5EYvoamzS6Q6tGdzN0WVOyl/
         LbATEUFYrI2N2Nd1FygCDfKeJkh+98ThVyMZa3rvpc2ZR2QG5E8sEg669iM3F7UmIfnB
         6O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063046; x=1757667846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVN9fU8BuZ2pfcdNe2cUS0wjh4zCK36hi2WxIAkD4jU=;
        b=jzpfzgo6yH9Mlp/igQz+HoiviytM7koOF4c1ahtNeItCVr1Lkblh7R4kqhA05rzldy
         wWFdTYXzuBJJyPpmWzgrpE8GSjyH9pvjPH/DUSO4d2DzIGoE6z4vPax5FmifVbzSeM9E
         BNBDqlNx9JO+2jp00kjZsXRZWCs4Ah8gOFKOdK/1gCa2paUGFt9LfjnlC8CnIgyvfX7M
         nYqjXI9ulvvIm8G7TXIb9/xBcoZcKPcexGnjUdTXOc8XwColy7Jyo08plqrSurYkqL5A
         LxnI0m2M7C8aR2Vs/V8nEkk8iG4j/ChGN2W0FEZaRAr8NwhVKG5RkFmGNGGWy06K1rLY
         yhiA==
X-Gm-Message-State: AOJu0Yz2n1btsY/4hHNfg5sYEwrn+xwtrUiLR8R4Tgm/nXP43wRaW8oV
	lslcZAvF4GHqHAkIZgeCimMpR87NX76irpZOYzBWB4ftTp9UkGhC/kObpktEPuvi
X-Gm-Gg: ASbGncuK1n27B5VMK/1iC6+6KUcPbrQOMCOZLaBwxFI1VF0pcdaBF6lBX2ze85Q63qn
	XKKaDtTKm5VhM8MCM9wJdVsEpv3gulFGtDwDh/ht6FoWpE7bC2keuckY2v2ec0V5EtpZ1ghrZ1t
	pI6U9o97fk+XzxQDMD0g+dk/rKd4K3taKc8QnXWPNVQlzOESVqePdWyknHuumTAX8238MQFu/eN
	V8hbjhSgV+VoFMG26MTTgbKS40qRs0fcBRC4+2FJ645UySHfSU7sRVOhp41VMR8e0NL7TxG4NfH
	nr10/4EmMpmAFS4zlkaNJFzylx5vkZcbLcYoVS0zNQBqnaOXfEVOX9Vu+wJH3uG/aQMKd/oetaS
	xJN1fB4m1FvsgUpqSjygYOZAapSBNTMk=
X-Google-Smtp-Source: AGHT+IHoIUAtbyV1YCJEQIrRJDWY/QQ0EHQk/2KnbNo2obqS4zNMdsKVJviMS5+lne991IFqec25kA==
X-Received: by 2002:a05:6402:21d9:b0:61e:cfff:21ef with SMTP id 4fb4d7f45d1cf-61ecfff2388mr10465441a12.13.1757063045663;
        Fri, 05 Sep 2025 02:04:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7caesm15844336a12.9.2025.09.05.02.04.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 02:04:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: drop GPE_MIRROR variable
Date: Fri,  5 Sep 2025 11:04:04 +0200
Message-ID: <20250905090404.2425345-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222978

GPE_MIRROR is not used by any recipes. Beside this it looks like
the url (http://gpe.linuxtogo.org/download/source) is unavailable,
and the main url (linuxtogo.org) is using an invalid certificate
(issued for another website).

It looks this mirror isn't useful nor valid anymore - so drop it.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/conf/bitbake.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fad397776e..8e90c7bbc8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -699,7 +699,6 @@ GNOME_GIT = "git://gitlab.gnome.org/GNOME"
 GNOME_MIRROR = "https://download.gnome.org/sources/"
 GNU_MIRROR = "https://ftpmirror.gnu.org/gnu"
 GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
-GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
 KERNELORG_MIRROR = "https://cdn.kernel.org/pub"
 SAMBA_MIRROR = "http://samba.org/samba/ftp"
 SAVANNAH_GNU_MIRROR = "https://download.savannah.gnu.org/releases"
@@ -717,7 +716,6 @@ SRC_URI[vardepsexclude] += "\
     GNOME_MIRROR \
     GNU_MIRROR \
     GNUPG_MIRROR \
-    GPE_MIRROR \
     KERNELORG_MIRROR \
     SAMBA_MIRROR \
     SAVANNAH_GNU_MIRROR \

