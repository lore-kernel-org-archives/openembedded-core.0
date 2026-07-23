Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B71DC531D0
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 23:30:55 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8974.1784849445811226297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 16:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CnyKKlnO;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38175907a56so759732a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 16:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784849445; x=1785454245; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jD6RD/ln0FbqHWzppuYBrNEZgoZ9fpF+1R9PreQBQAU=;
        b=CnyKKlnOyKXIxbXcL9ClWhlpWHXLqQXh7P+FB12OrVi9qp0d/6TS4T3TyMbPv4BNvC
         vuvKuG1HcP2blAr5x+fvQ816qK3D3tkewgRLZCAE5AuhSfNSizqE0de+uUPkHlYL62Ak
         oKPvG0pqudF49sheOCJxMd4dVkEXwUIWVjDT23wCMm/T5Zi0M2tDvjmZSoIQ5zPf+xy3
         MuWn1zXzrHb4LMhYHT7H+ZL6fCemOBGRjFg6Bpkzh9ZhKl+FVMyMeN9N3SpVsUBGjoyL
         EemBcyJvoIplmYe3A8TFv5rg94fdz6P+E5RG32/uWFR89sRXbs2G57Sy8DuQeB+zqmFd
         2cZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784849445; x=1785454245;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jD6RD/ln0FbqHWzppuYBrNEZgoZ9fpF+1R9PreQBQAU=;
        b=WNWQwOV8rGjqr08lJ0PxXTudmPUr+KLB8WZXPQFjQKHJk/Y99QrQljooZfCrQOrCVJ
         v3OSIQrZ8BXnWrrSGeSkZFRCYxcszD5NyVVzob5B9e8827KVo7PKvlUAeIepF0gF6QBc
         XAOGAxwmB3R+uoJBHCX5LGJ2v/XI7D7/2ro980Z7pSF1rH4zlhwE5WKxHKpR6zPAtcQk
         zdzbbNrFKXAxBYKnsTdEOVZxT0dDLfu8PFadW9jeBhZOO3LWWRacwP1/h4o1Pq8XkJYi
         XCnjqxiig23p8gAUOyk7Sf/STOxez6pkc+H1Lrlk9XHe2x0lZ7HEQh029txGvEOwlK4j
         ToHQ==
X-Gm-Message-State: AOJu0Yz8Ow0SyoJRKZp9el5IuwlVrrCQoOV5rsy+mmC4/aFaQALYEg23
	btXXvEzOBVItso25v9wKFTCiEVYi2a1cZFzmH255w9sywo4HlxXiz2ViDsXeJ+r1xj4=
X-Gm-Gg: AR+sD12g1OuYIHuruN52ONAoXfVarjTGUrcWgWglaJH80mhFI9LaQKoQ9Gqhjd3mM/V
	6E0HL308vjTt3v5pfap4Rx0HjeAqEReuaulW/uMsBCjkpJQGwGkGTgbvRt+etFpKNo3ETW3Q5h6
	PWThAQXzTD/CUNgmwFWHpghSb94agnDC4Fv2xPFoaYBoL8kr2GWJgCBohiMc97J374AYn5JGq0X
	BOzC1dRMPQAlXMPlb6amzZFslF5eCuwJ6EjFo7QoLtqBEWTVsemT0qLNFJxeoB3+IBvQYTLucbb
	UQ0PRYLUH3/4144AgwvaH0F9ii75EeIC5gU6m3hOoQVyMWdqUmC2NiA3ZwM2fS2IANWslh7q45x
	lrzRxTeh+OXunT7t618YYYvVdMKrPzWERZGBVIVmbKwgPNG/NriYGSlanz7p72Md8jsFmEGl3vQ
	fFLlzwmJusuX3tVWIme1iR4Pk=
X-Received: by 2002:a17:90b:4f84:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-38ec80b7a0emr4808770a91.0.1784849444915;
        Thu, 23 Jul 2026 16:30:44 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03c20c06sm556011a91.12.2026.07.23.16.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 16:30:44 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Chris Laplante <chris.laplante@agilent.com>,
	Peter Kjellerstedt <pkj@axis.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH v2 1/2] devtool: standard: guess srcrev update mode for gitsm:// recipes too
Date: Thu, 23 Jul 2026 23:30:42 +0000
Message-ID: <20260723233043.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723060209.8-1-bbnpreetsingh@gmail.com>
References: <20260723060209.8-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 23:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241877

'devtool update-recipe' and 'devtool finish' default to guessing the
recipe update mode: 'srcrev' when the source tree HEAD sits on the
upstream branch (the "checked out another upstream revision" workflow),
'patch' otherwise. The guesser matches SRC_URI entries against a
literal 'git://' prefix, so a gitsm:// recipe never has any git URIs
from its point of view and always falls into patch mode.

In that case there are no local commits to export either, so checking
out a different upstream revision and running update-recipe reports
"No patches or files need updating" and silently leaves the recipe's
SRCREV untouched, while the same operation on a git:// recipe updates
SRCREV. Forcing -m srcrev works, since _update_recipe_srcrev() is
scheme-agnostic; only the guess is broken.

Accept gitsm:// URIs the same way e7076f1742 ("devtool: gitsm://
should be handled same as git:// in upgrades") did for the upgrade
path, where the same omission was fixed; the guesser itself dates from
9b9733b7d7 (2015), before gitsm handling was a consideration.

Unlike git://, a gitsm:// tree can carry exportable changes that do
not move the parent HEAD off the upstream branch: local commits in a
submodule only show up as an out-of-sync gitlink in the parent.
Guessing srcrev there would silently drop them, because
_update_recipe_srcrev() only rewrites the parent SRCREV — this is
exactly the scenario test_devtool_git_submodules exercises (commit
inside a submodule, then devtool finish), which caught v1 of this
patch on the autobuilder. So only guess srcrev when every submodule
checkout matches the revision its parent records: any '+' (checkout
differs) or 'U' (merge conflicts) entry in 'git submodule status
--recursive' output keeps the current patch mode. This also covers a
tree where another parent revision was checked out without a
following 'git submodule update': srcrev must never be guessed when
it could lose submodule content, and a fully synced tree is the only
state where it provably cannot.

Note this changes the guessed mode for existing gitsm:// recipes from
'patch' to 'srcrev' when HEAD is on the upstream branch and the
submodules are in sync — the behavior git:// recipes have had since
2015. Trees carrying local commits still guess 'patch', because their
HEAD is not reachable from the upstream branch.

AI-Generated: Uses Claude (claude-sonnet-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
v1 -> v2:
- Use the startswith(('git://', 'gitsm://')) tuple form (Richard Purdie)
- Only guess srcrev when 'git submodule status --recursive' reports
  every submodule in sync: local commits in a submodule do not move the
  parent HEAD off the upstream branch, and v1 silently dropped them by
  guessing srcrev — caught by test_devtool_git_submodules on the
  autobuilder (reported by Mathieu Dubois-Briand). Of the three
  selftest failures reported against v1, this one is the only one this
  series causes: test_devtool_modify_nested_gitsm fails during
  'devtool modify' source extraction before the guesser can run, and
  test_devtool_finish_update_patch exercises a recipe with only git://
  URIs, for which this change is inert; both pass on master with only
  this series applied (analysis in the reply on the v1 thread)

 scripts/lib/devtool/standard.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index b2b27c7ced..9b2643604d 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1816,7 +1816,7 @@ def _guess_recipe_update_mode(srctree, rdata):
     """Guess the recipe update mode to use"""
     import bb.process
     src_uri = (rdata.getVar('SRC_URI') or '').split()
-    git_uris = [uri for uri in src_uri if uri.startswith('git://')]
+    git_uris = [uri for uri in src_uri if uri.startswith(('git://', 'gitsm://'))]
     if not git_uris:
         return 'patch'
     # Just use the first URI for now
@@ -1831,7 +1831,14 @@ def _guess_recipe_update_mode(srctree, rdata):
                                cwd=srctree)
     remote_brs = [branch.strip() for branch in stdout.splitlines()]
     if 'origin/' + upstr_branch in remote_brs:
-        return 'srcrev'
+        # Local commits in a submodule need exporting as patches, but do not
+        # move the parent HEAD off the upstream branch, so only guess srcrev
+        # if every submodule checkout matches the revision its parent records
+        # ('+') and none has merge conflicts ('U')
+        stdout, _ = bb.process.run('git submodule status --recursive',
+                                   cwd=srctree)
+        if not any(line.startswith(('+', 'U')) for line in stdout.splitlines()):
+            return 'srcrev'
 
     return 'patch'
 
-- 
2.43.0


