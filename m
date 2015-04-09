Return-Path: <ticotimo@gmail.com>
Received: from mail-vn0-f52.google.com (mail-vn0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 981E672D74
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 23:55:40 +0000 (UTC)
Received: by vnbg190 with SMTP id g190so814389vnb.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 16:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4GWDDWR0MTWDIpnSv4tNiJRyVbjPYKuj5sDHVD3BRCs=;
	b=e5yThexptAD1hHH6YhkV6o8kF7y4rnVECy9tutPnBIR/zKdVnOtK0HGQ2k0g+F6rHl
	9ZbYuZ7q8BIELAk+Z7Ckvq6hZtA4CGDP6n1ELeGe6Wxw7ewdSezFe54uIeCuXRvLdsfR
	LFlsphcCUEhKxAtl13EIluiU0EEDcGSMB38Xy0K2NsYLrIrJ5guz//REYvKSC/+Z8Egw
	UUiq9R/ce7gga1o/wFIy9WGrx3PhExMIzP1xRR37DPdnKmuJPCV7X2GJmgIDShunG0nV
	HpXb//0yDMaqLS0r1Ix/vYUDoqgPGnwtEXadzNH1mNU/3/M9T3JZulUX5ruS+VjxgGTN
	yVgg==
X-Received: by 10.170.197.130 with SMTP id o124mr9171477yke.77.1428623742185; 
	Thu, 09 Apr 2015 16:55:42 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by mx.google.com with ESMTPSA id n22sm296681yho.1.2015.04.09.16.55.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Apr 2015 16:55:41 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 16:55:23 -0700
Message-Id: <1428623723-5794-2-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1428623723-5794-1-git-send-email-TicoTimo@gmail.com>
References: <1428623723-5794-1-git-send-email-TicoTimo@gmail.com>
Subject: [PATCH 2/2] generate-manifest-3.3.py: Add fractions to ${PN}-numbers
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
X-List-Received-Date: Thu, 09 Apr 2015 23:55:41 -0000

python-cryptography requires fractions module which is currently unpackaged.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/recipes-devtools/python/python-3.3-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.3.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.3-manifest.inc b/meta/recipes-devtools/python/python-3.3-manifest.inc
index 61119c6..a200561 100644
--- a/meta/recipes-devtools/python/python-3.3-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.3-manifest.inc
@@ -155,7 +155,7 @@ FILES_${PN}-netserver="${libdir}/python3.3/cgi.* ${libdir}/python3.3/*HTTPServer
 
 SUMMARY_${PN}-numbers="Python number APIs"
 RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
-FILES_${PN}-numbers="${libdir}/python3.3/decimal.* ${libdir}/python3.3/numbers.* "
+FILES_${PN}-numbers="${libdir}/python3.3/decimal.* ${libdir}/python3.3/fractions.* ${libdir}/python3.3/numbers.* "
 
 SUMMARY_${PN}-pickle="Python serialisation/persistence support"
 RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
diff --git a/scripts/contrib/python/generate-manifest-3.3.py b/scripts/contrib/python/generate-manifest-3.3.py
index 48cc84d..df5ebfa 100755
--- a/scripts/contrib/python/generate-manifest-3.3.py
+++ b/scripts/contrib/python/generate-manifest-3.3.py
@@ -309,7 +309,7 @@ if __name__ == "__main__":
     "cgi.* *HTTPServer.* SocketServer.*" )
 
     m.addPackage( "${PN}-numbers", "Python number APIs", "${PN}-core ${PN}-lang ${PN}-re",
-    "decimal.* numbers.*" )
+    "decimal.* fractions.* numbers.*" )
 
     m.addPackage( "${PN}-pickle", "Python serialisation/persistence support", "${PN}-core ${PN}-codecs ${PN}-io ${PN}-re",
     "pickle.* shelve.* lib-dynload/cPickle.*.so pickletools.*" )
-- 
2.1.0


