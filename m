Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBADA728F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 09:17:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ9Hmuk028038
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 01:17:48 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 19 Dec 2014 01:17:48 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 17:17:45 +0800
Message-ID: <a17981b1a7724354814a5f9d08507df94330f4a8.1418979966.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418979966.git.Qi.Chen@windriver.com>
References: <cover.1418979966.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] alsa-utils: fix FILES of alsa-utils-alsactl
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
X-List-Received-Date: Fri, 19 Dec 2014 09:17:53 -0000
Content-Type: text/plain

Fix to use ${nonarch_base_libdir}/udev/rules.d instead of */udev/rules.d
to avoid the following QA warning.

ERROR: QA Issue: alsa-utils: Files/directories were installed but not shipped
  /usr/lib/udev
  /usr/lib/udev/rules.d
  /usr/lib/udev/rules.d/90-alsa-restore.rules [installed-vs-shipped]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
index 5f35d76..ecddd05 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
@@ -57,7 +57,7 @@ FILES_alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bind
 FILES_alsa-utils-aconnect    = "${bindir}/aconnect"
 FILES_alsa-utils-aseqnet     = "${bindir}/aseqnet"
 FILES_alsa-utils-iecset      = "${bindir}/iecset"
-FILES_alsa-utils-alsactl     = "${sbindir}/alsactl */udev/rules.d ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
+FILES_alsa-utils-alsactl     = "${sbindir}/alsactl ${nonarch_base_libdir}/udev/rules.d ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
 FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
 FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
 FILES_alsa-utils-alsaucm     = "${bindir}/alsaucm"
-- 
1.9.1


