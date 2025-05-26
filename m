Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD22C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 08:36:20 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.24790.1748248572522185389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 01:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XVVXi+M3;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-551f0072119so2457573e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 01:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748248571; x=1748853371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0nXMEDKjslTjEvq78CbxR/BBOVCDYQ/iTqVpxShX4Qw=;
        b=XVVXi+M3BBG0AHr76oGKeldbigSUVIlMEMj++eAXAti5+QU6hYLJn7olhrzBtGKSkE
         Lh+/wpSglqw9bgDyBCSgYTW88G+iGjvgqAKXxGvp3SYawDaEZ0kObzj+c8vjZnEKk7Td
         7TnlymDixjsWnahDG9oHOWFLA7swdahRoDNdGVkwqlwRLigrzFpb1SGQ+xgixKk+5yeI
         PbkHa3iAJCVmoYqS0bb0dTFNOrH2xHQCsM85O7hExey7qVmU0mwOv0lcHSYV9u4P9rFi
         4LqJ4uDS4Lp9FEvpRLAxOrg7rMyTqalMdKXCCbtg5FjiCSyOgVE3TZd8a91v/x3VWpfJ
         OCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748248571; x=1748853371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0nXMEDKjslTjEvq78CbxR/BBOVCDYQ/iTqVpxShX4Qw=;
        b=qGsfvU+m2+xyl8l2Dy5zfTmRzgwsjhLkCCCJz3a4M3ei2r/3zPXZ/9o79J6gefnY+L
         2EJX6OJqnh/5DlccpDzcLVsoVlbFT7ZbPT9nOonLPuoqtuqk0EojDt5KBKKPaLrSP3EW
         D6VUuZvOY9umIRN0IX/P+4hgIzKXRh8QLe1XOdI3/IxSbBkR5v86KP3q0SaDTE5cJ/cM
         mWwGL3t6mV32Vp+JJ/JEcP5Z/Gcse5pv3z+onOo9orkSObZWDYEGE+o0mxgppsZcbwHT
         G6Sp0/BCN7m5sjL4n4OaivfxHhx8YI1wd2yriTCRjahbh9iS0y5HuEcqnjk4NogKBJ3+
         BZjg==
X-Gm-Message-State: AOJu0Yz9GRJHzk5dt4Eha7CSNvtWFxgnZYBKFJsxLFaMR0rY3KkCMsh+
	urFwjQKWh8xrMd3BJaIYFZiMZkjfp9xY17ozVWglkItTTwT7YS+2Rj0Z8VW22+fPNg3pxW+ifW7
	3qpWcmxU=
X-Gm-Gg: ASbGncszbIuwHv5f8An+VAvczoEaX7+4rLJHkLkdDM0RdPCIw+rkJJCb19LSPKk4VjR
	oh1RcTglmh5mesxRZ3mbPboVB41n5W5Gi3CUT3jcZP8xyNBbtvpSw9//o5EwUTNltiezGx8peEp
	jQcpv7oKTCUaPIuYS6Vm2Nhgyo5trqPVoMnd17vjAeZHWS5unugk25fnBcVYGkRC7B5pknNZvx5
	K//SzpxDXmMHtLGGV0FUhf1KmcXqixAM7+kp9klRNG8kUB9D1ft1QT4c12chxtcTtmuqcAhxe0j
	QegRcfgJlm5LSrKh31eY1Z8I/5ZwEyBY8Tkiz7YtXkQYL8v4CC4ULtZygftxogRj3TIfZ7SC29I
	r46Q62vohSg20lU2Jq/zZVHcktwSe
X-Google-Smtp-Source: AGHT+IEXNT6gIJpn6ZTAr++ZPkb12FfCh9+zjRrYEEiK5hPvOfyoV5Uz4oCicc5CPjKlA4WQTeHypQ==
X-Received: by 2002:a05:6512:3da7:b0:550:e7fc:352 with SMTP id 2adb3069b0e04-552156e7b1dmr3602474e87.25.1748248570540;
        Mon, 26 May 2025 01:36:10 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a6502c667sm1271651fa.101.2025.05.26.01.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:36:10 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [PATCH v4 1/4] u-boot: disable CONFIG_BLOBLIST on genericarm64 and qemuarm64
Date: Mon, 26 May 2025 11:35:44 +0300
Message-ID: <20250526083548.413834-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 08:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217257

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

v4: no changes, posted together with selftest for feature

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


