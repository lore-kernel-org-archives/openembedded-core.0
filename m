Return-Path: <denis@denix.org>
X-Greylist: delayed 3603 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 Jun 2014 23:53:54 UTC
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 31D0E6028A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 23:53:54 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7F00BB3U9C4PA0@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 19 Jun 2014 17:53:52 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8F62120183; Thu,
	19 Jun 2014 18:53:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jun 2014 18:53:23 -0400
Message-id: <1403218403-3303-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403218403-3303-1-git-send-email-denis@denix.org>
References: <1403218403-3303-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/2] udev-cache.default: set PROBE_PLATFORM_BUS to "yes" by default
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
X-List-Received-Date: Thu, 19 Jun 2014 23:54:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Force probing of "platform" bus by default.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-core/udev/udev/udev-cache.default | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/udev/udev/udev-cache.default b/meta/recipes-core/udev/udev/udev-cache.default
index 5c4937a..2093336 100644
--- a/meta/recipes-core/udev/udev/udev-cache.default
+++ b/meta/recipes-core/udev/udev/udev-cache.default
@@ -2,3 +2,4 @@
 
 # Comment this out to disable device cache
 DEVCACHE="/etc/dev.tar"
+PROBE_PLATFORM_BUS="yes"
-- 
2.0.0


