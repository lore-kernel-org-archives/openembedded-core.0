Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id CECB260801
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 12:02:47 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id o18-v6so2039498wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 05:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=qz5LAN4BsN2Jwim5g8lDH30icplaMenjxmMotIb4YKc=;
	b=TfSpEDond5UEJqxal97qwHUjn57cldZbYNcy28+9d0DYGsVhUNR/Xw6uPI3guMK8/d
	sxsBg3Zi4I8T5BSwabBCsVLJQBlYs7qsb9EWWHrde/5eKbbebPy8dgaOGV0T6cdBcQM5
	jIop6HsHSVkVUEx513wFKIGM02AFuAQvOHpu48iiZsy8VcChQiC0JRDBM9tlOVusv4ro
	5UXJz8WEBN3suky0o4z5+PDiVfAbYsn/xDx8cYzysGW5tbu/+Y0X5ykEnR9ReHiQ3rES
	CHfHO2mvUn5YpviyXsn7VIqkyezxc4KksZkmE4uL2FZx4iT1dpCcQ7vLgqP2v7T30A/i
	aG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qz5LAN4BsN2Jwim5g8lDH30icplaMenjxmMotIb4YKc=;
	b=SfzngfoZqNefvGCtMtfHov1DDeIns6JVJpIDb3/2B3NQ3tb5o3bXRDeCM6777W3mS/
	elgmqQeJNQt+OzXVJVwjkyzpfm4+17VV6VgA15ZMAzhPsWXqJrn0/Ex1r8IPPQItUDTe
	UuwaWqNwUjiJqy9sFFLjDbs1wpy+glGvf6ZAcZhpcMCr5SprLlHa253dmotMa39ZOdRO
	VGX+BTjthv3wzSdQRgvK2SSZGnLMROmxUjjMGYjeMRh7/Gi/5iOTbQXMwEx5mHfn+Spq
	Dt6T6QtpobR/xXnnbU9HC5UwXRcrzyUkD8Ua5tcKnIMi6xjws/iEuVVeBORhEwT4z/jM
	Q6fA==
X-Gm-Message-State: ABuFfohkwPAr31XXh9+7h91pvKm9bEocA1MybZ7zfbMX2Mht1EypWSlb
	wOZ3+XY/KvCM1gHhvTQI4FP1FYnbxao=
X-Google-Smtp-Source: ACcGV60O17+fwr2Kjf49yyRpKjPwSNNRoevKq/Ktp5Mqj7OczsnKQXf654pwYrZ9MmPFcRNj2tIG1g==
X-Received: by 2002:a1c:aa0c:: with SMTP id
	t12-v6mr4155683wme.109.1537963368164; 
	Wed, 26 Sep 2018 05:02:48 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v6-v6sm3385899wmc.43.2018.09.26.05.02.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Sep 2018 05:02:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 13:02:46 +0100
Message-Id: <20180926120246.1024-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python3: move sqlite files into python-sqlite
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
X-List-Received-Date: Wed, 26 Sep 2018 12:02:48 -0000

sqlite3/__init__.py was accidentally included in python3-misc.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 539b7967b59..fe8bb992928 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -994,13 +994,11 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sqlite3.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/dbapi2.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/dump.py"
+            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/*.py"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dbapi2.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dump.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/*.pyc"
         ]
     },
     "stringold": {
-- 
2.11.0


