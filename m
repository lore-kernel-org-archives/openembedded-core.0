Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6935.1793791383680344715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 03:23:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bUz7Vk9M;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so4029695e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 03:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793791382; x=1794396182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8+0V+p2J/ZJmoCXcn8oNosQt4yfM9B4KumbJgEyUww=;
        b=bUz7Vk9MdLJoYlORZ2DnidZxRMnivmgFO325jF9qI/+2thk/8J1TqOJkQFeQjy6hsL
         8Me++jeaSNF7zWMbMdWOfYpaF5lRV/ke181Uwf/nJT7NvWbUOfX2AGVAZX6at5OzN1Zl
         v3t3LHbVw5/9XsnlcnX6bVs/mGORTY7iPqFtRKhFsEvCgxvqQBd8GLen54XVLDv/BYkU
         f88Lhv0s3K5q9Zu2eBp+wToluizQ1ANSI0fn/T1C7qW/tjOJRsh1HX5JdusYo8EAw3Y8
         NCnnVMW10frQndta8WaJgbVap+YQlZ8OhwLZkpXkYYU9ZXHjuz+S27p2GO8QzmoryvjQ
         TgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793791382; x=1794396182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B8+0V+p2J/ZJmoCXcn8oNosQt4yfM9B4KumbJgEyUww=;
        b=2eDH73O44DduWf2GtVKcXR9hNFkDJqRKlSoPEX7Q5wJgoYYEEYnpjjdv6cLwje32xt
         GjJ8uhIP+EUdeNpWcPfOIoDeReaK+3r/z6ZlbrfJXxIhuoj2UYrRpCr4WusMj1A8KxIH
         Jivt6oKn2PC0xcGixDdt0MLlshJm0aF9iFpYgX2W1Hr6y1l+VfD0bcdYRPL1ZgK1SVvv
         0LZBeidMxfHqLETmwm/Xz2CPWuRjZy1yZaYBfIbkz2Cxr3D6E25QnS6uaSbKwMPgzOdy
         +hjkW7uC9Q8Pt0pGtzaKlNphx2mmgL6GkQVY5yLUS+DQhD2cS4vUxwv8wM08Up2zPQcQ
         6j0A==
X-Gm-Message-State: APuU4Z+xi9xpLMF3A735kcdN4eZfERaRW/7IfUEVLKMlTc1LvoQK6zZc
	c+eacQKCEHa+FwN2TklGjjBOmkesrF0/kwf5TVCNzywGNDW5WMKvhq3CPM1ayg==
X-Gm-Gg: AYBFou3HYOerjSn2h+iZFAPITIv+Q3sV6SeMjoUl9a3X2lLp0flFz9qrkM8Yun3zSPi
	7SUIoBcm7TXEODk3zhYktn4BWCiwg368DqVm91pJTJCTEKq0AqJ/fkLqhb5s4vLpgzMM3FqR/sb
	MhJdEdlJM4zk3Y3nAwJtlI4K5RbGOVLUNTVhkZGr75qPHwf80U3vhcCA383AQ8H4oyESXy4WSEo
	587gkAF0V2el7Fvo3ihLFzhwEVbnsBiPPVlNFZVlaPaT9LVCVE0hFk29DSdXWj1mSoLqQdNQ8no
	C2PE8IqqqwFUul4vP0JnByA8daT6iWPZN6JWLhlXti+TD08y11fKX3vOWmzfIV2fnVA+NbD2LR5
	OTVJQntZxHDTQ+ANr0Cet9Uc8v5zPdp8AXlXPP6xfzgaDBKrKqr1CqtWcLRy9Z04/NOQWLjQb5r
	gUTtCAiRm6Eyv4N1EQIg8N6uRWUToaHi6/TvXJa7egJyueeKSceba2nR1BuZe++gfQmQ8wSUUqU
	cblaj0axypbJ+IzYhRGdjjI3FmOBCtpzaNLgZXk5fU0mM9GvHGlA+YQjQ2R8kDvr8Rf0inL9Vza
	3qRKDcmVOYE=
X-Received: by 2002:a05:600d:8082:b0:4ad:181a:4348 with SMTP id 5b1f17b1804b1-4ad181a442cmr252206675e9.18.1793791381853;
        Wed, 04 Nov 2026 03:23:01 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b412e48fd8sm45024275e9.1.2026.11.04.03.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:23:01 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	Stefano Tondo <stondo@gmail.com>,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [PATCH 2/3] spdx30: Enrich gitsm source downloads like git ones
Date: Wed,  4 Nov 2026 12:22:56 +0100
Message-ID: <20261104112257.866914-3-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104112257.866914-1-stondo@gmail.com>
References: <20261104112257.866914-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 11:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249365
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

The source download enrichment only handled fd.type "git", so gitsm
downloads got the VCS external reference but neither the SRCREV as
version nor the PURL. The gitsm fetcher is a git fetcher with
submodule support and carries the same revision, so treat it the same.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 803a9e05a9..7f3280a763 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -426,7 +426,7 @@ def enrich_source_package(d, dl, fd, file_name, primary_purpose):
     version = None
     purl = None
 
-    if fd.type == "git":
+    if fd.type in ("git", "gitsm"):
         # Use full SHA-1 from fd.revision
         srcrev = getattr(fd, "revision", None)
         if srcrev and srcrev not in {"${AUTOREV}", "AUTOINC", "INVALID"}:
-- 
2.56.0

