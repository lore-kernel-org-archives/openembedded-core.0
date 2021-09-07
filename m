Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.4603.1631057551430179237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 16:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iZo1fxOx;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id q22so476562pfu.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 16:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mgjTFRQGVckHb7s2tJjT11s2GrgnB17gmWIO9P5CGXc=;
        b=iZo1fxOxLzmKuAISRd87tkcCgTUAzrMieZPTcMVKz40t+llK/++XYFNE+BZHU+gYlk
         DRdvzMW58NBx9+XscivhvRGDkLoySGGqj9xoLhsR1B9QLryT6RQnMC1C/4KyK3E4Gbnq
         K3xgf/GrZIjx1vmIUy6eurTHpKG0f6Io6UJYhz32ip5wCRlK964/RW9ZHFsvkdglUWyp
         8jj4MnEyf7ky07Q9BzNfvtyWXzzfEUI9M0q9URKdpHNjeiENjBeMlepBLB9JT4BRw9NR
         TSeu6wsaIewYl7eeZAkldIn7bma2PHM4RZjArGYETSs04twLF4t+10VRYF2QM8j2nYkr
         fY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mgjTFRQGVckHb7s2tJjT11s2GrgnB17gmWIO9P5CGXc=;
        b=jxQ7ySqrqUfo46d8b5lZQMys1LSjKL5SYHYzCjd5zfP95Z2tll5ppeikxZkZT0QOFT
         X80N2yop9K+MtLdjP5EUUIUkOnobU94BD/1UtSK99c0f5UiIUl57CG0N6s0eBvFPOCPw
         ln5Gs90K7TqH0eYPGBJ9y+HU+b9g3Hncz138TfV/9XLXDgn1yBxuPRzQJqEJfP2WgJvl
         UiN2agqESg1/1RyGQljtUkZ97TvWGvCBFZh4OTYAGrpvtH2aJLOiEIiwQzZ4jDgFN2rz
         P2h+nMWohznpE2FzWN4e7u6FzSwbUPZ6DfPSXrgO0O3Ov1Nk9h6e2XKHHzbdZw3QdKhE
         3NqQ==
X-Gm-Message-State: AOAM531/+kCDdgfH+SLHoQTyytPsZliQDEGXCh/AL18aVoZmsPPknmvK
	8U71zPgXKiFETYQfahuqtmXG92QUVE8=
X-Google-Smtp-Source: ABdhPJzV2YOHKZi1vi/SGnU64OVb3TPhFm8e5O1zcmcscjAF4yW5+D6l1F9V+Gn6oV6ZM1aqSn03sw==
X-Received: by 2002:a63:e613:: with SMTP id g19mr807594pgh.12.1631057550838;
        Tue, 07 Sep 2021 16:32:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:ece:8e2f:f07e:736f])
        by smtp.gmail.com with ESMTPSA id d200sm157186pfd.127.2021.09.07.16.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 16:32:30 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ovidiu Panait <ovidiu.panait@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 3/5] dbus-test: Remove EXTRA_OECONF_X configs
Date: Tue,  7 Sep 2021 16:32:25 -0700
Message-Id: <20210907233227.3265977-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907233227.3265977-1-akuster808@gmail.com>
References: <20210907233227.3265977-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ovidiu Panait <ovidiu.panait@windriver.com>

X specific configs are already handled through PACKAGECONFIG:
PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
...
PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x
                      --disable-x11-autolaunch, virtual/libx11 libsm"

Remove duplicated EXTRA_OECONF_X args.

(From OE-Core rev: 7dc107b05a29f8a3e8903d73f84ef8069f68af6f)

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 036e3436e51a44de3fc9b4b8e5b1ff149e3aaa9d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/dbus/dbus-test_1.12.18.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.18.bb b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
index 0063dcce67..68fcdc847f 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.18.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
@@ -24,9 +24,6 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
 
 inherit autotools pkgconfig gettext ptest upstream-version-is-even
 
-EXTRA_OECONF_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
-EXTRA_OECONF_X_class-native = "--without-x"
-
 EXTRA_OECONF = "--enable-tests \
                 --enable-modular-tests \
                 --enable-installed-tests \
@@ -37,7 +34,6 @@ EXTRA_OECONF = "--enable-tests \
                 --disable-doxygen-docs \
                 --disable-libaudit \
                 --with-dbus-test-dir=${PTEST_PATH} \
-                ${EXTRA_OECONF_X} \
                 --enable-embedded-tests \
              "
 
-- 
2.25.1

