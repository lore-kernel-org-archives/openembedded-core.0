Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36D907E2AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 09:35:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4T9ZW6m027533
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 02:35:32 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 29 May 2019 02:35:31 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2019 17:35:06 +0800
Message-ID: <1559122507-53104-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559122507-53104-1-git-send-email-changqing.li@windriver.com>
References: <1559122507-53104-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] resolvconf: add rconflicts
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
X-List-Received-Date: Wed, 29 May 2019 09:35:31 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

add rconflicts since error during do_rootfs:
file /sbin/resolvconf conflicts between attempted installs of resolvconf-1.79-r0.noarch and systemd-1:242+0+db2e367bfc-r0.i586

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
index 8550177..7fa13ac 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb
@@ -65,3 +65,4 @@ pkg_postinst_${PN} () {
 }
 
 FILES_${PN} += "${base_libdir}/${BPN}"
+RCONFLICTS_${PN} = "systemd"
-- 
2.7.4


