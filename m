Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F4AC4167B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:13 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.142640.1671132063592833640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=pucZaB8T;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so3742711pjj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QEOsuyEEF19EwlpL9IeMviKQ/BKsKMusxgsSuPIpCM=;
        b=pucZaB8TQzjINSZVMLPWxgtCffskaZeCgUAkLdtXIt543JR+A3HD8TmnFEIAE7vptO
         SEqywt73GBrFY2arwP9n0EPY/VQoNHqqlVh+p90obePk7948+50HgGiXB5nWf3LDECus
         yYRKzNmEqJZC7fiqa36rEDCRc4/4oH17/BUYP4CymrMzVmDAaNtEWmsi7pe8GzimrLT3
         g+BXcHPBQ62NhnGGoEkxQHWqkG3mK9KcautVp0ilKyg+0YKj4PhAcKbSh4Cr73BtZRNl
         SCdjoXo+WKBppLuTh1qQ2Z220R0KKtf5xZBpnR8UydfsykUdQ9oaa6oymMjuFWIY0Iim
         l/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9QEOsuyEEF19EwlpL9IeMviKQ/BKsKMusxgsSuPIpCM=;
        b=hiETMjlNV9k1Ca0qS7sz8kfa8TqyokbTd/ly01dC+kfCJ3RGf6N/zOemQmYcfO5CgS
         158xBSy0AqASMDxKLJ+sl/m5thrRs0Ilp6nh+mLTcSc4N6OLwgs8GWEsU2LN+yAuSNF/
         Z7lI2W58vmug37LPvXh3wYQYlq0crN9HObrQ5ftRW8Cvq6/XsD/oJ6Tqbtmx1qgoeyR7
         APFXV3kEx8bg2bHXzYhKcq+3c5TfgkawLUxjqSt93mI5ARUitKDSSuo7tgb1GTwRz+wK
         ZGYcuy1AGIxYdc5JklYCSckDrv4FoFmr9Eet2KDl9KNVFqKwFaaS6AuhFhp3JqoDrCZ2
         DxTA==
X-Gm-Message-State: AFqh2kpLm88wO8KlsG3y73w9iBGZafSbwe6KTH9XH4LKCpqQT5pEy84v
	AXIpsokzD+TtAzzGmmxA7mb8fgE6MrofLqnRmEk=
X-Google-Smtp-Source: AMrXdXveVtSGD7CNTyV76H4HCSwyAw3t3Hp0rzZO9NRcFqr8/a/ayP4mHg9HyucPLUR7OamvE8JKFg==
X-Received: by 2002:a17:902:e5ca:b0:190:ee85:b25f with SMTP id u10-20020a170902e5ca00b00190ee85b25fmr9904468plf.48.1671132072746;
        Thu, 15 Dec 2022 11:21:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/30] libxcrypt-compat: upgrade 4.4.30 -> 4.4.33
Date: Thu, 15 Dec 2022 09:20:30 -1000
Message-Id: <760626c0409c4f735a0e00b73161d239c44e9645.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174598

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix -Werror=sign-conversion in lib/alg-yescrypt-platform.c.
  With commit 894aee75433b4dc8d9724b126da6e79fa5f6814b we introduced some
  changes to huge page handling, that show this error when building with
  GCC v12.2.1, and thus need a small fix.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6918477ad121f9c7335c661433a909e948f66d51)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{libxcrypt-compat_4.4.30.bb => libxcrypt-compat_4.4.33.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.30.bb => libxcrypt-compat_4.4.33.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.30.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.30.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 2bdedcba6d..61b0381076 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "fee2687bad66e351a3dcc963a34ae80125923ff8"
+SRCREV = "d7fe1ac04c326dba7e0440868889d1dccb41a175"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
-- 
2.25.1


