Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B360DC07E97
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:53:17 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.10466.1701211990595616269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:53:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nsHuj2pg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5c210e34088so4508386a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701211990; x=1701816790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfjAlF4azDb/5wfuX2hhZTXgJAgN6cxAudmW/sWG1LU=;
        b=nsHuj2pgLkVI+zjPXOvejIeOLBzUOw9cOPmq8Jiakr4MPSTUoBjgbJ2UH84BjRvE99
         kOB2reFBDy5JbzX+57mN2DfTqTgPumo8pNtpum/NZfZzVoH0vne2LZMInnA5HI/9nc8F
         Kg+WmVeefrzIFYKhk7PuXhQgTUBLgsJ4hIZnZ1T6ZuMTzmeIZnxns/m6BLjep/ZmGdJQ
         Yfe9ozLgmplHVDYWwc1/R2qGUlxK6S9YeCLFQdLfGnoMvGlOo2BBSeTMD76hwbKPJYXN
         aDJqdEkRsboI/57Yhk8mdKQwADAB58BXh2QSYZkvym6JkwkkxCeS+qw001zXg0Ny/hLY
         vm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701211990; x=1701816790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfjAlF4azDb/5wfuX2hhZTXgJAgN6cxAudmW/sWG1LU=;
        b=qe/1vUb8W3B7m9gSVaGtXzMKJQ4pqA4pFl3g+AvWmwhx4MP/S32r+0ildqxSNAg8yd
         v5cuxGHnz8J7HAZUkd3v87ljBqP62MdtUbvNtpcL7SRZPe3x/28kfItrB1MIy5DaqCCO
         myORaiVhtvRp/JJ77c/KKlTq/j3pT0ChPbQ9DB/VhYuJRsmskQ1zMFQVUcx2Hpo6Kl11
         f0GSwFumdf9Czxp2JjlAXi6eShaiANpg+OhbXRqbe2HMDdiT42NwBnuiv8lmR8apCMa9
         memKIvaPM5BiZWM/CD44A96SNldkqshmxKPuZ3CgjxOUbRWmUo6TVSjMxAK7kppEDedi
         Zf1g==
X-Gm-Message-State: AOJu0YznpRNEVZCR1CWtCXAOxQ+YnVbb0j0bseCrB2XzozquHWJAukDP
	eGzPLnJ2X+2/MrARXb6mGya9BL7+MSxHGgN1H1R5Lw==
X-Google-Smtp-Source: AGHT+IErTQQtxbnSDYFe0bSFdMSnv6JGACw3o61AMI831xg7L/u4PrMsGI5ff8dxw3t+OqRx3+lHSw==
X-Received: by 2002:a17:90b:4c05:b0:285:9d5d:709d with SMTP id na5-20020a17090b4c0500b002859d5d709dmr14396602pjb.49.1701211989813;
        Tue, 28 Nov 2023 14:53:09 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id cu20-20020a17090afa9400b00282ecb631a9sm9621898pjb.25.2023.11.28.14.53.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 14:53:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/13] vim: update obsolete comment
Date: Tue, 28 Nov 2023 12:52:38 -1000
Message-Id: <be68cf4c3e4218cc360ce7a645c92b631224ce94.1701210903.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701210903.git.steve@sakoman.com>
References: <cover.1701210903.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191406

From: Etienne Cordonnier <ecordonnier@snap.com>

vim 8.3 has been out for a long time, so this comment is obsolete.
However we still need UPSTREAM_VERSION_UNKNOWN, since we ignore
the last digit of the upstream version number.

Test result:
$ devtool check-upgrade-status vim
  ...
  INFO: vim                       9.0.1592        UNKNOWN         Tom Rini <trini@konsulko.com> c0370529c027abc5b1698d53fcfb8c02a0c515da

(From OE-Core rev: 65f5de85c3f488136d1ec2b1f7fe8d8426d6c5b3)

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 868a19357841470eb55fb7f1c4ab1af09dea99ed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1464c4f4f4..a12e3c8d89 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -22,11 +22,10 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
 PV .= ".2048"
 SRCREV = "982ef16059bd163a77271107020defde0740bbd6"
 
-# Remove when 8.3 is out
-UPSTREAM_VERSION_UNKNOWN = "1"
-
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
+# Ignore that the upstream version .z in x.y.z is always newer
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


