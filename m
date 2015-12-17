Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id A80787014A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:02:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 3E5362602C6
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 12:02:28 +0000
Message-Id: <1450353748-14381-1-git-send-email-joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] wic/help.py: document that mountpoint is optional for part command
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
X-List-Received-Date: Thu, 17 Dec 2015 12:02:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If no mountpoint is specified for a partition command the partition
will be created but not mounted — mention this in the kickstart
help text.

[YOCTO #8820]

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 scripts/lib/wic/help.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 89fb7be..be334e7 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -617,7 +617,7 @@ DESCRIPTION
        This command creates a partition on the system and uses the
        following syntax:
 
-         part <mountpoint>
+         part [<mountpoint>]
 
        The <mountpoint> is where the partition will be mounted and
        must take of one of the following forms:
@@ -626,6 +626,9 @@ DESCRIPTION
 
          swap: The partition will be used as swap space.
 
+       If a <mountpoint> is not specified the partition will be created
+       but will not be mounted.
+
        The following are supported 'part' options:
 
          --size: The minimum partition size. Specify an integer value
-- 
2.5.0


