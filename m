Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RXg0c-0008Qi-0x
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 22:23:34 +0100
Received: by ghrr13 with SMTP id r13so4843932ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2011 13:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	bh=bXSBJit/jxgUZ1U1d/4HG3JLMsAAe5NbXPaY0b2UJHE=;
	b=Flj7U4oBD++RynosLZgaeojLwcW/cl3iyEyOiJTa8EZRisM/Fg9sYNG6gcvRZzjDOz
	BYtSybAEd96yykIIuoVcQnrLsfJgv212UQQRxJJvoX8Kb36Tw1Tb6vjwF5ObA+WzWCJT
	tQOwbtIeuC+vZqlOAyx43ka7AHG1YicvNqx54=
Received: by 10.100.44.10 with SMTP id r10mr2288356anr.151.1323119803391;
	Mon, 05 Dec 2011 13:16:43 -0800 (PST)
Received: from auron.mgc.mentorg.com (ip24-251-167-38.ph.ph.cox.net.
	[24.251.167.38])
	by mx.google.com with ESMTPS id i22sm33253970yhm.10.2011.12.05.13.16.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 13:16:42 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 14:16:26 -0700
Message-Id: <1323119789-23067-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.8
Subject: [PATCH 1/4] oe.test_types: move into an oe.tests package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Dec 2011 21:23:34 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/lib/oe/{ => tests}/test_types.py |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 meta/lib/oe/tests/__init__.py
 rename meta/lib/oe/{ => tests}/test_types.py (100%)

diff --git a/meta/lib/oe/tests/__init__.py b/meta/lib/oe/tests/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta/lib/oe/test_types.py b/meta/lib/oe/tests/test_types.py
similarity index 100%
rename from meta/lib/oe/test_types.py
rename to meta/lib/oe/tests/test_types.py
-- 
1.7.8



