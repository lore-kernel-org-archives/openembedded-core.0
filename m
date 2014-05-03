Return-Path: <joelf@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id 2938560808
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 May 2014 23:26:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s43NQBbg006321
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 May 2014 18:26:11 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s43NQBvn024415
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 May 2014 18:26:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 3 May 2014 18:26:11 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s43NQBGv002026;	Sat, 3 May 2014 18:26:11 -0500
Received: from joelboxx.am.dhcp.ti.com (joelboxx.am.dhcp.ti.com
	[128.247.71.22])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with
	ESMTP id s43NQAt28097;	Sat, 3 May 2014 18:26:11 -0500 (CDT)
From: Joel Fernandes <joelf@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 3 May 2014 19:36:55 -0400
Message-ID: <1399160215-16270-1-git-send-email-joelf@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] serial-getty service: Add linux as default TERM
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
X-List-Received-Date: Sat, 03 May 2014 23:26:13 -0000
Content-Type: text/plain

In poky with systemd enabled, vt102 is selected for getty
causing user to experience a very crappy terminal. Default
TERM to linux.

Signed-off-by: Joel Fernandes <joelf@ti.com>
---
v2: Dropped PR bump

 .../systemd-serialgetty/serial-getty@.service      |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index 865de34..eb2280b 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -20,6 +20,7 @@ Before=getty.target
 IgnoreOnIsolate=yes
 
 [Service]
+Environment="TERM=linux"
 ExecStart=-/sbin/agetty --keep-baud %I @BAUDRATE@ $TERM
 Type=idle
 Restart=always
-- 
1.7.9.5


