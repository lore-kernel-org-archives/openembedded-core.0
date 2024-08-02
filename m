Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB58C52D6F
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 16:09:24 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.96521.1722614955777264095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 09:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h2KKECCG;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7ac469e4c4so617024966b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 09:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722614954; x=1723219754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtvmDEg2m+s0AfNUPnBq0AmQUKw25fIRzTG4ag+lD1U=;
        b=h2KKECCGNgS2T2nDT7GhmjQWPen7i/jZGTjYUH8uQfGSfliCGDVnBFlgVbUaCSAFwG
         6Oh9G/1A3SSw0iRNDeZa+i3ZFvU1MFBspl/ScErJODEOpl5vGU0IhZDeDaCV7bS8fZ/e
         Uh2b+9/HHofc+MqiPbuEaCQ7atZwGECL9m2sacclB2i0pr+Ai0gRQx9bRXEq3BgVGkdJ
         KPsMJHNYk491fs/szgAK7XkvKUra97++SknzeoIZeEcfaKbPcG8NFyeDzEv3nnKZhVd4
         6aB+cgvkXMuK5nVRoWAFByuxPz48JM0C/eC2em9kIQVwmclY38YrhiRSo2hBvWlJZIy4
         c/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722614954; x=1723219754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtvmDEg2m+s0AfNUPnBq0AmQUKw25fIRzTG4ag+lD1U=;
        b=A/U0jDwICakGq02LG3b9nIxGXVaoi1BiCQOveQdgO50T1pu27BRvyV/dLlaLkSnsLA
         +XnuuRuWeFhybd6ag/zVNnPlMh2MlUtEEs8NsBz/M0l8CsTuMQSUnb+2memV8TeFim1H
         pLc5eQzQjTiOkGuFhtpg1goqQ7qEB2MP1k/g+QT7OQzDDhIfbdA+AsQizB+LRQDi5oCZ
         0lYHws69tGKniQ8psnrL3njXM/ivcasXgq/+822Vcyuf/PvRMeVSUkJAyjrQvIZ53Blw
         UTa7yipti5AgL1kXc6MEck6H1i6O9mB6ClrnzqGjJYURPYxrH6cMleCXA1HKMPU1aqLO
         NmUg==
X-Gm-Message-State: AOJu0Ywys1LbILDa1a2uoh+6yRwEQObaEVpIxlOuc4hCgbmal0xnZfEo
	bU2ObmZRxrxARfkqbSuYg1ygthLqbzArcAMMWZ1bOZde48pXX+QI83e3ASPS
X-Google-Smtp-Source: AGHT+IGu3EDxlR2zuTKjcPddPZtPDZSv+YVad1Rii6fXTJrchAhJUfeI35a9mglUglQy6K9vwWcLKA==
X-Received: by 2002:a17:907:86a5:b0:a6f:5609:954f with SMTP id a640c23a62f3a-a7dc5fb8558mr303385066b.12.1722614953935;
        Fri, 02 Aug 2024 09:09:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e84340sm114289866b.185.2024.08.02.09.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 09:09:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] pulseaudio, desktop-file-utils: correct freedesktop.org -> www.freedesktop.org SRC_URI
Date: Fri,  2 Aug 2024 18:09:03 +0200
Message-Id: <20240802160903.2800657-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802160903.2800657-1-alex.kanavin@gmail.com>
References: <20240802160903.2800657-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 16:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202925

From: Alexander Kanavin <alex@linutronix.de>

Server's https certificate isn't valid for freedesktop.org without www prefix.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../desktop-file-utils/desktop-file-utils_0.27.bb               | 2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
index 55c88afcc9c..5285a6c6ea7 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/validator.c;beginline=4;endline=27;md5=281e1114ee6c486a1a0a4295986b9416"
 
-SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
 SRC_URI[sha256sum] = "a0817df39ce385b6621880407c56f1f298168c040c2032cedf88d5b76affe836"
 
 DEPENDS = "glib-2.0"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
index 54c79b4097a..6c172b4ec7e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
+SRC_URI = "http://www.freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
            file://volatiles.04_pulse \
-- 
2.39.2


