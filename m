Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2A5C55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 12:15:07 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4407.1785586505279578759
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 05:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KmKz7KPe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954df200ddso4114225e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 05:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785586503; x=1786191303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AYlAJAtJmOgJKPzkoy3n/5R8tcbwZM2u+3Jok6X20Fo=;
        b=KmKz7KPeUeeJ18KMaa4ZSTJkM0RoJIkHqXtUClqGW+EOBDMzYLj1EeU2ThF3KW/zo/
         qfVn6yWzRZ7TqbYu2ydeLL1YyHqvN1KjeuqqhHJhXNM7dN6cNQraLSZexgcOInmNl4kI
         OiefrVvEO/WIykcfc0fUWTtzBTBz+KCxl4cGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785586503; x=1786191303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AYlAJAtJmOgJKPzkoy3n/5R8tcbwZM2u+3Jok6X20Fo=;
        b=EygIoBncxFRQrglUGry+30Yz7pAwuGz7sA/Aao+lG5nyKatVvrYY/94YWY3buSySVr
         9MoWomC8GF36PTk6fD3LcTNt6/OeUo12v3T9fNa3BkLCZZUg2z0ZdMN+S/f5+LyUSlXL
         dYfsUdLFY2jQPqPnSK1iHypR9wkxOQyTYE/1wi6h6WY8B/p0szc68xSFbgcNWkGSaxHe
         uj3I7Ovf6vzupWPcQ5Y+YOiQiqSQgZerpeCrws0YUKSuGalIVnA04ebiQ5KIKuAKwiON
         P1X0RmvhOONWRyKUFrDXnzKTspjN+P1t/wdqoHEHgAe8WZzaxAssFMIEYas7sraPXIU0
         SmvQ==
X-Gm-Message-State: AOJu0YxT2cWQSxoSMnkXimiP9QciaM2mhaDUaFQM83iTRKcYzt/rAwNe
	8uOwUfZ/5R2dSHHsv1w9XgLqrvwh0KvFXL4S0rbwC16qsuoF9zFC1zeoFAZ4qIp3F7ijMcA85G1
	/hdKq28s=
X-Gm-Gg: AR+sD11OrWG2jNbvDRwpcHyAZl4EaoLpXzGOftopjOqAF/4RJaEnPpH3i37uGZOb2rM
	ficIJY8b70OWQOgAh9KzTFaTqx3q3HBHSwNs9vjj+A2/6576/hEyH8H9OeSNIulj9qWgWB31Dws
	VEzWRHnYXU3R1Ma/9wvsaaLJo8C9MM2CrGKeh+LjUP+7P69eTCLsPbm9E06jOKSjhDJ5sYxfhQH
	D5BkYZo7vnbV20XU4xcjS4gmoc5bLSeRndHwk+zyyf+1RjyxXKPqEQAqdQgB7Y/KIApMbeugUQi
	RZCm0A8pdoSl19BhlY58rSm5sbB2rBI7Fa0JWbV2gILIWDdr4avwA/Ovyo2S0a1sP2pPlgbAN/j
	SmT5bjPiTIDpEIjZXVn2G1mRFkYnX7zAJPi9PGjwp3qwx/OVHP+B23RZahehuLZO9W3Oojk7sBv
	VWd/tJbzsaGvMw6uqdi3xZzL4g/iatpgTC5vm1jxsCEFZR3GWYjoeeff0HyVRBthI5xgrAaZjx+
	IM6TMs98iLuhaVcHg==
X-Received: by 2002:a05:600c:4444:b0:493:f6f0:d66b with SMTP id 5b1f17b1804b1-4980c6458aamr40869935e9.1.1785586503463;
        Sat, 01 Aug 2026 05:15:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm16518796f8f.14.2026.08.01.05.15.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:15:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] ttyrun: upgrade 2.43.0 -> 2.44.0
Date: Sat,  1 Aug 2026 13:14:54 +0100
Message-ID: <20260801121454.2770123-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801121454.2770123-1-richard.purdie@linuxfoundation.org>
References: <20260801121454.2770123-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 12:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242495

Source: CHANGELOG.md

* __v2.44.0 (2026-07-31)__

  For Linux kernel version: 7.2

  Changes of existing tools / libraries:
  - create-sehdr: Enable quantum safe keys usage
  - dbginfo.sh: Let zpcimon log both optical module and SMART data
  - libutil/util_fmt: Add util_fmt_type_to_name()
  - nvmemon: Skip SCLP on NVMes with non-IBM subsystem vendor ID
  - opticsmon: zpcimon: Rename opticsmon to zpcimon
  - pvattest: Enable quantum safe keys usage
  - pvimg: Add '--flags <...>' and '--disable-flags <...>' option
  - pvimg: Enable quantum safe keys usage
  - pvsecret: Enable quantum safe keys usage
  - pvverify: Enable quantum safe keys usage
  - zmemtopo: Add CLI option to filter partitions by name
  - zpcimon: Allow setting output format using --format CLI option
  - zpcimon: Monitor for hotplug of NVMes to trigger SMART collection

  Bug Fixes:
  - opticsmon: Fix wrong size check for OPTICS_QSFP28_LOS_IMPLEMENTED_OFFSET
  - opticsmon: Handle error return of ethtool_nl_connect()
  - opticsmon: Fix error path free of struct optics in ethtool_nl_get_optics()
  - opticsmon: Close epoll fd in monitor_wait_loop()
  - opticsmon: Fix wrong JSON print for tx_fault

* __v2.43.1 (2026-07-22)__

  For Linux kernel version: 7.1

  Changes of existing tools:
  - dasdfmt: Check disk type before prompting for blocksize
  - iucvterm/ts-shell: Introduce config parameter to specify iucvconn binary
  - iucvterm/ts-shell: Introduce pager config to replace env variable
  - pv: Add root CA organization pinning to certificate verification
  - zdump/ngdump: Use OpenSSL's SHA256 to compute digest of dump image

  Bug Fixes:
  - 95sel-ebc: Add udev-settle dependency
  - 95sel-ebc: Add umount to boot service
  - 95sel-ebc: Harden boot mount service
  - fdasd: Fix memory leak in yes_no() function
  - iucvterm/iucvtty: Ensure PTY and server fd's are closed at exec
  - iucvterm/iucvtty: Prevent connection stalls when receiving TERM env
  - iucvterm/iucvtty: Validate TERM environment name
  - libkmipclient: Protect from symlink-following attacks
  - libkmipclient: Various bugfixes
  - libseckey: Protect from symlink-following attacks
  - libseckey: Various bugfixes
  - mon_procd: Fix possible static buffer overflow
  - osasnmpd: Fix SNMP non-compliance
  - zdev: Harden against invalid udev, import, firmware, or hypervisor data
  - zipl-editenv: Check in-bootmap environment block validity
  - zipl/boot: Check in-bootmap environment block syntax
  - zipl: Check keyword duplications in BLS entries
  - zipl: Fix bugs in mirror support
  - zkey: Protect from symlink-following attacks

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ttyrun/{ttyrun_2.43.0.bb => ttyrun_2.44.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.43.0.bb => ttyrun_2.44.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.43.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.44.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.43.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.44.0.bb
index 74204013c2d..776698e1b69 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.43.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.44.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "f85c8ebba0b482e677de1f2c4d8b67b588fe654d"
+SRCREV = "03f7566436b42c2f1a4ad717dcf610c1f926b8f4"
 
 CVE_PRODUCT = "s390-tools"
 

