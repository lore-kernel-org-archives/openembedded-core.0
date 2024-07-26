Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A301C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 14:22:39 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.61991.1722003754892597686
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 07:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OJACpdc7;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a156557029so2999075a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 07:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722003753; x=1722608553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y8yLur95A19I08YGrwOBYViyBNn6OnrJprT/O1kLAsA=;
        b=OJACpdc79iwCQqI//IpP+VTqfB/HM3dicqMIcEYM+5GstOl6XktluEiWWlqPnb/lzy
         OO08Wk7frXPqKJ4KUo4n1VaBbgm2eQQ6T5vFUc56puPpfIAA7YNBPrrwz8K57T2wUetn
         lAvL9beWxp6PvF84PpOs7+021aSC0FSzfgw7UcmcYEs0NDwZDVa6yfElmUixoTRwsvhP
         RvE3IznqPQnjU6pJM3w3VQDK1ircYx6D+w9EPlkuxpWTaGsTtNMk3mHgXJxpsjV5/WZ8
         At19r9Rhau+cFFKbauw8QZSE7Cya6dW6ohYvi8I56+q4grUkiTFsL6LDow9nglRGKVu2
         VNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722003753; x=1722608553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8yLur95A19I08YGrwOBYViyBNn6OnrJprT/O1kLAsA=;
        b=VLVNAEEqRfkl9SNjMiDIyahAjOqe3B4WOc+kVxx/4vTHUf20BloT0+Jm05XH1RPt+R
         nsfEbNHxaYPbrRrftxQ7zyo3AozswrMo50g4YwNbJ1oeuJUS5c/qomsGmva3QuiFnobz
         EY0+Jm14N2r2VcqPi31Yj//4wXowO75/bTrQulOdWxvUqdB9vsJlDKE6AZLpCiHjGO5D
         x83Ea4aS7E6eHDAzS9snc23OmZ6rj9LxciUkfcqy55sh69ad5+4Im5HGInwWkAINmels
         2qpOPThyTNYr1Xm5Dvs1vNO1PlxaU89Ib5/obeefnS41mCfPThF1h1ujUbswGtr8xwrq
         eAFg==
X-Gm-Message-State: AOJu0YxtcBUrrX6Pw4k6D494QT6p3N2F5FHrjF7IpHpQS+OX7Ro9NM5O
	jyiFRAxMElE5Xj8FXEhV9tKoWhQgcr5K9HjmLBnlZI5xMsvew+SsCUPqww==
X-Google-Smtp-Source: AGHT+IFiIV0c/JZ9I4YzJwHLi1AQ27LLf0ZJIjO9oQykeEmx/YQi7kEeH3CkdCk42D0+UJ+J1Obryg==
X-Received: by 2002:a05:6402:254a:b0:5a1:92d:dbac with SMTP id 4fb4d7f45d1cf-5ac62525b4amr4008828a12.10.1722003752970;
        Fri, 26 Jul 2024 07:22:32 -0700 (PDT)
Received: from localhost.localdomain (host10911.telnetropczyce.pl. [45.158.109.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63d4724csm1960428a12.48.2024.07.26.07.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 07:22:32 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
Subject: [PATCH] insane: remove obsolete QA errors
Date: Fri, 26 Jul 2024 16:22:20 +0200
Message-ID: <20240726142220.107913-1-michalwsieron@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 14:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202541

Those were removed quite some time ago:
- perms: 5da7ad1a483d0840a9a2e3b95fa62a1901be73f2
- split-strip: bcc03ea19e103f6aa93bada2f49fcc5cc7bc0790
- (compile|install)-host-path: a67e9ebfd5b8002fd4a7d8d27ff0d997817f76e1

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/classes-global/insane.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index ad38879fa4..04eb88364e 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -36,13 +36,13 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             license-exists license-no-generic license-syntax license-format \
             license-incompatible license-file-missing obsolete-license \
             libdir xorg-driver-abi buildpaths \
-            perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
-            split-strip packages-list pkgv-undefined var-undefined \
+            dep-cmp pkgvarcheck perm-config perm-line perm-link \
+            packages-list pkgv-undefined var-undefined \
             version-going-backwards expanded-d invalid-chars \
             license-checksum dev-elf file-rdeps configure-unsafe \
             configure-gettext perllocalpod shebang-size \
-            already-stripped installed-vs-shipped ldflags compile-host-path \
-            install-host-path pn-overrides unknown-configure-option \
+            already-stripped installed-vs-shipped ldflags \
+            pn-overrides unknown-configure-option \
             useless-rpaths rpaths staticdev empty-dirs \
             patch-fuzz patch-status virtual-slash \
             "
-- 
2.45.2


