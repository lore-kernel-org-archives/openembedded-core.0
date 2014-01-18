Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id B7A1F6DC62
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:01:35 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e49so2621172eek.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=uggCaTTeueYEExqKrsXX166RwEXnrrf/EBa+FFfrzHY=;
	b=jJUND2EZCki111nGXySfuRU3Gx5Ovqrju0wPmbQkUwxcjS6KhHRR8EZLqyDzAuaKhJ
	wJaTAx0QNxeGZOMWYYXRKpqB+1MOHsoZFu618vIOuiiZCJbnhcneOWmV64bXuzoGjTp7
	2tHfttp2F+9RLirpH4IHedz1GPo4avY2gS+8KheCdcUK+M5AF2xaCxZBZZtN6fKTtI6q
	/xYOdgAGesxO7vQYcaYMcUogfaH1h9df5KjupdhHwExkSQfLCwVHl8bYc2DVIiayzLGF
	sRo7xwLJGBhimQBuQZVvubbk18UEEv7TRsERg/JQXbHJa9IsMYpbzUj+SuiRdzjN72/7
	wZQg==
X-Received: by 10.14.246.202 with SMTP id q50mr8206540eer.58.1390053696390;
	Sat, 18 Jan 2014 06:01:36 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id u7sm35481593eep.11.2014.01.18.06.01.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:01:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:01:50 +0100
Message-Id: <cover.1390052402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
Subject: [PATCH 0/4] icecc improvements
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
X-List-Received-Date: Sat, 18 Jan 2014 14:01:36 -0000

Fix for icecc inherit causing allarch and native recipes to have different
signatures for different MACHINES.

Make blacklist more strict and start with empty one - old entries seem all
to be resolved already.

The following changes since commit 8163854adf87ac42a8f08ee25685d0ce1efb4724:

  oe-selftest: separated the SStateBase and SStateTests in different modules (2014-01-16 12:18:44 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/icecc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/icecc

Martin Jansa (4):
  icecc: Don't replace non-empty PARALLEL_MAKE with empty
    ICECC_PARALLEL_MAKE
  icecc: use bb.utils.which also for 'as'
  icecc: Fix allarch and native recipes having different signatures
  icecc: use exact match in blacklists, re-start with empty
    system_package_blacklist

 meta/classes/icecc.bbclass | 46 +++++++++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 17 deletions(-)

-- 
1.8.5.2


