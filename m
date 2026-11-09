Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3752.1794253683478169194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 11:48:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LnlBWAcC;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6df0b02fe91so724438eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 11:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253682; x=1794858482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NlKUz8MgS4Kq4pFCuqZXEnP3UJGmS8i6zP367nAEHg=;
        b=LnlBWAcCZfVL6jHE40YVh1ZGw7zvGdFdu+uy5vHYZuvxNwqMkMSZrXHBE3wpgbRyJj
         Ng1Db/28rCc2SNX3eYnM2Nt3BarSBuH2evdRafDj2SJw9BtKDS/Yk6m3/xSzrs7nn3xt
         7CN5mWJFFNtcQH3Eex0Rc1tDCldWdtvo9xtVh6q4fzllU8h0hkoK7ULW7EQx87EwQjbm
         Xvy8GLWgLg/yUyhrKTMuPHUyKE0ffbl73VdEqhPVWjMAhi54iEdCkLCM3LSzXqNKjYsc
         lyUJbd2AZUFLo+2l+r8waYDiUDcD5WMQiaDqV8yh5rohLbjCou+aJiVUB6XLNk3UJIgs
         KHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253682; x=1794858482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NlKUz8MgS4Kq4pFCuqZXEnP3UJGmS8i6zP367nAEHg=;
        b=sLF9wVq22OEf1a4gKOGkUIYM4+QCTw+LJsMi0v3yeXuHGqPAmHX32XJd1sTnFainwh
         P+3Y0LTm7iLsYeBsUt8K2QO0517P4VzoFCRmoHM6FaRIgOGjpA9EPXRJGg6GxFrb+gYj
         bInVztTwwQ0MwHXnCzvcDkZGbypLke2Owl+JRtrRWtOT6spRWWBHDXDfzQFJc8kLohBf
         5g2ghdlpVlaD+xgfKQKisDPK7gIi8NYti6E2ZZdEbGlZpFWREc/fRMyHP6JNfI4t1Tn2
         CX1QS2qIvsqziP15OWpcWTOt+9dr5q8I7gS1zitoVWj96i0mLbNzNz6Njd7MbVzyBPOf
         XSzw==
X-Gm-Message-State: APuU4Z+KPTN9ZqNLNEYwy6LAw7wSVov/R09bSEiFQJxniqhGqFyQrWGz
	5s26cBckyJrxfddqBgZE76Fk4VBh4rcJrV82/mhoXsegMMfz2T2Nzl+XIVH7/A==
X-Gm-Gg: AYBFou1mKXk29sjY59fozt9pz8SzB8MYXe1QvIycIXcLs7IYE9qGCdMmy2IF9cla4U2
	QpIvbr9OrcDQ0cju0NbJgCkEHtoxP9CuBiNoxnPBqY2NbjY97C++chS10k6vR1u8vkBG3NMscdZ
	FZ25B1tPF0hgIH+GbbzoMzqcpAyDDoj/t4htwqg2erKWauldI7yPhzBfNLl2RrRjmRzkdDPkgWu
	Oh1X9SKz4aJdrMG0GRjaF1vU0cY7KEltxd6sCKbuyEdJjQFeMX8MIZlvCbjyW8+3gPpeyP7ypNG
	YWu7NScIhBmURM/nO/ffPjyR9XhORvyMhD3+OqNWpR4asSbwxiurcQoJkINKKdhc+jynxAntI0w
	CnNfgOXG3xsVO00bAbTOUmNarEzKJzrGf4582JMwezZdSeqs4BZZwTtEoT5ohyqplgaR7Pqz0Rj
	/8k+2Lmvh2LzgzAGtVyHOGEvO31X29kNLWt2KR2nAiFlNxaTH2uEVK0K8uzN1ewxeg24M5bOAZz
	QatQX4Zd3/F2bDCD7Uzb4yf/SA69EYGORAvdoRbS5DHURhlu+5zExrGSiOlKJ3YnTra5q54Py8V
	t/+a/r6uGtilOt+Z9SiZVd2jPq4fEDu1aG8Hz/fnGuDxUKGn
X-Received: by 2002:a05:6820:8913:10b0:6cd:3fdc:2664 with SMTP id 006d021491bc7-718a7504e0fmr38595eaf.37.1794253682502;
        Mon, 09 Nov 2026 11:48:02 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::3232])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa132e65sm70363eaf.14.2026.11.09.11.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:01 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v9 0/9] Implement SPDX for deploy tasks
Date: Mon,  9 Nov 2026 12:45:36 -0700
Message-ID: <20261109194759.550935-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104153535.3184146-1-JPEWhacker@gmail.com>
References: <20261104153535.3184146-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249865
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

V8: Fix deploy error for linux-dummy, and allarch signature error for
initramfs-framework

V9: Fix initramfs-module-setup-live allarch signature error now that
initramfs-framwork is no longer allarch.

Joshua Watt (9):
  spdx: Skip dependencies that are not in the taskhash
  spdx: Add ability for deploy tasks to create SPDX
  oeqa: Add SPDX deploy SBoM test
  classes-global/sstate: Keep SPDX generating setscene dependencies
  classes-recipe/deploy: Add do_deploy to SPDX_DEPLOY_TASKS
  spdx: Replace do_create_image_spdx with deploy task
  layer.conf: Fix initramfs-framework not knowing which udev it has
  ovmf: Allow empty SPDX deploy artifacts
  linux-dummy: Allow empty SPDX deploy artifacts

 meta/classes-global/sstate.bbclass            |  38 ++-
 .../create-spdx-image-3.0.bbclass             |  32 +-
 meta/classes-recipe/deploy.bbclass            |   2 +
 meta/classes-recipe/nospdx.bbclass            |   2 +-
 meta/classes/create-spdx-3.0.bbclass          | 185 ++++++++++
 meta/classes/spdx-common.bbclass              |   2 +-
 meta/conf/layer.conf                          |   3 +-
 meta/lib/oe/sbom30.py                         |  46 ++-
 meta/lib/oe/spdx30_tasks.py                   | 323 ++++++++++++++----
 meta/lib/oe/spdx_common.py                    |   2 +-
 meta/lib/oeqa/selftest/cases/spdx.py          |  11 +
 .../initrdscripts/initramfs-framework_1.0.bb  |   2 -
 meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
 meta/recipes-kernel/linux/linux-dummy.bb      |   2 +
 14 files changed, 546 insertions(+), 105 deletions(-)

-- 
2.56.0

