Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590E3C3DA6F
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:46:11 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.15391.1721310363796175670
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 06:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=POUFUuua;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc692abba4so3898065ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721310363; x=1721915163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3GVLHSi/qM8G8bbKOfi4PKAoVViXPkFKnsVuuHOf3U=;
        b=POUFUuuab1uoWsqtGgURh4ojFTDkOZJJXNreBo0YgksEu7QiVIWmvsVLubIsom9Dlo
         2rcXqZzNf9gIc6Y36K+O7hkzGd5u7ygRyNNM8rrEAXe67C6/Q4tJhCsk/1ysKEGmWXjV
         nIu+sXrCpkkF3TrhpRVMAKYoX12tJuRBuHq0nIbeXQJnaQ+egj2Iyp+bB2+XvXry7ur9
         H3H5wE6VrKKfnz9XJg0RnXt8uIvQCW1RL55rwxFNmWyEK9LXFJqnaGBfIpWocFGYP8RE
         R0xstav2XVQgsvh3MOpvkVVm0bREIh5TfwUWuNqmB0Xek9UvCIX3mGJyf2rawapbybIY
         A4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310363; x=1721915163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3GVLHSi/qM8G8bbKOfi4PKAoVViXPkFKnsVuuHOf3U=;
        b=HMEmKPcp/vrSH+HA0OotTxadTppJ1mCYXlhIMvO/D6/1CkFw7K3EsKWC/mDKT35wmZ
         ofgxnSC7L3CXFKGRNBxpUepfhCkdI5QU8APfxIEU0V4vU1CBtPE6CuVEUSNaC/FfLJFm
         8hHcfecdt+1UFQoQI98ePP8lqqxV9H34Mf94wZS7Fq37oXCszvkzu8LasNMXh6xkVUVa
         ehCWUHpNxsFEHHIEj1Zo+OaBCJBcZD+0QGiBRRQMU9msqIS8isr6JmG56YIWTkRh43Mc
         5JI+6L/5fBAqJSzzbk+SBXpXaOcs8FM24eJGu2gBZVjuoFxdhmnlY/gfpn6zQUXteug7
         6KVw==
X-Gm-Message-State: AOJu0Yx6hkYwdJ92zNFItNttlvfiH91N23+mxtX3m+1KHMdZcW+E6Qe7
	onv5lhCdYpFmbygNqwUTqSyKAwupN1dDDfgtcCfqq+ck4/H4IKUX8KIN17HR29VY0sy5UIpWLZY
	d
X-Google-Smtp-Source: AGHT+IFsuYPPlCc4YmL4a1bAW/eb4AmK5nBEzk5GgulJ6xh9KngZhAma3eurNTxbLO7x3/BV/7iiJA==
X-Received: by 2002:a17:902:ebc6:b0:1fb:9280:c96e with SMTP id d9443c01a7336-1fc4e6c007dmr42392835ad.62.1721310363075;
        Thu, 18 Jul 2024 06:46:03 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb6ffbdsm93366985ad.60.2024.07.18.06.46.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:46:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/12] binutils: stable 2.42 branch updates
Date: Thu, 18 Jul 2024 06:45:36 -0700
Message-Id: <f5a56716b40bb8911e5bb31d5dc49b434e733a9a.1721310237.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721310237.git.steve@sakoman.com>
References: <cover.1721310237.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 13:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202220

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on binutils-2.42 stable branch are updated.

29ae8b8ea71 x86-64: Skip -z mark-plt tests on MUSL
92cc764e58f hppa: Fix handling of relocations that apply to data
c439c1e1f56 elf: Add glibc version dependency only if needed
68ae8e2a849 ld: pass -g for ld-elf tests
a1e3cb45c67 aarch64: Enable +cssc for armv8.9-a

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index c8f526b5c7..24efe495ec 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "cbec9028dd3fa9b49e0204f1a989cea67cae32c6"
+SRCREV ?= "71ef12cbf140a637e4ea4e2239ee5daedc8640de"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.34.1


