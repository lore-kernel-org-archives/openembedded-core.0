Return-Path: <B50113@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0186.outbound.protection.outlook.com [207.46.163.186])
	by mail.openembedded.org (Postfix) with ESMTP id B3D2565E33
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 03:21:06 +0000 (UTC)
Received: from BN1PR03MB281.namprd03.prod.outlook.com (10.255.200.11) by
	BN1PR03MB204.namprd03.prod.outlook.com (10.255.200.155) with Microsoft
	SMTP Server (TLS) id 15.0.995.14; Mon, 4 Aug 2014 03:21:05 +0000
Received: from BY2PR03CA071.namprd03.prod.outlook.com (10.141.249.44) by
	BN1PR03MB281.namprd03.prod.outlook.com (10.255.200.11) with Microsoft
	SMTP Server (TLS) id 15.0.995.14; Mon, 4 Aug 2014 03:21:03 +0000
Received: from BN1BFFO11FD002.protection.gbl (2a01:111:f400:7c10::1:157) by
	BY2PR03CA071.outlook.office365.com (2a01:111:e400:2c5d::44) with
	Microsoft
	SMTP Server (TLS) id 15.0.995.14 via Frontend Transport; Mon, 4 Aug 2014
	03:21:03 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD002.mail.protection.outlook.com (10.58.144.65) with
	Microsoft SMTP Server (TLS) id 15.0.990.10 via Frontend Transport;
	Mon, 4 Aug 2014 03:21:02 +0000
Received: from ubuntu.ap.freescale.net (ubuntu-010192241184.ap.freescale.net
	[10.192.241.184])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s743Kvmr007250;
	Sun, 3 Aug 2014 20:21:00 -0700
From: Wang Zidan <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Aug 2014 11:21:11 +0800
Message-ID: <1407122473-16439-2-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1407122473-16439-1-git-send-email-b50113@freescale.com>
References: <1407122473-16439-1-git-send-email-b50113@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(106466001)(575784001)(95666004)(36756003)(46102001)(97736001)(74502001)(85852003)(76482001)(104166001)(81542001)(83072002)(33646002)(85306004)(20776003)(104016003)(81342001)(26826002)(77982001)(89996001)(48376002)(31966008)(93916002)(86362001)(77156001)(6806004)(229853001)(50466002)(74662001)(88136002)(84676001)(99396002)(64706001)(92726001)(69596002)(92566001)(2351001)(87286001)(81156004)(105606002)(4396001)(102836001)(62966002)(68736004)(83322001)(79102001)(87936001)(47776003)(50986999)(110136001)(80022001)(107046002)(44976005)(21056001)(19580395003)(76176999)(19580405001)(50226001)(42262001);
	DIR:OUT; SFP:; SCL:1; SRVR:BN1PR03MB281;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0293D40691
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=B50113@freescale.com; 
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-OriginatorOrg: freescale.com
Subject: [PATCH 3/3] alsa-lib: pcm_local.h: include <time.h> to enable CLOCK_MONOTONIC
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
X-List-Received-Date: Mon, 04 Aug 2014 03:21:07 -0000
Content-Type: text/plain

CLOCK_MONITONIC is defined in <bits/time.h>, add <time.h> before <sys/time.h>.

Signed-off-by: Wang Zidan <b50113@freescale.com>
---
 ...al.h-include-time.h-to-enable-CLOCK_MONOT.patch |   32 ++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb  |    1 +
 2 files changed, 33 insertions(+)
 create mode 100755 meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-pcm_local.h-include-time.h-to-enable-CLOCK_MONOT.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-pcm_local.h-include-time.h-to-enable-CLOCK_MONOT.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-pcm_local.h-include-time.h-to-enable-CLOCK_MONOT.patch
new file mode 100755
index 0000000..06cdcb9
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-pcm_local.h-include-time.h-to-enable-CLOCK_MONOT.patch
@@ -0,0 +1,32 @@
+From f6b879e7cc87d83343f5004369146881d1d1e335 Mon Sep 17 00:00:00 2001
+From: Shengjiu Wang <shengjiu.wang@freescale.com>
+Date: Wed, 23 Jul 2014 15:09:58 +0800
+Subject: [PATCH] pcm: pcm_local.h: include <time.h> to enable CLOCK_MONOTONIC
+
+CLOCK_MONITONIC is defined in <bits/time.h>, add <time.h> before <sys/time.h>.
+
+Commit f6b879e7cc87d83343f5004369146881d1d1e335 in master branch
+
+Upstream Status: Backported
+
+Signed-off-by: Shengjiu Wang <shengjiu.wang@freescale.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+---
+ src/pcm/pcm_local.h |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
+index 2206afe..80bbe59 100644
+--- a/src/pcm/pcm_local.h
++++ b/src/pcm/pcm_local.h
+@@ -24,6 +24,7 @@
+ #include <stdlib.h>
+ #include <limits.h>
+ #include <sys/uio.h>
++#include <time.h>
+ #include <sys/time.h>
+ 
+ #define _snd_mask sndrv_mask
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
index b345377..bcf2fec 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
@@ -20,6 +20,7 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://Update-iatomic.h-functions-definitions-for-mips.patch \
            file://0001-pcm-route-Use-get32-for-multi-source-route-calculati.patch \
            file://0001-pcm-rate-fix-hw_ptr-exceed-the-boundary.patch \
+           file://0001-pcm-pcm_local.h-include-time.h-to-enable-CLOCK_MONOT.patch \
 "
 SRC_URI[md5sum] = "69129a7c37697f81ac092335e9fa452b"
 SRC_URI[sha256sum] = "690ed393e7efd4fc7e3a2d2cda5449298ca0c895197e5914e350882012430d19"
-- 
1.7.9.5


