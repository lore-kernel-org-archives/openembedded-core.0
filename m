Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B59D5AE45
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 09:59:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2954.1765619985373049229
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 01:59:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bVWQt5ib;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0834769f0so8791565ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 01:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765619985; x=1766224785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdaCYIgNQHRmy6FStZcozfr8+LmkbYmHXmrqkqGWkGg=;
        b=bVWQt5ibgQYNbAwH7BLrpvvC1a5lSC+w2Hmt/i8CcCQhEe0MzrY64zBT+7240btUam
         xOlO6hVSyOUzRaaj8jkJ+Vz6m2gBIKRJOm+M9ytuGfrmY2ibWO4bfO5/BMl61DAT0s9N
         OPEKUO0HOuYPSv1FY0yDrBQL9jio2HLZvXnJfTnl0KXIe2zkpGOnVXa4dN4ZpTj+ILiI
         JY7LAo+u4Wepb8kytzmRUkOWdxf8/h2XzXbmSuBohyiIzFGAB+3w/G6B7JVTcEhFLLOO
         t8Vxn790yA5nofhPkKYfW9ZL8JzujjLnkmpZ43p3uihDgDnxYTGdPjjYKxo4aEOPRsBP
         1tNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765619985; x=1766224785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TdaCYIgNQHRmy6FStZcozfr8+LmkbYmHXmrqkqGWkGg=;
        b=rfwOJsqcT/rWG3UkzWFhHlbXUPs2653pJkid2XcqzbkI95xKAaWI+n/ho4p3CQqJ1h
         TJEgdJgNFlqg3aXCisYRv1v0m3AZP3TRyFzQR93oO8YHcBHVkrrd3CWp77vvdUNBM4B4
         TV2oAQHUwY7wAoyoKeOncFDPjPeNyOnB0cw5eVRLHatuXuc+j6u5DB9Sbqud53EaT1oM
         425Fzls3YaD1nIZumIMDGeSoKNYp1OebYxR5HZm+HW84x1BedbnDaE2RiZCxdtfVQEHD
         rD9J+nnrKfymHvIgtmG4pqOMsc0u4Njv0oaUMzQFgbFDFL/xgUBF2rbcAi1j5Sr+Nsjv
         ds0g==
X-Gm-Message-State: AOJu0YzujPLrF9wOM9Z/TDkC8Js1MtEkC9m8/RpBX1/PFAS7gBTkcq9/
	MdarxzkL7ZImm1p5PzAskWwuH/51D4GIRuTju09+3lQVmF3RY+tmsQiJ5U2W5g==
X-Gm-Gg: AY/fxX7t7yOORQE+fAFS1/DuHdSBE53VaJ8ZgiwNK2eUoluFXa5uuJCiFLWlggzADoM
	BJ/iDG7/EWz9gjebJbdswlKRPkMWNpxQLsGA98VK72Mu2G3C9Mg/d2S7JgJ9nOOaHQrcBkHSvba
	a3b/dVTcJy+ynxTxFDy1X+6EWW4b1yh7L6uBGM5q0BMfhEKfC3bU64JyUfkMCKmdoipqB0lP3OG
	qk2FNFVBOTES8a7J+nVe9IWJXHt2D1iBD6B1wVkzOZniQ5V8+vRhswZrYcDhbK9oFTUaUAsTazX
	6oK5R58JNfsIQ/LAU+C5Y1pJ372CU+PqjoATp0PKUAkZLDw44FXVnLt/HZliZncb7a6QG8BjmJZ
	z8bSdNSoa47f5e9MDP9Z2C8BzQPTAB4oKI1nrt29w+aVBTIZ+cioi2Hr84swug3TFOd7r+RaqHV
	P6jDXqYEyhkwOYY0dpgD0Suu/s
X-Google-Smtp-Source: AGHT+IFOkFQoEGjNFrb6C+dcctNQ8hAg0zQoL718jtEGIkku3rBCaDGRv6B8uBbzvYKe8vloQhLKhw==
X-Received: by 2002:a17:902:cf08:b0:2a0:867c:60d9 with SMTP id d9443c01a7336-2a0867c6a5cmr27991675ad.29.1765619984562;
        Sat, 13 Dec 2025 01:59:44 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.01.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:59:44 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 03/67] squashfs-tools: 4.7.2 -> 4.7.4
Date: Sat, 13 Dec 2025 15:28:27 +0530
Message-ID: <20251213095931.2571498-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 09:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227621

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 61964e2265fa27dfa6791053b0ba5019ccd373bf)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{squashfs-tools_4.7.2.bb => squashfs-tools_4.7.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/squashfs-tools/{squashfs-tools_4.7.2.bb => squashfs-tools_4.7.4.bb} (96%)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
similarity index 96%
rename from meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb
rename to meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
index 8bca98f419..eb3974bcb5 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "99d23a31b471433c51e9c145aeba2ab1536e34df"
+SRCREV = "bad1d213ab6df587d6fa0ef7286180fbf7b86167"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 

