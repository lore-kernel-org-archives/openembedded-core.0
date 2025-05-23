Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908E1C54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 18:18:23 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.831.1748024296932387798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 11:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZwQ3Cllk;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so786205e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 11:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748024295; x=1748629095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xw1Ain17w2XiHI8GfXoCHKAq63NXZwbtOyr/6BmLzbw=;
        b=ZwQ3Cllke86of1aUcTrLg7PMNchyvI/xSN0v5mTs7cn8YwmSd6BHgbxyCmXSS6jzUC
         MGPytjrwIW5TgGrIXWq9f66RmKY3AN08envxDqE8cCZdND4RFyYLllzdpHMVvclg+xv4
         Wvaauld87cAQazPytojkjkuDnttq2odrZ97FilsQVLlvkOL/Rvx+Ql/ICA2qou7YI7j6
         ocmzFidiO0PSy4lazzNIuYbI1ciDVOonIMcnYyCFAa89lS/MBqaDa3NcVFD3XHMAMg1E
         qM8yH/SFrjv4JtjEhso7YvQQKCXlYxJjBeNaByf7Uw+BZeOK4A4xpQUwh8THIiHPX1qw
         8AHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024295; x=1748629095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xw1Ain17w2XiHI8GfXoCHKAq63NXZwbtOyr/6BmLzbw=;
        b=kxjqaL70uq0+IngeaWD1pBZVxE4kg2+85/B/TIiept+pheFLvd/oNVBEiL5LDyvOba
         IwRHb7W5BLH0NqPXg4ovgVXC1iK2QPYRQlQYhtPH6RwzVkGhdSaC1wjaxEKsFJJrfuNX
         S8koXjE74i43mskPm0IIlMXewN72uEtsod5g2rJDiDLEwnaXiY2FQ0MnWGFqijNC3k2E
         MPJt2tF9Pclx/08cDPoQMzSYN2Cy5O8AYRBr9zNfbWrcsVEqaStrl68nrRKqwFxljRSV
         UubomBXhOWS6nEAfBaieVKDWxmrqPZk0zPplfVrhGb3iYBKZnvGfPSKhzyS7xUkaHj/A
         m+JQ==
X-Gm-Message-State: AOJu0YyS1gXD6ZL3uIQ2+1YGDilcGfGagKN8e0wPJz6A0y70jN+1I65d
	euqhTQ1IbGfQruXG/YYKH4++o8LfsHsQHDCQyWTZxisRCRElGi3oG4tgrY27kqrM
X-Gm-Gg: ASbGncvSl/roEzKj98iVyxhxSiliUOMsxSkDXQLdaWBA8srdvQjGPyWxsACN76uTaA7
	7YxOZa0S2NQnvi+q0eT07/V4zZLH7aVBRvID/nl6L8AgFWut3z7ppMZ4shdMS4fEvc3pC0EiI13
	8AzgxrktF245uzTbpY+ppACpjXXk9fzEaP6dwJnZDUyJVBaQmrFF12WnAVCmaqzOVROgTU6/2tq
	7PCJjHqgJ4SzEX/w0Dn3C0ZLEOm92EFOblg8h7PaW8dw/ayV96pdXEPhNYX/+VnY+eNdHySm8Rj
	2ELqXeuK0gceZIqRX2AFOzC16lSSSmVJ3TuTSLhyPF3krCANgxYlpnciJRyfALD+tbQ9omRgq9W
	LMA==
X-Google-Smtp-Source: AGHT+IEkWJYgnqlcEPffImtEBC2kK9wIQFTx6mJUqFzEEY9z5CArMzXFdkbjeYkT+lIVhh0n/hqsUw==
X-Received: by 2002:a05:6000:26c9:b0:3a0:b816:5a44 with SMTP id ffacd0b85a97d-3a4cb44d9acmr367735f8f.35.1748024295079;
        Fri, 23 May 2025 11:18:15 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca889d9sm27366123f8f.77.2025.05.23.11.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:18:14 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: WXbet <Wxbet@proton.me>
Subject: [PATCH] ca-certificates: fix on-target postinstall script
Date: Fri, 23 May 2025 20:18:13 +0200
Message-ID: <20250523181813.3470300-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 18:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217217

When the package is installed directly on the machine (instead of
installing it in the rootfs directly), the postinstall script fails with
the following error:

/usr/sbin/update-ca-certificates: line 75: shift: shift count out of range

The reason is that the "update-ca-certificates" script is executed with
the "--sysroot" argument, and as the sysroot $D is passed. However on the
target system this variable doesn't exist, so the argument is passed without
this mandatory value, and the execution fails.

To avoid this error, check if the $D variable exists, and pass the --sysroot
argument only when it does.

Reported-by: WXbet <Wxbet@proton.me>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ca-certificates/ca-certificates_20250419.bb                | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
index f06a30bd6d..01f594095e 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
@@ -60,7 +60,8 @@ do_install:append:class-target () {
 }
 
 pkg_postinst:${PN}:class-target () {
-    $D${sbindir}/update-ca-certificates --sysroot $D
+    [ -n "$D" ] && sysroot_args="--sysroot $D"
+    $D${sbindir}/update-ca-certificates $sysroot_args
 }
 
 CONFFILES:${PN} += "${sysconfdir}/ca-certificates.conf"

