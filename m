Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E89AC36001
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:26:10 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.21007.1742563567702102853
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rGrsHUsU;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499bd3084aso1856773e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742563566; x=1743168366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfS4TVgenKD6mOiWnq5dgV2GgU3Hd+vNNEhJ9l3PIuk=;
        b=rGrsHUsUFjn0FUFCGI4QHjv7Pfh1qzPAiAYMpm7h/zsUnKIbFd9LayIAHYGE6+RD3w
         wIhHkLmuA0NE+hr4tQTQhwhQdZqBrs3KYnT44g9NYk+vsuLi0x1kg4Nx3seoBF/M1xkb
         HB++7kWbzplzgUaaMrrHYxcUMxnzkLx4vKuhM1/GObzEVEGeaMWe7cdJVWDwEqvGpGAk
         IT15y1er0AGZJfMM8rhf14b0m7YFx6XEyr6u8cohjjHY9HyqG/k1A+IAEo6yfdGdweml
         pYsGqHAnKj3tuizdfaMT2CAVsFEGRuszri6xeYUlXj+NPUBCPJt4qs/wlbzHmFLGkedg
         5ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563566; x=1743168366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfS4TVgenKD6mOiWnq5dgV2GgU3Hd+vNNEhJ9l3PIuk=;
        b=oBCp1Sn0AAptZnIpQ6tx5i7JAFitMeki3Ib3H/1dFr/efZfSnnmEOQEnp4abxpR5Fi
         5CCkpt0WxOJcqwm2JevYmGJS9UYGOn7pRXEby+xnf8mO6gZOW+jdI47J3bnEio0kgXWs
         JtAxmHtp/TDQdlDmj7F5GJVlXE6oqHUcgabz+Ik3+OMTt4BLukUIQVnjWNJINgxO1MsX
         LbHR2md6oHEM1IMfSlhiL5WQJRHn9htB9XA1rorloB+YnO/t8BIiR/ePAElSs6YCBm+1
         Z04UDhQS0En9QpdT4ulPVqJegZt+S5S4DqPWQHzxqKNYLFF0Tnae/UbsQn8Zk2P0I23K
         56gg==
X-Gm-Message-State: AOJu0YwIpDZwMR4To3vUIqDyQWY9rfrRW+XuygkA9g7y93GvHbplkbUG
	6vmSnI5uLp4+wUBzhGfn/qbznxz2ah0Wy/OE9l9WtHUEhbNYrfO8aU7xWNINIbNfzBi/GGK3v4S
	V+7s=
X-Gm-Gg: ASbGncuwe5TSP649Tc4UKbUwz7sVT0lR7caNupM3FxVxnVrwcgIs5ISQMzXviCZlavz
	kI8DhdUNSTC/58u1rh79fIAMp6VrmW3jmd24INErvuAlpsLj0Wo8GQy9Skwdq6uvfPDy1Tx8O6R
	lEGN1hevPtpQfAb/Hqr1hdlGISrRy68nzzUkGkhpqaiowiK9+1vKxy0HYjUtPy1LgoLFDPhHOuK
	e1/tm25SUxpo7eI+zeCS66tn6ymQwFE5+ndaBOuxy7ZclBB6YMK9RZn+0ERQwbTHyIpDegxmejE
	ZLFEuybw0vFsOATZJ6pR+NAT4Urj/ROtBNps9f419JT8lWW5eJQq/hXlFDBJNLmels/Hd4PlnZc
	Ba1i+6tN4C7j1z8b5eHmbzw==
X-Google-Smtp-Source: AGHT+IEhj2LBQftc2KyQRjbP58Gm4JQCnHKoh7eE5G5/kNPrS7Dg7D+d168ckOaPWr1qS+gIOhwVEg==
X-Received: by 2002:a05:6512:3f1e:b0:545:109b:a9c7 with SMTP id 2adb3069b0e04-54ad64f5a24mr1303001e87.35.1742563565833;
        Fri, 21 Mar 2025 06:26:05 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468a25sm182634e87.11.2025.03.21.06.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:26:04 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 10/11] wic bootimg-efi.py: fail build if no binaries installed
Date: Fri, 21 Mar 2025 15:25:16 +0200
Message-ID: <20250321132517.670372-11-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321132517.670372-1-mikko.rapeli@linaro.org>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213466

With systemd-boot, some builds included correct EFI
bootloader binaries and some not. Thus some builds
booted and some not. Check that some boot binary
was installed so that build fails if none were installed.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 96c710bf77..20b1c36a46 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -341,6 +341,9 @@ class BootimgEFIPlugin(SourcePlugin):
                     cp_cmd = "cp -v -p %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
                     out = exec_cmd(cp_cmd, True)
                     logger.debug("systemd-boot files:\n%s" % out)
+                # must have installed at least one EFI bootloader
+                out = exec_cmd("ls %s/EFI/BOOT/boot*.efi" % (hdddir), True)
+                logger.debug("Installed systemd-boot files:\n%s" % out)
             elif source_params['loader'] == 'uefi-kernel':
                 kernel = get_bitbake_var("KERNEL_IMAGETYPE")
                 if not kernel:
-- 
2.43.0


