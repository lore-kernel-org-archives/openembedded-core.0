Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.220.1795827021070383750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 16:50:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cZLWdZYB;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: c137.marques@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso5474000f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 16:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795827019; x=1796431819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5qxLK4A8Gg8M6/JGTyJdfTcKBL4ARbjx6JuWzIcnPOU=;
        b=cZLWdZYBOVnJ6UMHuxuFb+05gaUcD+vHL0j15mmARNKD+8nicsVwzhpcM0amqD0QxC
         mTiK1tFa80cmbH6YjhJFydlfRUzRsuSNoPk++m4D4T9ptuwIvv4BMbXKcXa122ps4xmG
         fcGnAAURRxxpFPcWRgBOt11kTUFMe6DwYyhgbE+Ov47+ki/VdVOJx+cKSJrVeCexHONA
         a4vg/oZyK7kHvGuOqtqMvQZky9a6NyKFMV/IXc+PGFY6VX0IXpo58HypSJ0IQmY2Txhy
         W+F9MiM0CJ/5VlCVPJ/HvEClEb4oejez8tyFPxSbGQ5zRKzILN81mhXRTNQaLAbXOka+
         uiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795827019; x=1796431819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qxLK4A8Gg8M6/JGTyJdfTcKBL4ARbjx6JuWzIcnPOU=;
        b=exc39LSkOOs3j7P1Gi92I+N7EByjQEd0plHhoyoWC/Ye/EAadNVtyFaLKZUXKunBdM
         +oWtBZiBMbETpCS4VgbdWEeLtNBTZH+GKyxudWM5zzHZIAJckR7SCgUXEH/4+SkClKpK
         6zxSWBlmlzetKIG8fCVwrWY/eDU2pRk4bxl+kBPOi6xNTJ6aQBdOCvcijH5e2jKJ3iBz
         FapNezLql1kUHly55T6VcdDOGzN+0xIvwN6fM5B3BhefRY7MlXNG1xiyQxspHrBJ2WJo
         kIwj+RX0aEw2e1PP7NEbrpbp8o6Ym9gKKPte/ZLQ7/sraWoO1q+qQYP0GrBujh1RlP6+
         7zAg==
X-Gm-Message-State: APuU4Z/gm52FjNjYw2wmirGh2pOR0hIqvcJqTIs6FTQOKaokoVDK9NXI
	whW6hT1KzhOSJuB1tfeRYmf1TSIc92LfX5JOhR76W44ft8F8reWtxAsSx+DJGw==
X-Gm-Gg: AZFdTZc5y/MTQ3SnrT1NBbvpXWE8jpDqBcMUidvwy/0j9lnPISZwg5Mi9kpM+svj8Kn
	+7enyP8UVHnGKT7zfTrYj8s/vk4biff6hlrZ95v/5qbp7IPRnMwAKVEsqhj4NuFWJiBvGooR1Rz
	H1mJzcJ4BnhBUVD0R96OARLCOIfn5c+K4jEh4xLY0WVfz0EiR/me08tvpt/L7bL6xPt2p3MV4fJ
	Sahqm38oRuO0imbVB6SXHrxgj4dmmnJEvpasDpK1A7dPU5Kh7EKBlVrBjOeITFdnCNm2Q+uk78R
	rCLQg60N5ARXW99U6KP/G8bPXPB2NqGClucqYjg2KOiaVU21BkX2evekIFuYYEGhxt1Zoni2yNA
	m/dm4lebm1etvMyWhSUQweNN/hEYVFyBGeTYwTscJKKXCHy3+8CIbAhd1gXBlMiop2XN7/PKq+f
	cpsyhPuumTS4S0/dyQjGGOYYte6W99zo/JTLsctvqNxQf/nJzX9GhIrkkTDYieyCZQdANu5GCGC
	XXVx8CsbTKLzdsad/+IdZAVtx6WQhu3b73cwbBTI/GmyzW7nqupA+ZA7XW8tAZe8QlA5QHFaoVs
	Zeh9TcR/FRE2LLGrTcFamA==
X-Received: by 2002:a05:6000:4211:b0:4bf:35cf:ba89 with SMTP id ffacd0b85a97d-4bf35cfbaf0mr6842494f8f.19.1795827018989;
        Fri, 27 Nov 2026 16:50:18 -0800 (PST)
Return-Path: <c137.marques@gmail.com>
Received: from pc ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm46864646f8f.18.2026.11.27.16.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 16:50:17 -0800 (PST)
From: Alexandre Marques <c137.marques@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Alexandre Marques <alexandre.marques@ctw.bmwgroup.com>
Subject: [wrynose][PATCH 0/2] spdx30_tasks: fix missing content in the image and SDK SBOMs
Date: Sat, 28 Nov 2026 00:50:07 +0000
Message-ID: <20261128005009.4101905-1-c137.marques@gmail.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 00:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251467
Content-Type: text/plain; charset="utf-8"

From: Alexandre Marques <alexandre.marques@ctw.bmwgroup.com>

Hi Yoann,

This series backports two SPDX 3.0 fixes from master to wrynose. Both
restore content that is currently missing from the generated SBOMs.

Patch 1 makes the SDK SBOM include the target sysroot packages. The
target and host parts of do_populate_sdk both write
sdk-rootfs.spdx.json and the host part overwrites the target one, so
on wrynose the SDK SBOM only lists the nativesdk packages.

Patch 2 fixes runtime dependsOn relationships between packages being
dropped. It needed a context adjustment because wrynose does not have
28ffcc0653 ("spdx: Reformat"); the change itself is identical to
master.

Tested on top of wrynose (16a03ed6c2) by building core-image-minimal
and its SDK for qemux86-64 with and without the series and comparing
the SBOMs:

  - SDK SBOM: 292 target packages, 20604 files and 105 vulnerabilities
    added
  - runtime dependsOn relationships: 86 -> 209 in the image SBOM,
    522 -> 1396 in the SDK SBOM
  - nothing removed, apart from the sdk-rootfs build being split into
    sdk-rootfs-host and sdk-rootfs-target

oe-selftest -r spdx passes.

Regards,
Alexandre

Pascal Eberhard (1):
  spdx30_tasks: fix missing SPDX runtime dependencies

Prasanth R (1):
  spdx30_tasks: include the SDK target packages in the SDK SBOM

 meta/lib/oe/spdx30_tasks.py | 56 ++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 22 deletions(-)

