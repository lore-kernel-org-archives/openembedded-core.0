Return-Path: <massimiliano.minella@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EBAC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 14:29:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.12294.1699367362544943525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 06:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HApYz09D;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: massimiliano.minella@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32f87b1c725so3983789f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 06:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699367360; x=1699972160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJwaMMs4qzJi3UCZL8+CVIeofzaaenZl6L87tWm4OUI=;
        b=HApYz09DMKogSMwMhstHXMLOAytm6OgZO8x0r6JHg2/lVtQk/C0lmA7drliBmm8Ofu
         gzTqIbBz/lWT28/FALKo41ymQ3FnhvZD95aRc29TIqFhZYHXlJBGmD8bmKxpg566vnK8
         yF72eX+YES2j8WDQM0z1+RiPdrsQewv4it5lrm+G5avjVMhDEhdr4joHbAyGFWYTBkwF
         vGNr6z5SF8Uv+qoILZQ41l0xrk+ZuA1hi6OhcFcioULvwf+2dDrxzsC7A/ndQ0Pebe9g
         jefHMrAwmYOJ6aZSpDRYVJScnxxALxGyouZhmKCIVmnIyLCSfpXN2U0501cCy88jy8y1
         rw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699367360; x=1699972160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJwaMMs4qzJi3UCZL8+CVIeofzaaenZl6L87tWm4OUI=;
        b=ZotEgkEplYzRDai+8rRLifs9bZ9qf91Ph+b7qzgpDCFBz5Q73zFMPezurj+78ewCJ5
         wSAC5XOttW5VCpLURXEs0y3JKREnNkbfW/QWYV4c2fwWySoPr3RiTeMWTu9p8xmpgmhL
         N1Dvrjh7rWZqpyF6uRNik1PGXa7xPeVJkVdckxdkFfkb1oXfPtEuw5EGpQmSZCg5py3G
         yz1qruvFFYP0HHyC+dSi+eCetSD41T58XR6OAAI7MYE0TUtZsKHn0S6bSBqICfNAud4b
         XcXqhqsXUK7/O+oIRrGetVqRPywaL43QdF6FKsdNv/UdBQF5tmt3+CyrYLh2HNCTZMqD
         wE2A==
X-Gm-Message-State: AOJu0YyTz3egBpz4vEKC5pfS0xa7J8DUHE0uv1fc6kiBMnO9Jj2bQ5GQ
	wWgIWSy81Hb+Z6VDvIbontP9OoB1pyxEuQ==
X-Google-Smtp-Source: AGHT+IGJSO8IhOEkASkpWENODnGx6BzkyCO8wkNQx6ZMW5/QTjZ5JEORahr4J/8XuXV3jnHnW18WnQ==
X-Received: by 2002:a05:6000:1882:b0:32f:7f78:e29c with SMTP id a2-20020a056000188200b0032f7f78e29cmr24467488wri.38.1699367360179;
        Tue, 07 Nov 2023 06:29:20 -0800 (PST)
Received: from localhost ([165.225.20.116])
        by smtp.gmail.com with ESMTPSA id k8-20020adfe8c8000000b0032d9caeab0fsm2534379wrn.77.2023.11.07.06.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 06:29:19 -0800 (PST)
From: Massimiliano Minella <massimiliano.minella@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Massimiliano Minella <massimiliano.minella@se.com>
Subject: [PATCH] systemd: update LICENSE statement
Date: Tue,  7 Nov 2023 15:28:40 +0100
Message-ID: <20231107142839.3345063-2-massimiliano.minella@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 14:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190284

From: Massimiliano Minella <massimiliano.minella@se.com>

As stated in the LICENSES/README.md "Unless otherwise noted, the systemd
project sources are licensed under the terms and conditions of the GNU
Lesser General Public License v2.1 or later", so replace LGPL-2.1-only
with LGPL-2.1-or-later.

With the exception of some udev sources that are licensed under
GPL-2.0-or-later (but are packaged separately), the project is licensed
under LGPL, and all the components are LGPL or under LGPL compatible
licenses. The package libsystemd is currently under the main package
license, which can cause problems when scanning for GPL software linked
to CLOSED one.  Add more granularity by setting a license for libsystemd
to LGPL-2.1-or-later.

Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
---
 meta/recipes-core/systemd/systemd.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 3ba0b5ffc5..ccc3236457 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -10,7 +10,8 @@ state, maintains mount and automount points and implements an \
 elaborate transactional dependency-based service control logic. It can \
 work as a drop-in replacement for sysvinit."
 
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
+LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-- 
2.42.0


