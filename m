Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDCBC77B6F
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:56 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.162548.1680796966123452587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=B58u+JGX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id x15so37652906pjk.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796965; x=1683388965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7wKPdAFfi1EMmTlywiFS9ZXS8FPww6XGmxAsaOZFvs=;
        b=B58u+JGXBcrcS7gyQp/baoCbq1qTKeMy/8cLkBYuW4g3hxZWAv3USU8UE8TQyddb/A
         HSBS4dZ+Zr0kYPiXIf6ioMYw/MnuhKZXuenB9jTs8OF8heF6krKO7Wjkj42di/6MM/U3
         Bw/5THz96JxwB1ebG2iswpsoVkLZlbDNDZ8+A3W9oISMJxZ5xePgOMUiRy9hugHmfXhg
         rJJY9K9GY9nB4KiYLQo8GQbeW/yBzwmMlZA9jzYdaMSv1i79+AUM7P39Y4l7Ei8Hd0es
         EL0h8jePGSwcxYAZ5McHR8d7/CWt8tNgTetgAb+QMgd9bBFC0S8693Zuc3izXNhKBgRY
         b/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796965; x=1683388965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7wKPdAFfi1EMmTlywiFS9ZXS8FPww6XGmxAsaOZFvs=;
        b=int79lALwTFBGMxRHVnlwVp1Xa6ImUX0xeV6qA9Qjfj7NYmSYhoS7t1gajxx5HkzfT
         9sQYo5pYTmQrmvW+L0IW68m+ZeeJiAn5AJaaF4pDJNnGXeXGwOiOvkrgPMdsQkNdFy/F
         Axn0J8ZTa8sV3gs07a3V9iow04szjLkl/1TnEiO5SnniPWSZ+UjyCc2yY9t1+9SkkU9g
         xLhzcPLUJ+svSOOqEtfQ30eb3S6htlen8r0N87qCiahAPCxgMaGkXfHn5sqzAA44udR6
         wrYBJoTFiuk6ICrSR/eC6TDhDFwIcZ4vRGADidoEgfWjkdmlzVmvIMrgkfPqG0afnV1J
         nqBg==
X-Gm-Message-State: AAQBX9cwSZCC0JcoCJWHHLCQ0rNUXpEo2SjMxHH3oXo9YEr21B3rOsUn
	AsCe9ur8Iia8/ZzdJASgCcjsin17B6ZR+SKTukg=
X-Google-Smtp-Source: AKy350ai+pQPEEN+0sh0Q1QbxfWeVzP9XvLMdTZU/xaIzRw3pWv4mmjBgcRyMD0WP7iWQmOzO3G8og==
X-Received: by 2002:a05:6a20:b127:b0:db:52da:367a with SMTP id ed39-20020a056a20b12700b000db52da367amr24876pzb.33.1680796965095;
        Thu, 06 Apr 2023 09:02:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/26] oeqa/selftest/cases/runqemu: update imports
Date: Thu,  6 Apr 2023 06:01:41 -1000
Message-Id: <21a31082b7100f82280c1e0b225e6d82b9f6e4f9.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179792

From: Enrico Jörns <ejo@pengutronix.de>

'tempfile' and 'oeqa.utils.command.runCmd' are unused while 'os' is
actually used.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50f766233e83528eebeca92877277374c7193530)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index c1d277a095..72ca77b845 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -4,13 +4,13 @@
 # SPDX-License-Identifier: MIT
 #
 
+import os
 import re
-import tempfile
 import time
 import oe.types
 from oeqa.core.decorator import OETestTag
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu, get_bb_var, runCmd
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var
 
 @OETestTag("runqemu")
 class RunqemuTests(OESelftestTestCase):
-- 
2.34.1


