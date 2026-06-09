Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD74CD8CB2
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 22:23:39 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7782.1781043816157626830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 15:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cvPZQZzu;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-486304fa184so5366135b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 15:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043815; x=1781648615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PMqdCo4BMoD8l5/0pO69ThRKvhwsOw6M3itg8MRCa9o=;
        b=cvPZQZzuoV/B6rC73Rco1kI2YpFQLrLHK3MQspGMUBQ3PrMOC9Ur4D74T+N+iSUMvn
         ly4SSWnvCvObZlq0likUzt01ftwu/BjscP8NaveQUqys/1TSJY1eT4BDDQqRLyhGqsIM
         9r3XzLSocijxSPNG4xE0/IVjookMUiD99+lO68dVsT7SRpUqT1WasTswrLIA/J596jDY
         FTdD/J6Hc1K9o5xDL82blx/MxzGt1FQ8qz6lOPQuzScd8ymRHngfN5/kIuG1dypguOp7
         B4lHUGcTPrkuhMreytUXMotc4h7mU7VimN5OwMPbrgaQykkvfFHudmSmL1vUw79DqgSA
         QqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043815; x=1781648615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMqdCo4BMoD8l5/0pO69ThRKvhwsOw6M3itg8MRCa9o=;
        b=RXmWQFzwy3XJ2PDj2dt9QIbbT1BlSO2Doq65k3rhino2T1ew+ucA3WTUgqgB18B6we
         YPmngQHtGhQ0YsOgHmh34S/piiBg91MLW065m/9aX9lB64RFyHWWAmPew35LvJP+YKfG
         7lIQvfWvNPFt85JCvgoGqvzF5AM4tD8YmJxtZHAeO+Fbq9QrS9zYXsGSCc2PCghcLVxk
         2+EtJ1F+c1Xp9k6c8p6z2rCPH59+II+/nFmN2PuiEWi4nJWDWUdBCZtjbGYDfL7fFC7X
         WgupI3IYTiiNtEfP0TQ9nHVwEXhCvmO2K/qe9Mune+7VFNnY+QqL53InLehY1b6Ck9ca
         7Iig==
X-Gm-Message-State: AOJu0YxOXiBAAlSorCqkzkW9dSfOwSe5MtHi3MSnwtZ5+lX/rzaSb9yA
	bNMWwxKYPxJO7CNlS/NdgS6255PhJ45iPS+xea15m6u5pQBYvloeoy/TYPVJDA==
X-Gm-Gg: Acq92OEDvCzkfmrwie4Cv6TyA6aLiue/O0fNW1oRdf47Axg0gh+6mPov137mgU6dMph
	R6n3SfassnkSTXY9dfqeNJE26LPQ4gDIE3tXSImKM7nEnpSepKogcmKZl6x8jT57fDDmrWdOcz1
	YEOgPRTZH3pWTy75B9qOpwouejdcdMbYXijEUuYKP1AMcJnTtbxdS8D5w381MhGrjsoUsQiNEmJ
	dm7yzwrLJJbV3If+kURZrKss5/uqbJfLFiMu0v6yLnrMfVTQlk91X3l3RwwbMGFE0mC5hEDDscx
	FyOrQHrkeQsFzgR4QgwhmYR0PRJ53AJaXgX53g+H1aUkXVVmk2WtgfhWGwFaVZI4FvshqTsjfvQ
	CAJ/OXjHmIcRg8zuwiVU21lZ16q5cj1hrjCszmLAc+QUWfTIeS9lw3V4A4HCs6ja4FSheu5LR0d
	/imhxMAiJbjlbZh2tDOx3W527QdKcikw==
X-Received: by 2002:a05:6808:1a0f:b0:479:ed26:fbd5 with SMTP id 5614622812f47-486f017f380mr3037570b6e.21.1781043815202;
        Tue, 09 Jun 2026 15:23:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::ce1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d7d4f449sm19122610fac.8.2026.06.09.15.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:23:34 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/5] Implement SPDX for deploy tasks
Date: Tue,  9 Jun 2026 16:15:51 -0600
Message-ID: <20260609222331.1293007-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 22:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238303

The SPDX use case for file system image has been well defined since SPDX
was first implemented, however there has always been a desire to also
express SPDX output for other non-image deliverables (primarily, those
that have a do_deploy task or similar). These types of tasks cannot
easily use the traditional method of having a separate SPDX task that
runs to create their SPDX output as this causes lots of problems with
the way dependencies are specified. Instead, it is desirable for these
tasks to directly produce SPDX output that can be consumed by other
tasks that depend on them.

This patch series adds support for this. Any sstate task can now be
added to the SPDX_DEPLOY_TASKS list and it will run a postfunc to
generate SPDX output that describes what is being deployed. For
classical do_deploy tasks, this is setup to be easy by automatically
capturing all the deployed output files in the SPDX data, but other
tasks can be added as well.

Finally, the do_create_image_spdx task is removed and replaced with a
SPDX deploy postfunc using this new system. This means that any task
that depends on do_image_complete will automatically also get the SPDX
output for the image, simplifying the dependency handling.

Joshua Watt (5):
  classes/baremetal-image: Remove "do_" prefix from image manifest
  spdx: Reformat
  spdx: Add ability for deploy tasks to create SPDX
  Add SPDX deploy tasks
  spdx: Replace do_create_image_spdx with deploy task

 meta/classes-recipe/barebox.bbclass           |   3 +-
 meta/classes-recipe/baremetal-image.bbclass   |   2 +-
 .../create-spdx-image-3.0.bbclass             |  30 +-
 meta/classes-recipe/deploy.bbclass            |   1 +
 meta/classes-recipe/devicetree.bbclass        |   3 +-
 meta/classes-recipe/kernel-fit-image.bbclass  |   3 +-
 meta/classes-recipe/kernel.bbclass            |   3 +-
 meta/classes-recipe/nospdx.bbclass            |   2 +-
 meta/classes/create-spdx-3.0.bbclass          | 155 +++++++
 meta/classes/spdx-common.bbclass              |   2 +-
 meta/lib/oe/sbom30.py                         |  52 ++-
 meta/lib/oe/spdx30_tasks.py                   | 377 ++++++++++++++----
 meta/lib/oe/spdx_common.py                    |   2 +-
 meta/recipes-bsp/grub/grub-efi_2.14.bb        |   3 +-
 meta/recipes-bsp/opensbi/opensbi_1.8.1.bb     |   3 +-
 meta/recipes-bsp/u-boot/u-boot.inc            |   3 +-
 .../systemd/systemd-boot_259.5.bb             |   4 +-
 17 files changed, 509 insertions(+), 139 deletions(-)

-- 
2.54.0


