Return-Path: <bevenson@melinkcorp.com>
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.231])
	by mail.openembedded.org (Postfix) with ESMTP id 3C10272E49
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 15:07:48 +0000 (UTC)
Received: from [98.100.91.242] ([98.100.91.242:49722]
	helo=evenson-fedora-vm.melinkcorp.local)
	by cdptpa-oedge03 (envelope-from <bevenson@melinkcorp.com>)
	(ecelerity 3.5.0.35861 r(Momo-dev:tip)) with ESMTP
	id D1/CF-29784-14615355; Mon, 20 Apr 2015 15:07:46 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 11:07:37 -0400
Message-Id: <1429542458-4291-2-git-send-email-bevenson@melinkcorp.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1429542458-4291-1-git-send-email-bevenson@melinkcorp.com>
References: <1429542458-4291-1-git-send-email-bevenson@melinkcorp.com>
X-RR-Connecting-IP: 107.14.168.142:25
X-Cloudmark-Score: 0
Subject: [PATCH 1/2] sysvinit: Add lastb to alternatives
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
X-List-Received-Date: Mon, 20 Apr 2015 15:07:48 -0000

SysVinit creates lastb as a symlink to last during the build.
Just as other applications may provide last, other applications
may provide lastb.

Add alternatives designations for lastb to avoid installation
conflicts with other applications.

Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 00d3333..2c7e3ce 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -29,7 +29,7 @@ B = "${S}/src"
 inherit update-alternatives
 DEPENDS_append = " update-rc.d-native base-passwd"
 
-ALTERNATIVE_${PN} = "init mountpoint halt reboot runlevel shutdown poweroff last mesg utmpdump wall"
+ALTERNATIVE_${PN} = "init mountpoint halt reboot runlevel shutdown poweroff last lastb mesg utmpdump wall"
 
 ALTERNATIVE_PRIORITY = "200"
 
-- 
2.1.0


