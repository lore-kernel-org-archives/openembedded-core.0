Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 1A4A973216
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 15:06:19 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u1CF6JMh008662
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 16:06:20 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.78.41])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id u1CF6Jrp024937;
	Fri, 12 Feb 2016 16:06:19 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 16:06:13 +0100
Message-Id: <1455289573-22770-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] lib/oe/terminal: set workdir for konsole terminal
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
X-List-Received-Date: Fri, 12 Feb 2016 15:06:21 -0000

It seems that if the --workdir option is not set konsole does open in the users
home directory. By setting --workdir . konsole opens in the recipes work
directory. This is the same behavior as observed for other consoles.
(Tested with Konsole 2.14.2 on Debian Jessie).


Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/lib/oe/terminal.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 1efc06d..634daa9 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -83,7 +83,7 @@ class Terminology(XTerminal):
     priority = 2
 
 class Konsole(XTerminal):
-    command = 'konsole --nofork -p tabtitle="{title}" -e {command}'
+    command = 'konsole --nofork --workdir . -p tabtitle="{title}" -e {command}'
     priority = 2
 
     def __init__(self, sh_cmd, title=None, env=None, d=None):
-- 
2.1.4


