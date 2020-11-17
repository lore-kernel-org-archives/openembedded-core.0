Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.9453.1605626691286117882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:24:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K4ok1/QO;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id 3so15848759qtx.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 07:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K4lhaEdQqTzcqp+GxJJGw08q1jiHdrIF/T9Dy3siDYM=;
        b=K4ok1/QOXxyqzKd9V5HQeCp0Gksek5pX2RMfbyl3fgkqYOqGx5lqduhlK1kZcMqXO4
         uV/R0YaLQ/AYI+uRaeEzRRRRJkL6C1dD3MPWK1XIRl1Rj+keY8DYM2pShV3wLCxZBUc/
         SIAtJToqYeRqrkWUDMXZAWpVtHacqYU6YlATLDsrgMCY8Noec23pqcnuUHz+cqfIwMGG
         /mTvw+NbcFdzDVpl4tuSm1e2RuyJx03OcX0oYQ8IT6/KQX1uItQIqz2Y6V9nWB9Iwpoz
         ORldg3CLlDiM1BsiatvkQdVSosLR/Wbh+7jY4VXJQV7ootJlcINItp8YOiHsg8MsAoBB
         8hvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K4lhaEdQqTzcqp+GxJJGw08q1jiHdrIF/T9Dy3siDYM=;
        b=YcanWvet9PMXP0Xlb4KY8K2xcRvKqzg+UUYmowD2iNfHsWkbQau2jDgbSSu1ysuXi7
         D3UnSX8b0ezZqFUeGJKceXpyTUBMMiQQRcQRUbLooqG6L0ZjSgiIka0MVc1IRv+CMUzX
         LFWvt47pAAdbYoGmKcoT9uMYo6te7hp5naPuvJcZfU8QDWx0qStAsDbvgAJ3LG684DQf
         ujdxh6aftsnxuehojAMDBRn2lhFX37GSyzce8NeHFZ6XpU4MB+/MssnV1pSTClz9ex+v
         zXwyGM5RerCvOn2GaLNnBnQZxu3AT9faYePYayjPqsE1Prie+IaIlaU7tw1hnf0uwQSV
         GvGQ==
X-Gm-Message-State: AOAM5331d92OceJ21ZkOPPPEZJ7vgRr0sjxBA7ueBVOVMEddCg5NM64s
	w9hLyQkOS2QhGJRhFk3UIZY=
X-Google-Smtp-Source: ABdhPJw+AuZy9MlRE1YQGyDehgjbxcjsUb6qnwqGsk2td27wO0G1EUoCaTZ3RF+FnztSbp0ZDspdUA==
X-Received: by 2002:ac8:57d2:: with SMTP id w18mr155359qta.356.1605626690464;
        Tue, 17 Nov 2020 07:24:50 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u24sm14537923qtb.33.2020.11.17.07.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 07:24:49 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/11] linux-yocto-dev: move to v5.10-rc
Date: Tue, 17 Nov 2020 10:24:33 -0500
Message-Id: <4f3e2d7d90e19b74ed717cfd83c72c7a3aeb57f9.1605626488.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1605626488.git.bruce.ashfield@gmail.com>
References: <cover.1605626488.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index fbc62f29c8..6272af6253 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.9-rc+"
+LINUX_VERSION ?= "5.10-rc+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1

