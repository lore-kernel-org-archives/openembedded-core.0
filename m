Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE1B7ED48
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:24 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id a3so368874pgm.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ymkRFCWUx10ycgLFNunG7/yu1TjVc3WwCcaBRFt8fM8=;
	b=NQXZw4FKVEtziOcQ3TmC9W0A+8ozYlrXdDsluqifEFI8cfIkVZXs1KQEAfUYrg5cjb
	oGUOZBwwyok6uSUno4VQF7yukxo/UU5M/n57A0M+wSWSQPFH2uu0OBQVPYH+1vk10ilA
	JaX0V3zhgXeP9KrwxF5RdpHCn7gT3cTFNnIIVBj4UxiFjSfLjisBaR13IL9AiICgJWOm
	dpxkBbbGeS11mCjHtXVKJesLTkj9NAQyKJevaNQUeTM+NJdUGoauo34m5qjWea8VNL1n
	YFMZM89/+aZK0j9jJVyBU1FhbDRy1mE7WppC4UXCuA3f+v/kys836dYnj9KFQzruAaxC
	dhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ymkRFCWUx10ycgLFNunG7/yu1TjVc3WwCcaBRFt8fM8=;
	b=N5jAc3LUWNMHZu9heb6gtWZrll3blWGKkKEnIGnDwmYs4iu6ivUBAbQMffmBXM3UHO
	oEanGxj00lWnrba72x+BKoglOgo8pn6QRkbf5BoOpgdNHwrMwdZMNgz0HOQInqlAT7W/
	vFPcJyJb42KygUkmTzfqm8xEc/wD3pI1G6QU7+NyFwV7Yc214iG4euH7urrh2XTVkcNb
	fcPji8T6CsoXmqjb1j5ckdmjacrgYmHd8TVPmIUjVKNLoeyQH8CHJBN8HWpEyGg7v/Yp
	izY7A9PbCqUXE63llDyxnxsKeD86486cKYIFVSX3ceqAIouBKDI3w8h7XsRMxDk8vVwo
	Bq3g==
X-Gm-Message-State: APjAAAVHCbGc3qQw2fuUn/sngYa1w4O2Ck1zaaFI6NMKVbT+0eDIrkax
	3IMGgTbUJQLblneD56OXUfFpxpQGokI=
X-Google-Smtp-Source: APXvYqxcfBZpZjhta6bnFcds6Bz6FXY6KRTUSytkpKYczQTS0UyqEmaGiYLVeSnPlvqFZJsWj6/37Q==
X-Received: by 2002:a63:a051:: with SMTP id u17mr857051pgn.7.1569294805246;
	Mon, 23 Sep 2019 20:13:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:12:57 -0700
Message-Id: <f965ecbf558b6db1959e4ba8e599d65a5c8022b2.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569294712.git.akuster808@gmail.com>
References: <cover.1569294712.git.akuster808@gmail.com>
Subject: [Thud][ 01/24] buildhistory: call a dependency parser only on actual dependency lists
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2019 03:13:24 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

Previously it was also called on filelists and possibly other items which
broke the parser.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/buildhistory_analysis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index ad7fceb..d3cde4f 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -127,7 +127,7 @@ class ChangeRecord:
             removed = list(set(aitems) - set(bitems))
             added = list(set(bitems) - set(aitems))
 
-            if not removed and not added:
+            if not removed and not added and self.fieldname in ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RREPLACES', 'RCONFLICTS']:
                 depvera = bb.utils.explode_dep_versions2(self.oldvalue, sort=False)
                 depverb = bb.utils.explode_dep_versions2(self.newvalue, sort=False)
                 for i, j in zip(depvera.items(), depverb.items()):
-- 
2.7.4


