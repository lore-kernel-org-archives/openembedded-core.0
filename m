Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF4FC25B04
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:54 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.143548.1671132064789602923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mwkxyeEN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id n4so26739plp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPbG6El2UBo6Z7Nf4YQOoSSBZXuUF9oRLLtJboaiEpM=;
        b=mwkxyeENPlJuZNeDsjuUFpEAccmHjzKvVEBcV4/tnehR3aiZJW71PdKnS49S74aXss
         +ZkoWOSYUHMjt5UzSfLc1vz8YI95+xMfO5+Qjii9UbrUxkO19ZqxBu2efsFzkAdM+V6B
         OPgmfy+gCF0K30HFFIaF9O7Z+KBTn7TuPN3hyzxCpAQFgcdN/RSpD5U1rbd2ND9FaMiO
         iY5gadGY90gFx8b/dJMwSpFRAyst/mQkplcEpfvlTelgrMAeHCqU8JwCV3Za5wslbjX2
         qSPL+mc1EQOxPGR/NdmDwfinVzlq0bxbeSXOEW9ZnQvQvSiHWmcBZWJBKwJtz9QSDRGN
         BlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPbG6El2UBo6Z7Nf4YQOoSSBZXuUF9oRLLtJboaiEpM=;
        b=JR+OLT115HVSiA0TBIL29wyEwFlUUcpTrE24bGkk4PcNHJKv0NKIyINvxEtKUIhN63
         7fUi31S28BrozLbGVMf+UfYj4AfqgENL4cNFZm8uy/5W23UhSdQFghE2QKkL2oJFdMgT
         ZdtKs5MC5ZVh9h4Hfjqb1IhKetKE4tc/Z0sF5vivk+pZNL+YFvz/fo0RkG5itleNssZv
         ZeQD5Tk/1sab9P81DoPdlXamtLDxEn9i0wpA34a7DhJcFvhFs/jMBDjpXnIUfl3/6mGN
         2tmtwpHAJdc3vbo4mdgemLfuZbpKki3egrlQdzfEb2JqnuGC17od3+cGFTGHCqFtU88n
         yVng==
X-Gm-Message-State: ANoB5pmrWL7wbwLgmZNTh5kl75m6vjln/ymjeeYeBU7tDfcGRkP9O6pz
	6jCH3FJSSe2EghbtmjuY9XnspIPXei+mcQvXUVs=
X-Google-Smtp-Source: AA0mqf4EO2mecePWqBpfOab+bmmUfSn5WWfzg9DXP+RkK4RKY9tuuD6Fmp8F3KFIHUKBG7aPRfinXQ==
X-Received: by 2002:a17:902:8494:b0:186:5f5a:5842 with SMTP id c20-20020a170902849400b001865f5a5842mr33440836plo.11.1671132107558;
        Thu, 15 Dec 2022 11:21:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 27/30] combo-layer: remove unused import
Date: Thu, 15 Dec 2022 09:20:51 -1000
Message-Id: <90275f88d3dc0fb2b5ade58d1b9bc606a9a73a29.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174619

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ebfab6c3034d41252d19c6e1a0ba79072aa51146)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/combo-layer | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 045de65642..c122f4b5e4 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -21,7 +21,6 @@ import re
 import copy
 import pipes
 import shutil
-from collections import OrderedDict
 from string import Template
 from functools import reduce
 
-- 
2.25.1


