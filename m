Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB01.domain01.net (STOEXHUB01.domain01.net
	[83.145.59.142])
	by mail.openembedded.org (Postfix) with ESMTP id CB87261FE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 07:31:05 +0000 (UTC)
Received: from localhost (213.114.79.21) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.279.1; Wed, 15 Jan 2014
	08:30:50 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jan 2014 08:31:02 +0100
Message-ID: <c66dfbf119c73bbb6585287daa376ab14bf11662.1389770944.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1389770944.git.anders@chargestorm.se>
References: <cover.1389770944.git.anders@chargestorm.se>
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 1/1] systemd-compat-units: remove dnsmasq from sysv disabled list
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
X-List-Received-Date: Wed, 15 Jan 2014 07:31:06 -0000
Content-Type: text/plain

The dnsmasq recipe in meta-networking ships a dnsmasq.service file, that will
correctly override the SysV init script. Thus, as pointed out by Ross Burton,
we should remove dnsmasq from the list.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-core/systemd/systemd-compat-units.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index e32ad79..d8cc3f7 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -23,7 +23,6 @@ do_install() {
 
 SYSTEMD_DISABLED_SYSV_SERVICES = " \
   busybox-udhcpc \
-  dnsmasq \
   hwclock \
   networking \
   syslog.busybox \
-- 
1.8.5.2


