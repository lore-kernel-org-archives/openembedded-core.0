Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48794C87FD2
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:17 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.17943.1754643011353013658
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OkUpfEDN;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so2017530a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643010; x=1755247810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYO7nTzdW7nDfJdfr7C9/s1jRijsiBXL8Ore6KODz9A=;
        b=OkUpfEDNEu+0EIUPUhnxCLtSsm3SYWxaJuQdClu1Lm873QCpAe6muK3bweag904KuX
         kbtnH8+QpZZXBm96D2uqDluQZI5K+y1GTg1JwEucgU61WBHiutCTtdHR4rGWzjk1Kz2H
         ZxWMpQtP2nCMt4WLtTk1XHqtq8uCH/czjEzpqMPDpLVUi3JXdnKAeRx8JcEkb62W7mDE
         tx4Tkf+nPnioY676kSoP18IgYekOKeztzf+UgArI3sJhUaDyUo7ABTbHTwyYVCreQt5p
         YXUNhLtzC+W8k92Xx2lKKGOGyzZJyRf1YLc0edzg8PnA3ueIkRPTE/mcOjfP+R0MMNf+
         zMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643010; x=1755247810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYO7nTzdW7nDfJdfr7C9/s1jRijsiBXL8Ore6KODz9A=;
        b=DEBUN2ugb9tA+mq74y/Oc5cGam15IoL7TRVh5xmbnYyCaCebrF2iHwcvvuUFanbS3t
         ONsZFGe4+mLGsTm8qfj9Gef6JKsS/N3QLvskdsEtFRY7tP/VGkGg4lvL3+8pBksu8+CS
         8g6SO/wiRFq+4aMZCSpmvWESq6lAZMZS5m+/SULD3iLVpPNIMfTD7xpMVYYlqIvGmh+z
         /i4As9Sdy/gl/CrVOokDZaclDBLmnqdF3ZYPzGaselcv4F3hE3TxXO5e9mCddH3uimpa
         nmSNQaUtcBe7mIdnPhoX2axQZDr3TKDPZDqJppW1dOMxMn/aL9yZtjCv5zfpc84AvePN
         HklQ==
X-Gm-Message-State: AOJu0YzFT2ZMQpc6Nmty4AXjD9merMmR9q4lc9alIyDHtyMT9JkU46oW
	4djPwQHoB/wrAg2tZ3mMEnOPtZwCEtjR/WTbaUQffcTyOs/WLDLdgOtAak600g==
X-Gm-Gg: ASbGncumYwsqBGku+oiPsgFS6jp9f7xmuuPG4SnFRY9z2ph5P70moaPDbddhaW5jbOn
	0Q5CaAM7sLeUV6eqcZhk7lXyhxNY+f7HD/yQFkq5qBvGm/n5m5okLkX2G/VKPGlrXuyos82wJSb
	eSdc+FZXcCQzq+Hr43hw1RPFL3RbhW3zFIM/PwBOdFtkH/sPzQCDbLJEsbaU5Bu13YaZ7dNBwif
	U96jz6+XPZJFYTQkTRbhFIax1PBw4R7EGtQQ672KK4Ae8qi7YjVDinUPSA/rQ+x+DOezRRDqATl
	TiY0SF5SZZ/jsikSsQj4Hzp8ecCAtHQCJrrNTKRTAf1RoGUdu5W21a9AnPvZ7eTx8uLLefv5eIB
	Waj77b6oWN7XQ0svjpnST74wOjMRc/MhEfegmFw==
X-Google-Smtp-Source: AGHT+IHqU067G3gWaCeYyNyH5SfRmAOhRdOEMUmJW6v2fpwDn9a/585DAazk1c1JHaCiuA4MQcGJPw==
X-Received: by 2002:a17:902:ec89:b0:235:15f3:ef16 with SMTP id d9443c01a7336-242c20a1558mr31658315ad.13.1754643010396;
        Fri, 08 Aug 2025 01:50:10 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:10 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 12/23] bitbake: fetch/git: always fetch lfs when creating shallow tarball
Date: Fri,  8 Aug 2025 14:19:20 +0530
Message-Id: <20250808084931.2156763-12-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221609

From: Peter Marko <peter.marko@siemens.com>

Before fast shallow tarballs the shallow tarball with lfs worked only
if the original .../downloads/git2/... directory existed. Once it was
not there, do_unpack on shallow tarball without lfs files failed due to
disabled network.
It was fixed for fast shallow tarballs and this commit fixes the other
scenarios, too.

This can happen when such shallow tarball is put to mirror or if
someone does cleanup to reclaim disk space.

(Bitbake rev: 4e6fb31a88448cdacf4e9f84cf0a8a8035f84d63)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d1dae30b7932c2e6c6829a04b19a7f9e440cdd5c)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/git.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index a73fb79ac8..9e0950006e 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -659,9 +659,8 @@ class Git(FetchMethod):
 
             runfetchcmd(fetch_cmd, d, workdir=dest)
             runfetchcmd("%s update-ref %s %s" % (ud.basecmd, ref, revision), d, workdir=dest)
-            # Fetch Git LFS data for fast shallow clones
-            if not ud.shallow_skip_fast:
-                self.lfs_fetch(ud, d, dest, ud.revisions[ud.names[0]])
+            # Fetch Git LFS data
+            self.lfs_fetch(ud, d, dest, ud.revisions[ud.names[0]])
 
         # Apply extra ref wildcards
         all_refs_remote = runfetchcmd("%s ls-remote origin 'refs/*'" % ud.basecmd, \
-- 
2.25.1


