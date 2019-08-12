Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id AC1D97E584
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 13:49:08 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id f72so12211641wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 06:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AQm+WNcZ5Yoo1s0O2Jj1632t0SjnfFmBMdstJnad3Ak=;
	b=aH9sElnMJ3LTGdZxhbsaPfGXyVXKo13b+6PuCURyo7KWXmpaC+5ASh8EtrP2cfTuSw
	jnXQSfxfYavQhD5q0+K7KDEausjrMuQYRhXnb9otlGnkvzxa/FYuObJs0ObouC/WhH1R
	xkLZnGLAUWN5NoWNAbp1qAw8aWZI/yuMQY/74//GENs8xdc7xz/sIX4vNZyDE14LULpu
	G4Do+kmj7FnT4RybE6A/3dZKoypvi/DsaXR00neooyFcmuxQs0TYhWXQlADMrxEG77UV
	RVQSIC95mWTaUcYINXF+mRSGWzoXczThSB7BfjW+mPcgCyMXXxu1c96ZWlOMjgPZ3GBm
	2yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AQm+WNcZ5Yoo1s0O2Jj1632t0SjnfFmBMdstJnad3Ak=;
	b=lXTsuzIily/mqpaWm4ymAcJ/6bdtyqgXDs6Dr7/ZUHfydMod845G/C2Vxh8A3zGbE0
	jMa0felT2dS3n2i0QtL5Yr0nAXXQkVrkw6VBWp+lM4yYyafJnY1uEDVkBwn2GC2Jq0TE
	6TBObhnVWA8mrGp0FT3YYkZLgEhrK3KP58LOvH3uQBUGvJchwG9TJRU+KJK7G/YuHFh5
	BH9trNY5koNIIWDbedFGrpjsisXCnR02vpEzJg1dj1g2ozxRLeKKcg99n28FDZhKXfI3
	NDtzYW64zSpibzZK3eLjKDVOB+ecdMlbCu7RrGS787DqeVTRL5q0L7e4v1GRzBe/Ih0A
	wLzg==
X-Gm-Message-State: APjAAAVD9hb6hTX78r1n18ED6IPTBXSHsr3dEK4aQI5GwutpMR7w4Zb4
	FwoxBamObjUZGNYb03ARzJKy5/Pb7fY=
X-Google-Smtp-Source: APXvYqyEqewZfZ+O2ULgHMD/yQi54FI69EnlMsV81vyc95vVRewjs6NwyqCLRjFKZfD4FtfPgRv2rw==
X-Received: by 2002:a05:600c:352:: with SMTP id
	u18mr3577455wmd.141.1565617749136; 
	Mon, 12 Aug 2019 06:49:09 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t14sm11932646wrv.12.2019.08.12.06.49.08
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 12 Aug 2019 06:49:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2019 15:49:00 +0200
Message-Id: <20190812134903.55045-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/4] python-numpy: remove the python 2.x version of the recipe
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
X-List-Received-Date: Mon, 12 Aug 2019 13:49:08 -0000

The 1.17.0 release of NumPy no longer supports Python 2.x.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc               |  1 -
 .../python-numpy/python-numpy_1.16.3.bb                | 10 ----------
 2 files changed, 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5cf9c7a8e80..c713c811ffa 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -588,7 +588,6 @@ RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-python = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-scons = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-scons-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
deleted file mode 100644
index a1133dad41c..00000000000
--- a/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit setuptools
-require python-numpy.inc
-
-RDEPENDS_${PN}_class-target_append = " \
-    ${PYTHON_PN}-subprocess \
-"
-
-do_install_append(){
-        rm ${D}/${bindir}/f2py
-}
-- 
2.17.1


