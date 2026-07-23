Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D61EC4453E
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 06:02:18 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17751.1784786531146129163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 23:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jYhpqxlR;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848595b338cso277022b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 23:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784786530; x=1785391330; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sug2bc6HwcokAJ4EQ4opnarYGssOXnJ5LR2Yyf+kNoI=;
        b=jYhpqxlRgmvpvq00ko46Scny5sqAc2mOdpoShcncT01jhTZKtPyTMduRGLmGF85TpC
         XFYr5cRIOy1pp+tRTjiH1yGqYgq9k4pDSr7gLLorNOo7IHZJNjXUf+HGviYf1Z9rHX9O
         gkoVK6pvYOQBf3LyQNA/Vuhan7n1VZOUpZEXkoavTwX6vpU04VbMXeaed4hh1YvbxHE1
         WmesNHi0ajlKlPdfnyvNy5IbT1BCOo2jZ7KzUFjoehsaC83HrpYURJ3n8XQWD0eVZ9XS
         cdaugmoj+XUKShNz4KOimYgpg+0UrKyAdWKIuyAkvMHJBLCtrZNvcbO+wiH8kPhPrNLf
         V+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784786530; x=1785391330;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sug2bc6HwcokAJ4EQ4opnarYGssOXnJ5LR2Yyf+kNoI=;
        b=sFTttz5EzN4h/7oKX2gAASFvudfHHM9qpKCeG2J7Xfwv/NLKc/zOlpC8U9BuN0bjc2
         +nyKaPSEozs88xumBmG9ZEM/Wu7ol3L97KBmdXUMupeBIJtgTKQUqR88/qAEm3pZb290
         GBJF8CZiz+nmupFER5OTo0gAzmCyE7vSsBAuqxaTa0lvGYuIZ2GctC1CyERVleu8d3B/
         RyURIsgwfGyKglhbyV2XjsngG6Vm1oyZXQCTyCOb442v4M1CiGotBE6OdTk9qrYfBIid
         NcgLhDLw5VQTxWVzQp9w1lCQcDZAgKEV90SA6X6UPDy68+f1r0U7cf0eB3lXDM9V0n7x
         TYQQ==
X-Gm-Message-State: AOJu0YwNcdF087demCYTTTXV57ScmgC58nk5jKX/24B+y3KxdgtQTMpR
	54LAzG3PyjM8VGaArM1VGU4ypHfw0kMmZz2npekNGBXvgRLKK07wITFxgg3jH/45MiQ=
X-Gm-Gg: AR+sD13vam9eQ20R02/yT3ApGhNlSeC9KuImf8AFsRu7rDRRLqJq5G7QkKbtn5tJJlt
	KOvYpTg6a/ryZwPAycNlr2MHyyLhT+3osD4xjhiodz2w4K5ouu53+xIPgXxzIgio9mKxfH3rlZX
	DgdbiWfoSaXEiJiSSbzpTqA/HrNws3j/z7jIcwPzsT9hI/9AQb7ww8hXTahH6QhrVlX/v8xClrB
	xB7y3c4qetem1hXOrc7lxAd2rz8dKXwldMlyf23LtISc7qKvxMsNfyyEekBpunQojoVmwDVxI/4
	LT9A9T6CbVI8BCkdRRUHcG9r8UCmYrzox3r4kMLlEUc3STLqalb6oib1M90L5DdpAy+e2831PhU
	WbH2cIn4iyPDOFLSzuCWN3xEM9JZBIpY+U66lzRgvHxb9teSzdlJ8NxgGF7KTJxCgBWxIrP3uk2
	vKST6zoCMRTDRY
X-Received: by 2002:a05:6a00:421a:b0:848:4b27:36a3 with SMTP id d2e1a72fcca58-84e2bc2aec7mr1871675b3a.72.1784786530330;
        Wed, 22 Jul 2026 23:02:10 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17602046sm2401550b3a.59.2026.07.22.23.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:02:09 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Chris Laplante <chris.laplante@agilent.com>,
	Peter Kjellerstedt <pkj@axis.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH 1/2] devtool: standard: guess srcrev update mode for gitsm:// recipes too
Date: Thu, 23 Jul 2026 06:02:08 +0000
Message-ID: <20260723060209.8-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 06:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241773

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

Note this changes the guessed mode for existing gitsm:// recipes from
'patch' to 'srcrev' when HEAD is on the upstream branch — the behavior
git:// recipes have had since 2015. Trees carrying local commits still
guess 'patch', because their HEAD is not reachable from the upstream
branch.

AI-Generated: Uses Claude (claude-sonnet-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index b2b27c7ced..2dff62a7ca 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1816,7 +1816,7 @@ def _guess_recipe_update_mode(srctree, rdata):
     """Guess the recipe update mode to use"""
     import bb.process
     src_uri = (rdata.getVar('SRC_URI') or '').split()
-    git_uris = [uri for uri in src_uri if uri.startswith('git://')]
+    git_uris = [uri for uri in src_uri if uri.startswith('git://') or uri.startswith('gitsm://')]
     if not git_uris:
         return 'patch'
     # Just use the first URI for now
-- 
2.43.0


