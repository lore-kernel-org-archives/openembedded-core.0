Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlLd2-0002Ty-Qj
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 15:27:44 +0100
Received: by eekd17 with SMTP id d17so578826eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 06:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=llNeAwViFIk7rDYjSir9legBBo54gkWs14lKlZnhb+8=;
	b=ZizszN1LmRIMfnjALXd4wUAM5t135+76LMbzEgglBcr6TPChMQTl6qVEOG5mEv43uK
	zqVANZv1Sy4ALso03T1vr6rqbpI4D5jGyltqrAuaiQEQpPR5JxYp4W5PHajiuRgHSafX
	172gvy4SEBOBvnKOyWDUWgQvz1n2IiLlnimBg=
Received: by 10.14.126.202 with SMTP id b50mr1422175eei.66.1326378013676;
	Thu, 12 Jan 2012 06:20:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t59sm19974878eeh.10.2012.01.12.06.20.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 06:20:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 15:20:01 +0100
Message-Id: <1326378001-11488-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <48CE4DDF-8D48-43D4-A294-0E69A6D64608@dominion.thruhere.net>
References: <48CE4DDF-8D48-43D4-A294-0E69A6D64608@dominion.thruhere.net>
Subject: [PATCH] dbus-1.4.16: use INC_PR from dbus.inc to fix PR bump after dbus-launch-helper permission change
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
X-List-Received-Date: Thu, 12 Jan 2012 14:27:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/dbus/dbus_1.4.16.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.4.16.bb b/meta/recipes-core/dbus/dbus_1.4.16.bb
index f87f266..3cf8bb8 100644
--- a/meta/recipes-core/dbus/dbus_1.4.16.bb
+++ b/meta/recipes-core/dbus/dbus_1.4.16.bb
@@ -1,5 +1,7 @@
 include dbus.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI[md5sum] = "44a2a10678e7e50460879c3eb4453a65"
 SRC_URI[sha256sum] = "1d8ee6262f8cc2148f06578eee522c755ba0896206b3464ca9bdc84f411b29c6"
 
-- 
1.7.8.3



