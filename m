Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 31F3B7F438
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:40 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id w16so7376608pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hZqTgINDA+GSWeT89RdgoNETahIaAcaktSPVKQU/Uvo=;
	b=Bu0GkCWxaDwy89ZjmcHGovEEDjVjFohHm92Ir6Q5R6/2vWo4a87UlQggBm7xyy3Ne6
	Sy5o7KQizEG5Pu7+bg5xOVLfETJ4t0K/0PRroT4DgQvuYxds4qzcaowRvsaPX8P3Xjrq
	db0HFLEk9lPAlnxzm5uevuNJRtaMSOfqFJeyrJIvAyLXw2sQoZgWXrPiwDL+ek73FJQ1
	KvLP9OnfmQ7+lEyKsVzAI/axJuTO2S1WVFyXcDcYQz06ayOfTPTVR9nNmmMimEfWy/c+
	4e4SUzwHoGY276IEQo7MDbaia0KVx1R1xsyqgcYAeWoMrIrurr6+NtDPQ+wq19/UuJx5
	7PBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hZqTgINDA+GSWeT89RdgoNETahIaAcaktSPVKQU/Uvo=;
	b=XW+fgc+F74xDJpR/f3ySwcqAGbhgnNkd+Rrm7IfPCnhLMchFBAOwxlRwSsoP6zMwCf
	TmHwAF+jYUyoVW7WB1XFy/ueXtez5tr7zOQqDgIny26zYrQETa0wYcCc2vVmBPPHjvoS
	b7akRRGH8OnJrzeLOqGBYkCN2aU0xrZxfNJqzEUKd4DLfDzMrzOjhVtTzturFOa5BG3X
	ikE8QFXr1zRuNyUFq3y/om4JWHTTWF//HRPv1miTDJjD8rIGTSnVW8dBLlusXj7rSe2c
	LmzAvnVBFWESOcAJHN4yq0Ka/ol3XK5zqJYG18NZ6Sx0eSOGffqNiKHuZ5bHWbka09qi
	IbSg==
X-Gm-Message-State: APjAAAWiS4aE8BkvIefXk7CpZmJzx2mTiX8QGCzlzJhEf1dYOS3vdS2C
	kMJzfi2Vo+jenQCzmojqZfACuyfG
X-Google-Smtp-Source: APXvYqyU3NlCgbBO2SzZjxlgVSz1rZNeSzHnYVglxNByhfUlIAA96DDvoMgcCrsZvdkb7w2ap+jsfQ==
X-Received: by 2002:a63:3112:: with SMTP id x18mr21478907pgx.385.1567348601167;
	Sun, 01 Sep 2019 07:36:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:55 -0700
Message-Id: <7ea494fa882d25cbd4e87f5fd505b5c4d37ceea1.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 17/43] psmisc: Fix dependency for USE_NLS=no
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:40 -0000

From: Jason Wessel <jason.wessel@windriver.com>

When using USE_NLS="no" in the local.conf psmisc will fail to
compile as follows:

| autoreconf: Entering directory `.'
| autoreconf: running: autopoint --force
| autoreconf: failed to run autopoint: No such file or directory
| autoreconf: autopoint is needed because this package uses Gettext
| ERROR: autoreconf execution failed.

This is because the gettext.bbclass returns gettext-minimal-native for
the host dependency which does not include autopoint.  The autopoint
utility is required to build psmisc, so it needs to list
gettext-native as a dependency.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/psmisc/psmisc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 82ef947..594a10c 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -7,7 +7,7 @@ command sends a specified signal (SIGTERM if nothing is specified) to \
 processes identified by name.  The fuser command identifies the PIDs \
 of processes that are using specified files or filesystems."
 SECTION = "base"
-DEPENDS = "ncurses virtual/libintl"
+DEPENDS = "ncurses virtual/libintl gettext-native"
 LICENSE = "GPLv2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
-- 
2.7.4


