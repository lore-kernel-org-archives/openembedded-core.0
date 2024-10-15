Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12E1D1F9AA
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:20 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.4792.1729018274731994476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nNEKzE7/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e57d89ffaso2135998b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018274; x=1729623074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgJXDO5LiD5XDXR2OWj5YllMvueGYL5NpWm/iZGConI=;
        b=nNEKzE7///ekiFCHNNIz05E75GWpyt4FcZRub3AaC5aHYIdxIOUTSlbsS4+s4UymWE
         tFnOXWqHO+PpCsBow0InmdHAplGWSkK2Zy+P0MepDW+Su8HwMYrcrDuhwn322Uo54z70
         Pzoy8FLKFf3Uc/196qv32i4Y5HsdNLXJmDxFOwS8myyXOHarm80BiZdigGi/MJ/p/5UA
         UMUOei/bc0Dn1vT60vY9gQktgpu1BrYo1BDROhhbpGxUb+ndsvO4L3MFDWuvT43TVR9j
         GHQx68uBnXtmDHDtNo/SaRTB0b0NfWD6r2uBIvjZDzP3ZU7NAjfUl55IoGXg2eYzMajg
         zlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018274; x=1729623074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgJXDO5LiD5XDXR2OWj5YllMvueGYL5NpWm/iZGConI=;
        b=tRUL9GBLdiSu1RyEWtJ0Z4f4fDNRN4HOxHCsATrX2sW+j6iu3VH6fLd06nRYJlWnCR
         Vamqj14O0nrpipKE/ZaK/1eOuWzJkl/I/tPH8LkYVsmtEqRS0K7DrX3lgOb+9xchYm3w
         FRACT/7QDRu4sqEOf8wibNuW5io4VwAbCPCM+dZy4e5lB3kJVmHf2qQMv6R1mhasR+6f
         oSh0UtKPNsdExAN3twRdZ6b27wCEI+pD/v20jXPCooLtl5yHZ3MmVBz5zXrL7r7DU3dE
         rnu1+t3Zlu+JJsyFYY0QbJr+oULK3658CcgodPV0gqpoUilWUwwtqneINovsITaJ2qgW
         Qt5Q==
X-Gm-Message-State: AOJu0YwtRGVDRvcRwweDjgiphOwxPDR/2HZGSSFia1kSG0ocNQNPkzTQ
	jhGA821daFMJAmB38QeV1ivRuEPlp3vbo0GneZqcjOpe9ZYgQvKd0og6s1KqpVoZlz9DqcdMB2X
	L
X-Google-Smtp-Source: AGHT+IHSdi4dq5akIsySbgE9nDdngyE/zuw4/Gqmpl6F0z415K+iNDiBUV/tlcZVcFzeDXpgIVQmWA==
X-Received: by 2002:a05:6a00:194c:b0:71e:755c:6dad with SMTP id d2e1a72fcca58-71e755c772emr4702083b3a.5.1729018274049;
        Tue, 15 Oct 2024 11:51:14 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/18] libpcre2: Update base uri PhilipHazel -> PCRE2Project
Date: Tue, 15 Oct 2024 11:50:44 -0700
Message-Id: <31861ad29c18ee76185970335fe86441ffba0442.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205931

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bd6d18228835773163a085070651e13ed961d66d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libpcre/libpcre2_10.43.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.43.bb b/meta/recipes-support/libpcre/libpcre2_10.43.bb
index fd0bd79212..f744df88fa 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.43.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.43.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=321a5eb46acae6b6c1ff2c7a866d836a"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 
-GITHUB_BASE_URI = "https://github.com/PhilipHazel/pcre2/releases"
+GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
 SRC_URI[sha256sum] = "e2a53984ff0b07dfdb5ae4486bbb9b21cca8e7df2434096cc9bf1b728c350bcb"
-- 
2.34.1


