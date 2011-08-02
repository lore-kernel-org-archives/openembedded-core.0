Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QoEBt-0008Ri-Tf
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 14:35:22 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QoE7h-0006Yq-5J from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 05:31:01 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 2 Aug 2011 14:30:59 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2011 17:30:18 +0500
Message-Id: <1312288218-15909-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 02 Aug 2011 12:31:00.0148 (UTC)
	FILETIME=[09226F40:01CC5110]
Subject: [PATCH] kernel.bbcalss: Added do_savedefconfig task.
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
X-List-Received-Date: Tue, 02 Aug 2011 12:35:22 -0000

* Added do_savedefconfig task to kernel.bbclass.

Signed-off-by: Noor, Ahsan <noor_ahsan@mentor.com>
---
 meta/classes/kernel.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 25d2629..f2f05b1 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -197,6 +197,12 @@ kernel_do_configure() {
 
 do_configure[depends] += "${INITRAMFS_TASK}"
 
+do_savedefconfig() {
+	oe_runmake savedefconfig
+}
+do_savedefconfig[nostamp] = "1"
+addtask savedefconfig after do_configure
+
 pkg_postinst_kernel () {
 	cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
 }
-- 
1.7.0.4



