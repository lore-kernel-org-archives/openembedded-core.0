Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32662C64ED9
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.3837.1676835066214117063
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K2yGQEo2;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id t6so1030664wrz.7
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGL8TxOrXAudUZTPZPeu3uRk4A9PCIo92wRAgD9WNiU=;
        b=K2yGQEo261aoR15Al+qWaD8xrBdULgsY9gLMeCGDqlcE+3A4j99/mnqLF2G5vd/IB4
         axTqFd0joMgiDsV2QvJ3mg6YV/XtUz4Sqj3PVrmOipGfpJjMwJUZQEhS3hUFOsJGOLUL
         q4GXgiscuOMAK/Gtuy7UOEnUR/ftFywA0SBUAFC3qIp/tkJeVFmCS8GkXg0oBXW0LgYT
         lJ9BCOAnnyUIIJ0VCTUZLwl9yRVeNt9Pnc+IIG/aHiiaRGFI0vjQqx+LUx+iqyGQAWz1
         qAjRVH192Cl3LVXLpIsSo6YLe6GZmgZF1OreZzQn2y3onJ8STy+0l5FppoHU59s+wsrY
         F63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGL8TxOrXAudUZTPZPeu3uRk4A9PCIo92wRAgD9WNiU=;
        b=uC/Em3fSvSkEm3BFMkp3TD6wF5THSXKKKEAFgHYEzqsfwc1gJZ0PX0jaAu2+L+mLbo
         QR+IT1I2vnVpbA8/NwikET6KRDardVIX54nwI38Gorz5+702GLOCz5JOYLTk2sLFvXmQ
         sXsXxCsQ43N+Qc7jGBk2R/hW8ntD+Z7bcRoqG9Zz3VPJbTewh1jyo5JRW6GLkwDqrd8A
         wnLnkXMJ5IBFVBoSOBMUCYMd06FuR03SQVYQDV67trtrHlLlc4KSWCpQoAJlKwRIVhVC
         cwDClGYpIxioRjzoEQzm+Xa9A+5R90Z8sGGt7H2UpWRpOVWm23N9HN3iDXgQJWtIVVvF
         7IVQ==
X-Gm-Message-State: AO0yUKVF3eUU/iFCqmrZigPeQCWXoMPvZb34pIU2O8tKWMT8/cgh1hVK
	IFLWTavMwscXnfsW1vnLKJJNhEkgbIQ=
X-Google-Smtp-Source: AK7set97EDek+0UzqBnPCfF0TIv5xsRYPAHQ8Mo3u5dOmlDTnkQBk0BXM7i1gVTl9pvjlDtGJq3UVA==
X-Received: by 2002:a05:6000:1102:b0:2c3:ea8b:2724 with SMTP id z2-20020a056000110200b002c3ea8b2724mr1673971wrw.21.1676835075379;
        Sun, 19 Feb 2023 11:31:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/39] dos2unix: upgrade 7.4.3 -> 7.4.4
Date: Sun, 19 Feb 2023 20:30:38 +0100
Message-Id: <20230219193101.338397-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177359

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../dos2unix/{dos2unix_7.4.3.bb => dos2unix_7.4.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.4.3.bb => dos2unix_7.4.4.bb} (88%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.4.3.bb b/meta/recipes-support/dos2unix/dos2unix_7.4.4.bb
similarity index 88%
rename from meta/recipes-support/dos2unix/dos2unix_7.4.3.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.4.4.bb
index 0d71c38bd1..d8ebeb6402 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.4.3.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.4.4.bb
@@ -6,12 +6,12 @@ HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
 SECTION = "support"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9641fc4af7b564646f533f3911074b7a"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=37f72246ce2aa2fce9482c10b1f2b502"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "dae6d4bbc42d03fabb89cde65ed89f22a165d16e"
+SRCREV = "b56a58584d3fef0720425ae154c2a4d80e6af6c5"
 
 S = "${WORKDIR}/git/dos2unix"
 
-- 
2.30.2


