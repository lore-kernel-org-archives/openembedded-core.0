Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 059BC7836E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 20:19:31 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x82so7626935wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 13:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=eRlSoAycowHf6DXzBA7n8W6Wh9l5CtEwga2vRGlTdGI=;
	b=ijZswOmweQmsUOMfIwRTvfIuTW36fiRQSEzFcGhJhf7/AiRSOov1SRjTerLPL0IY0f
	0rSfxbxVMuJphfYy3ibJJZuq+fg5iz/xjnky5c1+mGZCBlT2UEr33nOoMLMhmcfrgugr
	KjknrfzcMTS8pxZuewcQDxzAfeUlpQ/IenGAvuRZpxhVeAe62IHKEb4GZd/h5xS4fto7
	r6AfU442SruubXJEtavwtrwn5of7Y5CwMSJcZnztEhiJ47tK6zBKu9BDKe/MhIDEuGG4
	e/8q62QDL+Ocbdgyk7szC3JkgV3DZrzAYCNELB9Ffk55AJDO6gakvpVQbAuuE6f2PLUT
	R3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=eRlSoAycowHf6DXzBA7n8W6Wh9l5CtEwga2vRGlTdGI=;
	b=Gs4S272ZCFvI2S+ZIB3wMl5E3X8QiehVSyT1N5aef6QQclZugc+NNZIeRqcnc5b2XR
	qHHxQPQZQ27eRadvgvW9+NbdqIw61zs82JOcD6UuZriNdkJpW8MzFosgCyMeCjYqcW/K
	lTNVD+u+V2QX+lAClaBZ8w6ryKLublJzG/a+fd+DvFoSrsedJxdLbEmWvlS6rWkePMbc
	mVY93stm9KeDEBG4lbjr7o7+RSaoeuMMWm7CsRSpJrlvHQTMyLQXcf0zo7xQHKO2Ih7I
	p71n/+FoaKh7XfCwYbzIc5yJrDzLygbXbf2haK05oAXfeAgvmaIECBoVYPU1FloyYRPG
	OMPQ==
X-Gm-Message-State: AElRT7FomFAck9/dhFbohft1mgIJ7u8TywMin4z/SQ82KSEUmEhm1Wwj
	sYWNi4FpglVoy4UOluM6CdHf9Flr
X-Google-Smtp-Source: AIpwx4+tlKZDwryYUhseC5cRn+QW+5pCzCYOHmQHcNC+cbD4MVJu+bjvyp62flNxee2oioy0EiCsTQ==
X-Received: by 10.28.54.88 with SMTP id d85mr4098929wma.2.1522268372391;
	Wed, 28 Mar 2018 13:19:32 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m184sm219520wme.40.2018.03.28.13.19.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Mar 2018 13:19:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2018 21:19:29 +0100
Message-Id: <20180328201929.6810-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python3: consolidate sqlite3 files
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
X-List-Received-Date: Wed, 28 Mar 2018 20:19:32 -0000

Some of the sqlite3 module was in python3-misc by accident, move the files
into python3-sqlite3 where they belong.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 1914a4c43ba..95071c53f5a 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -977,9 +977,12 @@
         "summary": "Python Simple Mail Transport Daemon"
     },
     "sqlite3": {
-        "cached": [],
+        "cached": [
+            "${libdir}/python3.5/sqlite3/__pycache__/*.pyc"
+        ],
         "files": [
-            "${libdir}/python3.5/lib-dynload/_sqlite3.*.so"
+            "${libdir}/python3.5/lib-dynload/_sqlite3.*.so",
+            "${libdir}/python3.5/sqlite3/*.py"
         ],
         "rdepends": [
             "core"
-- 
2.11.0


