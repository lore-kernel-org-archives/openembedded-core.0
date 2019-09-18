Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9750A8FFDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 18:28:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46YT4P2W7fz65
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 20:28:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568831285;
	bh=plH66liYMnN9Be20g8+kVhwRiS+5N1eft5AY3cHitFc=;
	h=From:To:Subject:Date:From;
	b=s6iehLHQlvKi5tOhTMv2O4hocQCePZM6KaUNF2N0Rqc1XHgsnkY4vhL9HTqRLRvg+
	svFeCdN/uuENMp1CLsVmycSyl+HJ59stREPJDHDg9tlh+NkQuN9OkNHuFhjTQyjIi7
	+Z0BRG561utuQ9yinP6Dm9F3GPGAajGdoBwfl/jPBzqO/oi6d1oJquUN4mCzVcnM7x
	7GgmXrUi68EeFTk+L+Q21qCqw6M5mV8ksgJj0+tXAV+UJI5DJ84KSsmGqbG71NVMaB
	Me32PkWtksAo0HC2Ks0Ahh0CR01XuXij3mCM1J4478zfH+F9T39gB5UN8yZ63FvXbq
	K7DOW4g9nC/9pMRXUj1yCA9Cv1HHdP/nqQ9C+cMEUPeAdAQ7Zx5c4JHHlSnoY+QVi4
	cQPUcR57vq6KJuo1RO7Gwcso276DI5jqUZ//2vZOIChZj52RC19LLb5bZKhEWPzGF3
	+dAa+BVLhUNg8fBh//Kz2U4YrrCpCwdFBKJ7iR8G9vqkMaL08nCwSCbqoHfOeAmu5k
	h34Wm/KEhA8IPFnSYM0a6dVExlqw+WesA24cfzWEzf1DyMUh9gwD6m9Mhsgo34GUbc
	X99rLsuu1GpqLN07lHVCWexzScdDL97Edm/v0YKUbsJ/eXcb8yTx4C04vHhEwpZVNU
	rHF4Ue2aVjoqQCWff4PFBWik=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 21:28:02 +0300
Message-Id: <20190918182803.29170-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] squashfs-tools: Remove UPSTREAM_CHECK_COMMITS
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
X-List-Received-Date: Wed, 18 Sep 2019 18:28:05 -0000

Upstream is making releases again.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index ab2ff01b62..51e4a5939d 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -10,7 +10,6 @@ SRCREV = "f95864afe8833fe3ad782d714b41378e860977b1"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
            file://squashfs-tools-4.3-sysmacros.patch;striplevel=2 \
 "
-UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
 SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e"
 
-- 
2.17.1


