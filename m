Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D780D5AE7E
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:29 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2922.1765620140181502411
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lfdIxz41;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f0f875bc5so24830245ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620139; x=1766224939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1PpKOwEurvERXP/ywoqM+ggUztKDYtXAV4ZEUrHVEk=;
        b=lfdIxz41EN2opEIArOBxCaGmcHX2HRaIKx3OeWGPP+a0jlTJyI4o/2QuatCpnsxMtc
         O3vUssdL7n+tKCmpx28/cfzGWLpAKnDlwLgJJeAjp/FbRaV2iMZl1IIWq51SftTd5aox
         BYBpp+oVIj59kXCSmgstf4Fp8hahDr0dBSZ4G1ahZxKIrC+VSnOz7C1fveNYlvhiGqkV
         /IWI/ickz9W11Q7G0prllGgdQ7TzWqxhC/kaSc5KpWVOFkjvrQW9gX/l2qlDC/uiLkUK
         W3zRmYR5SbYc6JvAebULYP5oOCaiRdgNy8tzmGF1Q2Ypwwx3nXky8LXjP38DH4BAOk+R
         S9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620139; x=1766224939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j1PpKOwEurvERXP/ywoqM+ggUztKDYtXAV4ZEUrHVEk=;
        b=rXWfsxiqkYlHODD3PSfuz9W3F8vEvjkY5bg2kQEeh/Lb+xy11cdgXaofHhCIqGJpDT
         1yvIWjVwT+bnmJ+JpI5SJ0cCo83+VjZWpnp6/H6Agd+uDhToopGag2Az+uj1kjTh/WV5
         HCvXSADiW6D+Zu8Pua0aPPr5WyD3xu2RwRHV8cyqyzqDbCT/aazFPfcEdcKFQhqsmMfU
         tNpkOwTT4kcnOgkHSnchf8zulYTjICquiQzoYbENjwcZExJ5r+3wCnCgLXUgXeBfapEL
         Rm75VYQINt8oVQEXdHRxmIZEhKQBBl//ZqDXAhKGs8VgQFQj0n+FHX/EXsWRY2Kq8QYL
         MdyQ==
X-Gm-Message-State: AOJu0YzqdTywz3yq8gxX5wL8bET2bSAYpMfdICs0y9PoSH4HOyR8Sc/l
	MLmjjZFYmge/rq/uBAx8k662Ey31O3Y3zK+iMLtrdrDPIer7ODb0nNtYWwweLjcM
X-Gm-Gg: AY/fxX4XUMGQwhohEkB0PUQlfF6XBmU3i500VjbzElnb2wnkk276Jmc/tifrTX2v7Fr
	Gw9hRkt+aLwuk9ryP/rpe8iO7tW+S93HkSWXZPzmtL/e9h5YS4e+qawVl+Oz8N0b6JgGgw5qOQV
	leRAdSYCGhuayXlzzqMgjq6KJy+RoBLSyXGGCJ00TbSl4VMvkyx1bxLA5DV5woszs4v4eoEzgmz
	H3sPDNMTf2skwlYfq9PnhTFGv6R51tkp2j9iFkZkfrnDTUM0H1Pp588dMLA4LWb7UDzbfKxYJv6
	4Zw+reP7wHpSIs6kQTc3x4mJbFGF5G0spFyWgP6YVSXElnvkT85bBxd1G9t6ImYMlNj0OMSkN8a
	GS8u6W23R7toYqUPgOwsFgKSgV0KN9CxLPkWNivBgVaiox2Vj56Y/zaw2Wr46urm9f9RWazpGTz
	h2HKNzzuIT+naWIR4sNfAuaKau
X-Google-Smtp-Source: AGHT+IHkAtRZ6wNe0E84Qq4t112OQjqwO6YHrwRii1dFf22SpuaQ/Xb/bSxNwOQ4PHIfPIYwQaIb5w==
X-Received: by 2002:a17:903:40c6:b0:29f:1bbd:a572 with SMTP id d9443c01a7336-29f24369cd1mr44431015ad.46.1765620139360;
        Sat, 13 Dec 2025 02:02:19 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:18 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 57/67] enchant2: upgrade 2.8.12 -> 2.8.14
Date: Sat, 13 Dec 2025 15:29:21 +0530
Message-ID: <20251213095931.2571498-57-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227675

From: Gyorgy Sarvari <skandigraun@gmail.com>

Release notes:
2.8.14:
This release fixes a test failure in the previous release, and improves
enchant(1)’s word division algorithm, so that it only considers words that
contain at least one letter. (Words may contain characters that aren’t
letters, but Enchant was for example considering “1900” to be a word, which
is probably not helpful.)

2.8.13:
This release fixes a bug in the word division algorithm of enchant(1)
introduced in 2.8.4, which itself was attempting to fix bugs introduced in
the previous release. This could have caused a crash, but it seems we were
saved by careful bounds checking in GLib. Instead, it merely meant that
characters not valid at the end of a word were not removed as they should be
before spell-checking.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 03477472cfc0417241486a3d04441ebb95f087e5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/conf/distro/include/maintainers.inc                        | 2 +-
 .../enchant/{enchant2_2.8.12.bb => enchant2_2.8.14.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.12.bb => enchant2_2.8.14.bb} (91%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6a8e1c53fd..f17a622c44 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -170,7 +170,7 @@ RECIPE_MAINTAINER:pn-efivar = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-efibootmgr = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-elfutils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ell = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-enchant2 = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-enchant2 = "Gyorgy Sarvari <skandigraun@gmail.com>"
 RECIPE_MAINTAINER:pn-encodings = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-epiphany = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-erofs-utils = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-support/enchant/enchant2_2.8.12.bb b/meta/recipes-support/enchant/enchant2_2.8.14.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.12.bb
rename to meta/recipes-support/enchant/enchant2_2.8.14.bb
index 84f0156bca..4f8f2cf7f8 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.12.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.14.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "20e5fab2ca0f95ba9d1ef5052fe5b028e3e1d66d4cdea6b9adfcbd3e524c2a09"
+SRC_URI[sha256sum] = "d04588769399ff7140fa214b9731e6fc6eda9bb2e75df9f67263717710bb4c4b"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 

