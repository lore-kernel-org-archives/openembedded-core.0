Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.94.1602022462371471888
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 15:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cTJeLTyC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id f21so364227wml.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 15:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mco/YMEuHJlyIcMCvybwuN4bNtnawg51FLiWOaFWpus=;
        b=cTJeLTyCdPTapA+ELGEBjGVvswIhd0CxkkvOy3KdC6KqmG3Wicrxe0yN+T3NZwd0Sm
         FzVtmcazSBRid8/pnmBYQXqB0soFrs7C3TqJ714dBzf8wQ9mPh4O6ShxXc+hxaC+BEhR
         6tbEcrP9ZrKe3JzVQDK2gyk97CbYu2Kzbbc0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mco/YMEuHJlyIcMCvybwuN4bNtnawg51FLiWOaFWpus=;
        b=qy4MpmuvJAOpvwaMTVTndmuVtq+1bypFWoI0p9/s8ge8veG4kJavpK5cPTVySs6V4I
         mI2uji2JHlK34vC4tSxwNV5NYXj0/GkgRf5hjEkjD8wI8BEr1XHqfgKOy+OpFgp9+/YX
         dljCQblmmI3zvUXC5QoFVeKtW2DKSq7GoquJgVvWpl3tBShzbcW/kwoRqhTlVVfVHHHS
         0G6kqUtUL+3eWoHJyHLseahWIPkGzYfKo7bFX2Wm/sDyViMCM6XtkUpSIJoFYGT7exvD
         AshzM8bh4EvOTNH69OJrYqz5My1ucCrFbGPc03xW0pN/8mRSCq2qaScxi5uI5DAVyQWH
         1IVA==
X-Gm-Message-State: AOAM5315TxOPBkcHE3A1S7IxSLArr6sxZUwf8pVLieW29k8Gt5iyzhIF
	yUr5zHpEJCbXWPX7BVYe0G8NJLcAVJueMQ==
X-Google-Smtp-Source: ABdhPJzfgb+ydXnHUvpSRkfYGnzQACRg1phu4XndAtUdPzc6GlwtCYRg1faXVvYtZwhZ5cXGrLaLfA==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr70402wmj.166.1602022460552;
        Tue, 06 Oct 2020 15:14:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id r14sm178256wrn.56.2020.10.06.15.14.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 15:14:20 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libtools-cross/shadow-sysroot: Use nopackages inherit
Date: Tue,  6 Oct 2020 23:14:18 +0100
Message-Id: <20201006221418.3110811-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201006221418.3110811-1-richard.purdie@linuxfoundation.org>
References: <20201006221418.3110811-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When testing pseudo changes I realised these recipes have packaging tasks
but don't generate packages. Drop the packages tasks for cleanliness.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb | 2 ++
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
index 522bf3a0e96..02c6e152fc9 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
@@ -6,6 +6,8 @@ SRC_URI += "file://fixinstall.patch"
 
 datadir = "${STAGING_DIR_TARGET}${target_datadir}"
 
+inherit nopackages
+
 do_configure_prepend () {
 	# Remove any existing libtool m4 since old stale versions would break
 	# any upgrade
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index a8c1539c92d..1f6232e43c4 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -27,3 +27,5 @@ SYSROOT_DIRS += "${sysconfdir}"
 # otherwise: dbus-dev depends on shadow-sysroot-dev which depends on shadow-sysroot
 # and this has another copy of /etc/login.defs already provided by shadow
 PACKAGES = ""
+
+inherit nopackages
-- 
2.25.1

