Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 269896B8AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 16:26:20 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id n18-v6so3424782lji.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 08:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hwrKp+opxh5hSo/nbBwzHmdvTXhXbNSs1zcCLGU8+PU=;
	b=DGty5FTYS8tWcRqiy0ryo8MJAmW0RO8OqSHB9E3mHTtqF+EOhVweHjsBBgrC3vbhpV
	4DmuYVgmCZoc0gR6k6yItiYrVXZokFHJCYi3GbDiePwSwjrdXkzy1H5z5oVzy6aafQWJ
	BJeQ4/vjUAuSsZVyACnpS8a72rj2WSPuw30Vw4MUrg6/c29opG+b9yR8Mdi1PdRjvT2e
	Ki9+K8mkS+dRdfmwsoK0StWmB/flMqrr2YWWrXRUotymwRHpWH35uMbJfIRsSOGwTMp6
	9Kn1BVR7NTvdIAo3uKFcSMKRc3p+BR0hKSfASkwXT/j6uItsNnkPtwmo5A1C+Vl+ERY1
	piVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hwrKp+opxh5hSo/nbBwzHmdvTXhXbNSs1zcCLGU8+PU=;
	b=um6EiQDpCk/dJDiMMPmnQ1p0NMglu6Q8yOVu2tINZ+nl6yuOwCxDrpNLN9MxbrdL4y
	OBvtDrX2EQl78yq6RgaXX8B2gySo7u/wHirbZDs/HgO4AR4LXHsjx+g1t73iaXeFeDpD
	pwK3A3TNW0c3IQMBrJK5RYED7xq+PkK/fVo1NP+Tka2N9VUycfsbASSiyXUznxx/jRwR
	sg5L1asU3KrcfT4TuzMqka29fRF2Pr59wvcSPKEaWX2RsVNToJxMLJWSGL6orMf8JX+7
	1yJftohj0Fm39a0bJDSl8ymPuD7A09Wo6jAJgmts1qOxWDHl6lGimC+Vu+pJXJLykur6
	+SaA==
X-Gm-Message-State: AHQUAuZgy1NuSfW0/RDDFuTCRicUpBoreYlf8KET+k4Wim2kJomZAxR4
	wlKovt4Ac2oUGfNUFZFlic2xUPH1
X-Google-Smtp-Source: AHgI3IZiNX6Xdod+1RdkPOXdnDVj8hOGR57eB4erM41gJLgES6zbysGhbxGJvIuOoBAQqxy8VQBe0Q==
X-Received: by 2002:a2e:864c:: with SMTP id
	i12-v6mr887676ljj.105.1549383981296; 
	Tue, 05 Feb 2019 08:26:21 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z16sm2279528lfi.54.2019.02.05.08.26.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 08:26:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 17:26:09 +0100
Message-Id: <20190205162609.69096-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190205162609.69096-1-alex.kanavin@gmail.com>
References: <20190205162609.69096-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] python: make the python 3.x version of 2to3 utility the default one
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
X-List-Received-Date: Tue, 05 Feb 2019 16:26:21 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python/python2-manifest.json | 2 +-
 meta/recipes-devtools/python/python_2.7.15.bb             | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 81f1c24f97a..eb52e862ab3 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -109,7 +109,7 @@
             "core"
         ], 
         "files": [
-            "${bindir}/2to3", 
+            "${bindir}/2to3*",
             "${libdir}/python2.7/lib2to3"
         ]
     }, 
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index f462d087251..8df1dfd1ba6 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -131,6 +131,9 @@ do_install() {
     if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'bdb', d)}" ]; then
         rm -rf ${D}/${libdir}/python${PYTHON_MAJMIN}/bsddb
     fi
+
+    # Python 3.x version of 2to3 is now the default
+    mv ${D}/${bindir}/2to3 ${D}/${bindir}/2to3-${PYTHON_MAJMIN}
 }
 
 do_install_append_class-nativesdk () {
-- 
2.17.1


