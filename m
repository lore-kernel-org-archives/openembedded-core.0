Return-Path: <Alexandru.Vaduva@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 3B5DE73A1F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 09:52:25 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 10:52:25 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4470)	id 0CC3F2800CB;
	Wed, 11 Mar 2015 10:52:25 +0100 (CET)
From: Alexandru.Vaduva <Alexandru.Vaduva@enea.com>
To: <openembedded-core@lists.openembedded.org>, <yocto@yoctoproject.org>
Date: Wed, 11 Mar 2015 10:52:18 +0100
Message-ID: <1426067538-21975-1-git-send-email-Alexandru.Vaduva@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: Alexandru.Vaduva@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] linux-yocto-rt: removed duplicated line
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
X-List-Received-Date: Wed, 11 Mar 2015 09:52:26 -0000
Content-Type: text/plain

Seemed that the recipe contained redundant information.

Signed-off-by: Alexandru.Vaduva <Alexandru.Vaduva@enea.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 7dbf82c..bcfd754 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -23,5 +23,4 @@ COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
-- 
1.9.1


