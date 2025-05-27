Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE338C54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 09:08:27 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.46970.1748336899922052424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 02:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cj6s0un1;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32a72cb7e4dso293041fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 02:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748336898; x=1748941698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv2X96gPCKUYBJEF1TZSMhlnIFP28fUoWr6YlbwP6Vk=;
        b=cj6s0un11ZaiOjpn2B0RwiFsOZHtq6dDIaAdYqBOnSLLGIeXbwgCU5Al2iQG6Ua2PA
         PX5QAbFGX9jyfaUe9QJJ6nFNnbPr+NWjGvCgbj3sPGFd9iIrAYRJjUnl0zr7TUJyeOA+
         i81fENEMMkKdeDhB5Umf2eGJX/9t8h+ezEQrPCbLA1+YoaG4pp2SCovtWdB4pO2Ig/vC
         0WCYh92sgUMZcKMcy3+vWfXDdVX6LEEiCowhwVeIP6oRs1CoYyy1rdBmEY803F0S4teb
         eFOe9LDWyk6vBLpgL1tr6cDvuS0qoCwC84yATaNd0LSSRyAWrlUof6YouUeF2Jtvx6Tb
         QO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748336898; x=1748941698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fv2X96gPCKUYBJEF1TZSMhlnIFP28fUoWr6YlbwP6Vk=;
        b=bLw0J6wv1zP6Nc6mbX/6S82jKCPKMW2lbGG6cDVQn6z+T/3GdvHfl4B3DD6d3GSyox
         KHbZQXzZF4HpzPOVVAkAd8uWIOhfNhRndywVTScmwoGiNMeb+3+UCdlGdYKNO/PxfVsK
         42DXu44rPXWCqLs7gPGwDR4KKuwmHPHgq87St86iBSW42WFc6qKntOxdnQDrCgiDKJNA
         Fh3N1hrgyKTc0JcBjwAvFrpPUaa5WzKNiDY5ghZyGfAZ9osLddUhgeZH0O6EbBqC6+0y
         l3TSpk3qKGJTr/737Ka1DYP2MBKqqxjaNl0ym08XPyE2vtMVmrV+wGC3XCcGaO9VqYyb
         C2Tg==
X-Gm-Message-State: AOJu0YyJxRtOCRntaw88YEKpGVuBlnRQSL8vHtjCEtrhCtcBPCKEAD7V
	Bnj8nuZtOAyVRYGaBu10Y53sAFgkuwx+0f7p/D+2jlhKjl1/ZI9JOxnj5NP00kf3y6Wmtzg8znQ
	0nNVJwJg=
X-Gm-Gg: ASbGncujWqX93bEm2I7hFfGwKSA6cvRHvCQ8XvLXeVvWVzzgQkwQlzpDk/m8JPOdKE0
	RLJNDWOrBCYwtkx5+sBGpEwroCXwedqegIUzU0UU06A30+g+DEFFFzjtGedf6cfTg/MWefsk8XQ
	IP8cxd0Fw1JVaH28yPP+cNN6J0eZscNQN6jM5UMX4KMtOpx/cSICdfq8oCDHgsV36yX7o1BOlSN
	x0tfyYFXAMtFTdV2Lrk+m6hGwhjZT8Aepss6ysxKfRNRjBbtmqQ7OlGVJS5zxUZrrNQU1dU+nDN
	XbMJvky1Z9wr2Z4X4Ym1z8C8dgGvQDuG+FUWG5G7HGPk8fx8FMGiO2wgvFWVGspAM1zfmhok9tt
	isKc6n+kt+ECvsZlpk2V6vmpE
X-Google-Smtp-Source: AGHT+IEVXHXJeNQn8BdpZ8bWXT/Qtfojcm5sf2Y4v9ZKyg/GtKC6VSY9esI751Noai3F6Bfv40fptQ==
X-Received: by 2002:a2e:a98c:0:b0:308:eb34:103a with SMTP id 38308e7fff4ca-3295ba58655mr43947481fa.28.1748336897895;
        Tue, 27 May 2025 02:08:17 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-48e-3a00--183.rev.dnainternet.fi. [2001:14ba:48e:3a00::183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a6d358ecbsm2290211fa.17.2025.05.27.02.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 02:08:17 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [PATCH v5 1/4] u-boot: disable CONFIG_BLOBLIST on genericarm64 and qemuarm64
Date: Tue, 27 May 2025 12:07:54 +0300
Message-ID: <20250527090758.540188-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 09:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217290

Booting u-boot on qemu with kvm is currently hanging on aarch64
build host. Root cause is in u-boot and CONFIG_BLOBLIST can be
disabled as a workaround.

To reproduce, build on kvm enabled host where "kvm-ok"
succeeds. For example genericarm64 machine and core-image-base
should then boot with:

$ runqemu slirp nographic novga snapshot kvm

On qemuarm64, default kvm setup will boot directly to kernel
and is not affected by this. If build enables u-boot as bios
then the same issue happens.

Without this config workaround, the boot hangs without
any messages in qemu output but ctrl-a-c to qemu console
can shutdown the emulated machine.

This seems to have regressed after u-boot 2025.04 update.
KVM boot can be detected from speed, for example genericarm64
boots in 550 ms with KVM and without in over 5 seconds.

Fixes: [YOCTO #15872]

Upstream u-boot discussion:
https://lists.denx.de/pipermail/u-boot/2025-May/590101.html

Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg | 1 +
 meta/recipes-bsp/u-boot/u-boot-common.inc                 | 4 ++++
 2 files changed, 5 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg

v4, v5: no changes, posted together with selftest for feature

v3: added u-boot discussion link to commit message
    https://lists.openembedded.org/g/openembedded-core/message/217105

v2: applying to genericarm64 and qemuarm64 machines only
    https://lists.openembedded.org/g/openembedded-core/message/217054

v1: https://lists.openembedded.org/g/openembedded-core/message/217030

diff --git a/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
new file mode 100644
index 0000000000..d01d3d12d8
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
@@ -0,0 +1 @@
+# CONFIG_BLOBLIST is not set
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index fd1eab5cdd..a77c49cb8b 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -16,6 +16,10 @@ SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
+# workaround for aarch64 kvm qemu boot regression
+SRC_URI:append:qemuarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
+SRC_URI:append:genericarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
+
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
-- 
2.43.0


