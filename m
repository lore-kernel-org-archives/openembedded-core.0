Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8307.1793225173418381865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 15:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ej8KiYbu;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4a6fb4040cfso522443fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793225172; x=1793829972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUzAofN9Vqw+fIieGKBhFaoj+tOsD6nRY6BgsZVr3Mw=;
        b=Ej8KiYbuVBLDGSy6GCKCiKR4y1RtOEQ1wNes5tifyD6tdKlcJMEVJEuTo3zwH4xA33
         tjawD0VGV/1Hx9/zBxDu9/S3lh3Ji7i2MbNBrygY7LC84SltWdhh0VbvfppX3gjvTg2P
         2onug40t6tS7EP5vZgQLtbbvt7/8OBAmrjLe4L/nSNZu+GY0Vf8+Z1APzVfZ7EANZu9M
         JIQbCzJ/i2zBWNEWLpH/O+6dNcF9zY25G3+Vimbg2iRjUso8frnnBgxzqUJU4XWl26gP
         mENCqdp1kTPpaydDKEdsUr4kqQuQ0D/204TrsXQeQe/TEAyGyq0+Am9xtgCR/YMgoFNZ
         Ov0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225172; x=1793829972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUzAofN9Vqw+fIieGKBhFaoj+tOsD6nRY6BgsZVr3Mw=;
        b=L5+AtkGRHKd10findVtIsPyxUiPepNRlshg280PPEaXByWeLdmiaxvWGCgvOPRkJ/e
         /Bmbgj5itXC0N1AMhuBRxTdzLa9aUFIEr3AWQDkt0T/HgxTcNKSpf0oE17Rity11dzOS
         gbm12rbZeMu1/DU3GGHFA6K96WTlfYY6d6ISxPQaLInJyWJWCiBTOJefIrcV0nlckD2q
         E9MEESTOJW/LsIQVW1R2x2rCN0PyzC9uLf0zms9UXB90pvhAumTJawH5p2ybBKvJE+z3
         9h8GTt8vkr0GOiYNvI1Pox4KgAD29Lw6/qeCok0HnULRQQJ/wA64LNeLgtI32qtj6gYW
         7/mQ==
X-Gm-Message-State: AFq9FYK2gS32XVFR/WjMYVBskMl3uQL953wuE5FI3w9FYZmEngVVJpfs
	CQONBwwYLNRxr5Bpozm6vNmr+Chjpg70SP8JKTHxkmLEbfQa5femgWGDrZGMcw==
X-Gm-Gg: AYBFou1eSJ63B5Fn67LXwIYE15TzIQ3SZAiyTVomIQlZvvZberN81AIE+vhW5FeQfk7
	USbhzcuWTf1QQ8KRVQvTlhlubxmq9DtsbafOx5dKc91V1pB41zJtAbcmkVl3h9uVi5/90/Wps7l
	+plu8mhGFPD+ho/Owgxjqi5Dm6zz3hx3fcTwzcgSX3lztYAqskOUE//ZKLiCDoZuVT4bjJxaRQY
	vD8MbWv/Z4YnlJWsZCiPf/Ysbsa4KBfWwNFLwWcuA1eaaYGhqWkpsWHBDttqCIKfIYyJlghRib1
	Jl96q3lJ+ZNDyf8/d09xQWhp5lSC/f7HBnp01/xeV9inPKT80zUOCS1FxSAp96L5m7beZ06ZPis
	4jgTSZaQAMcW5AMHQKZ1mfaqTA396YcO1V3G5iEdr1+BCoArTH/zfeTa/RFlGKAHrHV806FW2tL
	xNPNmPOrl++auBWCUnRN2+P+FwOMJLtuNojEo55WMcB3rJ9y00eRqujV0BHoNOjykhbaqqjPVp5
	R7oXR7cD3OCXcVsiu+jnSa5QY+KVtsU5qITeriEJSUfxgYLWpHe9LMdJWL2Po9692TBBSSKjZPc
	9iIX0NFtyBxQcbpmz2zloCkq1tk=
X-Received: by 2002:a05:6870:819e:b0:449:bccf:bb6e with SMTP id 586e51a60fabf-4a8bb173c1dmr2563777fac.7.1793225172369;
        Wed, 28 Oct 2026 15:06:12 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::8aac])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77abffcsm3527597fac.4.2026.10.28.15.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:06:11 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 0/8] Implement SPDX for deploy tasks
Date: Wed, 28 Oct 2026 16:04:31 -0600
Message-ID: <20261028220609.1348489-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027224931.385138-1-JPEWhacker@gmail.com>
References: <20261027224931.385138-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 22:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248837
Content-Type: text/plain; charset="utf-8"

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

V6: Fixed a bug where eudev/systemd initramfs-framework was not being
properly detected and the wrong link was in the SPDX due to the switch
between the two not being detected.

Also, deploy.bbclass now always adds do_deploy to SPDX_DEPLOY_TASKS, so
any recipe inheriting that class gets it automatically.

V7: Add SPDX_DEPLOY_ALLOW_EMPTY variable, and set it on ovmf to fix it
erroring out for native builds.

Joshua Watt (8):
  spdx: Skip dependencies that are not in the taskhash
  spdx: Add ability for deploy tasks to create SPDX
  oeqa: Add SPDX deploy SBoM test
  classes-global/sstate: Keep SPDX generating setscene dependencies
  classes-recipe/deploy: Add do_deploy to SPDX_DEPLOY_TASKS
  spdx: Replace do_create_image_spdx with deploy task
  layer.conf: Fix initramfs-framework not knowing which udev it has
  ovmf: Allow empty SPDX deploy artifacts

 meta/classes-global/sstate.bbclass            |  38 ++-
 .../create-spdx-image-3.0.bbclass             |  32 +-
 meta/classes-recipe/deploy.bbclass            |   2 +
 meta/classes-recipe/nospdx.bbclass            |   2 +-
 meta/classes/create-spdx-3.0.bbclass          | 185 ++++++++++
 meta/classes/spdx-common.bbclass              |   2 +-
 meta/conf/layer.conf                          |   2 -
 meta/lib/oe/sbom30.py                         |  46 ++-
 meta/lib/oe/spdx30_tasks.py                   | 323 ++++++++++++++----
 meta/lib/oe/spdx_common.py                    |   2 +-
 meta/lib/oeqa/selftest/cases/spdx.py          |  11 +
 meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
 12 files changed, 543 insertions(+), 103 deletions(-)

-- 
2.56.0

