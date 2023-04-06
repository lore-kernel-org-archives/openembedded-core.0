Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A1DC7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:56 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.162561.1680796975445000780
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NMZ/R3nW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id q2so1814309pll.7
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796974; x=1683388974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ea3wJOyoVPGDfVTJ1za20bEFMltUjh+vpJLCxD+J0js=;
        b=NMZ/R3nW4DLcIWVoXKPU9YTpYkEJvs8DagkPhvopuZCVXm2MLlNjUZ3B7qaz+ElZMP
         e92uu+6fXvXEjZz3E622A/qF9MvRS+/3XlAhEkdrTQoq2ektVGYi4K/l4Ohwyh4lTDpD
         fo54o7sjTeaHL7+sXh84hiRxQ2ZhFoux/lJseyaSmeCAwNZvW7rm52i+as3ULnrsAIH+
         H1s3xxl+j7UbjeHVVURd7R8xbxB0d5Dm2JL5vijcpyy6mscB97SA6wXk4Ogh4twYcbhs
         7KOSFjHkmCSKvbdbqAg+lsFPio7c8o3uq9X3dQnkL3Q9Iznp2p8DXwT9Uge4Hw+X8cXN
         5ILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796974; x=1683388974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ea3wJOyoVPGDfVTJ1za20bEFMltUjh+vpJLCxD+J0js=;
        b=tvWOSDgLjtmeGFPr9DCgyQV7xaao3GMbxU40f/Co2vt+/96LEzG9Or4ZBkoMDLixr/
         lhSoyKs7nVPtWYFhUoC2ttTR7RPFTdqqqy9Y3fqEg54SZ5C9Xn2xMQeBUbFPRNHCQmQ7
         IHlk1tmDZMC7NSOfnU3EF/q11LXhKAmX89kA5zO4IQrHDApTTJEJYnh5JeauApSWcGbC
         WUMwM8OnXsBBLhWBJ3oY/7iXsUC8vUDmlY4A3Q6KrugAyhvgCJtoZWvszOzEWkWd9leH
         dh55qoHOXfmWtHzIt3ChadiTePqLM486YMW52R25WOzZWtP/TJS2/GughsZO/cIhRbSG
         jHpg==
X-Gm-Message-State: AAQBX9cZdy9K2EqfG/slEFEU3EftZS2bbG000iy+y7ff6u6JOqYvWhIo
	iDV71a7butvfQAVNy7RBgRYC3tdia+1sGUW+X8Y=
X-Google-Smtp-Source: AKy350YMwjzTt5ziMyR6NvdeMExIoUsFnkMgqFmDXqbT2V5LOtUwmLSPz45ekGJXnEvyQ8UeMGrweg==
X-Received: by 2002:a05:6a20:3094:b0:d8:cfcc:555d with SMTP id 20-20020a056a20309400b000d8cfcc555dmr54822pzn.17.1680796974525;
        Thu, 06 Apr 2023 09:02:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 19/26] oeqa/utils/commands: remove unused imports
Date: Thu,  6 Apr 2023 06:01:46 -1000
Message-Id: <9faa5ad7ea61a2edd121b526c688f964e0b656ac.1680796770.git.steve@sakoman.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179797

From: Enrico Jörns <ejo@pengutronix.de>

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c00b5cdd57c3d9c47d4780d6627c74221911b72)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/commands.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index c03ba52ef2..473aa38d41 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -8,11 +8,8 @@
 # This module is mainly used by scripts/oe-selftest and modules under meta/oeqa/selftest
 # It provides a class and methods for running commands on the host in a convienent way for tests.
 
-
-
 import os
 import sys
-import signal
 import subprocess
 import threading
 import time
-- 
2.34.1


