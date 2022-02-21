Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB9AC4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:36 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.4751.1645478675092367186
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VZ21f1FJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id q11so4080116pln.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gH28zEYuX4dIu22F5ySRqNxKqG8OHTnBjYzGU5MdKwE=;
        b=VZ21f1FJOsJe8BYwcfZCnVOft+Pd2L+aUw2QByf6SbhN03/fMdYkPoLGBWLs9zhdgM
         /IW8JOK0laiiMxLp+v1wSEd83DyHERptE+5mVmcEwpvELaXEgtBgTlP6YB5AHOyWLiYQ
         sdrgRoeFnTSyY7i83XgCyZ9IB+4eOh7jtUh6jUdyTI/Eb0SOVeNTWQW/nz/gIPLeEaCz
         nvu1wbaXrAkGSbUnmnrj28lrRlVlA/RgrVYO2qB7URPFyAjkLHe/f8aIMFYikyVLrAhQ
         1mh7B+ecYn2kCkQ/Wdm3PjvEn+oodW74os1HDSCMKgBmaw7xPjfvTkUXBjRo6Ho6kB5L
         WcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gH28zEYuX4dIu22F5ySRqNxKqG8OHTnBjYzGU5MdKwE=;
        b=VgxpuxHbu6Jx1NMf5OJ/szPMzOvbB7wD8tKuQBiHJzrcL7mq4FfGb+M4pdym7VNp2u
         RL6zPA3K0YHicHxOwj2N417ic/zZWKIVpsVy5IjPrhhzwf1rFS5/MhOwXsoHhMhAoN0S
         13bfsyGH4p0az9hf7aTkZMq7T6TkU8HsZ5e9PIrbEglXuzfMOooZVom/EHzUDnawNGbI
         X9/VZrhsKjOKk3JLq9ltCI78VwjR0YHyOK9X7XtaFWIEpextl79+fvtaoI7YiNSuScfJ
         vfSW7PRj9RyYNP71ISMjoZa9QFjJotctdlJIEm5Tm2C45F6Mp3fxslYvOp//FPvqGkpo
         IrPQ==
X-Gm-Message-State: AOAM530kqFqYm+6YZhuUS1HoWcx8jZvB8tOse5Vwa4CMVbsrhLkNUl1y
	+TD8ItNDAvZ8PmTUNNp+xWaLeY2HTcDeqw==
X-Google-Smtp-Source: 
 ABdhPJzMCwV+6rbBF+T0b6hFgO/5d7EAeS+fgBcvV33ytNe2/PqHnndQLFrQBXTv0p1mlfeyQs6FKw==
X-Received: by 2002:a17:902:ba8a:b0:14e:e8e6:7215 with SMTP id
 k10-20020a170902ba8a00b0014ee8e67215mr20642164pls.135.1645478674184;
        Mon, 21 Feb 2022 13:24:34 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 20/32] python3-libarchive-d: set PIP_INSTALL_PACKAGE
Date: Mon, 21 Feb 2022 13:23:35 -0800
Message-Id: 
 <492a94d1ce3d2bd6b442d29d077881a61c23bb4b.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162096

Set PIP_INSTALL_PACKAGE to libarchive_c to match the name of the wheel
built by bdist_wheel.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-libarchive-c_4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb b/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
index 3c6bc1e1cab..99837848a67 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
@@ -9,6 +9,8 @@ PYPI_PACKAGE = "libarchive-c"
 
 inherit pypi setuptools3
 
+PIP_INSTALL_PACKAGE = "libarchive_c"
+
 SRC_URI[sha256sum] = "a5b41ade94ba58b198d778e68000f6b7de41da768de7140c984f71d7fa8416e5"
 
 RDEPENDS:${PN} += "\
-- 
2.30.2


