Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF906BDCD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 16:53:22 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id r17so568898wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 08:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NPxwRFKdxFZUvFzbJgZuCFRr077QPQwUh6vGyOTcZLQ=;
	b=EAlohlrBGX9PlkDkV9HSGMohak/8tPqCngy3vZYBhudLCBlI5cOZjC5bSHgDFzUTMS
	FDJ27zoROPR151Eexn6H1Ezp5SwiNkmB59VrTWgoSKxF/PlpNIUrFrfH+HHumMkZxC8J
	8Vi2Yv4bfY0klXjDz0Kc7cUPZIxpuJO73fP6D0vA8ifiTLvTqm/PMhPt4VdTte9m1Rcz
	la/djHWsZTJJ2vl/S3o8o9jDEqkhnRQS1xcBmNmu/TgiwHbA3Wlyog7xAzNOTbkJEPtD
	lyrQigZIDSTR2sBV34pcdrq56sLqm7kdWAKvtJ348Mdt5S7ajM85O8e3yNTvzsBkyx5W
	XSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NPxwRFKdxFZUvFzbJgZuCFRr077QPQwUh6vGyOTcZLQ=;
	b=qEZz1HoxU5c7yw4CX9PgcFnEJFHROyMM0lS533xjruWho7+00DIssJm763hvLgMrIR
	d382oRwWtixP4rEQKSFsa8I+T8KnBOrmUO1cXfX/jVhmC0I73kCV1YXu46znTiTXqNuk
	pN180QPrsWNS4P6ezyiyXMyT0o1sUGiWpwkMnAw/9q/qrZu3nSa/TdHSNDHB/Mx/skMe
	8v3GcwaNulZUfHY5gyhUCIq/LP2OMdzgPzUc8S1bbbBuPjwM58fyXLXcGZL3/llLglkW
	u1stYU+4U/y6zito9goHoxg+lH4DOIh89EN8tJvZUp/ZS6hxFEAZuNV+y6UL5Wue/Lff
	QonQ==
X-Gm-Message-State: AHQUAuZ36c2qjAeIVV1uGwB+8NUD8W0EM9pyr1hg+gnE0ba1ioT1WOiK
	5OWjLaT8GPQ9t3X45l0tTyHN9gYS
X-Google-Smtp-Source: AHgI3IYiZR9CwPQN+Pm+0GoZYjvXmGAyiY/zRhIp6Bl+phoWeeXUAeSSiiAZe9OvEWE/fMi7T81bBQ==
X-Received: by 2002:a7b:c937:: with SMTP id h23mr7391507wml.76.1549558402604; 
	Thu, 07 Feb 2019 08:53:22 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	s3sm16149152wmj.23.2019.02.07.08.53.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 08:53:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2019 17:53:14 +0100
Message-Id: <20190207165314.3396-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python3: tweaks to achieve 100% pass rate in ptest
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
X-List-Received-Date: Thu, 07 Feb 2019 16:53:22 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python-sanity/python3/python3-manifest.json               | 4 ++--
 meta/recipes-devtools/python-sanity/python3_3.7.2.bb          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python-sanity/python3/python3-manifest.json b/meta/recipes-devtools/python-sanity/python3/python3-manifest.json
index 24f9805fbd2..0a4ab2cbe43 100644
--- a/meta/recipes-devtools/python-sanity/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python-sanity/python3/python3-manifest.json
@@ -212,6 +212,7 @@
         "files": [
             "${bindir}/python*[!-config]",
             "${includedir}/python${PYTHON_BINABI}/pyconfig*.h",
+            "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]",
             "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
             "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
             "${libdir}/python${PYTHON_MAJMIN}/UserString.py",
@@ -491,8 +492,7 @@
             "${libdir}/*.la",
             "${libdir}/*.o",
             "${libdir}/lib*${SOLIBSDEV}",
-            "${libdir}/pkgconfig",
-            "${prefix}/lib/python${PYTHON_MAJMIN}/config*/"
+            "${libdir}/pkgconfig"
         ],
         "rdepends": [
             "core"
diff --git a/meta/recipes-devtools/python-sanity/python3_3.7.2.bb b/meta/recipes-devtools/python-sanity/python3_3.7.2.bb
index e05ab42b0ca..8f9d7dc8fea 100644
--- a/meta/recipes-devtools/python-sanity/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python-sanity/python3_3.7.2.bb
@@ -281,7 +281,7 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MA
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
-RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2"
+RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
 RDEPENDS_${PN}-dev = ""
 
-- 
2.17.1


