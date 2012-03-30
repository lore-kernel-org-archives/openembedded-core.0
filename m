Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDkmz-0000RE-PV
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 00:59:25 +0200
Received: by obbwc20 with SMTP id wc20so1679894obb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 15:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=eo8o3dcEFoFNclKlnTLZkTm/qeSHRIZqMUOhY8PtEJI=;
	b=ZhVi+0IeEB4ppdkuozTjhWPBtPWQ67Rd07o8xPA5CQUpaIWUKBc4zWP02T6KISKJbf
	c6qQykiqu/ZdRwocPMgRHDWqnbDNJ/jHBxfgmZs8miR6heon5jWQxq4INpqA18ay6GV4
	7tiNNRtK168EkQ/tmJrkV7wuwksXw/leUPs987jG5XwJuqi5TbTDgsvXkyC/0j6OEPPm
	LJk8mXVVNUJ3smwwhSJt8XAqO/b4vf+N0DHRmBhTEKeRuGQD5DDlxopcCef1d+hkSDnN
	JAWpvN3iC9UejSkNJ0RSsHQ1QtIk3u0yRt3xF1fJT0kt9Cdzml7WTjGKUMB8MR+aZLQ0
	Dcuw==
Received: by 10.60.24.170 with SMTP id v10mr161166oef.60.1333147820370;
	Fri, 30 Mar 2012 15:50:20 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id om2sm3806455obc.6.2012.03.30.15.50.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 15:50:19 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 17:50:14 -0500
Message-Id: <1333147814-4990-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] tune-ppce500: correct the -mfloat-gprs compiler option
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
X-List-Received-Date: Fri, 30 Mar 2012 22:59:26 -0000

From: Christopher Larson <chris_larson@mentor.com>

Per Edmar at Freescale, e500v2 needs -mfloat-gprs=double, but e500v1 needs
-mfloat-gprs=single.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/machine/include/tune-ppce500.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index feb1967..c966560 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -7,7 +7,7 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "
 TUNE_PKGARCH_tune-ppce500 = "ppce500"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe -mfloat-gprs=double", "", d)}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe -mfloat-gprs=single", "", d)}"
 
 TARGET_FPU = "ppc-efs"
 
-- 
1.7.7



