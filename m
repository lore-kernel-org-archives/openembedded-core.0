Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF33C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 14:20:47 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.14679.1679408437263151795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 07:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=f2D83qqi;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id z18so8632544pgj.13
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 07:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679408436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2BvVz8fR9iIC29uYP9Yre9+IkpZG5sy7WulQyuitcc=;
        b=f2D83qqi+X+4yUH5G4iiVUyJkDYOa8uWfByePiRxAct5PyvbZGLoOgXgIA6PNufKbi
         fZ9vdp17QheNCECUyaRhrZpFDe9S5JDJ1YHX9cjRd8oYhG2CIo3GwstwjcyRKxKNXeTX
         qGQVSPrIw0LxvFZT3l8vrPSJIbuJUfWbK/t9jrxnL5Dpi65DN0vKVOWMDBrh2QP03SDz
         LtKSSL0GW8B1bcR2X9DS+XRuwE+KJnJzttUtCNMPckENHhcrtG7LgTFztQXuNgEjXawx
         C5tMuFSzs4g2E9W7VOlWExNkdRGkhDxefzG/cfWHQ+DRRxHf45CebxXJHlIUg0NiDRHC
         2wlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2BvVz8fR9iIC29uYP9Yre9+IkpZG5sy7WulQyuitcc=;
        b=1IntMaxeFHUJIcovTMu5CVI49KsRBgjv+ChfzW2V9ZS8lEj59Jp2r80+/XqD3OI6v0
         HJBD1NiUFc8M1FYVCP+fGY+whNPGHxQsEWIPOXDrenj9xYFqDBiJbjtqvCulOqIKUsm/
         E2l8vSzjsT6SMClDF9nJqAdjJ98bU6VBnvcsxht1/K3CMAGTeMCe0H1BQjL/fSzUH3IW
         +Syk3Wy8Q1qSTzs7xA5n7ifPUZ1ANXEyRAl7hIbUzGM9IAvMPSfmtoIDNwsdsi6VDFLc
         R7yh7W6HVRvcdpGS9RhiHJ8+z7FBn2GOyCMVRGNWBfF7rKEVe4h3OBiV6HmXhTiO2qx8
         8GBA==
X-Gm-Message-State: AO0yUKXAufsnPhnywvlOBBv2Mgr9rh51p7ZKF2T0CznwtHheW9m6g8W0
	kPkBAezhcq0Wec5Vdb3J2OYMjD/aBXWIuAok6Y0=
X-Google-Smtp-Source: AK7set9vrU5AHS2VZMBjPSf77DxIK2WWvEiVgevnOjZZ3MfKLLBOY1z80bX1CJJLYBAExYTgJD63yg==
X-Received: by 2002:a62:1782:0:b0:628:1862:dda6 with SMTP id 124-20020a621782000000b006281862dda6mr1238429pfx.17.1679408436223;
        Tue, 21 Mar 2023 07:20:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005892ea4f092sm8551291pfi.95.2023.03.21.07.20.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:20:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/14] ghostscript: add CVE tag for check-stack-limits-after-function-evalution.patch
Date: Tue, 21 Mar 2023 04:20:08 -1000
Message-Id: <d966b565d39bf50f058b388235ccea5ab0c2e60b.1679408291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679408291.git.steve@sakoman.com>
References: <cover.1679408291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 14:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178874

From: Chee Yang Lee <chee.yang.lee@intel.com>

This patch fix CVE-2021-45944.
https://nvd.nist.gov/vuln/detail/CVE-2021-45944

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../check-stack-limits-after-function-evalution.patch           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch b/meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch
index 722bab4ddb..77eec7d158 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch
@@ -14,7 +14,7 @@ stack than are available.
 
 To cope, add in stack limit checking to throw an appropriate error when this
 happens.
-
+CVE: CVE-2021-45944
 Upstream-Status: Backported [https://git.ghostscript.com/?p=ghostpdl.git;a=patch;h=7861fcad13c497728189feafb41cd57b5b50ea25]
 Signed-off-by: Minjae Kim <flowergom@gmail.com>
 ---
-- 
2.34.1


