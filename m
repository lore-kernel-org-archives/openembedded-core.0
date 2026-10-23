Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4548.1792753046303803143
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=Uade6LyD;
 spf=pass (domain: 9elements.com, ip: 209.85.208.182, mailfrom: tan.siewert@9elements.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab01c46697so5189591fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 03:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1792753044; x=1793357844; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jjO6mahbCyccZi8v3JlLmbCM8Ctrto6A4luSQFmCoEE=;
        b=Uade6LyDL3N1HQM6Z5GZzRoW9lby0htYDBW8k2zHtK1A80xytvYilDFYLP8R6NypiC
         bFFyAayiQ+y+eXrtsI4L4tN6HZnZFugXfOyrLt0ABhm5WskKzpaDPK2CFJaiPgOOndTx
         vN3Um5rLDAtpWO4noLPDOAMmjDT+ykPWZLK6piuEDwdQGUAwfVqLR1+UO3x2bnhYU1tl
         3c0lvpBxSN7cqTBTzRNlRFcnJQU6CcrJfeRtD6/IL4TmJ4Xbb4xnl8jtF8C1gbtGoq6A
         /CetH3GAHmTgYFcasP6Qgg8Y/fscpZ10ocN+VNEl7prr7yrkHGa6N+uL5EFPaYrHvnLw
         sh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792753044; x=1793357844;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jjO6mahbCyccZi8v3JlLmbCM8Ctrto6A4luSQFmCoEE=;
        b=W5QKRDq/+j5WnA8Sl7keq86JSiu+mV0dI339Cb70uQ5h1QeZ4RYUjYMJcDFEBMKHo9
         SKtTAEqeNCDw/zCfLBz9UTB1WAh6iibQsD0IYzZZCzrFtcJCMnguvWd37IAVxX7T72Sz
         xG65YGoKIIW0SnNplJbyX7LDYf/DrtZp/MSpfJaWoGIGCs+C/ERAIVoBfXpTYsYwd2Na
         DGwPtytOcazEAXMVP3dtFeJ6OM6ha3iWxD9FntIjwl2FTxE7jTMoLUH9NjXZc3SVzcFi
         pyMoQHPLFQP7HpTLISHDohIoYZ9Ik7BjX1Anx0CSp/rHiXuGVUtejsc9CO0y706All6u
         QMWg==
X-Gm-Message-State: AFq9FYIwC+MkAE1eMIAyMaUTpf1aP1s7bQjVYJjtqM66tt16aLrkIS+x
	acliimfd5r3ccJkK/isKBlH5JObqLb8eRe0RNIKoCa7kxV+4bBbABPD/Y27mf2qHWDfqpttx5Yb
	LAJSMxr4=
X-Gm-Gg: AYBFou0Zct7Jehl7Y+jCLEMWjvKi8DvzvyGpYv+Tc1FJJlPRCewGPQd76il+WC7ykYZ
	QbIZha17oPIUi3nqRWvn2l9tDkue2/4UyC8WbF+B12IVj1WpGhvcBGMvbMcBy1kYeYaRLEnWG+j
	/Wt+bhMUMi4RCJLLPQ6/M/1pN81CkkpR7ntY+NvRtx3nTGa+KCovDGbg3jYBAKgG0nJ4z1VlwXW
	xbZURtEpo3+25co06mKsKwUE8WLomftaMtC0JlxVUfoLFfK0uqoa2MPz4uv5NigpYWmM4ORGDeO
	rOQx83JKR6renG9sUgzqE3v1O/MkZQNt4RIzsIUcqKgdZHRJy2Fng5Lw52Xf7zk1qBgm4xlA8Rb
	HteA57c/oi5Ve6kaFj/lsopy2wlL5DLB1d4WfDXex9GhhnmfwYaNZ64HaMQZsvh7EEWm00uV21J
	IDZmbXUStaw1ckZlm2lWUUvzNr9l5BVf4O1ZQ5EcWE/ZfWR44Ar8PnMQXYecRAyDX3f3kKp0be0
	N05bOHOE/pi7sDll3OZtTFG0sfhhV2W9P5EGFFpD8rY0nuO/Rom6neHLGiQfoKPoWymPhMMsg==
X-Received: by 2002:a5d:64c3:0:b0:48e:3bc4:a367 with SMTP id ffacd0b85a97d-48e3bc4a3c4mr871822f8f.33.1792752726938;
        Fri, 23 Oct 2026 03:52:06 -0700 (PDT)
Return-Path: <tan.siewert@9elements.com>
Received: from white-mocha.local ([2a01:599:841:69c3:a3ce:18eb:5996:fa43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37eded3fsm4268891f8f.7.2026.10.23.03.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:52:06 -0700 (PDT)
From: Tan Siewert <tan.siewert@9elements.com>
Subject: [PATCH 0/4] systemd: add packageconfigs for storage optimisation
Date: Fri, 23 Oct 2026 12:51:52 +0200
Message-Id: <20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMOw6DMBBF0a2gqWPJdkEwW4lSOPgBg8RHHoOCE
 HuPCeUp7j1IEBlCdXFQxMbC85RhHgU1vZ86KA7ZZLUtjbZGyS4JY1Dzknhk8SkHooKHc8EZVPp
 JuV0iWv7+v6/3bVk/A5p0zeg8f/MRH/15AAAA
X-Change-ID: 20261021-systemd-optimisations-dae99d91e807
To: openembedded-core@lists.openembedded.org
Cc: Sai Sireesha T <saisireesha.t@windriver.com>, 
 Patrick Williams <patrick@stwcx.xyz>, 
 Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792752717; l=2413;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=wXkR55koLG8GNdavemCjgV2LyAZbmFAwKc6MtWQ3tRM=;
 b=m0KdVPc7vxWwqsj2RGh6x1Bp/7C4Tnm4SH/2QvhkSka8fc63NW8zLkzzApzC1SyB/iSc6Nu1i
 TIoAwRKT62HAsdXWrPNQP913SCA1388i/PmSkeLINtlIO65lP76hKWa
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248537

While investigating the storage usage in OpenBMC I noticed that several
features are enabled by default because their meson options default to
true or because they use .allowed() instead of .enabled() for the
validation. This pollutes the storage which is expensive on some
platforms (there are platforms that only have ~20 MiB for rofs).

This series adds packageconfigs for the features ukify, sysinstall, hwdb
and fdisk.

ukify was enabled by default but only works on EFI systems. On non-EFI
builds it will be disabled by default, but enabled by default when the
efi DISTRO_FEATURE is set.

sysinstall is a neat feature that makes installation guidance easier,
but for a lot of embedded systems it is just a waste of storage. It's
not enabled by default as it has runtime dependencies on systemd-repart
which weren't checked before. Enabling it by default would mean we'd
have to enable OpenSSL and repart which does not seem viable to me.

For hwdb, it might be useful for systems that see PCI/USB/HID devices or
for some laptops, but who needs ThinkPad keymaps on an ARM1176 SoC?

fdisk is recommended by libsystemd-shared, and disabling it drops
util-linux-libfdisk. This is only required for sysupdate, repart and
homed.

With all the changes I was able to free a significant amount of storage
again (the hwdb alone was ~9 MiB uncompressed).

I've tested my changes with qemux86-64 by building systemd with the
default configuration and with fdisk off, hwdb off, sysinstall on (with
and without repart), ukify on, and with the efi DISTRO_FEATURE (with and
without ukify), then checked the resulting packages, shipped binaries
and RRECOMMENDS.
Enabling repart or homed without fdisk fails at parse time as expected.

The testimage with default and hwdb-off + usbutils configuration booted
and passed the default tests.

Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
Tan Siewert (4):
      systemd: add ukify packageconfig
      systemd: add sysinstall packageconfig
      systemd: add hwdb packageconfig
      systemd: add fdisk packageconfig

 meta/recipes-core/systemd/systemd_262.bb | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)
---
base-commit: ae5cafacec8e99c5a27fa5b3b378eefc595910ef
change-id: 20261021-systemd-optimisations-dae99d91e807

Best regards,
--  
Tan Siewert <tan.siewert@9elements.com>

