Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF928C0219E
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 11:46:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.38636.1738842360569981175
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 03:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ErfJwRgk;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso4916365e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 03:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738842358; x=1739447158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPu4S32qezSc3KLY7SyMngOyXn0YoKwhtJNV1US/CBo=;
        b=ErfJwRgkk340UfOhpJmJZxUIv+aobTcuzpjrOKngzNgXkCl+JYnhhkGYw9g3oq+iSx
         +KFj5mn7lEgHxYtti6WfN9kQyN9b3oeS7CTcNPOA5cCwCtNj2GiD03NVUZ2kdwjfOcwO
         kiDwCRO5qYKDxX4q06hdjm3MG3lf5iSGVpQ1vohYuyF4WsfkHHhSfLucaA8t1iQJ4/zt
         sxpanpfTkQbbY9iDVPjDlaJvvV+ZVl/adQpGoYameVji5VriwNQmNc8NVEPOp8c3e6X/
         +Tw59sAlhN9OcEHueS8pRSE4nuPnr1AXSIw5fpW2CmHVWgSYWfKkR/MPytyKp1hcQE3e
         zZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842358; x=1739447158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPu4S32qezSc3KLY7SyMngOyXn0YoKwhtJNV1US/CBo=;
        b=wc0Ihmth2O+m9AU/OUHGThd7QoC5W5S7xLaClp3/SabWBzen4lddeqr+ooPnStDpfu
         6MzDtfGWK6AdmZOuq2jOITFjRBI4J13Pqem5oBhMfs4F3k5v0qiI+UOCxzexhQcNb1zF
         e52t0RWm0ad00rbKF/qPKu8HuoBC45zhfgr8JMK2wTv/9DJ1EILZygVqFsCpy0cWFbge
         OhHAsfvg4auT+b+7HipW/QoiqmYkZ4KucGjj6XZ3XIRT4ayyilqv4mRgUK0Hzhw50mxn
         3Lqj3bXds/u98mqJvHzv1RE/I9MTRwcp/4YufZD1a0p4FFk+Fttsh8dU1Jj5oG+4pqKO
         95ug==
X-Gm-Message-State: AOJu0YwoysS56SDdzNr3wcP3PFPAyKtY2vUfdPS+iabUiy0du5XOpNml
	5+79kcl6MbpfJPjrxqud60zOejPI2WEepW2OnZrVKwxKBrT5XWdtnlwxTA==
X-Gm-Gg: ASbGncvF25uFUlRyxkQycPnj6sF52xfIFp57y8RUGNqhVgjgq6PRNrh4viAoahsMgmL
	Lw44vaE3rzDlg7wKuzfMxZEZv2rz9BbXnxe49tVb1Hj9ctjwnHws5fNJGVHO8Ytn4p0uVOn8OfQ
	PgUfve4zzMVVWLkaH/Jip8qys8uPH8dMABxLPhP57ht998VNtC08R+kZz+XqF+Rnv9VXv4ScvMG
	AX6hzBnC/PNuHM6YzFifZ0JFffa1faxRyRVR/KC08oKQhIvrWAiU65yX/INK/RIxqY0PlC4jCel
	PURYlsq3f2FzqHf9dGaS/+WQC/TehbRsQpV/Z/P4fJPz+w==
X-Google-Smtp-Source: AGHT+IHf7v19rFtCH/7oSQIUupzS9rIVSgwbynPJfrCpdi1oWiygk/u0GnuoS//pMB2PbVfIWz3WYQ==
X-Received: by 2002:a05:600c:3107:b0:434:a29d:6c71 with SMTP id 5b1f17b1804b1-4390d56e5b4mr51799495e9.27.1738842358407;
        Thu, 06 Feb 2025 03:45:58 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd802csm16158235e9.34.2025.02.06.03.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:45:57 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v9 4/5] dnf: Set SEQUOIA_CRYPTO_POLICY in wrapped tools
Date: Thu,  6 Feb 2025 12:45:46 +0100
Message-ID: <20250206114547.3441965-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206114547.3441965-1-zboszor@gmail.com>
References: <20250206114547.3441965-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 11:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210922

Point to the crypto policy file	so dnf can work with signed packages.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/dnf/dnf_4.22.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
index f9d6ea1fa6..e5ac3c9824 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
@@ -69,6 +69,7 @@ do_install:append() {
 # Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
 do_install:append:class-native() {
         create_wrapper ${D}/${bindir}/dnf \
+                SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
                 RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
                 RPM_NO_CHROOT_FOR_SCRIPTS=1
 }
-- 
2.48.1


