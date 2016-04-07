Return-Path: <christrobridge@hotmail.com>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Apr 2016 20:23:27 UTC
Received: from BLU004-OMC3S20.hotmail.com (blu004-omc3s20.hotmail.com
	[65.55.116.95])
	by mail.openembedded.org (Postfix) with ESMTP id 3E44977045
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 20:23:27 +0000 (UTC)
Received: from BLU436-SMTP83 ([65.55.116.72]) by BLU004-OMC3S20.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Thu, 7 Apr 2016 13:18:24 -0700
X-TMN: [UnKHlWRcqUV2jdIdWNVFXut7qSoGWPnm]
X-Originating-Email: [christrobridge@hotmail.com]
Message-ID: <BLU436-SMTP83DC6F8AAB9D0165AB0E9BDA900@phx.gbl>
From: Chris Trobridge <christrobridge@hotmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 7 Apr 2016 21:18:12 +0100
X-Mailer: git-send-email 2.4.3
X-OriginalArrivalTime: 07 Apr 2016 20:18:21.0160 (UTC)
	FILETIME=[A141CE80:01D1910A]
MIME-Version: 1.0
Subject: [PATCH] Add missing runtime dependency to python-pygobject
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
X-List-Received-Date: Thu, 07 Apr 2016 20:23:28 -0000
Content-Type: text/plain

Signed-off-by: Chris Trobridge <christrobridge@hotmail.com>
---
 meta/recipes-devtools/python/python-pygobject_3.18.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-pygobject_3.18.2.bb b/meta/recipes-devtools/python/python-pygobject_3.18.2.bb
index 8fe1d63..a9871fe 100644
--- a/meta/recipes-devtools/python/python-pygobject_3.18.2.bb
+++ b/meta/recipes-devtools/python/python-pygobject_3.18.2.bb
@@ -22,4 +22,4 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF = "--disable-cairo --with-python=python2.7"
 
-RDEPENDS_${PN} += "python-setuptools"
+RDEPENDS_${PN} += "python-setuptools python-importlib"
-- 
2.4.3


