Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C38C6D7BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 10:45:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAFAjY0O004141
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 02:45:34 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 15 Nov 2013 02:45:33 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Nov 2013 18:45:43 +0800
Message-ID: <251777d6d4284fb929939d626990ee3f26394c05.1384512287.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384512287.git.Qi.Chen@windriver.com>
References: <cover.1384512287.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sysvinit: use ALTERNATIVE to manage sulogin
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
X-List-Received-Date: Fri, 15 Nov 2013 10:45:31 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

Busybox also provides sulogin command, so we need to use the ALTERNATIVE
mechanism to manage it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 50842e2..f2d5659 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -44,6 +44,9 @@ ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
 ALTERNATIVE_${PN}-pidof = "pidof"
 ALTERNATIVE_LINK_NAME[pidof] = "${base_bindir}/pidof"
 
+ALTERNATIVE_${PN}-sulogin = "sulogin"
+ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
+
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1"
 
 ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
@@ -56,7 +59,7 @@ ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
 PACKAGES =+ "sysvinit-pidof sysvinit-sulogin"
 FILES_${PN} += "${base_sbindir}/* ${base_bindir}/*"
 FILES_sysvinit-pidof = "${base_bindir}/pidof.sysvinit ${base_sbindir}/killall5"
-FILES_sysvinit-sulogin = "${base_sbindir}/sulogin"
+FILES_sysvinit-sulogin = "${base_sbindir}/sulogin.sysvinit"
 
 RDEPENDS_${PN} += "sysvinit-pidof"
 
-- 
1.7.9.5


