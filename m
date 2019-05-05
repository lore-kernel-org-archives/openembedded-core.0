Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 813637D6A8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 05:23:15 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id f7so2560949wrq.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 22:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Cw4abVEKmtIn9MCsxLoxlfOrihn7dafVuVpXMMD24mo=;
	b=DiqpwFip7RxkCjeoTGoKe/eUWTlYDhV4Tt2ZBf0hqGH+F1iFcNucuNvzoRugoEoM3U
	eROdxsVIUJy1PchVpb7z2XsXjt2PZGu36MLYM9oaxchJ5KinxPziM2zMWEw0G2nT3Qkt
	hbSMFGDu0t73gBiesgw3tqG1mSr25fK2lm75fysp7c0SEN2GHGKTdrACjqSXCPhAV3ci
	EBOZKJP5VW9yN6ERPTBOSYTe/klT/FClj+aJGssdtte51stx3UG3CJ3UxxzmmIuQP7Cr
	pMY96E4OKOjBm8cDQT0LKPifu9BziTL2+5EztkCiOp/Lj9T62RWzhp6ksY5DCGYTR3tj
	qYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Cw4abVEKmtIn9MCsxLoxlfOrihn7dafVuVpXMMD24mo=;
	b=BngtqGlTngW4GGaAAnYWJalqNQE1fl7MDwjmqVFJXefsgH2eQ6mRq5j53aBWmJVtS0
	TrGPL4bb2Gny/kWLqHMP/j8SwdTTlk/ZUHJNcijD5CbF3k/gai1FD6xXl5ksCccOGCPu
	HOCRsm/+dkUYKtk2BdrIsFnuMA5+QhiTtNA7+/En8QZzfLLrACRsKE5rgTfgjgFA9xue
	sAJzuzBX6j8YNDThl3bieJQaU+COn6cx2gLH21nuecjHKOsIseeFpqbhAQugCWFznRce
	IbW+FpCFtromKiRDtEndqgWRVeQLXoUGw8E/GxgfHBxDMvtaY51oNIWP8jUCkdreljmc
	6z6w==
X-Gm-Message-State: APjAAAWNpCHYQ3D/hE64k6CgR2Y6sFE/68yQbnR+6py8uiv1NCruAq1V
	y+PYx8kLpzeAZ2FloqCpGxsb9xSr
X-Google-Smtp-Source: APXvYqyabAXRxtTWKrfsr7CtxNiFMn0eJ2uhuDfiuAwqKz5p6RaN3xKfy2OOFb6GGfduoUv1WdK54g==
X-Received: by 2002:a5d:638c:: with SMTP id p12mr13273644wru.61.1557033796146; 
	Sat, 04 May 2019 22:23:16 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	c21sm9524260wme.36.2019.05.04.22.23.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 May 2019 22:23:15 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 May 2019 06:23:13 +0100
Message-Id: <20190505052313.21764-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python3: Add ntpath.py to python core
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
X-List-Received-Date: Sun, 05 May 2019 05:23:15 -0000

The newer python3 recipe no longer includes ntpath.py in core, leading
to failures in pkg_resources:

  Traceback (most recent call last):
    File "/usr/bin/bmaptool", line 6, in <module>
      from pkg_resources import load_entry_point
    File "/usr/lib/python3.7/site-packages/pkg_resources/__init__.py", line 42, in <module>
      import ntpath
  ModuleNotFoundError: No module named 'ntpath'

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 0a4ab2cbe43e..0803ac00334e 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -281,6 +281,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/linecache.py",
             "${libdir}/python${PYTHON_MAJMIN}/locale.py",
             "${libdir}/python${PYTHON_MAJMIN}/new.py",
+            "${libdir}/python${PYTHON_MAJMIN}/ntpath.py",
             "${libdir}/python${PYTHON_MAJMIN}/opcode.py",
             "${libdir}/python${PYTHON_MAJMIN}/operator.py",
             "${libdir}/python${PYTHON_MAJMIN}/optparse.py",
-- 
2.17.1


