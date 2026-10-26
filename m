Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6064.1793051190851993418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 14:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rxW+4XYu;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-84e513874f8so2142517a34.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793051190; x=1793655990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eC23W9bkfFta1DAT+IRQAQck9iRpW3h3UT+kF9qBt2o=;
        b=rxW+4XYuKrRXMobrBHSykjFub+1bbuHbGdSCAUYSIK3huY08GUX/0suB5AKe61tSBc
         bZ/mCkmCHKKh079JMAoP7MFCR70wfWO2KSpYIDDm2CA/ui+p80+32QbwKdQ5RP9Do82B
         BDj70tYe/XeIWETjcPU4rAB+jiPWcRa22Byc3yI9BRSpc0qdM6STOdFOe6D4T1CiydrU
         cN7ilN3sUFGz5blTLT32Exz7P1pFqH2+nGh9kxvLyi+Lxe12UZUCGQVT0jP25dFzONUC
         M8P0ItUG1rv3SoFiV6ml0ZNLSwe6Nb4xd9WXf+g/AR9L6X1KmPmaNOD1a7E2IzA69N9l
         dNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051190; x=1793655990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eC23W9bkfFta1DAT+IRQAQck9iRpW3h3UT+kF9qBt2o=;
        b=I8h/kPMRuKmLNI25rW0DAs0npE91Dtd0pVe6+OoacjJt4VRI7YgUnuTrDevkHW7+cS
         Jrxam1YFiClKeyKohwSI5EXpoeGlP0ut9DigDHcy5M5tXsmF0Shs1KMLbAh1AflnT2dQ
         Q4WHqlZNC5Eqaa3RZELgskwBiInxn+cAOYES9WEMXxX9V04C/bTByNnePOYl45qzrPaQ
         LeC9+U/OM/5RihyMpAp9KKhWu8bRhziz5nzaXjdDyAguwqosW/W6j0djGQjBMfhdR6sP
         bwp8Y4xi/E0fLbEtdEjGQuKJb0c6eBIFL3CEusvlGE5zQ8rs/b2BlSWog/NOkEobxuuq
         nQpw==
X-Gm-Message-State: AFq9FYL27gDFMauBbMVqEwINAgalFu82YsOoqTb6yLPr0R/1s/ase1xz
	1Z/MAHWNNIxl+lgzG1CAVqqv2OJQOI8u+HQ6yrWMmPFfLZhoeH5Ge5vKKakkRg==
X-Gm-Gg: AYBFou3zaiSXXXjYSkx8MG9ta5UkCAsOhA61ZApFgNIVu+kc9q2IPUvakFw9Y52DlOW
	fXimS5sBSsuTw8GtYLRP7qCPfR2vY8RXhT0pOWAWjr/4rytWFcj9FWJMnosR9Biz2PBA7fkdjwN
	3EZzoGsSerX2j733oKTVSuGS73yHeFBv3DvDm2QNW7p36OOe3WLiwnWngeTCQTms1329YmHL+ht
	3S24QBjEWDHHtAts1BSLLiw7dN0jcLriAuFzxVMsdoJ67UFwrWsuu56rFtdh4TSC83Z1lZ0N00i
	53SoZyRBhkaVez5DHs6uMELx6avOXp/NYsrgs+9ZobX08bnLtKJr/K7X9AiPDFPzzLuiAsVGm25
	GuD+pSWVVpeuHhCUb+ZcvxnFiz/VnSHbEW+xTdCRVehRZGZdgzalManimqPxxR7kpNKa5tbaVKK
	7VE9jUc7uROX9ZuWpez2lFwDPOif7FVUTeYhryqCKAzu69ymz1VJfGMQGybsrQ89XOKMnB3tlNl
	y9dFlvAwluU3+mw1G3vCkma0kut2/4UFkqCUD3vnH1i7A3yUIegDw==
X-Received: by 2002:a05:6809:343:10b0:55c:95a:f10f with SMTP id 5614622812f47-55c095af16cmr3232603b6e.52.1793051189816;
        Mon, 26 Oct 2026 14:46:29 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::283f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424a05dsm6304219b6e.4.2026.10.26.14.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:46:29 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 0/6] Implement SPDX for deploy tasks
Date: Mon, 26 Oct 2026 15:45:20 -0600
Message-ID: <20261026214627.2388650-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260630210422.1903245-1-JPEWhacker@gmail.com>
References: <20260630210422.1903245-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 21:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248693
Content-Type: text/plain; charset="utf-8"

he SPDX use case for file system image has been well defined since SPDX
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

Joshua Watt (6):
  spdx: Skip dependencies that are not in the taskhash
  spdx: Add ability for deploy tasks to create SPDX
  oeqa: Add SPDX deploy SBoM test
  classes-global/sstate: Keep SPDX generating setscene dependencies
  Add SPDX deploy tasks to various recipes
  spdx: Replace do_create_image_spdx with deploy task

 meta/classes-global/sstate.bbclass            |  38 ++-
 meta/classes-recipe/barebox.bbclass           |   1 +
 .../create-spdx-image-3.0.bbclass             |  32 +-
 meta/classes-recipe/deploy.bbclass            |   1 +
 meta/classes-recipe/devicetree.bbclass        |   1 +
 meta/classes-recipe/kernel-fit-image.bbclass  |   1 +
 meta/classes-recipe/kernel.bbclass            |   1 +
 meta/classes-recipe/nospdx.bbclass            |   2 +-
 meta/classes/create-spdx-3.0.bbclass          | 178 ++++++++++
 meta/classes/spdx-common.bbclass              |   2 +-
 meta/lib/oe/sbom30.py                         |  46 ++-
 meta/lib/oe/spdx30_tasks.py                   | 316 ++++++++++++++----
 meta/lib/oe/spdx_common.py                    |   2 +-
 meta/lib/oeqa/selftest/cases/spdx.py          |  11 +
 meta/recipes-bsp/grub/grub-efi_2.14.bb        |   1 +
 meta/recipes-bsp/opensbi/opensbi_1.9.bb       |   1 +
 meta/recipes-bsp/u-boot/u-boot.inc            |   1 +
 meta/recipes-core/systemd/systemd-boot_262.bb |   2 +-
 18 files changed, 536 insertions(+), 101 deletions(-)

-- 
2.56.0

