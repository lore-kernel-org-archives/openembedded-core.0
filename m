Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 437DE799D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 16:06:19 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id n23-v6so2750618wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 09:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JtK1hc+bvmyjw67e3lSv3no0cTcGgAoBZk8h3RxZcyo=;
	b=mGfuS2vadZaMfq4hL5GXXDkvK02/5MVTNDewJkKLjtI6o5mpc3PrVG0Nfb6MYti782
	3i5OX+Rq/gzEmCx0ESF8F5VywPtZmz0hlbi3cFODtJ4sGuEnPKeXkqwH3Cs+W1h5EyPN
	8VeexiVz+TIC5FMRH1NVtyTmacmntQ4rBCR1CUsSIpi1SsS1uECSumnITTJ5UH0ekrZB
	N0CaIogfVG38MFGZWqr5ErtXQ/vBVIVMQL7Y++Do0CbAKJjwaDRyvgHTGGU4mwsv/NLS
	Xk8FONVnjj/DxtaB3XAiOIpI+rVFOnp50KoY9lSqqacviiuK7USDyTSt41yd+ZnKs5Ip
	RsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JtK1hc+bvmyjw67e3lSv3no0cTcGgAoBZk8h3RxZcyo=;
	b=krabCPPP8Gg57nRLBHHu1XkKjl8ZctH9K+3WxwyI5Z2uqrWje/wQg3ahUuTn790PGY
	zJRC4AvePPOQdvHJzZs3OsXjXNXOWptewUeIGlXdA/VV4Ih7B8wvD0yXWjjFTwdTWaLb
	MLSTwBhUb8dyJTRNzkQ9GUrT58nEaOPd2s5fSRkBLtbyDhHXJjac1OeJbeAAuDlTks73
	PXKNiDFsYxrtZHTcaAezv+oNcsB2DiMGGSSl5uXQWF+xgl8gJzqeE/VWtxNw6IQ0/MfM
	oBW9pFzAVhxugnoVKY7VMrSd60/bqrjdYtU7tkbzMDPIlyksgyiVTDKUZ9puKMv9wKC7
	hVJA==
X-Gm-Message-State: ABuFfoitNw/kofe22ulRubpSZYr3020+hAff4gn/qx20ZImlBEh5C3Y6
	TZscCkEBKbafgUtRBGpzXknSmV7WsGM=
X-Google-Smtp-Source: ACcGV60wNXsClGxwu0HMlsnw3w5E2WvxA4wwrGSZ19cW1cI3covF/DutLmZSS/nOTu6uqBBrnVja1w==
X-Received: by 2002:a1c:f4e:: with SMTP id 75-v6mr2226690wmp.79.1538150779491; 
	Fri, 28 Sep 2018 09:06:19 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	11-v6sm7562289wrb.95.2018.09.28.09.06.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Sep 2018 09:06:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Sep 2018 17:06:14 +0100
Message-Id: <20180928160616.6672-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] python3: move sqlite files into python-sqlite
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
X-List-Received-Date: Fri, 28 Sep 2018 16:06:19 -0000

sqlite3/__init__.py was accidentally included in python3-misc.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 539b7967b59..f922561368d 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -994,14 +994,9 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sqlite3.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/dbapi2.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/dump.py"
+            "${libdir}/python${PYTHON_MAJMIN}/sqlite3"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dbapi2.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dump.*.pyc"
-        ]
+        "cached": []
     },
     "stringold": {
         "summary": "Python string APIs [deprecated]",
-- 
2.11.0


