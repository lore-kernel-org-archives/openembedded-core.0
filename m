Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D377C87FD2
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 13:32:19 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.22366.1754659938219777051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 06:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X9lnvs/4;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-617f89a3dccso170304a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 06:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754659936; x=1755264736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TxjW9Vpz+ewgeRqw2Yb933qSsbG8KxxDfUm17Kw7mE0=;
        b=X9lnvs/4mJWU18dfVXV4eCQ0kvvCQK+2cktPi1QRUNsYc/bFNynaMckP2CRzY/+eZP
         cqTdQKHf7I+oOs9nq+tE50glQy3j56vL0bs60ZtikttkcMDzjBc7OErzCY3KQnQNzZq+
         IMJ+mYYKo+b6kFEDCEi9sCQrH45tMs//XGgvnTH6bXk8JI40fd/jd/Z28bl8YfHexbcy
         LQJhgAmQ+0rB5+Sr8ATAJuJUgd+cZMEbyOfCgsv9P8O319Lj3Y9bTS1Bcbz25hwkML8e
         49p/uko6VD8TVmFyHKnQ6cIUL5Oy3ZugNZlURJ7Twqugh0nxbHSxs2VQ97/3crlfK/5Q
         S1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754659936; x=1755264736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxjW9Vpz+ewgeRqw2Yb933qSsbG8KxxDfUm17Kw7mE0=;
        b=K+OrqttyatjfEE3Sk1onHKfBL9pN6psGoVyR/bGAs9AY2Z4vGel6md8mFUppzssoPa
         InAr2wm6oEEW1H0rN9XNnS2q7Cn/VEZgdJL/bsOvucL+V0/B1lWYbSFJDlTJXSWgCAFz
         LnHqFNq7jaad1DHzj5ZEUG5RYB2dmF4w7RP8JpFRTwlgH0DLw8lUiAhwmf+Oc1gj0mn1
         plln3PIiLSeCxCHoia3+3dS1yHoSE0bOWfYA3NHeWyV5waG7k+6gZnn9hS7Jo/hV/efA
         +eD+9pZFxEBKN5OF3rFw57RtlRVogDu3DxyHiHBzZirxevkXNUmbgIuWOlPJQEaFT9r7
         H6Lw==
X-Gm-Message-State: AOJu0YwnfDTOWKheSpwYKMusWgWD4Grki4miZDNovN8xxcVNt/cLIXLZ
	Cu+WDYO/kPEMzAF/2oxG+mewES1VqfcPRhaC2+j2kq79p4ic4UTJ8qR2ipdgEA==
X-Gm-Gg: ASbGncthn/e0Cxw6nhQQLMzVqjfXFjHqRDiywyv9ThwKWjnYGIZUAtrSz+U7KGHTD3b
	XCecrVu3FvFaBQPoXglZpWvpeyIzVMuRvRQ42eVmhkKcgLE7YCGYTqeecTPJS1dbMYDjgx9HMZ6
	WE+AgPLj6oR5bk8pZeO0T3wMwXbSF/nfP4a68bFkAmkAohwbtq4Rpd3tTPJlo9x89LSjGj/ouZi
	URHSHc7XrHWwnKXyRifgvgkzDq7+kCEDFv+w6gV0xsTHBORCDy5xP9BRxiQkrjySb7OZ9Qrewo6
	EJ6WhpJhvAnyhTWWJ/UjsS2hK5BuG1hg4Gx4wgk7bIZ3na0wJtbD7aSVtxL8AoBUiXUzSC0JiAU
	FCDpJ2Vn2InIj6J5foMQ=
X-Google-Smtp-Source: AGHT+IHbC04QYECgelR5bZaxm1f4DT2f/+HkVeyuG1/xl+qbd3hPUQGbnlZhc6iw3TiJgAfC8zUn/g==
X-Received: by 2002:a17:907:9482:b0:ae3:7255:ba53 with SMTP id a640c23a62f3a-af9c6517e01mr265780066b.53.1754659935232;
        Fri, 08 Aug 2025 06:32:15 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a2437desm1502508966b.127.2025.08.08.06.32.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 06:32:14 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsecret: upgrade 0.21.6 -> 0.21.7
Date: Fri,  8 Aug 2025 15:32:14 +0200
Message-ID: <20250808133214.224830-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 13:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221653

Changelog:
- docs: Fix return comment of secret_value_get_text
- bash-completion: Fix man section number in secret-tool completion file
- bash-completion: Integrate external extended bash-completion script
- bash-completion: Require minimal version for bash-completion
- meson: Use newlines for build options

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...001-meson-add-option-to-disable-pam-tests.patch | 14 +++++++++-----
 .../{libsecret_0.21.6.bb => libsecret_0.21.7.bb}   |  2 +-
 2 files changed, 10 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.21.6.bb => libsecret_0.21.7.bb} (92%)

diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-disable-pam-tests.patch b/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-disable-pam-tests.patch
index da5ed1fd32..e0a5737eab 100644
--- a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-disable-pam-tests.patch
+++ b/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-disable-pam-tests.patch
@@ -15,11 +15,15 @@ diff --git a/meson_options.txt b/meson_options.txt
 index 936eff8..2ae14f2 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -8,3 +8,4 @@ option('bashcompdir', type: 'string', value: '', description: 'Override default
- option('bash_completion', type: 'feature', value: 'auto', description: 'Install bash completion files')
- option('tpm2', type: 'boolean', value: false, description: 'With TPM2 Software Stack')
- option('pam', type: 'boolean', value: false, description: 'Build PAM module')
-+option('pam-tests', type: 'boolean', value: true, description: 'Build PAM Tests')
+@@ -61,3 +61,8 @@
+   description: 'Build PAM module',
+ )
+
++option('pam-tests',
++  type: 'boolean',
++  value: true,
++  description: 'Build PAM Tests'
++)
 diff --git a/pam/meson.build b/pam/meson.build
 index 8413b58..5155329 100644
 --- a/pam/meson.build
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb b/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb
similarity index 92%
rename from meta/recipes-gnome/libsecret/libsecret_0.21.6.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.21.7.bb
index f40b1159eb..e77f83e92f 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb
@@ -13,7 +13,7 @@ inherit gnomebase gi-docgen vala gobject-introspection manpages
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
 SRC_URI += "file://0001-meson-add-option-to-disable-pam-tests.patch"
-SRC_URI[archive.sha256sum] = "747b8c175be108c880d3adfb9c3537ea66e520e4ad2dccf5dce58003aeeca090"
+SRC_URI[archive.sha256sum] = "6b452e4750590a2b5617adc40026f28d2f4903de15f1250e1d1c40bfd68ed55e"
 
 EXTRA_OEMESON += "-Dpam-tests=false"
 

