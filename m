Return-Path: <>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 508647C427
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 13:00:19 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id e26so8818142lfc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 05:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DMO/UAvuPaiISEXshBJYHtbJRtetLrc6YPhi28RESQM=;
	b=cio78ODiuHxOg9xuCUhbjQyXKMrAInm/ZMO5pfTQWnFNzoLXWw0nbBWMySZlRybjzf
	Zqs4GHGyWGulNZTnYlC7lyc9YIDgaTqEX/Nw+jRm43oOcsoW0MEs5edlEplYJLaornix
	NJ6ZrIMH5375wYE872Iub9GQWowXEqp1Hw9FszXbQ80jdTIZiqk21DKrzUrE2piRP+wy
	X28ejP71XlKasI4o7dRyD7kHHyRpWH1Rs+9aqEeS7nz7REr7/JbogNt3M3FvQjeGNa9K
	bOCLtSw7AoyqR+Iguo3Suv97/mZNJd3YL6i2mYBdvT9Cy/6G1tzskiAdd6uqSqIeesRw
	DCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DMO/UAvuPaiISEXshBJYHtbJRtetLrc6YPhi28RESQM=;
	b=kxPMoYgbW2GiUPaPVZgq+dChwxiOm4mPoq4UfiLP0aVP1N+YUkxNGMw3WC3AqCN7K1
	s/ySa2BefEZlZo/dcJBc0X8vaI0AcgpbHYlXG5L8IoVmv2qtzG1YHjmBP44wDfy/vyii
	KyMSU/n/S3wiaK5lfn6CAqZhgkczPt5+WQKe9G+7+WAP3BbKCLSnwlfhz25A4kqpwXAL
	AGq6++qTupu0DV/CU68qStFR22dV8uxi562CsErR+XpSbk/5vfGcDwBGsUTTPDdcSNpx
	wY2gOVk25GnfqiMjoTdqAstSTFttAdEjRjQ9PrV2RHkd8x063AsDcum3CavJ/6pQsLMF
	Jkqg==
X-Gm-Message-State: AJcUukdHzBD9FgZMt5jzcBXrbL/8qj6axCwK/jz+4twUAWy3ChnUwXPY
	ydPSAt2ONrQky9fjY1On+x6C0WnTIHVMyw==
X-Google-Smtp-Source: ALg8bN5PNIAK25Q57nSRX0AM2A4dflXQNVl5l8p2p+pVJ36KFjNyoZgxbFis+9T9As/gbMwX6Yd0Wg==
X-Received: by 2002:a19:4dd0:: with SMTP id a199mr11960039lfb.42.1548507619780;
	Sat, 26 Jan 2019 05:00:19 -0800 (PST)
Received: from localhost ([80.64.92.72]) by smtp.gmail.com with ESMTPSA id
	12-v6sm2147109ljs.29.2019.01.26.05.00.19
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 26 Jan 2019 05:00:19 -0800 (PST)
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Jan 2019 14:58:00 +0200
Message-Id: <1548507480-22805-7-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
References: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
Subject: [PATCH 6/6] perl: drop lost patch
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
X-List-Received-Date: Sat, 26 Jan 2019 13:00:19 -0000

Commit 68552c353255 "perl: remove the previous version of the recipe"
dropped 0001-Makefile.SH-Pod-Simple-requires-Getopt-Long.patch
from recipe, but left the patch itself in source tree.
Remove this patch since nobody uses it.

Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
---
 ...kefile.SH-Pod-Simple-requires-Getopt-Long.patch | 34 ----------------------
 1 file changed, 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/perl/0001-Makefile.SH-Pod-Simple-requires-Getopt-Long.patch

diff --git a/meta/recipes-devtools/perl/perl/0001-Makefile.SH-Pod-Simple-requires-Getopt-Long.patch b/meta/recipes-devtools/perl/perl/0001-Makefile.SH-Pod-Simple-requires-Getopt-Long.patch
deleted file mode 100644
index aad46f3..0000000
--- a/meta/recipes-devtools/perl/perl/0001-Makefile.SH-Pod-Simple-requires-Getopt-Long.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 58c69d65b19b5f9a35e1f5ce08d2ea47884233d3 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 27 Dec 2018 00:18:51 -0800
-Subject: [PATCH] Makefile.SH: Pod-Simple requires Getopt-Long
-
-Fixed a race issue when parallel build:
-
-Running pm_to_blib for cpan/Pod-Simple directly
-[snip]
-/path/to/cpan/podlators/../../miniperl "-I../../lib" "-I../../lib" -MExtUtils::MY -e 'MY->fixin(shift)' -- blib/script/pod2man
-Can't locate Getopt/Long.pm in @INC [snip]
-
-Upstream-Status: Submitted[https://www.nntp.perl.org/group/perl.perl5.porters/2018/12/msg253236.html]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile.SH | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.SH b/Makefile.SH
-index 9848d55..7a164e7 100755
---- a/Makefile.SH
-+++ b/Makefile.SH
-@@ -189,6 +189,7 @@ dynamic_list=' '
- dynamic_ext_re="lib/auto/re/re.$dlext"
- extra_dep='
- ext/Pod-Functions/pm_to_blib: cpan/Pod-Simple/pm_to_blib cpan/Pod-Escapes/pm_to_blib pod/perlfunc.pod
-+cpan/Pod-Simple/pm_to_blib: cpan/Getopt-Long/pm_to_blib
- '
- for f in $dynamic_ext; do
-     : the dependency named here will never exist
--- 
-2.10.2
-
-- 
1.9.1


