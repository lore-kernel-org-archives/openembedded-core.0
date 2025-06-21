Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D61C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 16:14:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.10271.1750522478340212744
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 09:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TfFvBzoO;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453636fa0ceso20218215e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 09:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750522476; x=1751127276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISM0BMGJEiJ45ueqmdUNmX7crOh9kPtED/HJajXs81Y=;
        b=TfFvBzoOW8yqQebVW69TK2VscqkAUE4oNPpYlbdXdYlY5FNGx9iq/qN9ZkN21933MX
         FmESnxyvmwW8TgLy85v8Lo0nT+TPuv0zRzP3KKFiy56MjaRfRUzKK4E24LD3VM6Vq+Zn
         NgwJcZlfpYKg/SE9gMPh0Jfjpjeh3FHnOeUCVeqwY9ZOSXwY01ezvkDiBcBOMxTZzoAo
         5yN+UM1InERP9Hns7eJcU4y2FDNPV2zbE3tlqydJX+rhgkHr4SmITOwTPPfeV75264It
         5gIBOts99mdYTVQ6HBd2Tb65+iWXteBKAsJpSZNWfq0KCI4NhHtz07KT37hciQDzmv5s
         ZMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750522476; x=1751127276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISM0BMGJEiJ45ueqmdUNmX7crOh9kPtED/HJajXs81Y=;
        b=xGfssrSryddLwL1cIZa5/IBaE2e8Ld5LJkQ3rOUg2xSn0FkKC4GR71i4ye0qmWbqAh
         WwfVTdh/Xee21MjSFA7NK/lojb6kVq971EJ2FxgHcYOC4rJ6VkjUcd2QA/CV1ljFimSo
         lrEe/KGBEnjVgkMG3L5zPShl3WLdDvo0iEyxJvvYGVa+Bo/YMBbok33VkkqKZ2mDovLy
         wmKzsmpY0SfaLyHgIBWKXVyssFYUCQ7tj0j4wOiTcF+6Mgzz+X5W9igoTkQxHXBDzwfQ
         HHYUxnClY7t73Vad5Tl9tFIqtrpyjXtS9lrMCSOWPt4zCy/+37wA8Yjayc3stkyH4p7v
         G8ZA==
X-Gm-Message-State: AOJu0Yy+PwlGt/0ZsPHIJfbtUC6RpHNtrSzZ3PuM3JHsAe1KwFcFgoeq
	MVZSJN2v+GoqIAmub1Zv2Y1uKfd5YNHhjtBd/5xtL3K7uK3ebiGe5SZzj+4uLw==
X-Gm-Gg: ASbGncslcjtfdafk3Krlq144GS/LIKWgoZk4m/eaqs5NlrAuHMKIajf53de8WRrHXHU
	FSkcF+mwh5gDwZf+Ypbhai7rz6H+aAyuo/WOc4TB1nOMU6UYwgJxqXMWFX+5GVPVcdqhlapwOCP
	Lm1aj+lddysb7yH/M9HfGUwS5+obWGVJCUuuTHdj+xLAFxXjECH1zW7SSjRl+5CCITwYZXY/X4/
	QtplRsNfaIEdxYsBPcjR0wfmVTrdjjFI5r9XSeYAu0yR6uAIrszv5rjVO4tChaH9JrOwHUB8MNB
	PPuFyrJGV6L3t5BFimx2QKBU+MyLi0a+Cezto9zok10z4amy+//HieO1E6U9hbJOupN5kawX2LX
	dhkiC+DX3pKU=
X-Google-Smtp-Source: AGHT+IHyTMghue1uPi6mR1RYuyl6o2JDalAZtL16MC5YTLtH6HO+1OmWjVVa/ZZkYwyEQXQzeQ7lUw==
X-Received: by 2002:a05:600c:c4aa:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-453659dcd57mr77692145e9.17.1750522475955;
        Sat, 21 Jun 2025 09:14:35 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f189cdsm5118446f8f.35.2025.06.21.09.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 09:14:35 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [walnascar][PATCH 2/2] xwayland: Add missing libtirpc dependency
Date: Sat, 21 Jun 2025 16:14:24 +0000
Message-ID: <20250621161424.13595-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250621161424.13595-1-gudni.m.g@gmail.com>
References: <20250621161424.13595-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 16:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219167

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This was being pulled in through python by accident. It no longer needs
it but exposes this missing dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xwayland/xwayland_24.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
index 0774c1bbf5..c0b5dee4c0 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy libxcvt"
+DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy libxcvt libtirpc"
 
 OPENGL_PKGCONFIGS = "glx glamor dri3"
 PACKAGECONFIG ??= "${XORG_CRYPTO} ${XWAYLAND_EI} \
-- 
2.43.0


