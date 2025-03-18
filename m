Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58470C35FF9
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:11 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.4277.1742272742237003862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E3l8/mOO;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-225477548e1so89082245ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272741; x=1742877541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z80FLWYlIjF5wF1RqFcGBdgb45hxlD07i1vOHGwqVzE=;
        b=E3l8/mOOJZbYTy3k7+37WslkIsokKMoLKRiCWER2WCUhdx8kgkn2rQ+m4671JGtD1f
         J85tL12SPkGnqXWJif5wleGF4bUv8sBQRzVd2hQSUg5PovDa/aPomGu5MDiGXFTFv/Zb
         9H+nVfNvl9eHzdL42sXtGcd7MaV6vXgfWWBudoVHBA5aU7THVgUrEJexO6pJGFNnzRQ5
         mkU5yy/+KBCX3yyMiusg/hpvQ0k5yGdzhvNOXPiR8f10n3qJgOOZFW43KmnkCIFFK8DC
         8gkK7QgfuY8oDh2mIpn+8uNARDtouZWhkyvP37b9Y2SaajMgYp4zJz/+2H6ws00wGIRB
         bENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272741; x=1742877541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z80FLWYlIjF5wF1RqFcGBdgb45hxlD07i1vOHGwqVzE=;
        b=gduVCUYyG4HBK5PPcPiXoTk758lNRu4SVRMvVopElr9Hffn58JP7SK+N4o4pwiqUQm
         dDdXnZcPM8QlE9nUIhD50Az4BFQQ06lHYTIGo3uwRdMjhhZ0gbdLN+fQl9KFj1SqsoHl
         K+SuwhuUOCC259BMdbBUQMvFFWV7DqN1eDciIwSfuyR2+9F7f7BUe3BCUgOrxngRMx4L
         lHAwRZrcLcV2qF74D4+6beT+SAwnghXiZz2iGUHl34k98XGa21Kfax6G3sbVm0DFV1FV
         jLW0jta4Ko+CtHB5c6cyhc9khSEAn13I0jQlpwI1Gv1Hq8vuRWzJUFxa73GaYspu1016
         m9vA==
X-Gm-Message-State: AOJu0YxkhmT4sw1xmVHppo5gnqsE6VEwrRvm5ASrMDmbszbV88eUPpE+
	9aVvM/dRPd4p9XhEwzgFI9hiupddkfuZ8i8il5Pfietm9m2qOX9ZQoQSj/aF
X-Gm-Gg: ASbGncsF5qbY4Ra7KCDieyJLPueKLQNk23iAYQv3L3zpaqGX2LRDHy0TlCvG+nWmSvq
	tTNvKIPZ9VaiV/5Gh5/KOkpIa6yBnGf3MQ7rPqStDG/XcCr8qa3n9iSiAoksZRHdgQtZ/smgTSU
	B6rJ4Ywq128fsM1QL527OnD678Tp0jk+NGXSljqf5dJYJM4o5RElgh5nkJz22b4asxjBkawfJDf
	DOxq0sDVM/xXPlvrKwKKNdv//W3DHqlo14o+85zh2IFELNmISySvncJJQaFrTF9pBB3P/K4/20z
	+zUHNpCozb37UtxMDEhbESlhniwJStsS0u2K
X-Google-Smtp-Source: AGHT+IGHXnNTSJSfTnWOp9jWl6Nt50ZCspFjlNMMX77kjrjditVKd+X4h/9HYhqj8LpXyKP9wcR5zg==
X-Received: by 2002:a17:902:e74e:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-225e0a6e646mr203426685ad.23.1742272741427;
        Mon, 17 Mar 2025 21:39:01 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:39:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 13/24] man-db: Add missing rdep for col utility
Date: Mon, 17 Mar 2025 21:38:33 -0700
Message-ID: <20250318043846.2422141-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213147

man utility calls col utility internally when formatting is asked for
therefore it expects col to be in rootfs otherwise silently errors with
retcode 3 meaning 'file not found' in this case its due to col not being
found, other distros eg. gets this via bsdextrautils dependency

libssh2 ptest mansyntax.sh fails due to this error, which now works

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/man-db/man-db_2.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes-extended/man-db/man-db_2.13.0.bb
index 2178239bb60..17bb2996531 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
 SRC_URI[sha256sum] = "82f0739f4f61aab5eb937d234de3b014e777b5538a28cbd31433c45ae09aefb9"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
-RDEPENDS:${PN} += "base-passwd"
+RDEPENDS:${PN} += "base-passwd util-linux-col"
 PACKAGE_WRITE_DEPS += "base-passwd"
 
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'

