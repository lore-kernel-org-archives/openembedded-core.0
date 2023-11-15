Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFB0C072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 18:24:28 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.20962.1700072665213714603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 10:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kx9/sa66;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cc329ce84cso63112025ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 10:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700072664; x=1700677464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9AJAc8ykrCdJubcP0EpbmPrysZsiif0jA9oJG9koNQ=;
        b=kx9/sa66Bm2LtC7+uQMwsGaNXmvPRcbazQnu5PwzTO1qlycT0WM7FlDEH9cn0xQQrE
         J9OVUA8sPnSsaY8AYK09nSFZIjzuXoZEie6GgkmXqcgeT4Ztqns9EDzlFj143nonBipt
         yNeieup7JLdZEPNKAz+rjd3nW9ty6o1KfPgWfQg0F3RlAwbANTT/BzHkMrAaAJsk+ehc
         hepvLBW18/aMZmPcl/g85PG0/3Om95+Lp9/GQJ0nNivu330d5OLh4C6BMvzM8vSc8xlK
         CvP4Nor8fjfXRJvmrGXrD1qcvhhMnKjZzAu+mRT6P7EUS2zWl9mBdmfA7m67x90MUNh9
         P8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700072664; x=1700677464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9AJAc8ykrCdJubcP0EpbmPrysZsiif0jA9oJG9koNQ=;
        b=f8N1fp+PEM38wXpURf20P1AORfiyt0ahe51bUwIhOKfH6lENPJFswW6mle0Jfcs98V
         0bEe5lLq34/wmKyNmamLp9IL+r4jKPSLF4HSFgtivfRUDv7owicGT79dvRtcvX5q/5Yj
         w5ya2mvp+SptroAHkjrVGWHFC7CN1iBdIe9OBlzUdlUKkVrQ5qDeyHatl4Jcz56ydawb
         w+JI4EyseqlLmR+Vhj8zECrG35BgORtPIPQ+mjVMYDyBgFzN5SFiDsXP84Pi4zf08P+R
         QElphAnt8ZgbBMH67cwdJwPu82BUtgjPyKhAD8QGK5Q+nXqFnXWQIOVKoFysMy+cgC27
         Zryg==
X-Gm-Message-State: AOJu0YyMBAGIDH8UHLxt/ZygHDLmPNyuC5ErPZRgSY6JJXnPggu0RHJU
	R1FwTkSc4flUPFa7LCeQKYdY9mY06XtmMQ==
X-Google-Smtp-Source: AGHT+IHv0esQ2QuPPTqyKerglmbDPkjeZSQTpFRnJa2zjSlyOp+GTqNtZwm6icon0nYVnWTk9gkgqQ==
X-Received: by 2002:a17:902:db07:b0:1cc:6ec2:d24e with SMTP id m7-20020a170902db0700b001cc6ec2d24emr7509464plx.53.1700072664204;
        Wed, 15 Nov 2023 10:24:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c20d00b001a9b29b6759sm7628161pll.183.2023.11.15.10.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 10:24:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] vte: Upgrade to 0.74.1
Date: Wed, 15 Nov 2023 10:24:16 -0800
Message-ID: <20231115182417.415940-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231115182417.415940-1-raj.khem@gmail.com>
References: <20231115182417.415940-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 18:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190740

* Inherit systemd class
* Add packageconfig for fribidi support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/vte/{vte_0.74.0.bb => vte_0.74.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.74.0.bb => vte_0.74.1.bb} (89%)

diff --git a/meta/recipes-support/vte/vte_0.74.0.bb b/meta/recipes-support/vte/vte_0.74.1.bb
similarity index 89%
rename from meta/recipes-support/vte/vte_0.74.0.bb
rename to meta/recipes-support/vte/vte_0.74.1.bb
index 21203adcf79..8a7054a13cd 100644
--- a/meta/recipes-support/vte/vte_0.74.0.bb
+++ b/meta/recipes-support/vte/vte_0.74.1.bb
@@ -16,10 +16,10 @@ DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native i
 GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
 
-inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection vala
+inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "9ae08f777952ba793221152d360550451580f42d3b570e3341ebb6841984c76b"
+SRC_URI[archive.sha256sum] = "2328c3f1c998350a18e0e513348e9fc581d57ea4e7b89aedf11e0e3c65042b4f"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -31,6 +31,7 @@ PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)} \
 "
+PACKAGECONFIG[fribidi] = "-Dfribidi=true,-Dfribidi=false,fribidi"
 PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
 PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
 PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
-- 
2.42.1


