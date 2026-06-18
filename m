Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0E8CD98FE
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 16:50:47 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24013.1781801437934427456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 09:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HjKeQmna;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e6b554044fso1007956a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 09:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781801437; x=1782406237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmDdYm5Ux9XwiFns7SmVKAVoWoo2pRcngO56GIPOIVk=;
        b=HjKeQmnazX9aop6PYGjoPvR4+I2iyhGJH59IPkoEhbgxhMf3+mCSPVX29yjqAHXvGW
         bUizVsd3OqlppBxB4N4zqOWyaUX2iHmV1h42Q2YT71yCNv/KmYOcRlK8/EC33IgTTz4J
         2r2VWPVvYjMl45SZep6zaTVnK7Kui0icvrTvk8GXiFeAFaP+vQQ1Zpm064vXcdqKVDiH
         6PHXqxtyyKwfv3BV4kcCna4IuwJABNKX2pCRYufK+7AWWHdeAjBUEHlq+84jeaKsJ1o/
         4Zw0WJCN3tOKlswc+u0tLZ+9RISatwyxdh5s4Fa/MvJO+f0T3r23+9Vx1XXpTosxdd/W
         YWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781801437; x=1782406237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MmDdYm5Ux9XwiFns7SmVKAVoWoo2pRcngO56GIPOIVk=;
        b=m1cht58ns3KloDwtc5+4uLFoDec+OeqizInxWNH/4r3ocFJSqdvJo0U4ok3iREm53E
         QqAS/jIDki/fsFLH2RbfRaGV4LL5+ecvTGZknzChokL9NLHfvyLpH9uCczCzP9nHMrOl
         ZPvNScDozMPymTt1TIR27bVxNd7bsjBJRdJO8FEvvW9fppxECflzQST/ubAnpEGBnqTu
         I3bSn3IJ0ZLtmEiU/ZgMeD63DQz+twGUB8MEPhbFndilbxNgin+n6IFqhdB555XYbDp0
         TjCSYYYCaYGlpPq9w1GPfL5FKK2YFuyc1U71ydb9CGnmSLFoj29uEZ6m1mVi5JUWgsdF
         ytSg==
X-Gm-Message-State: AOJu0Yya6Yh6QGnSEO6TQwv2S5CTsQ1bclLJDvQmWBz42hfg6WU2wbxA
	H7IJ7haFb3J4LZJ02WGiNsVmKS4BUuhQL1XTB2epaHCGO8v/Y9DYHetBu7+yGA==
X-Gm-Gg: AfdE7cmj8AGb4Cm32YMdVaSxrVPUpos1qbahef2jiSx7YyRKLeNvf4VToFQps0qSLi7
	jcDZo2SOFskgLEfCvdldfPDPQa6qQLDPR7ZNZ6Y4On5wgm7KchgQcXbnMHmSjSpljMhEr33XU3Q
	g5UO3rZ6qbcGfIorXOoYYk87lG1YnRaYpt19kRVsrDRwVfxRzr/vYzYu8MX2IeiW7enVrJIUBq2
	uyMW2VpHaJ1xLLH998wdXYoWMKya0mrwedS0YILadU09NTHBnYDUGZlM3aYpfUNrSnA3uk+Qno2
	c8wEeElBp7MggsGkcZM1DT30ItpiPVDkCEfQkvjSh6n0kYH9R4gzgnDtil2NcctKmsmfOClZ/Hn
	vYERz4RUuywGcx1pRxxNy1TjcBzv2tuXBW3ketFNcA/fXAC/3C4r1AEyWdnqkjJ82gp+C6rJcCs
	xOM4bVysfvXQ==
X-Received: by 2002:a05:6808:6f96:b0:486:560d:aa91 with SMTP id 5614622812f47-4896aa88767mr198916b6e.19.1781801436560;
        Thu, 18 Jun 2026 09:50:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::8b4b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4875dda5ee5sm8732987b6e.2.2026.06.18.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 09:50:35 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 0/5] Implement SPDX for deploy tasks
Date: Thu, 18 Jun 2026 09:38:40 -0600
Message-ID: <20260618165032.347436-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609222331.1293007-1-JPEWhacker@gmail.com>
References: <20260609222331.1293007-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 16:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239090

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

Joshua Watt (5):
  spdx: Add ability for deploy tasks to create SPDX
  classes-global/sstate: Keep SPDX generating setscene dependencies
  Add SPDX deploy tasks to various recipes
  spdx: Replace do_create_image_spdx with deploy task
  grub-efi: Change to MACHINE_ARCH

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
 meta/lib/oe/sbom30.py                         |  46 ++-
 meta/lib/oe/spdx30_tasks.py                   | 301 +++++++++++++++---
 meta/lib/oe/spdx_common.py                    |   2 +-
 meta/recipes-bsp/grub/grub-efi_2.14.bb        |   3 +
 meta/recipes-bsp/opensbi/opensbi_1.8.1.bb     |   1 +
 meta/recipes-bsp/u-boot/u-boot.inc            |   1 +
 .../systemd/systemd-boot_259.5.bb             |   2 +-
 17 files changed, 514 insertions(+), 94 deletions(-)

-- 
2.54.0


