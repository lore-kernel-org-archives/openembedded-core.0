Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66892E85396
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 18:36:15 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2206.1775241366077854033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 11:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TVgkrGoz;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8a58057d7baso32274416d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 11:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775241364; x=1775846164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca8hTiCoyHq5w2aNuiI/2K0vbFd/p0QsatRWMs2f0Ko=;
        b=TVgkrGoz5Kif8Yq1bJsRMhWE9yS6x3T8BiofY8cQ2S9DQz+35xcbGZDBs9redqZhAp
         pMq2l0hMgo3RKRcxrfMr1u0qJTCQnoEzAnB4A7mBlA3gsrt7kMDhvb4vGxfMYn7PFNQb
         zhPyLBUNFbA3w8ssryZYXTii1iNteoGlhffXkcJjpM+Xq6kVkxmC5gQRmQCUjafYssqC
         szuMfCwCuSEQsqi4zCJpt/FRy+udLB90iHxhvRLR0jRUlubBbdMaYVUOPTMN0AsSqJQG
         BRWcIyKPbSHhytbtzmHqaMZ4Hihj48ybILuBuR2JUndKQ8VqThfAdhwI5dq9786NaRji
         Bf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775241364; x=1775846164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ca8hTiCoyHq5w2aNuiI/2K0vbFd/p0QsatRWMs2f0Ko=;
        b=cYXg9a1ICDA3DYIqM45UJ9cuVgVA/VLUS21zqjLUhrNYEvVYrPZSrOg5OmV2eKDAsX
         d4Hj/oBRo7+BPcrFM01p9D7vM7xq0N7pbuaMTxD3RdKWtIuXiCNHMqWHpyVCFlVGOlE/
         q9RO0jnekbdkZLW7oT0ZbnGBzUbCMMbDEjYxsrSSYdOQ0Yun1dHhdUJ/nKiQlOzoZ6J7
         NbzlVPEdGe3ZlWe5lRoZlGyzryF30uUVhlg9BRhEXVSuxBpAvWfppxCAdfGMFAAR7hRL
         Jah4q18iI6rrUCQ7fsUGSiY4QqhD1dHMUzebw/jySn7d3n410Azum4CtdTcCBKAkHdAX
         JXdQ==
X-Gm-Message-State: AOJu0Yxe1RO7tQlpe/3jEoaU2+9BEgVRHFp06nIEuLtO5bJkKqWLpxsM
	KtLafwI+UQHG1Bizw8yH1Ku1ZaDlVZNEipbDC5D8E6JVmcaUJ37+1UfxdTzXjNUc
X-Gm-Gg: AeBDiet5ceVN4QxTCxe9FFMECZ70HCFqGqBq0Axqm/lMgiS62EYkYu4iHTywpoQBMOX
	CZAPABZ0BIRVawKHwx9MDtZZqFKG+3we7WDFPzYLMQCCp15VE7vr58Wy+xel4brHMUmbhu3MUND
	K5rGMfHWcmat4TgIFqQg+QgipU8iS0F3tomICSK357lgdGK/XzSCHqTmolpmZ1C/BW18EXRz9eo
	Reeq96i+qyagagSL2iNJ5b9xEftNmjRd5krXQU0X8PXVGDBSzHAqAlFPlsMejAbUgf9RLKBGUPX
	GSLRj4+flqq01LwXA71Z32oHilxLVHVED0+qvTOfoXz7hDVEex1oLUcK4dLQbWdhTP2a+Vj0fgJ
	YNEIw2cDf3VHHXehfDf6Zu+hUSo83XWzc70mErFcDqfWuXnPxFMGOyQVYfs+/EOqQ3Wv5AerqFC
	28/tFP20OYVPhiPNwICsAxHfaKP/1HJU/ybLYZ7s6/vZmCVXj2Sh30q0ILGni+wwLaiBmoFlFJi
	tYw
X-Received: by 2002:ad4:5f4f:0:b0:89c:d886:c022 with SMTP id 6a1803df08f44-8a7020bd04fmr65992656d6.1.1775241364028;
        Fri, 03 Apr 2026 11:36:04 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593ee25c9sm64627916d6.22.2026.04.03.11.36.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 11:36:03 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v9 0/5] standalone wic
Date: Fri,  3 Apr 2026 14:35:36 -0400
Message-ID: <20260403183541.2631883-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 18:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234592

The wic utility will no longer be integrated into the oe-core
repository. However, the wic utility will continue to exist under The
Yocto Project umbrella. This will allow wic to be more easily used
independently of bitbake and oe-core.

The new home of wic is: 
        https://git.yoctoproject.org/wic

These changes have been tested with oe-selftest as follows:
        $ sudo .../layers/openembedded-core/scripts/runqemu-gen-tapdevs <my numeric group id> 4
        $ oe-selftest -r wic 

The original patchset contained several more patches. Two patches that
were part of this set have already been accepted into oe-core, and
several patches that added "--vars <envfile>" options to many wic
invocations in the oe-selftests are no longer needed.

The order of the patches in this patchset is entirely different from
the order of the patches in previous patchsets. Although it had been
decided that it would be okay if patches in this series break the build
(then fix the build in later patches), it was pointed out that using
a different order would minimize (or eliminate) and breakages while
continuing to make small, incremental changes.

This version differs from previous versions as follows:
- the patch to provide the sector-size via the cmdline has already been
  accepted, therefore it is dropped from this patchset
- a patch to fix a long-standing sparse_copy() bug was accepted into
  oe-core already, therefore no changes are needed in this patchset to
  work around the issue
- wic will continue to look in `wic` and `scripts/lib/wic/canned-wks`
  directories for *wks files
- use bitbake to learn variable values if bitbake is available, previous
  patchsets refused to use bitbake to discover variable values and 
  insisted on always using a --vars file, even if the bitbake program
  was available
- by continuing to use bitbake (if available) most of the patches to
  tweak the oe-selftests are no longer required (since they are run in
  an environment where bitbake is available)
- reorder the patches in this series to minimize build breakages

In v8 the only patch was to upstream the sector-size cmdline option.

In v7 the code was changed to work around the sparse_copy() bug. That
bug was root-caused and sent upstream independently.

Changes in v6: 
- many code and comment changes based on feedback from v5 on the mailing
  list
- this version included many updates to add a cmdline argument for 
  sector-size, this support was added upstream independently
- a patch to add a ufs bbclass was dropped
- move the canned-wks files before removing wic so the histories of
  these files are preserved

Changes in v5: 
- rebased on latest master
- split commits out to make them easier to review
- a patch to add sector-size on the cmdline was added

Changes in v4: 
- deprecate but allow sector-size to be set via WIC_SECTOR_SIZE
- change partition type of sample wks file to gpt 

Changes in v3: 
- squash all commits into one 
- take another crack at trying to fix a warning if wic is not being used

Changes in v2: 
- try to fix a build warning when not using wic 
- add Mark as co-author of ufs class
- add wic utility to the list of native dependencies of
  image_types_wic.bbclass

Trevor Woerner (5):
  wic: add recipe
  oe-selftest/cases/wic.py: update WicTestCase
  selftest/cases/wic.py: remove test_sparse_copy
  wic: move canned *wks files
  wic: remove to standalone repository

 meta/classes-recipe/image_types_wic.bbclass   |    4 +-
 meta/conf/distro/include/maintainers.inc      |    3 +-
 meta/lib/oeqa/selftest/cases/wic.py           |   64 +-
 meta/recipes-core/meta/wic-tools.bb           |    1 +
 meta/recipes-support/wic/wic_0.3.0.bb         |   18 +
 .../canned-wks => meta/wic}/common.wks.inc    |    0
 .../wic}/directdisk-bootloader-config.cfg     |    0
 .../wic}/directdisk-bootloader-config.wks     |    0
 .../wic}/directdisk-gpt.wks                   |    0
 .../wic}/directdisk-multi-rootfs.wks          |    0
 .../canned-wks => meta/wic}/directdisk.wks    |    0
 .../wic}/efi-bootdisk.wks.in                  |    0
 .../wic}/efi-uki-bootdisk.wks.in              |    0
 .../wic/canned-wks => meta/wic}/mkefidisk.wks |    0
 .../canned-wks => meta/wic}/mkhybridiso.wks   |    0
 .../canned-wks => meta/wic}/qemuloongarch.wks |    0
 .../wic/canned-wks => meta/wic}/qemuriscv.wks |    0
 .../wic}/qemux86-directdisk.wks               |    0
 .../wic}/sdimage-bootpart.wks                 |    0
 .../wic}/systemd-bootdisk.wks                 |    0
 scripts/lib/wic/__init__.py                   |   10 -
 scripts/lib/wic/engine.py                     |  718 ----------
 scripts/lib/wic/filemap.py                    |  590 --------
 scripts/lib/wic/help.py                       | 1197 -----------------
 scripts/lib/wic/ksparser.py                   |  322 -----
 scripts/lib/wic/misc.py                       |  272 ----
 scripts/lib/wic/partition.py                  |  615 ---------
 scripts/lib/wic/pluginbase.py                 |  144 --
 scripts/lib/wic/plugins/imager/direct.py      |  702 ----------
 .../wic/plugins/source/bootimg_biosplusefi.py |  213 ---
 scripts/lib/wic/plugins/source/bootimg_efi.py |  436 ------
 .../wic/plugins/source/bootimg_partition.py   |  162 ---
 .../lib/wic/plugins/source/bootimg_pcbios.py  |  484 -------
 scripts/lib/wic/plugins/source/empty.py       |   89 --
 .../lib/wic/plugins/source/extra_partition.py |  146 --
 .../wic/plugins/source/isoimage_isohybrid.py  |  464 -------
 scripts/lib/wic/plugins/source/rawcopy.py     |  115 --
 scripts/lib/wic/plugins/source/rootfs.py      |  236 ----
 scripts/wic                                   |  641 ---------
 39 files changed, 58 insertions(+), 7588 deletions(-)
 create mode 100644 meta/recipes-support/wic/wic_0.3.0.bb
 rename {scripts/lib/wic/canned-wks => meta/wic}/common.wks.inc (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-bootloader-config.cfg (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-bootloader-config.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-gpt.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk-multi-rootfs.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/directdisk.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/efi-bootdisk.wks.in (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/efi-uki-bootdisk.wks.in (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/mkefidisk.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/mkhybridiso.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/qemuloongarch.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/qemuriscv.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/qemux86-directdisk.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/sdimage-bootpart.wks (100%)
 rename {scripts/lib/wic/canned-wks => meta/wic}/systemd-bootdisk.wks (100%)
 delete mode 100644 scripts/lib/wic/__init__.py
 delete mode 100644 scripts/lib/wic/engine.py
 delete mode 100644 scripts/lib/wic/filemap.py
 delete mode 100644 scripts/lib/wic/help.py
 delete mode 100644 scripts/lib/wic/ksparser.py
 delete mode 100644 scripts/lib/wic/misc.py
 delete mode 100644 scripts/lib/wic/partition.py
 delete mode 100644 scripts/lib/wic/pluginbase.py
 delete mode 100644 scripts/lib/wic/plugins/imager/direct.py
 delete mode 100644 scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
 delete mode 100644 scripts/lib/wic/plugins/source/bootimg_efi.py
 delete mode 100644 scripts/lib/wic/plugins/source/bootimg_partition.py
 delete mode 100644 scripts/lib/wic/plugins/source/bootimg_pcbios.py
 delete mode 100644 scripts/lib/wic/plugins/source/empty.py
 delete mode 100644 scripts/lib/wic/plugins/source/extra_partition.py
 delete mode 100644 scripts/lib/wic/plugins/source/isoimage_isohybrid.py
 delete mode 100644 scripts/lib/wic/plugins/source/rawcopy.py
 delete mode 100644 scripts/lib/wic/plugins/source/rootfs.py
 delete mode 100755 scripts/wic

-- 
2.51.0


