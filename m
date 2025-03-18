Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF78EC36000
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:38:55 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.2933.1742323128581139895
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sc+BYYw7;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff797f8f1bso5776648a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323128; x=1742927928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FkonGlWmIlM3IsS5leGH/uKmdN3husJG9W9mDrXSm4=;
        b=Sc+BYYw7WlBIMADgvzfOjP5s5J+io+Sp9TMWlekSH2Dyx6qRXVUnOCMOumiVrezvO+
         pr7wacY0nSO1EKRqvmHq0xRTmt5jm7EVXf9+WdvR8IbriM18Qic0Rwm77ZKhm1HVo5dG
         qfmjhhkFDTzOyY1sqR7XWg5N+m32kUQupwfuR8S44bMyNvNQ5b17YSlXFED5PuRRloGg
         e3kv0Ohp+JFxx4kTTVNuE9bOvi6iumokU5Fgplfrq9XmDLbCNoqwwyUAeRlQoEuVZ+sx
         FIooBrmWfMeoHdKPV4RpVNhIYlsfi0qwzyh7olWIRon0tNkjxIib/QqTqZQu0rTMVClq
         6vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323128; x=1742927928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FkonGlWmIlM3IsS5leGH/uKmdN3husJG9W9mDrXSm4=;
        b=B6GSGJ0+5F8Y843cd8UOnfdTz59DDLPn28PskJm+pzKhHXNkCwN+gRjBsDzLgFcggS
         0eRDLR4kI3SjcNCq/hOK6te6qrBfe1CaUn4/GHQwVEmMgo9sdTmztR0zhHzS8H54ZcAI
         7ZYlA4wD8DhkYjpoDAkhRYvTl3ydd9aXOxXL9Xdf0k+ATBAKOTlASC0cQcj2NuDXz+H1
         8tXXBNTdrSKdnKvK0RZerbALKh+IkOtb+erAQREdq83+ERDDj55nRqaYQ5ngtFqYO9hL
         QZj3ajxMcrmHR5TgAsxO8TvfV1a6kUT3n4w1HDJGjcnr6axMCaVruovMbmi1xV/wGQkr
         gjrA==
X-Gm-Message-State: AOJu0YyLql9Zl4GZXXlO6/tDx4eO2l2u+pPN9m5e2lmjtrgpVpGWCDEs
	QTsyUvJfxaaMBcPVMZmS7MaC5U4EIPogxmvtcZNsZOBIvsbFOc+rRasc0IZx
X-Gm-Gg: ASbGncvEAuJ5xCsL2w2igDNx9WnOsgqWNimVZllIaCvKSYgUkAUpPFaOYWcSMA4UsNh
	nMSkTWBQKKdbbC9333Zp8dDYdDpDvun2GDCHZiYv3HGtoYmlcf/tI3/iShdodnkVW+nU7S3qs0t
	0TDHE/Bx391i/P5mJEaoFUP4JA/hQxowx40tBuEGo5Jc/RN3iye+qCqlulAwL3+OY7PUeaTyRtg
	e1UvL6dhDmmoEBEOt1/Uzz7E1SVmRBCiCEb+p3YBUOfARqrM1NkhKz8bydHlq0Dy7j1taGKuNH/
	xTizdbzBNZSwTSBK0vAZW30zAGjCa4RuF+pU
X-Google-Smtp-Source: AGHT+IGi7Y++NNk3UJfQRTfUn92Ss2w32M209lBQ/M7kJBKP1gOHaiBjpvURmFmWgq3/RBliGGwB7g==
X-Received: by 2002:a17:90b:1b51:b0:2fa:157e:c78e with SMTP id 98e67ed59e1d1-301a5afe9d1mr5437927a91.7.1742323127733;
        Tue, 18 Mar 2025 11:38:47 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kai Kang <kai.kang@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 04/25] libpam: add ptest cases back
Date: Tue, 18 Mar 2025 11:38:19 -0700
Message-ID: <20250318183842.2256284-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213230

From: Kai Kang <kai.kang@windriver.com>

It removes the installation of ptest cases when upgrade libpam to 1.7.0.
Add them back to make ptest work. And 2 more cases in libpam 1.7.0.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/pam/libpam_1.7.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.7.0.bb b/meta/recipes-extended/pam/libpam_1.7.0.bb
index 1be3c9e2bb9..4abc52bd93b 100644
--- a/meta/recipes-extended/pam/libpam_1.7.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.0.bb
@@ -142,6 +142,12 @@ do_install:append() {
 	fi
 }
 
+do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}/tests
+    find ${B}/tests -maxdepth 1 -type f -exec cp {} ${D}${PTEST_PATH}/tests \;
+    install -m 0644 ${S}/tests/confdir ${D}${PTEST_PATH}/tests
+}
+
 pkg_postinst:${PN}() {
          if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
                  /etc/init.d/populate-volatile.sh update

