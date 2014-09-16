Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 464B471449
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 08:08:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8G88c9H025326
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 01:08:38 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Sep 2014 01:08:37 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Sep 2014 16:09:04 +0800
Message-ID: <e082072fe648c56e46f00c80c4a9aa329513c30d.1410854885.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410854885.git.Qi.Chen@windriver.com>
References: <cover.1410854885.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] volatile-binds: use ${PN} for SYSTEMD_SERVICE
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

As this recipe inherits allarch, it makes no real difference whether
we are using ${PN} or 'volatile-binds'. But using ${PN} would keep
the same style with the other recipes in OE.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index 4080ff7..694ba1e 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -28,7 +28,7 @@ def volatile_systemd_services(d):
         services.append("%s.service" % what[1:].replace("/", "-"))
     return " ".join(services)
 
-SYSTEMD_SERVICE_volatile-binds = "${@volatile_systemd_services(d)}"
+SYSTEMD_SERVICE_${PN} = "${@volatile_systemd_services(d)}"
 
 FILES_${PN} += "${systemd_unitdir}/system/*.service"
 
-- 
1.9.1


