Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0360165E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 08:08:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8G88ZBc025317
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 01:08:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Sep 2014 01:08:34 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Sep 2014 16:09:02 +0800
Message-ID: <7862e4dcd89e37d4ef0c46443e9a812c81cb57d2.1410854885.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410854885.git.Qi.Chen@windriver.com>
References: <cover.1410854885.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] acpid: use ${PN} for SYSTEMD_SERVICE
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
X-List-Received-Date: Tue, 16 Sep 2014 08:08:38 -0000
Content-Type: text/plain

We should use ${PN} instead of 'acpid' for SYSTEMD_SERVICE, otherwise
we would have the 'installed-not-shipped' QA error if multilib is enabled
and we run `bitbake lib32-acpid'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/acpid/acpid.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index 9b4c3a5..e015619 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -14,8 +14,7 @@ inherit autotools update-rc.d systemd
 INITSCRIPT_NAME = "acpid"
 INITSCRIPT_PARAMS = "defaults"
 
-SYSTEMD_PACKAGES = "acpid"
-SYSTEMD_SERVICE_acpid = "acpid.service"
+SYSTEMD_SERVICE_${PN} = "acpid.service"
 
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
-- 
1.9.1


