Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2465.1795462164723797231
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 11:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=SGTiCgq+;
 spf=pass (domain: 9elements.com, ip: 209.85.208.53, mailfrom: tan.siewert@9elements.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6baa6f27904so2079108a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 11:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1795462163; x=1796066963; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NSn5FFCWb6sQpo2kpbuIPsYzjVSI+hgOrPzHnOgDqto=;
        b=SGTiCgq+Jx2ZJ8dbjduGqdEgV7olv/R79sTyOGCV1dJCYxrAmeA/Nat3Kj/LL9FILJ
         N84qCH8DcVZJ8tyP5fapU9D5+0KJNbY0Fsj87unoRVeRsPPsj5Y7U619s2ZZKphoQrNk
         bxV0rJqihPD9jfTqCiYjidjKLhxkgnI9v/TjxVeW9ZQDCsdSoFCYPEG7zB2PO7UeEAdM
         B0Dxois7l3BwUPPJHXRkQEJHKlFdG1uuJqhX3hufX9kB0e1mCDMC3Ax6Swiec/9eUcX0
         nolF+o6P8g59X0a7uqh0wTusYb5BPfqwzZFgLEek3P+mYHO7L+NtIdtoQbH1hCPk2yLA
         XPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462163; x=1796066963;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NSn5FFCWb6sQpo2kpbuIPsYzjVSI+hgOrPzHnOgDqto=;
        b=Q1tB5G0SYTEZg2U+UXTD/S2FcCiiEKeyxwGeRc4HqzCO3QtNCYS6nlOjHQfgDTkSrt
         i7usItSyhH3N/nFB4AB3uBsWyoWtaoTtUMZ12EWhu+Xno5KW7Are4PxPddFnpaKQxd1c
         fMFJHUlC0XdhWgfTriHkUX/thsej7K89X2ea5MFluAfyTK6eEVDAY+5oakwfv2xFugZo
         bRQMDvQcXwA3xsUrk5PRyN0zSm/A50L8unlxClV4rqVNrr8XeUN0caSnKE1RPgRkI9bv
         hxwBbEAirBdwD9jtNwz0f5zlahC+T7vfADjUjG65/FdhYeP8QaZ6i/Iu8E8QcTiM0vSo
         1Qnw==
X-Gm-Message-State: APuU4Z8q3+1ZUrDQze0awc7+xDEpHAfxZ4Dbtj0Isgs61Iy3qqUGDfnx
	d1ieZewoRPgEgigsS4LdJE/tpI0OWcjN7KXbFLHF0Y5HeJJPCUpGjD8KFLP3WO4gkz9EYz/IyYF
	iJLkfnI4y+w==
X-Gm-Gg: AZFdTZfnrq2re4lra34+oCtDpb75eGe6Cl6JFf4x9eZuwac77NgMK4YdsdmONoyWl16
	valPF0Q6ZrFnhJj1t+hkpFbseQDD2dWXzo/b08t7eMnkGUwaHhWbPC19QefWZ/9v4BNDiL3vc1q
	Z5oUSAikoIRIJZm8gm4uE7LbW6otx0lWsQrZI31KhmY/zCMmQQkmzhu6LSkk5KGNs2+9OPCeyZo
	1rEYULRiKIfNTPwJVh6PZrQPy7X+dfLAS+nmGcvoMSFma/umkEGssQFzlFShNaNwjvEv1a7uSot
	VrYKrkXkrt2F6Ms9ybMASSzvqTLNhdZmuuQURX42871XVEcRF61R+x9APo77DDx+6jh18HH4Q/P
	+xjWHH113dtkGiuNI4PURFT5Ywj2VR1Pn7S1R+Xzmw0hBNp2s2nCUHkSm4aTLQBaUfrHQyzwXr1
	VcaLwi7ljXpN6W8dHgpjmIXKDQHxtXiY64ULfyI5P2cPlRuqwFk5SsA2E5ctVOJ9+9SbYS6eGU9
	1GdBbpc+Ftsf/REFqH47MR87JhS8v6E5rtjDYjjS4ArvgSWzuhmHca41fyzLnGELFj3Klu/n2Mm
	xV5ys9orcFYqLD5ON6o7XqS7IeuDrCgv9KujBJkSVlwZO0+ZSs0dRy1/oZP9sD6pIQXpfcvTz5D
	Y2T0qlop1fpqBKuN0fqw4uViy6KrBJIeK
X-Received: by 2002:a05:600c:a08e:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb887c3afamr286660555e9.3.1795461777050;
        Mon, 23 Nov 2026 11:22:57 -0800 (PST)
Return-Path: <tan.siewert@9elements.com>
Received: from white-mocha.local (p200300e66714e500bfe47b00fa11e276.dip0.t-ipconnect.de. [2003:e6:6714:e500:bfe4:7b00:fa11:e276])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm299291305e9.2.2026.11.23.11.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:22:56 -0800 (PST)
From: Tan Siewert <tan.siewert@9elements.com>
Subject: [PATCH v2 0/4] systemd: add packageconfigs for storage optimisation
Date: Mon, 23 Nov 2026 20:22:40 +0100
Message-Id: <20261123-systemd-optimisations-v2-0-0ecd5965985c@9elements.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2pq2+Kor/8OwwHaQMZaSTiUSw
 r9bMC5dnuTecyZgjIQM52KCiAMxhS6D3hRg27q7oyCXGbTUByW1EjxyQu9E6BN54jrlAwtXozH
 OKDzJI+RvH7Gh9+q9Vl/m1+2BNi2yZdESpxDHNTyoZfdrlH8agxJSSGtRyRL3O9dcDD7RY5d4a
 4OHap7nDxAanWXQAAAA
X-Change-ID: 20261021-systemd-optimisations-dae99d91e807
To: openembedded-core@lists.openembedded.org
Cc: Sai Sireesha T <saisireesha.t@windriver.com>, 
 Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795461768; l=2641;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=XMzwfZgvYSswmGgcC03twZgyeG+xX0+3zg2zplSpns8=;
 b=JEXcgDcbwaMYqVOULgn3THu8qyxYl6s6b3LTXhT3Uvig08j2O75HmVyFQeQhWhvd+q3U/UHsC
 TUKcSu4pbWIDrLGSpOAeogSpnpzkEyL8BYLOAEkLu5GUeDjsL6Wzcw3
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 20:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250936

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
Changes in v2:
- Rebase to blacksail and systemd 262.2 [Tan]
- Remove PACKAGE_BEFORE_PN condition for ukify [Paul]
- Link to v1: https://patch.msgid.link/20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com

---
Tan Siewert (4):
      systemd: add ukify packageconfig
      systemd: add sysinstall packageconfig
      systemd: add hwdb packageconfig
      systemd: add fdisk packageconfig

 meta/recipes-core/systemd/systemd_262.2.bb | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)
---
base-commit: d612a1a307a0413aaed24df370627a1f110b0857
change-id: 20261021-systemd-optimisations-dae99d91e807

Best regards,
--  
Tan Siewert <tan.siewert@9elements.com>

