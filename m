Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC9A761C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 21:44:16 +0000 (UTC)
Received: by padck2 with SMTP id ck2so2526064pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 14:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=I28TdyH8qdBSTbMUtAjyuCXhAH0KWFXmUSrGfyO8nUc=;
	b=EzzFvGTn3kqF1hsC2GfXVi5d5SgLn8iFt1L7j/zNlui0aCQXaXAHKQlVqXvb9MVeLa
	6rKWIfG1L/0UMNeMB3YEPoY+cOjb+HbB0DGeDsIQUO6rQ7j39IwuinUquo/P0LRtsR74
	wjCOXd0YiP1Gljm+j721NJJ418mjcDFMvFOISTs0lB95fbiazj3pOGdMaePWM7TRcL6O
	zR6V56GGUIy/dhqKm1xbgW8u/jRFr0WkM+8mfYI+pXTmiIhicpzbs180ucKZFyqQwf82
	Ce85xyE4DKAqFOMQr//iGxkyMDswCgCkIBDfCH5YN4rKkFZmWoj4TteAnB+3swjDtXUr
	tP3g==
X-Received: by 10.70.123.226 with SMTP id md2mr22903232pdb.29.1437687857085;
	Thu, 23 Jul 2015 14:44:17 -0700 (PDT)
Received: from gumstux.mystix.com (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180]) by smtp.gmail.com with ESMTPSA id
	g10sm10760875pat.35.2015.07.23.14.44.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jul 2015 14:44:16 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 14:44:13 -0700
Message-Id: <1437687855-6499-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [fido][PATCH 0/2] Backports for WIC
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
X-List-Received-Date: Thu, 23 Jul 2015 21:44:18 -0000

In order to use the wic tool multiple times (Ubuntu 15.04 host), I need
to cherry-pick these two patches onto the fido branch.  Otherwise, wic
just hangs on the second invocation.  Can these two patches be applied
as backports to Fido?

Alexandre Belloni (1):
  wic: remove intermediate partitions

Ed Bartosh (1):
  wic: Make sure file exists before removing it

 scripts/lib/wic/kickstart/custom_commands/partition.py | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.1.4


