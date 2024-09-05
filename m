Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5308CD5BCF
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 15:59:08 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.13384.1725551940915701101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 08:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YColLtRS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.179, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3f90295a9so12816701fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 08:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725551939; x=1726156739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DfbzxdirTauNbt7fdD9ot6+J8iM+OZu0wNGU4BBxC3c=;
        b=YColLtRS0RXExjVzpdL0ivUcfHS5K3nSLKlm87gQA5I5ljfhzoyQiRSHQnHVrQ89yl
         vUHPJcyTiuntJrvqYJps8ro8jEkvRFkov4s5QJt5Cjo06fk500Z9zyulmT4cSXxeq4Mg
         +3vLN7GiHdJmHXztkBHNm42S2DEi8wRRkEaVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725551939; x=1726156739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DfbzxdirTauNbt7fdD9ot6+J8iM+OZu0wNGU4BBxC3c=;
        b=Te051CGhQIwFdrAspVsBpB9Ydufmp+rev/dEyUcDA+pLElzqaFtA99WcfJdgVM8DqG
         PKpMJrmprf1JZfQofYfLFNhyPiCHoHJe9gbGPiGIaeLHF0xYJ12yv+tZZwpL3bA9P2t5
         Qw8Asa5eU2cQkI/D5YoenemfHtRN2KY7aWjofWjiYOEa2hQGeE6veelnnpdtss2KuIWS
         GjYLL6bJES2+KQJvs5cDWyjwoM6Zr50g6SHLkKjxQ3UNaksan/TGEVdIUaKVEGYSdVpn
         lNsXfKOOvoU/jSAKYuVCClakf+PasyObgCtVFcrssIia1kjIQsspfLmr5uMgv0grtD6r
         9+ew==
X-Gm-Message-State: AOJu0Yzgl8Ml9YXPRBZUSoMu9eUaaI9j2zarCZZU1TgWs2+SnFcpOEr3
	x/cucJtoWl4GeMprFLcgHKzm6XWS308vLig9R67U1IXOh1QNwP38JPvMdbxowC9py896B4u+se6
	u
X-Google-Smtp-Source: AGHT+IGzZYOG+01msUXFAAmHPDImpEPYn5/N8C8wbPP97rJFk2oBOirijcsnj8dSBYpqoMWnyn+SxA==
X-Received: by 2002:a2e:be13:0:b0:2f4:f255:4fc1 with SMTP id 38308e7fff4ca-2f651d6044bmr51820651fa.11.1725551938118;
        Thu, 05 Sep 2024 08:58:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b438:ccaf:fc83:f321])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc697efasm1372710a12.59.2024.09.05.08.58.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 08:58:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] license: Fix directory layout issues
Date: Thu,  5 Sep 2024 16:58:55 +0100
Message-ID: <20240905155856.1595113-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 15:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204240

There are several issues:

a) pointless empty directories were being created as a path wasn't
   fixed in a previous commit
b) SSTATE_PKGARCH wasn't being captured into the task signature
   since it is in the ignore list by default. We want to capture
   the absolute value, not the dependencies
c) with those issues fixed, cross/native issues became apparent so
   those need to be fixed too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/license.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index 4e39ec1d44e..043715fcc36 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -18,8 +18,14 @@ LICENSE_CREATE_PACKAGE ??= "0"
 LICENSE_PACKAGE_SUFFIX ??= "-lic"
 LICENSE_FILES_DIRECTORY ??= "${datadir}/licenses/"
 
+LICENSE_DEPLOY_PATHCOMPONENT = "${SSTATE_PKGARCH}"
+LICENSE_DEPLOY_PATHCOMPONENT:class-cross = "native"
+LICENSE_DEPLOY_PATHCOMPONENT:class-native = "native"
+# Ensure the *value* of SSTATE_PKGARCH is captured as it is used in the output paths
+LICENSE_DEPLOY_PATHCOMPONENT[vardepvalue] += "${LICENSE_DEPLOY_PATHCOMPONENT}"
+
 addtask populate_lic after do_patch before do_build
-do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
+do_populate_lic[dirs] = "${LICSSTATEDIR}/${LICENSE_DEPLOY_PATHCOMPONENT}/${PN}"
 do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 
 python do_populate_lic() {
@@ -29,7 +35,7 @@ python do_populate_lic() {
     lic_files_paths = find_license_files(d)
 
     # The base directory we wrangle licenses to
-    destdir = os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('SSTATE_PKGARCH'), d.getVar('PN'))
+    destdir = os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('LICENSE_DEPLOY_PATHCOMPONENT'), d.getVar('PN'))
     copy_license_files(lic_files_paths, destdir)
     info = get_recipe_info(d)
     with open(os.path.join(destdir, "recipeinfo"), "w") as f:

