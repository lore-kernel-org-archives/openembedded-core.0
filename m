Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlfyS-00057Q-Vu
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 14:15:51 +0100
Received: from mail-we0-f200.google.com ([74.125.82.200])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 05:00:59 -0800
Received: by mail-we0-f200.google.com with SMTP id x43so2553040wey.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 05:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=jmPFWHT47xWvi1KH8Io+EgWqV6t1hPsT2zlWVgkIs/c=;
	b=VThQafmU6Pjk6dTnyUTkXSCnXV2ONDYPF1vB6ej8O8b1ERYVIBmy5H8DCuOtPWE44B
	SlywrIAxqIQt/SkYSyvk++noe0iFID8BLTnFqKPOVskca5l0WePS6W27KXLDmmJWBogT
	E2m/FD9qi7vRml00vP5xbYVKEX6bhE8lTyskn6W0btutOGkX1HYkPJe/ScqFmnYlwEmO
	9tXXYpPDzQ25G5D3prB4QSo87UFkAd19B6x1dIesncowpzgIelPX8TuUhymBGE97SpVN
	eqUQyUoV1NCtxhyYYwCl7pUvn+DGJjj2OdhiwevNbUKBf6oxrvO66SIxPXQJsYBWFfWs
	ImwA==
X-Received: by 10.194.92.180 with SMTP id cn20mr17413730wjb.51.1356008457398; 
	Thu, 20 Dec 2012 05:00:57 -0800 (PST)
X-Received: by 10.194.92.180 with SMTP id cn20mr17413718wjb.51.1356008457301; 
	Thu, 20 Dec 2012 05:00:57 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p3sm25116206wic.8.2012.12.20.05.00.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 05:00:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2012 12:59:13 +0000
Message-Id: <1356008353-12375-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlDYyPpZ7Z5WDaMkv629s130mXaUOrzyXobkl7/3/Z+gMCXHdBH1GdU6RiqxxV0hcl9yi/EiLpAsoQhH7eBLLF0JeM3HTd/hwXTcgm/7TFz56+LO05ephWn6lHCkg7NQ4QlqF2Fs/jCA9vyhBe9RYsspQIfwv9PVVmA+Uj3S3zk2tnR7XH3Slwp5WWxU/zVWq+cSSzi
Subject: [PATCH] python: add -crypt as a dependency on -math
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 13:15:51 -0000

random.py imports hashlib, so add this missing dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 1e16c6b..3c7be7e 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -139,7 +139,7 @@ RDEPENDS_${PN}-mailbox="${PN}-core ${PN}-mime"
 FILES_${PN}-mailbox="${libdir}/python2.7/mailbox.* "
 
 DESCRIPTION_${PN}-math="Python Math Support"
-RDEPENDS_${PN}-math="${PN}-core"
+RDEPENDS_${PN}-math="${PN}-core ${PN}-crypt"
 FILES_${PN}-math="${libdir}/python2.7/lib-dynload/cmath.so ${libdir}/python2.7/lib-dynload/math.so ${libdir}/python2.7/lib-dynload/_random.so ${libdir}/python2.7/random.* ${libdir}/python2.7/sets.* "
 
 DESCRIPTION_${PN}-mime="Python MIME Handling APIs"
-- 
1.7.10



