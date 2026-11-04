Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6934.1793791381625757258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 03:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HUoG0/mN;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a215e64962so5537395e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 03:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793791380; x=1794396180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGuJ2lcQkDnU1caQ5Yb3gd5LVSISe79RyVMIgPXAFR0=;
        b=HUoG0/mNFj5Tby8fESt4rt/WFsHboP/NguxtNUKeuibjjm0G/5oFmRFsESOUuXfjrv
         fK+mOhA7ENXrHDYH2MqUzBSfDnu7kwd8na6vqDELDuFywyTJ3A7a9f+JmRSEySz7QVEr
         L7Q7r8rS9WQhrkmIZuzEd0ALvQVvRLyENtaONiw3AQMTLlQpShvVrhUdWw60qJQhyH2t
         rBVg5hISMipa71lpplcZsM7CWwq6SwXW1TkBAfyaZHPFyy8jVfAtV7yeVAjBUNiuUgiI
         v82zcYENiMkdIKZd2cWjX4lSEnGwdtQbaNQZaDCNORkuXaXREQgOO/SF9FHzSCTgWYrs
         Bdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793791380; x=1794396180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGuJ2lcQkDnU1caQ5Yb3gd5LVSISe79RyVMIgPXAFR0=;
        b=YO+u3hi4FDzrw9EjyjObovOY74pLnbAF8Gxz9OCoXDA/z0Lh32LF7EgsMB64xpfE0+
         fCwK0su4biyF7oWgehLtNFtUNh7g/F9akDmBFD0u0UnBkuh8XCNrZtHOvNDw997iAT4b
         40EUQ40P/90GQHz/0N2vNk3fIl4PzICrapo0BZQAayikq15w3pb8tKMi1T6YuAWKRJlf
         Tjg72g+qYfxSwomfUaSK8xZjReawOf0OvHPfDyQKov5yi0XV/dQuh+Ty3nzsEAjAu99x
         QZfmCxl9L0w+FpdfolH0Guc+QsHi1v99oHplLauQyyNhxuzna82ruZWpuXCMBXs9ckwJ
         EbEQ==
X-Gm-Message-State: APuU4Z8Gxf6ip2gjSsffmzp30rckusfSLnmPN0JWQ7EAQdwt42PVpDWL
	J7aJmKlqS7Z+CVaQgUo3ciGBM6ixtPD71bJcTaCs5OBxN4xlt9RCPtk8ZxE4sg==
X-Gm-Gg: AYBFou3ZtzGawqf3r/cMEPf9fpPu2oMno8LLlGSLFXOG1LmO/cUsVdnPo3yk5YO6SKT
	KtnNUyrhOstf49Nyxmljd8MDZei0bX/GwdUvMutLEUO4l4zFpsJAVOoBFa0F+frjbU6N9vQ7FUN
	1dbDBFz4DUVOgsaKTPBQVasJOYaBePWdnTy77IBg7mJxAnzKEIS336/haxj5NKW85wOVX1z6NA2
	I14Ndl1mnru7tUg+yVcrBCJORGLqv5C7DLPMOXVl9Ao+0vTY77XYAy6FuLxxIQNIK50q9lHwhuN
	50qPShLOItVerIU/0X3OCUebuAymIM2fcP+tlotWg3jba24gX0dPWUXebOS6Q/MBJuZf5w7qpsQ
	5dPKL3/FP+3b/ZjAorw/yzSwauJ3M5qoOHvoR+gRKuy1W4qDw1cNc0AbAiXtVPcrt5tpgyxBQKq
	rx82OwjN/RVwenI2q9t1g4R/nq26NdIoLhTw8gm+pClLO/5K74OSHABrBfmPlr9OyyXT1NgcVzI
	wiofzT7fgrF+m/kwN6RK/VhQD0sjrbryqBau/NU0Kv2rHpmGLL6MmaKTgN+yRsq+Bf3nlu8/VtG
	l+CVK+8Jk4rYxPfJ7ja0bBrI+6XYfWaw
X-Received: by 2002:a05:600c:4f86:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4ac18b7df2cmr372342685e9.23.1793791379557;
        Wed, 04 Nov 2026 03:22:59 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b412e48fd8sm45024275e9.1.2026.11.04.03.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:22:58 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	Stefano Tondo <stondo@gmail.com>
Subject: [PATCH 0/3] spdx30: Fix two bugs in the source download enrichment
Date: Wed,  4 Nov 2026 12:22:54 +0100
Message-ID: <20261104112257.866914-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 11:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249363
Content-Type: text/plain; charset="utf-8"

Two fixes for the source download enrichment added in 9f1825e74d
("spdx30: Add Git version and PURL to source downloads"):

- _enrich_source_package() and _generate_git_purl() start with an
  underscore, so bitbake leaves them out of the do_create_spdx
  signature, and SPDX_GIT_PURL_MAPPINGS with them. Changing the
  mappings restored the previous SPDX from sstate.

- gitsm downloads got no version and no PURL, because only fd.type
  "git" was handled.

Patch 1 changes the do_create_spdx signature of every recipe once.

Patch 3 adds one selftest per fix. Each fails on master without its
fix. With the series, all SPDX30Check selftests pass.

Stefano Tondo (3):
  spdx30: Make source download enrichment part of the task signature
  spdx30: Enrich gitsm source downloads like git ones
  oeqa/selftest: Add tests for source download enrichment

 meta/lib/oe/spdx30_tasks.py          | 10 +++---
 meta/lib/oeqa/selftest/cases/spdx.py | 47 ++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 5 deletions(-)

-- 
2.56.0

