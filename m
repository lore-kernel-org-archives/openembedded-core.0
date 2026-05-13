Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C45CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 15:03:46 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9837.1778684619163429632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 08:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DLRuZRBU;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-439a8366831so907136fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778684618; x=1779289418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVl30Il4g+zGgUBuocg5KfmJ7J9V+xbdgS2IXXQs0eQ=;
        b=DLRuZRBUIcENn73a7rRakTiQR0qc3v/VNiG6x2thhZsTqbflXcUWGqyMYIgoN2HCCI
         P7zKtvot2/DA5KmYd2T7UIJSGzyrwCAZ5YlMdF+WwIsRD35Ezu9rBklBT/eVihWEzro0
         wsZ2AJB2lE0Yz/gQaKa/ZUY6Zg9MO/qConiNxiBmXvpqlkY7hAV8GojLTS4qlkVsFjKD
         jN6GeI9i4ZodUvjEKn70IkOyXHteOyYbor2LLVjZ6HttxEW0wExjBr0POdo1fgFtVk1E
         mbtkkxAppdtm8TzSdQva2j3dYQLEuD2G+tPmTgso1aMMEoUcY0sYRTmPnpaGlvysnFoP
         sFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684618; x=1779289418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVl30Il4g+zGgUBuocg5KfmJ7J9V+xbdgS2IXXQs0eQ=;
        b=DPbYQJP8Y/a2ChBBhuaGAyxT95ro/67CX6K/NFHranEWcXM/6Q/sYsHTIiyjJMZGKl
         lVvaeRt3sX/anvxMZKOFqMtAPx8x0q6k9m8zDS5TejXZTQqZtkZ2KV3SqKuMMAWg4P8Q
         K53uNo1Nq2f+mRUaaU/hY7xDo/O4V/7jL/yosLhAXM48iEAZBp8SUA5FomhdpJZgXtBS
         xbb3R0y1n+yBVigXBw7J3uKNimiUx6DEABzJTH+a+nPePBIx2/9a0aLywZjdSfr49imn
         A0HM2/meYHp8qHjNV7yyrWf8rzIKDlTLTGNWc1CxDeWywwx9j3EWr0DBleX1VuThI8y+
         vY6Q==
X-Gm-Message-State: AOJu0YzR6mM8BZBI3ALkqjrKjgXinY9nyD/DlLE9R7MM1mZDm/GqBmAt
	bkuPQ3l16tAjzN0c+ECTvz1J7gomaCdHZA63py2DyT5JRoCQObgEa51jOtD2+oGI
X-Gm-Gg: Acq92OGk5Byc7N2x8KU37fNOfW4729hHm8rO5MGB30hEG+d+KFI+ww3Qv5kxZs+2gxk
	aHVpQIc7YswBNEur3OrKgNJav3nTYqXXrJoF/7VWHz7Z0LvQ+qkxWjA2AsLcjUtMVuNyuiVYmDd
	dAEFd8VRoZuCrZYuKpx47WVz/qG+zKPLK9XK6ylCE6abiv2TznKtLOf48xDI+PLUQGRwGjL570w
	NRnthGBDsn/OFmgwMxFWWy2JA+yJNV1TNUPldYona3pws5TT4nztJPnhNOqQyzhMkdz1aB942iR
	wqm+2k3lvwT0gqpI87l/t1BBnMXkSQbs/LMgTn5u8T5Y6gl7N8g5CpQTtwD4yv7CSOAU9d4CeH0
	5vUzbTivnsyj/SmJUia0A1NgblWmXeMn/u0YDZ6WOsBmdPimzp8BQZZ2mh/N/e4ALnvtE3iGWo/
	qQnf+PHkP+EXHfyWdh3Oo+
X-Received: by 2002:a05:6870:eca6:b0:42c:d92:1c68 with SMTP id 586e51a60fabf-439ce36b71bmr2142705fac.21.1778684617951;
        Wed, 13 May 2026 08:03:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::c552])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-435573e7254sm14765400fac.14.2026.05.13.08.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:03:37 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/2] spdx: Use checksum list from bitbake
Date: Wed, 13 May 2026 09:00:57 -0600
Message-ID: <20260513150334.925178-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513150334.925178-1-JPEWhacker@gmail.com>
References: <20260513150334.925178-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 15:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236988

Instead of manually curating a hardcoded list of checksums, use the same
list that bitbake uses.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 1821dd7de4..0a30be5767 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -547,8 +547,10 @@ def add_download_files(d, objset):
             _enrich_source_package(d, dl, fd, file_name, primary_purpose)
 
             if fd.method.supports_checksum(fd):
-                # TODO Need something better than hard coding this
-                for checksum_id in ["sha256", "sha1"]:
+                for checksum_id in bb.fetch2.CHECKSUM_LIST:
+                    if checksum_id not in oe.spdx30.HashAlgorithm.NAMED_INDIVIDUALS:
+                        continue
+
                     expected_checksum = getattr(fd, "%s_expected" % checksum_id, None)
                     if expected_checksum is None:
                         continue
-- 
2.54.0


