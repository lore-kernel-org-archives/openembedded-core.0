Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.547.1599495041370360288
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 09:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H7TfdBo+;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id 31so8200139pgy.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 09:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Boabz1ee5kWQId/dhufdddkuXqt0fONg412hAGhokqM=;
        b=H7TfdBo+iJwpItydyWyArmzKNAPlbukIpJF2RlVmAw7Yzwi8mtUMRas5CYj8xF7CfR
         UhYaWlX024QBF1aAsk2Ly21PPvn1Qc1tyfAnt1UdyH+9pmpUW0gmAU8JICnb5swg24r3
         Tfkj3c8nvkK+OUsDuTzwRwQGXS4JJN/fn1RLfHU0ZhpKA187f7e/3pHTbaq7csK4WvLS
         KaskoyPqFqNnjS810JBM/d1uKA4QesU9plvmwcmpftOX/rixibIxhoCc5glSqasTMngC
         pHBTFgmsenJf9jlVfimZhVUdbFMvhvkOlsxx1A5dVcgrg6QtlE0fH4BwaAx08eTVsI+q
         /roQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Boabz1ee5kWQId/dhufdddkuXqt0fONg412hAGhokqM=;
        b=bl3Ya5RF7vDYbx1AOYc9dwjjkhWubUpAo6i1tomdDba03DCkeDskvyA/bFP3iDpQWL
         O4ebpFk/kQqOm43iSd76CUXWq2s2sU89SVmzBsY3D9XhZMrLmQqMn+txoRwsysBfEgab
         PMoAxfRR4yYUK/ff+GGF4aVa6E0apHYbXOxoJ/gBW3WTNavT4uQrSracb22tGejXx0zC
         FOzFtsQEQmciFl4KtP4DHTAT0UDE3XivUS7VS1zG0Bwgk/IJqTrRWGtq4XUMA5wFdvtN
         sKRYlG48+YHXjwgAA0jUVO0ECt7h3d8QoBY86ns0/nzUKL75QSanwz5CKihH2NujRBwH
         2dmA==
X-Gm-Message-State: AOAM532DAvZfcrlnX8ZkFHOEsyRL7m5Md1/gc2cGb4yWBxEwtNM/7Kyn
	3Tjv/oQSSgsUKqsi/cVrQmDBaxU/bj8=
X-Google-Smtp-Source: ABdhPJyF7BcNzPyYFzHXkmUMnBUZHQ2g+S2pcxh43BTR2rGMy9bK1oCOV94fgzZ6DHDA6Z1igEuRVg==
X-Received: by 2002:a63:f606:: with SMTP id m6mr8721987pgh.193.1599495040585;
        Mon, 07 Sep 2020 09:10:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:5e2:c7ea:56cb:5d37])
        by smtp.gmail.com with ESMTPSA id o1sm15196082pfg.83.2020.09.07.09.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 09:10:40 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] uninative: Upgrade to 2.9
Date: Mon,  7 Sep 2020 09:10:39 -0700
Message-Id: <20200907161039.15182-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Khem Raj <raj.khem@gmail.com>

This supports glibc upto 2.32 which is now rolling into distributions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5cda8c7d642cfb72242c95f450e3391bd6537709)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 889695eae3..69b6edee5f 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.31"
+UNINATIVE_MAXGLIBCVERSION = "2.32"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.8/"
-UNINATIVE_CHECKSUM[aarch64] ?= "989187344bf9539b464fb7ed9c223e51f4bdb4c7a677d2c314e6fed393176efe"
-UNINATIVE_CHECKSUM[i686] ?= "cc3e45bc8594488b407363e3fa9af5a099279dab2703c64342098719bd674990"
-UNINATIVE_CHECKSUM[x86_64] ?= "a09922172c3a439105e0ae6b943daad2d83505b17da0aba97961ff433b8c21ab"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.9/"
+UNINATIVE_CHECKSUM[aarch64] ?= "9f25a667aee225b1dd65c4aea73e01983e825b1cb9b56937932a1ee328b45f81"
+UNINATIVE_CHECKSUM[i686] ?= "cae5d73245d95b07cf133b780ba3f6c8d0adca3ffc4e7e7fab999961d5e24d36"
+UNINATIVE_CHECKSUM[x86_64] ?= "d07916b95c419c81541a19c8ef0ed8cbd78ae18437ff28a4c8a60ef40518e423"
-- 
2.17.1

