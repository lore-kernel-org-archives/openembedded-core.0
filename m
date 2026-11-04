Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11930.1793806539568341832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=w+lQAuXF;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-539a57a0b1fso342477b6e.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806539; x=1794411339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AK8f3hOQcWHtx7nWInDFYqNaBG1dYLDaUXZAyD+2Vy8=;
        b=w+lQAuXF49xUWGz7jOnokRmyX/lg9VH67jeU3Bj/cNV4uwiUNl3DJgegE6IPft43TK
         uxiD08Tldw2V2DEkwHSVgcwSD2zQbmVw0GP3bDai5ioB/sb0FYijZS8jYYQ728mYG6Av
         UvlbmyOR30OuqD+qqSG65a01Tq0tjRt8xAk/MHc9A39C+AAjveLWyvBKnKSrVF/TYEq/
         DyK+SW0cQBk1kqe/Y6t3sYrM8+wp3tLxvRAqe2DUzQ8P/HpcxtIvGEr1R0rq1mLR2WsG
         SHkeQdBS4LbB5UhzmvcFEcPaaDa5PuYGnAsB8IxRM3R+QzNXH9KCrtjT7GdGqA6ceUvp
         Iybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806539; x=1794411339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AK8f3hOQcWHtx7nWInDFYqNaBG1dYLDaUXZAyD+2Vy8=;
        b=I/zl8MTKLzg7Ek+jBrEbkfMmrlOZfLixSAgSBdwkf/BM3qmqsUN0ae19VXRJJoTIti
         IaSYQ/LKVQUpSWkqGyad2/t81kSzPm4CZqhAFJsPZAUsxtmUedj7Es44Gom72wn/XEb0
         Dl+IgkSOGkNTF35Wpt+bXCfLs+LHJlW49GI6VUWMP4B+KfxY34pCpTaBjiimNS1A3u2Z
         X57dLxkGRK6v0CTtK3OvhR2zBDbAlNUPUAhEs7Y5gTpbhKP/5lsZK9cLyhYAigMDmfU0
         Kq9/+lgXzAecmMpkMw/YZ/Cbv+Rqb4ydAl7ozZoKD8AJBt8nIPx4ISvyRY8pFXV4NKlo
         KSqw==
X-Gm-Message-State: APuU4Z8V59o3nOJ/lxkm5klN3Wpl83XzwfxrUwXLHRtIEU+w4WgQqNNN
	EO+md/UpP7eabdFjGgNmhhX+xu9fUIBf2AI3mZg64+7Q35HBObLT0ugtQr5FbA==
X-Gm-Gg: AYBFou0FqK/gOF75fRYqd1X3GYPHBHpjXJO+2aHImS0VrqHsAz5vZ0z1YTxfXYdwKO1
	yPT6Ee3V6/ldTF6FecT7+ev5WOsPkTJtSnmb2m9wYhNC2TxmvCjC6uhw+samFG/7RbEaLHHx2jx
	AXW4xvXyfw50XjIWSWRlMcZXjqKnJiVZJGRLmy4THn1G/Aybzv/WxlMcj1WRkZ43JAaMDPwwfw2
	0jqzlILi3TCgvyQSo5MJ8URiDyBUM2xjhlf1tqQaAZA1yf/FtMRBJctETecR1Go1F75NZPMlcLx
	HCDYIRfIqqWf8KVgzfo2b7WNXNEPxfY+dX0jhJnig46PGRMLCPEkscFw2LlTRpCyl4t9EEWRLap
	98CRk1Rsp+zrbHusAFYKYlbDMVDDYOp7eq8kREewn3Q4U17+f7lLUOAcgJNuv8MZ4zgPIk+GIrn
	TV+oOr5DpM4txrYBytII2TT5SvY9QOi4cszW6oTYtO/hWwTAKbjRMQowm0QpRsERn+Be9WTMVH1
	AypchHl6crUDnNFDNPNqNwxQJvoHZluaUxRbd0ajgx2lJD7rEa/ljSjV2T4GLX3YyqQz7lqahQs
	5ckMgeMN4ux9dsgUFqzTTQ/CIrE=
X-Received: by 2002:a05:6808:309c:b0:4cb:b6dd:2fe2 with SMTP id 5614622812f47-5640d919f7bmr11891530b6e.4.1793806538511;
        Wed, 04 Nov 2026 07:35:38 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1d6f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9f8basm1894928b6e.12.2026.11.04.07.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:35:37 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v8 0/9] Implement SPDX for deploy tasks
Date: Wed,  4 Nov 2026 08:33:53 -0700
Message-ID: <20261104153535.3184146-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028220609.1348489-1-JPEWhacker@gmail.com>
References: <20261028220609.1348489-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249394
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
 meta/conf/layer.conf                          |   2 -
 meta/lib/oe/sbom30.py                         |  46 ++-
 meta/lib/oe/spdx30_tasks.py                   | 323 ++++++++++++++----
 meta/lib/oe/spdx_common.py                    |   2 +-
 meta/lib/oeqa/selftest/cases/spdx.py          |  11 +
 .../initrdscripts/initramfs-framework_1.0.bb  |   2 -
 meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
 meta/recipes-kernel/linux/linux-dummy.bb      |   2 +
 14 files changed, 545 insertions(+), 105 deletions(-)

-- 
2.56.0

