Return-Path: <denis@denix.org>
X-Greylist: delayed 3609 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Jun 2014 17:20:48 UTC
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 96B0C6059A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 17:20:48 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7Q00BLPG1E7ZF0@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 25 Jun 2014 11:20:18 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B57D6201B8; Wed,
	25 Jun 2014 12:20:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jun 2014 12:19:56 -0400
Message-id: <1403713196-22214-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403713196-22214-1-git-send-email-denis@denix.org>
References: <1403713196-22214-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [daisy][PATCH 2/2] udev-cache.default: set PROBE_PLATFORM_BUS to "yes" by default
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
X-List-Received-Date: Wed, 25 Jun 2014 17:20:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Force probing of "platform" bus by default.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

[Backport from OE-Core/master 6aae37c66fb6e7153b829ad860b7e7f94e804bd4]
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


