Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1BFC3DA59
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 12:43:04 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.5280.1721479379290356246
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 05:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AB2Glkcc;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.169, mailfrom: steve@sakoman.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-39834949f27so6007685ab.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721479378; x=1722084178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJJzmphV8ULcxfZyHx1mr95cOraoi5Y9JZ2AZi15z30=;
        b=AB2GlkccU66S1hrjycn3BHK226qRwNiGJbXzhjE23nktl65ehhNPmiJxglml+T+Hb3
         SkBKARADyQF6szOQhwOuIBM2sMdGZDl3USS3eUA9syL4e3dxrwudo8U5tlPsCg2qK1BJ
         ErFayyGlgKa7+jESSzHrZBULg1pZ99gp3LxMP+txtVLtM6WN3gtUN48Ccnbt9t1AqN7c
         PkBZpxlCgfhWEb+T4mqPpA1l8bq2zURQpTl8ZdSz9T0bsDISr9h67mrPPga8w7qw2KhF
         2SrcqggukYPRMHwCklOwxv3wAa5Gx82i0jWpnTdXCqTpzJ0ETIea6DoHjtofIcPq7B6e
         9qaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721479378; x=1722084178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJJzmphV8ULcxfZyHx1mr95cOraoi5Y9JZ2AZi15z30=;
        b=v9a6RdTSKjcb0GRlR6m2E9Ss0tXFkTdpa1T684LhoIR1NUSIRh3v+bws6uTIhe63TZ
         SsqoDfspOwspbQ5zYrMRly/q21+sFZa6jwEWe6W/5xK/RQu2brTWsQYDd3+uNmaYQMrx
         lbE8sCxJpPH4xP75btEhbD1eSeyhyKtKEODJ7go2Ex9Wxda2M8iPPL74ks0KGQgCjoAW
         v3ZftVEo8tCrAHHz8mEus1HBnxT+m7yVjSzRA15vBVKIe7wKvcxqYiwj+xMNTbguHYNh
         h4sgvtB9wjeqM/EZ0kg3u7OgRpQKTo3CVc2DXSLqwGPnb73ul7997ASMJlFdPQ3sVn4z
         26vw==
X-Gm-Message-State: AOJu0Yz8sVKBgILL+wFbOBpV8oh5QOLRiN8hcx60OMBDU23S4m1CMD/7
	aANCy3sIDbjizKM+zCs2LoJyXHcGBK3HItKNbGmJzHaUiqrvniers4V5dD3n7NzEVORzmOIC8wC
	K0gc=
X-Google-Smtp-Source: AGHT+IEYcg8uWF0IrGqYyLsBSl/IUgZGGLFuTA9hrgrwP0Fw77Xux7PBC+xYez/xms4E+vrxkAWt2Q==
X-Received: by 2002:a05:6e02:1a6c:b0:397:b45d:d009 with SMTP id e9e14a558f8ab-399403a8cd1mr12212675ab.16.1721479378373;
        Sat, 20 Jul 2024 05:42:58 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d0fe2e2b4sm796604b3a.10.2024.07.20.05.42.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 05:42:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/6] python3-jinja2: Upgrade 3.1.3 -> 3.1.4
Date: Sat, 20 Jul 2024 05:42:46 -0700
Message-Id: <58ee84c274b0c93902aad5d4f434daec5da55134.1721479252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721479252.git.steve@sakoman.com>
References: <cover.1721479252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 12:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202282

From: Vijay Anusuri <vanusuri@mvista.com>

Switch to use flit core since upstream changed.

They also changed the capitalisation under pypi.

The license didn't change but the file was renamed, probably as it wasn't
rst.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e352680528b18c3cdae26233bef7cddc2771d42d)

Upgrade fixes CVE-2024-34064

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-jinja2_3.1.3.bb => python3-jinja2_3.1.4.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.3.bb => python3-jinja2_3.1.4.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
index 068e21bf5f..3fe82d5e4e 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
@@ -2,17 +2,17 @@ DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone templ
 HOMEPAGE = "https://pypi.org/project/Jinja2/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "ac8bd6544d4bb2c9792bf3a159e80bba8fda7f07e81bc3aed565432d5925ba90"
+SRC_URI[sha256sum] = "4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369"
 
-PYPI_PACKAGE = "Jinja2"
+PYPI_PACKAGE = "jinja2"
 
 CVE_PRODUCT = "jinja2 jinja"
 
 CLEANBROKEN = "1"
 
-inherit pypi setuptools3
+inherit pypi python_flit_core
 inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
 
 SRC_URI += " \
-- 
2.34.1


