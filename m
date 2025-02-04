Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C42EC02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 10:54:37 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.113869.1738666463421664256
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 02:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V+2J3PK+;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436341f575fso63060445e9.1
        for <Openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 02:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738666461; x=1739271261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqnaA+ldWalr46s3/xLZU2VNhAKovzMkLti8j72Z0FE=;
        b=V+2J3PK+Iu9gwTaB/ZcWWWOeti4Nu+wS7fqDy6Bbou/eD/n1z7vqpxIpKVtA5FVC2H
         Y4ilywCybaCfKPwnqbvqIhMgxMwoQ+fT8BXvVyC5LWdQd5wRg9H1OOV4xdHMbbMzlR93
         mpoCPr62ABZAtGothcEkAGBYSyJI7dF+/PYCiYjOnEdC9tpQkk6yum/IY0qkuclzsgRe
         JyB0Ry2yGtFyOA/FI/H+kjC7lOreS9LkQl9jKAYM73po5HQ7WmWAGuthYAMomWEmVy6r
         DSTw9TbdRBwoHfjidPw8aRVtDOXAuclGgIg0IhvcG5aQ6LbW0XfxX5sFwzjtj30UNkiR
         u8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738666461; x=1739271261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqnaA+ldWalr46s3/xLZU2VNhAKovzMkLti8j72Z0FE=;
        b=kSPKqJMdIIW5a2cW+rtZhRQanM7cxdaTLyp9EXqikP/1VFDuX06JAS7FGOOkZ7Iup8
         bq35xiOP1ou0mhBOWGCx+4PeaQna/GAGgijXMnlzXURWcFwXKrTSSe7b19lyVXmFPDiV
         if0uCSdHagHehV2UaOa+2rih3G5SsjsosHyEhiyBxWqkVsLVbWyEhLVDiEOECJq4C+Er
         34icSAm2wIk/wNTnnMW2qHG7dZNqITlNZsV9wFjLxwNJ1+IpBvk/z1B8MKVM8WK/4QzS
         uEzA4/AbBWJ22OH+VsuHre2lTunRC9J6Z7G2xFHOBa//L9O85MLYzWjAAIK+L+CdsQ+I
         +1BA==
X-Gm-Message-State: AOJu0YyTp6KP7JRrp0y6DcGBLpZrhkkV/jkKtDW3u5GyTP/YI7ChiU49
	iK9b/RxztsdAqaiyyyXVOCEHDbMuojlzf3Q+OTNl2rsLbB07qKys5Dcw2ESD
X-Gm-Gg: ASbGncsO21n1Cq4RUDJ0oBAOlKOI3w3oj8CV8q8j5G8HwmRZPG59pS6uMH9OW1eTzFm
	ENo+HWg1KN7eoTO0rmAtN3FR8gW3IrT1DUZhPtRldfjJCc4SaYHCWHGpPQAwBwnmYhC9u5i0p1y
	0qk74VhZRbz+APQoNiWPgotkPmtnX9Q4IKfEewa6LnssqcSNXdxEhBJeOo5ROBKS+3b0fFW99Lm
	fudUf1UrR9lyXceAarcONevJmuHiSBEIdGOJLbkck/vqjPj3HtYkVfDHXTe/0BRyGXPAc+r8E3u
	sXq7ZhsJku8B1kgDOx3qWujUExXa+tE/7N9XjiW53Umf
X-Google-Smtp-Source: AGHT+IET0V2LOREfoL7bwtFJZrcS/B3N93oXTou8naAVaQN7wnyic6HNhud4lxoa3MOyRSQgmP43Zg==
X-Received: by 2002:a5d:64e4:0:b0:382:3959:f429 with SMTP id ffacd0b85a97d-38c519378b7mr24089628f8f.5.1738666460948;
        Tue, 04 Feb 2025 02:54:20 -0800 (PST)
Received: from slackware.local.localdomain ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc81941sm220702145e9.36.2025.02.04.02.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:54:20 -0800 (PST)
From: uvv.mail@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 2/3] meson.bbclass: Add an option to specify install tags
Date: Tue,  4 Feb 2025 11:53:14 +0100
Message-ID: <20250204105315.84079-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250204105315.84079-1-uvv.mail@gmail.com>
References: <20250204105315.84079-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 10:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210767

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

The feature is available since meson 0.60.0. You can specify
comma-separated list of install tags (not targets).

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes-recipe/meson.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index b343480f9a..cbfc45b94b 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -22,6 +22,9 @@ MESON_SOURCEPATH = "${S}"
 # The target to build in do_compile. If unset the default targets are built.
 MESON_TARGET ?= ""
 
+# Since 0.60.0 you can specify custom tags to install
+MESON_INSTALL_TAGS ?= ""
+
 def noprefix(var, d):
     return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
 
@@ -182,7 +185,10 @@ meson_do_compile() {
 }
 
 meson_do_install() {
-    meson install --destdir ${D} --no-rebuild
+    if [ "x${MESON_INSTALL_TAGS}" != "x" ] ; then
+        meson_install_tags="--tags ${MESON_INSTALL_TAGS}"
+    fi
+    meson install --destdir ${D} --no-rebuild $meson_install_tags
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install

