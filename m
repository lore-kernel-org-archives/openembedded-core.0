Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A63C4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 12:22:33 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11587.1784204547722212178
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 05:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qNxzpbDJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: festevam@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-80c5cb9a888so57574527b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 05:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784204547; x=1784809347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EUPnRvwxqPkyHrTRTQATZYfy5AaFvUVnLqCXQA5M0zk=;
        b=qNxzpbDJ+IZERDxv01JiJtK43zXMKLYVDkAGhfcc/8ecM9SicxgyLvez7Nz0OMJZjR
         vzTDXbNqCNykvr2NBeg/zek3pYWDoK3JuSi7x/kCJhF9BYVgaE8G8bQXeZz7c48BuwZI
         cqUeSyKqlnDaBdYDa9gOJvyD/VE+Gri7/ZiBKu5l/bhzqxjwruzvpry/FAWilmuZc5s/
         0cM5IrMbyqOHE61dQQrLX5Wv1mhP4MSOoR3Jt1JoBk22obi4KvlrZ5x6nTSXkUnSZXQe
         irSXtCCSFyCj+vIHHZTWEniw19/ePDOkmUFQCIDaASAAGl/fMbentFgiS5xGM3D/+wQS
         Ocdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784204547; x=1784809347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EUPnRvwxqPkyHrTRTQATZYfy5AaFvUVnLqCXQA5M0zk=;
        b=NLLRBwnvTi5YZi+G7NB8ddSAKU+RtMK6ghGuc1dnEob6KhE09uk3fl5duu7BZAxlql
         H0E3mxws7BuI9qOZ8z9dOnAnoxBccAVGdxzDuNKfBwnf7Hr8g4MoZ4+4KncT1HwhWhwi
         cMp0MTxOV3UnKQm2O3Ln27z4YIUjXX8tuTWwlfnFHzOQfuYEbfSlrgki4qb2HBrWb3tw
         8+xuW4yNc0QSeQLUymjIwp5ps4dhLl0onwu3efAyz4/b2sI4gC20/kblgS7iyh+nYFLu
         xC0tyqsjPy4ivBk4cwpdBO4nmuW8nJ+jlqTKBdCFQxkI2ET0m4GvqWKyZtEUOfH4Xb2w
         Fhyg==
X-Gm-Message-State: AOJu0Yxa3jUlhDWn1HXbwGP/2EiCP/H++BSZ17nrPHebSJEVLc2by5el
	1rpRo4EStjqKLDyvRWWSKd5LwzvrZ5TAaWaI7K/2h/KkzTCjeGyGd1EwW4Q8Nw==
X-Gm-Gg: AfdE7cmb6gLZq/A0500wqcjp3taAODoUTiLl733q3pl64CnjHZGPalA4OB2Ju9N7Nla
	HeiNxTgJK5w1pXV1HBv8ut9ByxSoFGCu4bmMS8n5SIQjGJ31kXjAcPxRBLClUxm9hLxFoCesrCQ
	Kx6BzwrRb8zAqP/7gOrWqKNjdsQkQEP/tIn2jTyONdBcxKdyJx65uUI6nK1JK6ke8MKU/0eX6ut
	7BzMYaFTAmmmaiDyWlsQp3Rsr0LyEqLuV37Ovrmo6Zge6iouOtlQoBn1qILEUSwkHrxO62lp2kv
	+HouQFMPFhWSWWxHyQFm/eIlBpIYzNyjRimtqZaRXYdGbZqxvDzYj3MO3NF0sBc36u4Du2LP+hm
	gKDVUfI8OUhdHvSZ8Z1+rfIZy4VTyaHUvIb+bI6eTDVNC4zfaMu7kNufv9fEE0s+As0AgdzUHLd
	bk1w928UVOaDvfyvWhK1nEzj8GzxDr0EayuvEvBIjsmNiqtZU=
X-Received: by 2002:a05:690c:b96:b0:81e:a3e2:5e66 with SMTP id 00721157ae682-81ebfd29dc4mr71782427b3.8.1784204546631;
        Thu, 16 Jul 2026 05:22:26 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a801:a24:61fc:d0de:7874:f476])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e950567eesm132957247b3.13.2026.07.16.05.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:22:26 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@nabladev.com,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 1/2] gnutls: Enable p11-kit by default
Date: Thu, 16 Jul 2026 09:22:17 -0300
Message-ID: <20260716122219.569673-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 12:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241089

From: Fabio Estevam <festevam@nabladev.com>

U-Boot 2026.07 enables the mkeficapsule tool by default. During its
build, mkeficapsule links against libgnutls and requires PKCS#11
symbols such as gnutls_pkcs11_init().

Commit e9f12f64279c ("gnutls: Add p11-kit for native builds") enabled
p11-kit only for gnutls-native. However, this is not sufficient to
build u-boot-tools, which still fails to link mkeficapsule with
undefined references to the PKCS#11 API.

Enable p11-kit in the default PACKAGECONFIG so that the required
symbols are available and u-boot-tools builds successfully.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.13.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.13.bb b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
index 943864d4ba..ce9f2b16ff 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -31,8 +31,7 @@ SRC_URI[sha256sum] = "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16c
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-PACKAGECONFIG ??= "libidn libtasn1 ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
-PACKAGECONFIG:append:class-native = " p11-kit"
+PACKAGECONFIG ??= "libidn libtasn1 p11-kit ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
-- 
2.43.0


