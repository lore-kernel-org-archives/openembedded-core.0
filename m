Return-Path: <ticotimo@gmail.com>
Received: from mail-vn0-f48.google.com (mail-vn0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 085AE6AD0D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 23:55:35 +0000 (UTC)
Received: by vnbf1 with SMTP id f1so860638vnb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 16:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QIywlhbm+owHACLEPGwkY/X0A75F9+KLKLVdKoW9Kyc=;
	b=I3U4nc6JsP1Wlcc+7s5kvWVtoZSKN/SvuDd7fOlRcwkuRon/ttc3kyfzzpsjvO0d4s
	BtUWx/vsieY//Lk+pjbWwL0w6Otfrqpb2wbWktGnLICQAOwNx1WoPh3OCZeJDrDYg+wU
	8Xzo1pf74ejAkGzPhsqIWI7ZLVlYrzXyeIvBwYO85DNtA4mNh0SPbFXRiiqV+2QxILAT
	vgy+iu6IsHgUrQmm5HUJHuu/KbbGsCR9mU8faajUqIgzRoWZomktN1NsoHiwQWznksov
	aSW34DfXEfD2HD2i0LEX/kFde6dTLa77Cq0JtV7Jjhk3zAEJYrA0QJF/nLlf9koA/ZoV
	8Obw==
X-Received: by 10.170.126.14 with SMTP id s14mr1186774ykb.103.1428623736541;
	Thu, 09 Apr 2015 16:55:36 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by mx.google.com with ESMTPSA id n22sm296681yho.1.2015.04.09.16.55.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Apr 2015 16:55:36 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 16:55:22 -0700
Message-Id: <1428623723-5794-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 1/2] generate-manifest-2.7.py: Add fractions to ${PN}-numbers
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
X-List-Received-Date: Thu, 09 Apr 2015 23:55:37 -0000

python-cryptography requires fractions module which is currently unpackaged.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-2.7.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 12f775e..4cd7a0c 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -175,7 +175,7 @@ FILES_${PN}-netserver="${libdir}/python2.7/cgi.* ${libdir}/python2.7/*HTTPServer
 
 SUMMARY_${PN}-numbers="Python number APIs"
 RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
-FILES_${PN}-numbers="${libdir}/python2.7/decimal.* ${libdir}/python2.7/numbers.* "
+FILES_${PN}-numbers="${libdir}/python2.7/decimal.* ${libdir}/python2.7/fractions.* ${libdir}/python2.7/numbers.* "
 
 SUMMARY_${PN}-pickle="Python serialisation/persistence support"
 RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 99bdca8..922ebe4 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -314,7 +314,7 @@ if __name__ == "__main__":
     "cgi.* *HTTPServer.* SocketServer.*" )
 
     m.addPackage( "${PN}-numbers", "Python number APIs", "${PN}-core ${PN}-lang ${PN}-re",
-    "decimal.* numbers.*" )
+    "decimal.* fractions.* numbers.*" )
 
     m.addPackage( "${PN}-pickle", "Python serialisation/persistence support", "${PN}-core ${PN}-codecs ${PN}-io ${PN}-re",
     "pickle.* shelve.* lib-dynload/cPickle.so pickletools.*" )
-- 
2.1.0


