Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F140C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 19:40:13 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.2836.1643312413202705213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 11:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A7XSHGTW;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id d5so4046591pjk.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 11:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gR88qHxeaENMMW+v+JDl+KyhIaLNiptwrGHZDAHcO7Q=;
        b=A7XSHGTWeQPPqJDwmPpwhUSxqKrqmCixhn4tyyXDTdAlzF60NCrxLF5ISStIHAoCl6
         pHp33oo2bIy7OKiT+r2P03FQusmPjM6tmRaPe4Ll13MlOoiikaViLClqv/SNdRvcsK1v
         KlT9uC6CzxdIWrC0NLhqpagh9Ol/bgn3jMzhhbrKIkhtFGPNaGYfe66rxjN7ZX2WuyIX
         9Npobn9BBDVlDzEmwctvjCkV6lC/O5LfBUlz6fDEL1yiIegnKWdofFHzRu57gLn7qs0y
         3duMizVqW8qIIvx2Pw2aTUuv6w9Yvg+la6u9j5J2Tj9KDwYKLjMmYHDcR9DJCKypQlDW
         779A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gR88qHxeaENMMW+v+JDl+KyhIaLNiptwrGHZDAHcO7Q=;
        b=hg8vNw9Aq4LvbAS2BLz+5J4pZZ4DxDJczbJ/L/kI/fW7+nKDo8NFzYSiHiCx2WGNBX
         WWeRacxIrJnpEF+7SG8O6i1rvO84oDL/mGT5aiGkNfhLaeKtwDv3Mld5NFNYZGfz03Hu
         km1bc0l9BCl/5Ya2UMHZPNgddGskM4t0TVaGguLqb0Kv4brg7Y5qPsycWDjROP5TRfSS
         7gM7X7CxBKJBE0O2adi8QPpK74OALaUnkgHLWrQPZe51wb9PuyN75aro28RFeVJpuVsU
         c+p42TOIA1wWsaOgF9wpTfjlpsp1P+UfbNiKX4USk4V77yj1CEd4Vd3qT+jLELoD8dZg
         BuyQ==
X-Gm-Message-State: AOAM533dta9Ow5OjuqhnSGcxPPVv/W49zGMmUS6xu4Fv+K1K4au6MVhy
	DGm1u+kI+GX4t+IbiLdPIJlQUXOKg+M=
X-Google-Smtp-Source: 
 ABdhPJwFea1X6/psT8JKpn1qtGEtExuAAdX+dgAKwPC5wZTjSu2myoUSU79fnXRDd8uYvQTPb0uTSg==
X-Received: by 2002:a17:902:da92:: with SMTP id
 j18mr5064447plx.127.1643312412265;
        Thu, 27 Jan 2022 11:40:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 d1sm6569468pfj.179.2022.01.27.11.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 11:40:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest master
Date: Thu, 27 Jan 2022 11:40:08 -0800
Message-Id: <20220127194008.3732712-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 19:40:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161052

Changes in this srcrev bump

  * c4d4028d fix failure to use add-cfi scripts on asm when building out-of-tree
  * 775bde6b fix wcwidth of hangul combining (vowel/final) letters
  * 8d404733 fix mismatched signatures for strtod_l family
  * 98e688a9 define NULL as nullptr when used in C++11 or later
  * 8274aaaa fix hwcap access in powerpc-sf setjmp/longjmp
  * 3733c831 fix struct layout mismatch in sound ioctl time32 fallback conversion

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 4d31047cd84..1e33ad5317b 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "b76f37fd5625d038141b52184956fb4b7838e9a5"
+SRCREV = "c4d4028dde90562f631edf559fbc42d8ec1b29de"
 
 BASEVER = "1.2.2"
 
-- 
2.35.0


