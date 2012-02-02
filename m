Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RswP1-0001AG-HH
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 14:08:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 447E3315879B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2012 14:00:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id kyxRQHo7dfsF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2012 14:00:35 +0100 (CET)
Received: from [172.22.22.61] (drms-4d0158ce.pool.mediaWays.net [77.1.88.206])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 35E2D3158799
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2012 14:00:35 +0100 (CET)
Message-ID: <4F2A88F2.60906@opendreambox.org>
Date: Thu, 02 Feb 2012 14:00:34 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tune-mips32.inc: Add mips32-nf and mips32el-nf
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
X-List-Received-Date: Thu, 02 Feb 2012 13:08:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

tune-mips32.inc only lists mips32 CPUs with hardware FPU.
Extend it to list CPUs without hardware FPU, too.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/conf/machine/include/tune-mips32.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index 4a5f0fa..45d865e 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -6,9 +6,13 @@ TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
 TUNE_CONFLICTS[mips32] = "n64 n32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-march=mips32", "", d)}"
 
-AVAILTUNES += "mips32 mips32el"
+AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
 TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
 PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips"
 TUNE_FEATURES_tune-mips32el = "${TUNE_FEATURES_tune-mipsel} mips32"
 PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel"
+TUNE_FEATURES_tune-mips32-nf = "${TUNE_FEATURES_tune-mips-nf} mips32"
+PACKAGE_EXTRA_ARCHS_tune-mips32-nf = "mips-nf"
+TUNE_FEATURES_tune-mips32el-nf = "${TUNE_FEATURES_tune-mipsel-nf} mips32"
+PACKAGE_EXTRA_ARCHS_tune-mips32el-nf = "mipsel-nf"
 
-- 
1.7.5.4



