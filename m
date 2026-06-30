Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1805C44502
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 21:04:32 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30997.1782853465447589069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 14:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jyCXoE+U;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e94c26f9e0so2101133a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853464; x=1783458264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfivgT/G7M+1QPBRQVp4pxBOdNIi0YIaYv2IiiIFIvI=;
        b=jyCXoE+UMUb+AZUjvzxC2VZ6YaF2FkbaLhvYLzrOLfADXUCAhcPuFubU3xL9dKLcBh
         JU7IIqc4AQAcExI6KmYXxWC83aLv01BmsxILldmesi0hOsDCjbXCOI1rv8GeK+VAxmQd
         UebI6cHlJurwOZ5XNJrtXlbIe1hZp5ANmiOacAcvneseDEJo6gZu4dxizVec7+mVLVug
         XNLdAHm4cBHvjiA28vlSpvvEl7aF6I+ruQTQmtK6stKEfPbeJ5Tscu1LC0luv6QOBrgc
         bMI9tPQeICp3RWiXjM3LJaBin512p5dgEqiCVYht35u33bxk69YoIFN/+bM2ceyEC+Z7
         PrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853464; x=1783458264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QfivgT/G7M+1QPBRQVp4pxBOdNIi0YIaYv2IiiIFIvI=;
        b=ifeehQHKixIc9kBAOL7/hsHz8ggA8Yl2VBg3PaFwPKKtqA9AwKaO7fth5lFHa7cqRL
         PMPg7NnTkYtcYeYDGJOVLbarpi1qa9KUHPyLrGb/EHtQxJj8qOCBLITKCas11C1WfzzC
         YYPiTp7J76pUAwH+g2jhzGuiOAKFI3xohSQQvy4128ZIKe29PAWKLhVcpX+4Z6+/K3G/
         Mny0L93h/4BCAm1pnNaiNOIZxGqeeFI1KYT0qay3Nn1OYwekV7SIHrGTTSnK1LPcmPhS
         23duNkW/G/6LSe4hwTvvVeTW3dJl2MQXny8NsuYjhPJxa8VCYiddIfuw3PiV3r+jmkZI
         eQfQ==
X-Gm-Message-State: AOJu0YzNEPJkCuELfWfEAb53rJwotHxBRD8dm9sj/wADX/+rKvWEnoee
	JCy3Af5G5Pk+UuhyP3m8UF6XouQlssOF/RdwIbKgwhovKSDEEpabOydabwFxKw==
X-Gm-Gg: AfdE7ckoiQMg/+qY4lnBQ+UjDXs84/q9UBdJWtSRh/Cs4SW93wc2nEvVyMloQAzBv3t
	+9a3r4JCyBdiMNxDZN7cYlsZSV/8PL8+Q16kNK/pB9KJ9yxeTGIqEVlii10kD4u2PIyibLCLBFo
	Lo1eIsB1hbYTBod+HR5UZf1I1s334WvdhBrTqviLRgrkXfvYsvVDurwDmbVKPybXCNmEOjHOkKJ
	QzqJePG0F812+QDcu74HMC545cvyiioTBUKYwIEqdbNaDtZqVY4E5eIwRwH1tY7oesOJi8uZ2kf
	H3yqZljkkzloQrdibMuh/caSHwOJA8zpvhuKACjzgQ4lc1HvkDrFdbt+XvQBdvBNEdR+S+95SOw
	rbsEOab3aR9WjN/B/lQREjL6wjGtRgP4nETPjSOathWVLY/WtR7H12DcpGhyFTg/aJipE6dl1MU
	O5YjNphmefrg==
X-Received: by 2002:a05:6830:439e:b0:7e9:d1f7:b728 with SMTP id 46e09a7af769-7e9ec6ea2d0mr3756698a34.21.1782853464425;
        Tue, 30 Jun 2026 14:04:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::3cfc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebfd01cdsm3248143a34.8.2026.06.30.14.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:04:24 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 00/10] Implement SPDX for deploy tasks
Date: Tue, 30 Jun 2026 15:01:34 -0600
Message-ID: <20260630210422.1903245-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624141706.2164567-1-JPEWhacker@gmail.com>
References: <20260624141706.2164567-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 21:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239915

The SPDX use case for file system image has been well defined since SPDX
was first implemented, however there has always been a desire to also
express SPDX output for other non-image deliverables (primarily, those
that have a do_deploy task or similar). These types of tasks cannot
easily use the traditional method of having a separate SPDX task that
runs to create their SPDX output as this causes lots of problems with
the way dependencies are specified. Instead, it is desirable for these
tasks to directly produce SPDX output that can be consumed by other
tasks that depend on them.

This patch series adds support for this. Any sstate task that starts
with "do_deploy" can now be added to the SPDX_DEPLOY_TASKS list and it
will run a postfunc to generate SPDX output that describes what is being
deployed. For classical do_deploy tasks, this is setup to be easy by
automatically capturing all the deployed output files in the SPDX data,
but other tasks can be added as well.

Finally, the do_create_image_spdx task is removed and replaced with a
SPDX deploy postfunc using this new system. This means that any task
that depends on do_image_complete will automatically also get the SPDX
output for the image, simplifying the dependency handling.

V2: Fixed SPDX documents missing at SBoM creation time when the
documents were not a direct dependency of the SBoM, and were present in
a sstate object. Previously, these sstate objects were not restored
because they were "covered" by the later sstate tasks, but now they are
restored if they are depended on by a task that creates SPDX output.

V3: Fixed a bug where dependencies that are not in the taskhash could be
missing when the final SBoM is created and added tests.

V4: Fixed some testing errors that revealed that EFI providers have to
be MACHINE_ARCH (and consequently, wic-tools)

Joshua Watt (10):
  spdx: Skip dependencies that are not in the taskhash
  spdx: Add ability for deploy tasks to create SPDX
  oeqa: Add SPDX deploy SBoM test
  classes-global/sstate: Keep SPDX generating setscene dependencies
  Add SPDX deploy tasks to various recipes
  spdx: Replace do_create_image_spdx with deploy task
  grub-efi: Change to MACHINE_ARCH
  systemd-boot: Change to MACHINE_ARCH
  multilib: Add systemd-boot to NON_MULTILIB_RECIPES
  wic-tools: Change to MACHINE_ARCH

 meta/classes-global/sstate.bbclass            |  38 ++-
 meta/classes-recipe/barebox.bbclass           |   1 +
 .../create-spdx-image-3.0.bbclass             |  32 +-
 meta/classes-recipe/deploy.bbclass            |   1 +
 meta/classes-recipe/devicetree.bbclass        |   1 +
 meta/classes-recipe/kernel-fit-image.bbclass  |   1 +
 meta/classes-recipe/kernel.bbclass            |   1 +
 meta/classes-recipe/nospdx.bbclass            |   2 +-
 meta/classes/create-spdx-3.0.bbclass          | 173 ++++++++++
 meta/classes/spdx-common.bbclass              |   2 +-
 meta/conf/multilib.conf                       |   2 +-
 meta/lib/oe/sbom30.py                         |  46 ++-
 meta/lib/oe/spdx30_tasks.py                   | 314 ++++++++++++++----
 meta/lib/oe/spdx_common.py                    |   2 +-
 meta/lib/oeqa/selftest/cases/spdx.py          |  11 +
 meta/recipes-bsp/grub/grub-efi_2.14.bb        |   3 +
 meta/recipes-bsp/opensbi/opensbi_1.8.1.bb     |   1 +
 meta/recipes-bsp/u-boot/u-boot.inc            |   1 +
 meta/recipes-core/meta/wic-tools.bb           |   2 +
 .../systemd/systemd-boot_259.5.bb             |   4 +-
 20 files changed, 537 insertions(+), 101 deletions(-)

-- 
2.54.0


