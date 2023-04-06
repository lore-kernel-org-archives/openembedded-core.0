Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2636FC77B70
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:56 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.162539.1680796971803094908
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mt1KZh9P;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id x37so24024469pga.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796971; x=1683388971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJumSe93pZIKv5lRmTOyhtUDMOKK0Jyr+T0eNgl7Upg=;
        b=mt1KZh9P2991+e3ow8dsFqSaNmJ8z0v8tdRgGi+WvAPCFK0/2vstvLpUBXhLpUjNuu
         d4/+K35umpTo9pM4MPsQA6z1yEAaDz7rQjEFPJpIZgTR4exbSgGXU8Hu1+tl2dE3u/Sb
         WgJcnXG2BxmSUA7MlkZBMKQWaWqECo4qLgNP2J2jXJ6Qt1OJaGf0ljhpscIH0Kl1vddL
         1p2o5CcjIDltRUGcQJ/cLalB/GnTxzANtD+UynBTWH4qp2ZdMLf8STgeSADYTERPzNpV
         4hAuk0wrqWUidxpUI4E66Fabp1CrSkta/pmlt4gTfWB0NAW341SRpfbQVOmvOIAss9Jf
         THrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796971; x=1683388971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJumSe93pZIKv5lRmTOyhtUDMOKK0Jyr+T0eNgl7Upg=;
        b=OY5PGsLIc9wi6cetGc5tatRetETOCgiJMWD79BvILlcv7Va8VYXa8XpbqYp9RZvAXy
         U+8Fll8DIVgYoNUB8FXk9UGTc2IrBk6WiDlvoqjs3VH0t6uDZXzZ/2AknPj1u7sxq7Jp
         rYwgOmLfUfy2Xm7oT+TrvzHKTXKosm0bf9xTBgzBVqY0SsqFpXafMpRFF1+HM+Z1sPTL
         fJnLFMc9dbmP7N8EsNWkXVZakVXy6nzXVSy9/88ODvc3ECvqbfXOc60RYdxjjjf32mNj
         Tx6Vwg+IojY3sFiUaOZMEZ/XoAJSOBBIsFwFdHYj8//+FW1aEbEFxS3GTC048ponEv3w
         iZkw==
X-Gm-Message-State: AAQBX9dB6UXfh723B3E8iYJf+ZIRzHKJxgEV+kSPZwp5p96h+oWivRRz
	k88tz9CkTMkqEn6d7JSZ1d67CmvjPCSsuD1jUmY=
X-Google-Smtp-Source: AKy350Z46Tj8ZKIeb//Y5ddx7Wr10PETtgODxJh6N+Pt+WslYx6BH99WJvh0Zi2xy3DV85XWpESE3A==
X-Received: by 2002:a05:6a00:1d8b:b0:626:9a1:3731 with SMTP id z11-20020a056a001d8b00b0062609a13731mr6367227pfw.7.1680796970781;
        Thu, 06 Apr 2023 09:02:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/26] oeqa/targetcontrol: remove unused imports
Date: Thu,  6 Apr 2023 06:01:44 -1000
Message-Id: <6659360828b5d022b90e71883159a75f4def7382.1680796770.git.steve@sakoman.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179795

From: Enrico Jörns <ejo@pengutronix.de>

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 46b42edbf814d15be3a18283018ede2d4f817bc6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/targetcontrol.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index bc6b91e994..f5f2ce2f12 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -7,18 +7,14 @@
 # This module is used by testimage.bbclass for setting up and controlling a target machine.
 
 import os
-import shutil
 import subprocess
 import bb
-import traceback
-import sys
 import logging
 from oeqa.utils.sshcontrol import SSHControl
 from oeqa.utils.qemurunner import QemuRunner
 from oeqa.utils.qemutinyrunner import QemuTinyRunner
 from oeqa.utils.dump import TargetDumper
 from oeqa.utils.dump import MonitorDumper
-from oeqa.controllers.testtargetloader import TestTargetLoader
 from abc import ABCMeta, abstractmethod
 
 class BaseTarget(object, metaclass=ABCMeta):
-- 
2.34.1


