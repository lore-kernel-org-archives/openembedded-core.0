Return-Path: <eric.meyers15310@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E6DC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 13:16:37 +0000 (UTC)
Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com [209.85.160.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34846.1782479793841671186
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 06:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YWi3Asl8;
 spf=pass (domain: gmail.com, ip: 209.85.160.67, mailfrom: eric.meyers15310@gmail.com)
Received: by mail-oa1-f67.google.com with SMTP id 586e51a60fabf-43b7e186a0cso391402fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782479793; x=1783084593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t183B2h5ccr1mIu26fxcOGKnJV5F2CXDj9bY3S9kKpo=;
        b=YWi3Asl8xPWPxZxfQSIn6MawmxgBMtKrOdE4gXZMA1/zEMPZzrsKTlCblNFCPFlTKk
         uJqijFJdJDABZhNYHiebRQmlC9BpigPX8PCqVzTUrv0rbcZlQoW1fXrX7eFDqMvkk9bB
         u1XjjkhY/rHsVSY+CYfMnPcxGbJD2CGIrmbcpWynzFyUcpKDyGgTktuXQ+b91tY2eFn0
         FDBKLHpWyxk3fMhC+GGSEvi4iSE/PaHsTOpln0Ur80oBl2CjGVly8W/p8MBVNTxZV8k0
         uSEekG85pVTm7AnMKBQVwfxXCx13Mpi+Wk2Gcg84KUsJLaBTSOH+pePng1H4Pc7kDUhE
         dNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782479793; x=1783084593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t183B2h5ccr1mIu26fxcOGKnJV5F2CXDj9bY3S9kKpo=;
        b=tQQ4veQxYOUTDIecmnHtiqx/2EwK/7E/rO3sA8/m7lsRyyE4H4jtcN0dIRQ7pSnSvu
         ZaCR5RTk4OMo6RV89pHrnR3JHfm0xaNhMbTnQDlOifuz2WxtSLFJdP4L7vEsEPS7IClv
         AmwNW95hNuAtGsepwjTyj8j/qHtW+jZUUVT1e3qCYsT7d+ZVNkN562KvAZeCdtZenAxZ
         bdG9UJBjgLek074Mb7m+j92/5Z16nLAeC/DGrQ2XRdaX4iQjqxS/+BOz/uIosGsvKSlB
         /kMVk6RNzyj9P6EUHuZQqyloLhxlylrb1pu0mEAJ0MoDN6RahY4I5mf7Jw/h3xQFoFaL
         yIjA==
X-Gm-Message-State: AOJu0Ywk0uLR7iAt9ZUF91rBOP+3fCb42wyX8Pv2DJyTjaYVhlC9D3ve
	DsO5M91clmBoPi3Rjfq9oxe8T8rFTXuEs69CrzT89K588BeaHDBki8cIsYYamekY
X-Gm-Gg: AfdE7cly07sl0CHiiKQ1PcDsjk5PqVAn6+oiulzLY4Kd9sUZfEObGK+D/4hPovcTA38
	EdGIqjfcWnkQ0IkC1wKkCVkWJ/24lQWVsd6pImyxsg24Z3PzkRJpAtYbgN8de0erzRMFLaSOOlU
	0aWsxuNloCZSeGzhBLZ5eDuDRYoYwLXwjY+tODwQbLD61KDkqh+NRGk7RXqqTP4ufwPTZcuWJsL
	kZimG/hgMn2jorNP4jghFXYWXcbTqUkTsTKpT6G+QiTJYJM/mZEDRPkCAcB/FP3d00g80IuGZX/
	D/9S6XmWNOXA8ENZkLBaGe0P3/qKPJsTZc82cPNKbWuNZ6Z0IT4S9G522RJIAbP7yhLNvKmVJE9
	lKttpXyBfM9j53affYu5oWti1FUjm4ZQShx41q4LqPoV9gauAWjStKJTwIQe5Y4bMnvJ5v8wI5d
	G8fa151WvFMFWhFUSL7igdejjgEyIPlkkyF5EzZH+XcyPTkmimlyPhrOH6aLbIQdbDOzVEu4cAU
	vY2jH527yz1kA==
X-Received: by 2002:a05:6870:7a10:b0:441:8562:b89b with SMTP id 586e51a60fabf-448117f1683mr5691297fac.7.1782479792937;
        Fri, 26 Jun 2026 06:16:32 -0700 (PDT)
Received: from ACT-L-SWD024.yourbase.domain.local (c-76-157-120-28.hsd1.il.comcast.net. [76.157.120.28])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44778b6159fsm11576413fac.11.2026.06.26.06.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 06:16:32 -0700 (PDT)
From: Eric Meyers <eric.meyers15310@gmail.com>
X-Google-Original-From: Eric Meyers <eric.meyers@arthrex.com>
To: openembedded-core@lists.openembedded.org
Cc: Eric Meyers <eric.meyers@arthrex.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH v1] create-spdx-image-3.0: correct SSTATE_SKIP_CREATION key for do_create_image_sbom_spdx
Date: Fri, 26 Jun 2026 08:16:30 -0500
Message-Id: <20260626131630.1357579-1-eric.meyers@arthrex.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 13:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239630

The override was "task-create-image-sbom" but BitBake derives it as
"task-create-image-sbom-spdx" (do_ stripped, underscores to hyphens), so
the skip was never applied. The task then cached an ${IMAGE_NAME}-stamped
SBOM in sstate, letting a stale spdx.json be restored via setscene. A
later do_sbom_cve_check would compute the current IMAGE_NAME and fail with
"No such file or directory" on the missing timestamped SBOM. Correct the
key so the image SBOM is always regenerated, never restored from sstate.

Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
 meta/classes-recipe/nospdx.bbclass                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index 15a91e90e2..cf79ef5b01 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -71,7 +71,7 @@ python do_create_image_sbom_spdx() {
 }
 addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
 SSTATETASKS += "do_create_image_sbom_spdx"
-SSTATE_SKIP_CREATION:task-create-image-sbom = "1"
+SSTATE_SKIP_CREATION:task-create-image-sbom-spdx = "1"
 do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"
 do_create_image_sbom_spdx[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_create_image_sbom_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
index 7c99fcd1ec..aec73ca54c 100644
--- a/meta/classes-recipe/nospdx.bbclass
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -10,4 +10,4 @@ deltask do_create_spdx_runtime
 deltask do_create_package_spdx
 deltask do_create_rootfs_spdx
 deltask do_create_image_spdx
-deltask do_create_image_sbom
+deltask do_create_image_sbom_spdx

