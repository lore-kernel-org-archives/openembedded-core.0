Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE32FD1F9AD
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:20 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.4795.1729018276374651675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=leU2eXI4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ea7ad1e01fso116587a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018276; x=1729623076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0z5YAccJO6aSargXND4DNXKmV//bAWr6p2JW68wC7Ow=;
        b=leU2eXI4Y8HIRPKaU4gT+Ip/CK7w4hgBKZpV5Owa2oiB8c1MpJ0QO49r45mSw2/Fkb
         zAvMJmjpjwSfd9uA3gmMnLgf944qw50nOPvPsc04b0BzMw/ecfMBRIk8VaNXN+4fTAvu
         ynWorLDB/NkL3Qbnh8WF1jTXv4e7wk6MIh+Tg0RdSGYwHADR6JhZnX4TV/Vc8axMHaJu
         Km+JD1hJhjNLAYTloKmzsiIr5P7+9HSy92hGmmUrYowV7a3+nZ34q2yM/hzVCN0vCdnv
         dh7jAsnsglh8EghnVP7M1WZL45Kr9tfEhx/wGa30vOG0vvi+7qnmVJmUzfkVEsaTP0CK
         z/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018276; x=1729623076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0z5YAccJO6aSargXND4DNXKmV//bAWr6p2JW68wC7Ow=;
        b=lFhmuTYE2sMdmB00rworHoHG/n2U6uVPQKuF4Vwz/i51GWte/TSWPAQTHCsAHIyHwR
         bJEZUorkoaNiabd0OC1O1TtHe8fI6DHE9eY3JbdwOCsr2F+JIjf1ukvnjpmkrHFekuh4
         wY7UDXYRoBAthkIrx2A2vUmEQxaLK3pmGVrxI0hmtzSkrufBJ0vHwPyzTPC8iX8DePho
         5omZzBFhCTADvhzbd30xPlXv+AZiqy74+2oGF81HWgtjS1rjZwBlIRxbYEdwYicObuQ9
         VyvYX1pebQrdN8tHMBh/GzeSjZqaohd017cLIuANDJJaImwUGJCw2NsHUYGa9WJ7OMGh
         9HZQ==
X-Gm-Message-State: AOJu0YyJwmoA9rJxbKoLBQbC7L7J0O7Mat2zotI9rspb+mywRPN9bzpG
	VNII50dFsQpnhq5Tsp9bSY3xZl1xd8cTkJvg/vURDWVWMDicTpeXisnvUcoU6ckVkQ4WwpYUiqu
	J
X-Google-Smtp-Source: AGHT+IHs9H6LlYLY8ZnREa7/oaJe8dWc81cwZygMYpuFsvTdDNqjKtQEql+b9VutOGN+ZxfmH8yOkg==
X-Received: by 2002:a05:6a20:c888:b0:1c8:de01:e7e5 with SMTP id adf61e73a8af0-1d8bc8c8c47mr19679013637.15.1729018275617;
        Tue, 15 Oct 2024 11:51:15 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/18] license: Fix directory layout issues
Date: Tue, 15 Oct 2024 11:50:45 -0700
Message-Id: <a31b46627a85ea871deb760f3d0008de72ceb439.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205932

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are several issues:

a) pointless empty directories were being created as a path wasn't
   fixed in a previous commit
b) SSTATE_PKGARCH wasn't being captured into the task signature
   since it is in the ignore list by default. We want to capture
   the absolute value, not the dependencies
c) with those issues fixed, cross/native issues became apparent so
   those need to be fixed too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport from oe-core master: f68aed302a0e4b86fb8c16a6ef4e7295bed48b86

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/license.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index b2e0d3faba..d7c5d08a77 100644
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
-- 
2.34.1


