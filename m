Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 923FD70D20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 03:08:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7F3918M022338
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 20:09:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 14 Aug 2014 20:09:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Aug 2014 11:09:07 +0800
Message-ID: <d55a27c4e72655ec36422efdac52fe18224e8dfa.1408071677.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408071677.git.Qi.Chen@windriver.com>
References: <cover.1408071677.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 07/10] systemd: add kbd-keymaps to RRECOMMENDS of systemd-vconsole-setup
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
X-List-Received-Date: Fri, 15 Aug 2014 03:09:01 -0000
Content-Type: text/plain

systemd-vconsole-setup.service not only configures font but also
keymaps.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_215.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_215.bb b/meta/recipes-core/systemd/systemd_215.bb
index 0ed9a6f..97d7d51 100644
--- a/meta/recipes-core/systemd/systemd_215.bb
+++ b/meta/recipes-core/systemd/systemd_215.bb
@@ -208,7 +208,7 @@ FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
                       ${systemd_unitdir}/system/systemd-binfmt.service"
 RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
 
-RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
+RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
 
 CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
                 ${sysconfdir}/systemd/logind.conf \
-- 
1.7.9.5


