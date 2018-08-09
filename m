Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 802AC78DF9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 11:44:59 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id o11-v6so6012222wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iAxHRlkwFRW9ahjJ8mm7+OGsga2cKC3sWl+LBh0EHuc=;
	b=aXLVWxs7fIjfw5S4cWosyMxPu6Ed58vYLRgdGSlGsQchJcfqpux4fFetF0v+SEJsRa
	6YyL/YO3Ks0NNLTuzQDpXNL6nq2AomulTQd7TY3B6VDQNPH0BdNtVIool0vmjlC+31RU
	bdELuMQ+RCFiqbkwFcasj2Hjmu2QSTvYNyMFp4I1sIWRvG5QeDtQfXU6mnUUQax312zq
	YYnrAu8CGwLvcDTYx33mofDSvS9P1yfa6mKcLXlLQKNLrNDQkZGE0dQ2cxSTCTdslIOU
	t2wWamqBOaepyN7Q4pcwzGTkV1PRPzzHnWIxtotvLFNdwZym9f9uzI3RODrjmfIaWuU6
	vayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iAxHRlkwFRW9ahjJ8mm7+OGsga2cKC3sWl+LBh0EHuc=;
	b=C3TZayKCsC+DgVjlhCb/25oFKPsGM6A/ZH/AKtfAeu5XCCdeHDjfjplTKYYZ+F+S69
	Da9salT+KjtxLiqIku7HepfxfU6r7KtbGwPRri063XPwBrtha/F32F6QpOEnHweMr8rD
	Stia34DsTJM2+gze/y13dD0YpAXceXUWjWZ665r3TGoFG27nWK46rAlaFxUmttZLWe+4
	v9OllQ8Zu5W887UfT9iKFcUb/efdm9tHdlNjAYimjlYrfSkd6vK4rbfy5JI/IHepLGVQ
	RD/GcToJvyihrMWidZt8NrKlnYar/DNRKRdCBvU/pXDfvLwPMuHdwTBI0f5vdYsAPOTb
	WYqQ==
X-Gm-Message-State: AOUpUlErRhBIik/+Arm9jl10qtTNml/zvL1ey4gIkZulP+JZyzby8ktc
	jvPmq9IXr73q0tcXKyqHDFDHsAl4
X-Google-Smtp-Source: AA+uWPxNas0oKf5F/+kRV7hiqmoWjh6WZDjtQXsK/NGwXa6qYMD8nXf0HxttHYqyGcSOyLGrkywXig==
X-Received: by 2002:a1c:4d16:: with SMTP id
	o22-v6mr1341701wmh.49.1533815100235; 
	Thu, 09 Aug 2018 04:45:00 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b6-v6sm9257450wru.66.2018.08.09.04.44.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Aug 2018 04:44:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Aug 2018 11:44:48 +0000
Message-Id: <20180809114448.26411-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180809114448.26411-1-Martin.Jansa@gmail.com>
References: <20180809114448.26411-1-Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] perf: inherit manpages instead of adding man to RDEPENDS_-doc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Aug 2018 11:45:00 -0000

---
 meta/recipes-kernel/perf/perf.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2c6bbb42b9..ccd2c7d11b 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -39,7 +39,7 @@ do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
 PROVIDES = "virtual/perf"
 
-inherit linux-kernel-base kernel-arch
+inherit linux-kernel-base kernel-arch manpages
 
 # needed for building the tools/perf Python bindings
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'pythonnative', '', d)}
@@ -247,7 +247,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
 RDEPENDS_${PN} += "elfutils bash"
-RDEPENDS_${PN}-doc += "man"
 RDEPENDS_${PN}-archive =+ "bash"
 RDEPENDS_${PN}-python =+ "bash python python-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
-- 
2.17.1


