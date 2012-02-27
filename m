Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S26Y1-00036d-JI
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:47:49 +0100
Received: from mail56-ch1-R.bigfish.com (10.43.68.227) by
	CH1EHSOBE007.bigfish.com (10.43.70.57) with Microsoft SMTP Server id
	14.1.225.23; Mon, 27 Feb 2012 19:39:19 +0000
Received: from mail56-ch1 (localhost [127.0.0.1])	by mail56-ch1-R.bigfish.com
	(Postfix) with ESMTP id 9A50A1803D5	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 19:39:19 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail56-ch1 (localhost.localdomain [127.0.0.1]) by mail56-ch1
	(MessageSwitch) id 13303715586996_7886;
	Mon, 27 Feb 2012 19:39:18 +0000 (UTC)
Received: from CH1EHSMHS006.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.232])	by mail56-ch1.bigfish.com (Postfix) with ESMTP id
	F0955300045 for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 19:39:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS006.bigfish.com
	(10.43.70.6) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 27 Feb 2012 19:39:15 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Mon, 27 Feb 2012 13:38:52 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	q1RJcpYC016536	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 13:38:52 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Feb 2012 13:38:51 -0600
Message-ID: <1330371531-28803-4-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1330371531-28803-1-git-send-email-msm@freescale.com>
References: <1330371531-28803-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 4/4] tune-ppc*.inc: update to use new default value for TUNE_PKGARCH
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
X-List-Received-Date: Mon, 27 Feb 2012 19:47:49 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/machine/include/tune-ppc603e.inc   |    2 +-
 meta/conf/machine/include/tune-ppce300c2.inc |    2 +-
 meta/conf/machine/include/tune-ppce500.inc   |    2 +-
 meta/conf/machine/include/tune-ppce500mc.inc |    2 +-
 meta/conf/machine/include/tune-ppce500v2.inc |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index 663f220..02cebe7 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', 'ppc603e', '${PPCPKGARCH}', d)}"
+TUNE_PKGARCH_tune-ppc603e = "ppc603e"
 
 AVAILTUNES = "ppc603e"
 TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index bdca1aa..27ef4a8 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce300c2] = "Enable ppce300c2 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "-mcpu=e300c2", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "ppce300c2", "${PPCPKGARCH}", d)}"
+TUNE_PKGARCH_tune-ppce300c2 = "ppce300c2"
 
 AVAILTUNES += "ppce300c2"
 TUNE_FEATURES_tune-ppce300c2 = "m32 fpu-soft ppce300c2"
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index 709e14f..1326720 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "ppce500", "${PPCPKGARCH}", d)}"
+TUNE_PKGARCH_tune-ppce500 = "ppce500"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 950c46d..51e6f53 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "${PPCPKGARCH}", d)}"
+TUNE_PKGARCH_tune-ppce500mc = "ppce500mc"
 
 AVAILTUNES = "ppce500mc"
 TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index 0cbe5af..e7b51c6 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500v2] = "Enable ppce500v2 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "-mcpu=8548", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "ppce500v2", "${PPCPKGARCH}", d)}"
+TUNE_PKGARCH_tune-ppce500v2 = "ppce500v2"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
-- 
1.7.6.1




