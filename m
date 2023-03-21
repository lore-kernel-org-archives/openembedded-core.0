Return-Path: <xmdy61@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D77C74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 11:06:16 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.10254.1679396774694181536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 04:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nq0Uh3mA;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: xmdy61@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id d10so8300239pgt.12
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 04:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679396774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nwU3uC5k8ctIkkA03zM0PwFrVS8xMarchQLXcHyE+6s=;
        b=Nq0Uh3mAr1YKZLjGAsZEMaS56c4pTBuRusrRLZ4s4sLBM+Zc/AJueeFr1dlRQU48VU
         DKwrMU/LeY5i7yWgjp05JsJbx2e8oDmzMTiZwkZecB4ftSdo6ebTn1ktUQSvj8XQuaCs
         DF8pjvY73ieRBf89ITWiqsogam5yJHSNGljs/X16/ZY1MeyI+S6I5xKoEbO3wyV0ksNW
         7R2rHKZlSwIAvCy6kYxuC/r5dHf3cFy2dzasRk0oR/FrTlVU9ZnYv+Jwz/vA2SS5RB6n
         ytN2ua22nitx/4pGfTqVbv0A2jKVaOUmFgVDzzDrnrivWRF37TuXFf/M4LGvcVu982QT
         lVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679396774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwU3uC5k8ctIkkA03zM0PwFrVS8xMarchQLXcHyE+6s=;
        b=ESSsB1o+vjudgM6L9amwNxzvQIJze65J3Sj8hlfRWKOWLH6e9kfrATpIEeetJ/BnAu
         tLSlE2p2uj2Wrh4/z1CYnN3kG07cFvLUv/0WvA7ZCPskbF2uyRXa4S5KK9IDRN/+aanG
         S3Rjkn1/SNQRBmn1xgfB65ylSntQysN0uCSUci+KxFph6pGsuCWlnDaugLfLGSrZI0ca
         uBWmy8SRD43XmkFVnTmD4zkAUq4/bl+8Rv/fQ+/4cf84kiQKW/cxgNxhGCjM1odroLL4
         9gDtp1asQKoDvgv0KDaz8fA3d660wSuQLkIu/4SqXyRq5Nb+eT0GvEBEbxHWZDa3eQXH
         eHmA==
X-Gm-Message-State: AO0yUKUEPrrEEaE1B1m+xbnlbBcuPFbgjgGBhLS5c+hFqcpNUPS4j/aa
	mME2Yc8lUcxO4FtOJKLFKzzJxDDs1u6OdA3ZutY=
X-Google-Smtp-Source: AK7set/TyA0vTtBFYlN0ThLwoNy7tt2izSIaY/Ns63Uhd95pCKkPeKM3uiduvvAfd1geZ8QiL73NSA==
X-Received: by 2002:aa7:9539:0:b0:627:e69c:8488 with SMTP id c25-20020aa79539000000b00627e69c8488mr2080118pfp.14.1679396773734;
        Tue, 21 Mar 2023 04:06:13 -0700 (PDT)
Received: from zangrc-virtual-machine.. (vps-74066a48.vps.ovh.ca. [15.235.163.186])
        by smtp.gmail.com with ESMTPSA id x16-20020a63fe50000000b005004919b31dsm7876938pgj.72.2023.03.21.04.06.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 04:06:13 -0700 (PDT)
From: Zang Ruochen <xmdy61@gmail.com>
X-Google-Original-From: Zang Ruochen <zangruochen@loongson.cn>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] maintainers.inc: Modify email address
Date: Tue, 21 Mar 2023 19:06:09 +0800
Message-Id: <20230321110609.720004-1-zangruochen@loongson.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 11:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178853

zangrc.fnst@fujitsu.com -> zangruochen@loongson.cn

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 meta/conf/distro/include/maintainers.inc | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ec7ea90d16..d1bbb1a6a7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -158,8 +158,8 @@ RECIPE_MAINTAINER:pn-e2fsprogs = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-ed = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-efivar = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-efibootmgr = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-elfutils = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
-RECIPE_MAINTAINER:pn-ell = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-elfutils = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-ell = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-enchant2 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-encodings = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -414,7 +414,7 @@ RECIPE_MAINTAINER:pn-libuv = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER:pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libva-initial = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-libvorbis = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-libvorbis = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-libwebp = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libwpe = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libx11 = "Unassigned <unassigned@yoctoproject.org>"
@@ -608,7 +608,7 @@ RECIPE_MAINTAINER:pn-python3-chardet = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography-vectors = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cython = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-dtschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
@@ -647,8 +647,8 @@ RECIPE_MAINTAINER:pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-
 RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathlib2 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathspec = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-python3-pbr = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
-RECIPE_MAINTAINER:pn-python3-pip = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-pbr = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-python3-pip = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pluggy = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ply = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-poetry-core = "Tim Orling <tim.orling@konsulko.com>"
@@ -656,11 +656,11 @@ RECIPE_MAINTAINER:pn-python3-pretend = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-psutil = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-py = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyasn1 = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-pycairo = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-pycairo = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pycparser = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-pyproject-hooks = "Ross Burton <ross.burton@arm.com>"
@@ -680,7 +680,7 @@ RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko
 RECIPE_MAINTAINER:pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-rust = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-smartypants = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.34.1


