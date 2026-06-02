Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D244CD6E5D
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 11:42:16 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22971.1780400532030695290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 04:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iTRI4cKv;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf30d530bdso38487605ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 04:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400531; x=1781005331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yfz/JS0dCufjsmB5mpQSiH8nnDoNVzrMxB+5vomWLH8=;
        b=iTRI4cKvP/ZbUO/7Z2PO13BSmbSgOTOBXHayb+VJmnzoLSG+aYSUnA/q/0XGeYHg11
         OkvnWbO7qzspyZsIs2OEMDMX/ZC1KHB3V5Sjpbh3d/N+vW0bQBi5XF6bwEcvfebUtdFm
         oqpaT2NrRnODMFrUjUw49Xi9mMoTlY8dZ95aBgCJziWNunert4+ktG5LhMXcQVz4r2wb
         U3JQ9VoGvfI4+z9agpEBHh8UwkcUejIJFDS2jA4FNVngma+FXtXsTBp31hzfXBIa1trr
         XzNVQ9FMo+NePRS/g46HKFx1RL3c4WpaMg9v3ZjnR2x5rrO0imHiNmz2bWNUOEB6hyjT
         nn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400531; x=1781005331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yfz/JS0dCufjsmB5mpQSiH8nnDoNVzrMxB+5vomWLH8=;
        b=PVxzYcBnnFYfxMmgDu3d8Dg4yKohn1mJuBQcXZuiy1a61QC4s4+lPgXsfASzSuLoEn
         JCVVxtM/7Fssb0pnqEGRPfhRj/RJiGFodw6es1PR2e/kv/gmwlCfpfk7NNbcErXZcqaN
         gip1lccffMexNy2L50kPQEeMPEi+nH4w2nmHoR8HtmhDb3GTFgPjYDgz1NyyBZYzBZ2v
         XBw9BZPYtO9ekB+dieCWD6G2see9IEuTgIlTxmAC0nSelbW2zsf64aLxKJkXx8HXyhVu
         WHaCCJAjkXHi+yWFXaZbvaSZ1jR97+Jw6gLDfxK/S0aHQh45aKmQL1gtm8mUjEX7j0RV
         Zhow==
X-Gm-Message-State: AOJu0YwXOa9ZHC4NOAlcIbUohzGYFZzG9rUbkrjV5AjSfGD4DmFg9W4U
	2tU68nSKe7cNC8BPu5mU81gRHdIbRo6aX3hfHCTCHU2wv7ut+NyZdryJXgSor3fw
X-Gm-Gg: Acq92OFOfBwMyYVGCqLxQOa6SGh85qyY+IU/3HEuoEOwsildWjuS1FxrnN250NdBtav
	AxCSYYax2yYqyKxBpkNOIMoBNlFrNZAztCaQDjrQziSpHmXkpviafKCrn+v/5m0I+QL5xxTMuA5
	KdAO7pndEaAJAEyJ7dES+rD3D8o6NpSq+TQJlNnoBO53be9nwMN2QvDUcRwd1k7hBXp6ydc3lTN
	ZdYvh5YEyiso4s9/vJUSdD5c4qTlCSesmPFNMPVXR/aehHmlH+cN5UYgW9EMJt+vTf+oPD6Jyim
	K4bQW1pepNwg9xwXJx5OTvgDZRaeVwrjF56+aeEPJEV1RL9tjhrLRPu31+Nfp9oH98FXh3A8bPW
	HxTFXqRdOjt5DCGct1225qCIrL/ouceyRVi1DQqn6I5ZYyILCM2ysHTGnT2H0sjkKyLABU4+US7
	/TZkpoaETOm7PYE3hR2fjVtKeDp7lrh++5jeg1wOmDI1RhoVv6eQG0Eb+QaRlEUL8vFpGvatKbr
	YG0hg==
X-Received: by 2002:a17:903:1905:b0:2bf:281f:19ec with SMTP id d9443c01a7336-2bf36803dccmr177654595ad.24.1780400531347;
        Tue, 02 Jun 2026 04:42:11 -0700 (PDT)
Received: from naduvan.timesys.com ([223.184.95.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c141f883c6sm2703035ad.77.2026.06.02.04.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:42:10 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [PATCH v3] qemuboot.bbclass: add missing task dependency on kernel deploy
Date: Tue,  2 Jun 2026 17:12:04 +0530
Message-Id: <20260602114204.1646653-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 11:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238031

do_write_qemuboot_conf had no dependency on the kernel deploy task,
so if the kernel was rebuilt without invalidating the rootfs sstate,
the task was skipped and .qemuboot.conf was left stale while new
image artifacts were deployed with a new timestamp suffix.

Add do_write_qemuboot_conf[depends] on KERNEL_DEPLOY_DEPEND using a
Python expression to guard against the empty case, since baremetal
images (which inherit qemuboot via baremetal-image.bbclass) do not
set KERNEL_DEPLOY_DEPEND.

KERNEL_DEPLOY_DEPEND is defined with ?= in image.bbclass and is
already used by do_build[depends] for the same reason.

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14520
Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
 meta/classes-recipe/qemuboot.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 56106b1958..639d4bfd9c 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -128,6 +128,7 @@ inherit image-artifact-names
 
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image
+do_write_qemuboot_conf[depends] += "${@d.getVar('KERNEL_DEPLOY_DEPEND') or ''}"
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
-- 
2.34.1


