Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A4C10F9958
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 15:44:43 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.108685.1775660413376225487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 08:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ds7TMjmV;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: zizuzacker@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a9296b3926so36095235ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 08:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775660412; x=1776265212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JViP3hsGGRFIi2i+0VJ+EP7PIoVo/pMZtrnkOFnOsZI=;
        b=ds7TMjmVBQ4nCPUK6PqlnlH5DZ52GLIJJmENUxOzeMGWJiDaJNKbjHmY5Be9hMjMrC
         D1Qb4Z9pPkgrweLNoRjqzl36deR9C7mq8PYLX3F/wS1/iqe4qQId/Req6oUagh+OOpUu
         pRVZeNJX5pgVAi2tP04qcMZBi4RHTjLBKviwhffC5uGv5+Y5/F7+fGu90YIrh/qKWLyd
         nwAs7OMSu28bdSf2uD9O0e753pk4wMLH51jjD47vyAX++p/lV9n1KeukoNRkra4ang+h
         qIc0qnazwBwy3/bfiT5GNWQhqDn/D9vWXXV531ZvXfvFeikjlaUHnY4DPk6b0OyNi6l0
         HncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775660412; x=1776265212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JViP3hsGGRFIi2i+0VJ+EP7PIoVo/pMZtrnkOFnOsZI=;
        b=Pm1KpHj77SfAro/6QUV8bvXEWy7/daGEBuipcNWDL5PYyDysFTi56NWsqjZ7MwQBMg
         QchqM8uYv7MLNoT8H4xjgg8Ki4HVDi9oY12namHTcRQ1iA3R6e7FNepsak/6mWyjxgkf
         aRYamVITj8XJeVM/PQdlVe1t8tLR8wVabWGALzA8oa0O542BJHmEyOgjkgl1YAfdcl6a
         bxLNxBBayygF7Moegx/QBoZcixusOU0biqwR4E/bPTfZPwz1D+Lsiis59wK43yMieGHJ
         vlQ8p/vgpXSPvzf0fAUST6yKqg9wOy9eys9zRAYEiQ0mjcqrqhLX043VxPyGHepa53Oz
         wPPw==
X-Gm-Message-State: AOJu0Yzq2bza65sQuvEw1eOHoswS44Gi2phUZGnbYqqRnObO4G6gnYe1
	HL8rg5wHjXifu3a/0BaOcZrajBDKfjrDMq7aocfGQNsD8QSrtKyiT1v9M5iF6g==
X-Gm-Gg: AeBDiesPUU1ercfnAIbC8Iul6HIVIaNYViS6moAMADWVKS9QVpgk0MEyK8YFaXQ8NyT
	BEKSsx0N2TL1nT9Atu+LsqgYMRbm0VVc839GyfSBL5KgNOInYvutndqYz5+HywyAsHkM8rmzoVQ
	LsTsHMbwGqeMfazSjUVUbMDORU0J2k85AGlZ+m0Hj4UpzSB7pFQteJd8pxpGaMVgdActf05T/cb
	BnHZhtjuimnf0/4jIUIou0ZKJsMyhzhmkWzltHip8AMK45iKEdCBOIJ4W0r4MgTQrWcEUjMB+FL
	tZeDMSoqLT5vV46itIMeNmDKaB5QC9HAmuxq0JCPXdlbtt2Term4Li+FYZfMar2PtcIBUnUnai1
	O6B32sK0Ez/Eis/r/+oWzutfKK+ZYZm5AE3YwUf6+IPs/nU6dH2DLIYgx2FemGZshc1xKKJ7qRM
	wVT6MH/7Ca8wZdPbytM+6iz/Ci0T0YrONGe8c=
X-Received: by 2002:a17:903:1ac3:b0:2b0:673a:7c85 with SMTP id d9443c01a7336-2b2818ee1f6mr220467775ad.37.1775660410837;
        Wed, 08 Apr 2026 08:00:10 -0700 (PDT)
Received: from localhost.localdomain ([42.112.63.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af31sm202895775ad.52.2026.04.08.08.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 08:00:10 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: zizuzacker@gmail.com
Subject: [PATCH 2/2] meta-selftest: add usegroup-deponly recipe to test USERADD_DEPENDS only
Date: Wed,  8 Apr 2026 22:00:03 +0700
Message-Id: <20260408150003.18063-3-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408150003.18063-1-zizuzacker@gmail.com>
References: <20260408150003.18063-1-zizuzacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 15:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234854

Add a test recipe that inherits useradd and only sets USERADD_DEPENDS
without USERADD_PACKAGES to validate the fix for [YOCTO #15863].

The root bug is that useradd.bbclass unconditionally requires
USERADD_PACKAGES to be set, even when a recipe only needs to depend on
users/groups created by another recipe via USERADD_DEPENDS. This recipe
depends on creategroup1 for user gt1 and group grouptest, but does not
create any users/groups itself, exercising the code path fixed in the
previous commit.

Signed-off-by: Zk47T <zizuzacker@gmail.com>
---
 .../selftest-users/usegroup-deponly.bb        | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb

diff --git a/meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb b/meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb
new file mode 100644
index 0000000000..e5db7a47ea
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Test recipe that only uses USERADD_DEPENDS without USERADD_PARAM"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+# This recipe depends on the user/group created by creategroup1
+# but does NOT create users or groups itself.
+USERADD_DEPENDS = "creategroup1"
+
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
+EXCLUDE_FROM_WORLD = "1"
+
+inherit useradd allarch
+
+TESTDIR = "${D}${sysconfdir}/deponly"
+
+do_install() {
+	install -d   ${TESTDIR}
+	touch        ${TESTDIR}/file
+	chown gt1:grouptest ${TESTDIR}/file
+}
+
+FILES:${PN} = "${sysconfdir}/deponly/*"
-- 
2.34.1


