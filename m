Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D90C87FDA
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:47 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17694.1754643038311462121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NCWUCq7X;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24014cd385bso20642535ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643037; x=1755247837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mK3/9Ohtbj4n0nl7V8n0G82kH9pv7Al6B/pJQG37lI=;
        b=NCWUCq7Xaw/V9mn2xID52LGLF6spUiyWTxJYYcHYdklC9Ofqexol7lToh1a/GXwnxr
         MysYuJIFM/hk35r8X44a3IV+fsM3DQXDuZvTy+xU/mvce8DALd8oL0ixMzwjKgGPq3y+
         g4RJhpaILSYCqIljVtZTkO91xsSOeEUjlxNZLpzeUa7qSG+KH0gqu6JSAJ3DuYAxtfTd
         qu3DY8LN39ufUuecRh1mhCWPFTiLTDk89O1ardL0q7t9/CO3AqP7kI6fUEE3ynnXdi1M
         sbczGJHcKOAa65DjnePdVFFeHM6fDKcBVIfHyLRRgtnu560ZcRkSGjP9K/991llCU8Nh
         5xVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643037; x=1755247837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mK3/9Ohtbj4n0nl7V8n0G82kH9pv7Al6B/pJQG37lI=;
        b=A5X9nr3CT70R6dmLZuY1HRaJzb/7ZjgHIq2sZ33Siz8RicW8ZJF1AY/WDzij71AoA6
         IFOZj6axuG7ZOLitpVZozsmeT84a97nvuqRfDZO99zijf+3mRz+w3rLotxJIcpLQl+wa
         LzmwV93xzTNjEfsI/h3VW+cLV7Ak9lzOFdpsu91SA9giXeiI/tTJyM4+yXcjS90WXewj
         Yo5HxJPPEzH1uOemytnHrxMhJ6MRJZYjxrYroeLpTsCHuv9AO4DjdGgimGx5uSPNrjT6
         ua+2e89ep9kGnOpQ3yia+0msnxor/4TTGxkWqjWAZ6Q3gb8+1Hoc86LuQcErqGZ4sMmy
         RPMA==
X-Gm-Message-State: AOJu0Yws6ycdK1npre+se9ZiBakyrH89b3i02kvLTHP04b1qiG7ZK7FJ
	IUPSN0K5XcmKOc/FfPjUQUj9bjm/oiwdIX7cJZkuEjNg9TilAh6zwoIq+EiWEw==
X-Gm-Gg: ASbGnctZwyU78JRj3QugX+Dqy7cgLyeQf+XUsU0oaaJZDnkXYXaMVd4gM8uaE3M+hCJ
	KEtn9BG9IAUgER3gmeXyczmsXcAb8dqCP/E4VV/ZOwaBnRdEopuzuo0M76AKk98wUXaazUwkBtN
	BPQfz4O1Opb2cSpNRKFwCjThnHSkrZxDMr1gVdk1jaoHpZ6J/5xULQbUMb79W4UM8Mso4Z9RCyj
	U5GJvPQFRp2k9JVI5JDQUsZnF5Js9EaMh+aABhjBhGpJIZ+m+EVfbDqkN4at7Sb/k8caoD0EaIp
	dFLd7mMWXNUPGTtE70q3YQMdH6uYj7fXfht0SykynOd89mO3haOFVbdys/8Wekvcsbvl2cscTCf
	T7OoWyOnzoIZpJFtaFEw/t7R9zLrySUjS2TfvnTx6YcU=
X-Google-Smtp-Source: AGHT+IHenumyEIVo1yN1gJ6PGhvo8ZesrMIONdPgsH6LDHsELDVEW4G9AfGG+iHtWPz/BSO33Q7zZQ==
X-Received: by 2002:a17:902:f683:b0:235:f078:4746 with SMTP id d9443c01a7336-242c224b697mr37714075ad.42.1754643037354;
        Fri, 08 Aug 2025 01:50:37 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:37 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Koch <stefan-koch@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 22/23] bitbake: fetch2: Ensure a valid symlink in `PREMIRRORS` case when using shallow cloning
Date: Fri,  8 Aug 2025 14:19:30 +0530
Message-Id: <20250808084931.2156763-22-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221619

From: Stefan Koch <stefan-koch@siemens.com>

- Since `ud.path` contains in that case the `PREMIRRORS` prefix path,
  this change ensures that a correct symlink is set up.

(Bitbake rev: 37ed18e45aa17406162efc5ee3ddb2d6b33d07b9)

Signed-off-by: Stefan Koch <stefan-koch@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f5ae37fbd86c1328ebd81166573fbad3028abe5b)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/__init__.py | 10 +++++++++-
 bitbake/lib/bb/fetch2/git.py      |  7 +++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index 49dca75025..9b1aa8858b 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -1093,7 +1093,10 @@ def try_mirror_url(fetch, origud, ud, ld, check = False):
                     origud.method.build_mirror_data(origud, ld)
             return origud.localpath
         # Otherwise the result is a local file:// and we symlink to it
-        ensure_symlink(ud.localpath, origud.localpath)
+        # This may also be a link to a shallow archive
+        # When using shallow mode, add a symlink to the original fullshallow
+        # path to ensure a valid symlink even in the `PREMIRRORS` case
+        origud.method.update_mirror_links(ud, origud)
         update_stamp(origud, ld)
         return ud.localpath
 
@@ -1633,6 +1636,11 @@ class FetchMethod(object):
             except FileExistsError:
                 pass
 
+    def update_mirror_links(self, ud, origud):
+        # For local file:// results, create a symlink to them
+        # This may also be a link to a shallow archive
+        self.ensure_symlink(ud.localpath, origud.localpath)
+
     def try_premirror(self, urldata, d):
         """
         Should premirrors be used?
diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 764e34ccc2..390d9ddafc 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -371,6 +371,13 @@ class Git(FetchMethod):
     def tarball_need_update(self, ud):
         return ud.write_tarballs and not os.path.exists(ud.fullmirror)
 
+    def update_mirror_links(self, ud, origud):
+        super().update_mirror_links(ud, origud)
+        # When using shallow mode, add a symlink to the original fullshallow
+        # path to ensure a valid symlink even in the `PREMIRRORS` case
+        if ud.shallow and not os.path.exists(origud.fullshallow):
+            self.ensure_symlink(ud.localpath, origud.fullshallow)
+
     def try_premirror(self, ud, d):
         # If we don't do this, updating an existing checkout with only premirrors
         # is not possible
-- 
2.25.1


