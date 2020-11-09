Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.8710.1604910709394777642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZohQg4tE;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id ay21so7790089edb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V4LKeRa10DYH0NG3hAciDf1SPG3wbpxa1VbxTCSbkh4=;
        b=ZohQg4tEsITMmEmFmQMtM6XpHPqw5SWIjmqqtfaRQ8XDQrzoV/128CDtHm6sYbgzDI
         z1FKXdGt195do4hE4nCEbahWkvkwgL2k+HM8w5d6/aZlzOZ0Fam+KP4K/Halw3vBZ58m
         gvyuwup/955luBiTABu//WdZ/1KRamcYknP6lFoRaxvKRzjgfBL5fSk46vX627xR+Qyd
         EXRnmt9DeYIJ1vet+vN5djpLa1wqPQN+0ScIv9AYpfimkfCwFtvpfomatI8uf6u0GfvN
         2buUki3LfxxOnpeuXDZygmKQKjllt9xtckWvVInKr/TJQ4fFcRSUWiWnG9TtmyC9JKHU
         5uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V4LKeRa10DYH0NG3hAciDf1SPG3wbpxa1VbxTCSbkh4=;
        b=diPnJYGtLU5atlT4duuzLLha1bn7kDeHtrCphrvQ9sxqHvQUq6GIfNt0/L42yJOw14
         lO6fvOwxNtASBHvI0e9lVaGbHzIVeiX2Kmz5QHtnD3M/f85KnENublCKAoppmFlLd6bS
         BxKH0/AVvP3ltY+aUPS3g/nZxfpQzM2RckJ5Irv3S1pbx2tyjciPd4p+uLFeNzHLZONH
         0ph8ybHQBHxGlohSMVihP11BDfplcFUsSnn1a3Q/MEl83h7Qf18Bzva55C6QqmUE2YsZ
         dCzr2k8llM+ufzC0tP4zVYIV0tmUeCmnUjWP4ux1FZX6s4ANZCvMG8DlofV2SmPsVs6m
         Utcw==
X-Gm-Message-State: AOAM532uSHSA0KFvOH3ejRsMlQD25YBHcf8sq1WRmQhcJFgZ852hfQaC
	KKFC7pPw+szD04lLfN9bq3AMRvQ7JxDaFg==
X-Google-Smtp-Source: ABdhPJymAE85CbI0NXP0+eSC9svSFMWTV9ymUXbyb394O9/DQ86MNHFRLuw45os7qsNyx6o9UokO5Q==
X-Received: by 2002:a50:af65:: with SMTP id g92mr14582152edd.273.1604910707742;
        Mon, 09 Nov 2020 00:31:47 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id sa23sm8187691ejb.80.2020.11.09.00.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 00:31:47 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 06/12] default-distrovars.inc: add wayland/opengl to default distro features
Date: Mon,  9 Nov 2020 09:31:27 +0100
Message-Id: <20201109083133.16503-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109083133.16503-1-alex.kanavin@gmail.com>
References: <20201109083133.16503-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This puts them on equal terms with x11 distro feature
(which I think is due).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 433d4b6651..0927e9c0ad 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
 
-DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat"
+DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat wayland opengl"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
 
-- 
2.29.1

