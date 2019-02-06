Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A28066006E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 16:26:45 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m22so3463303wml.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 08:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hwrKp+opxh5hSo/nbBwzHmdvTXhXbNSs1zcCLGU8+PU=;
	b=U1ZRwkxGvrGn/cW873P64Ump6BJ7FVd8Tev8U3czFrRHTtAJVjqL0aO4Ld3AXmeJ16
	cge4H5WK4pccaorWDrnjE5ybB6Wf+zlbYZD7jQ6vW3FacqCfBox42iLs6slor5BN5pEp
	/uP3LDQy6cwhvRltOLdI1Sczo9kyCjnxTamNLT2Vhui/725tlUD6a3hXqnI13f0Tddny
	OXiykB+rkLeNm4mOZYCMqKK1xYkZElTUZvtp+YepMlaQ4dxtSqDFFUh2EbapjKM22jhv
	9uOHAs8+uOg25T8Edu+QB0ebFwzZXbEaVcXPp2Pprzf2Njc6kd4KQW9tSMyPoi+vVL39
	h4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hwrKp+opxh5hSo/nbBwzHmdvTXhXbNSs1zcCLGU8+PU=;
	b=gybQuQ0A5MlVZn2KRDFqZP7MDxKTp8bramA0uFo+u6pllgLjR6BulXNhtABwXPZrzD
	wD/61YtOwYzCOJ3YAJI9q0PN8mUmfYrWdWrk3wXMNw5st/G30dthBs7s4O7eGOPVHmYE
	YBWU0zrAHTQ1HukgvuJ5L+Ykmlkx0MNHs5Ip2MFVwG9Mu92dwhmwjB+F3rxH+RlKBi9G
	GDLK+5yeMaCLZUD+8ZiEQS0CA1hs9I9aE1G0U5Aome21uAR3nqyvDDju5UFz8Jz1Rg5Y
	wgTcTHwFB4iEdUwTuLjrjFogEC6B6jBcmIK24cVOn6HJydTfDHAAF+tUvy9/Ixzrd8XA
	schQ==
X-Gm-Message-State: AHQUAuao92E8hbRX9j4glG6qiztQRUurc+mEBALltwzwR0Q7Jx2vIkZ1
	Ur/+vTz0vltQ3Hqr6dCSedWVPuTz
X-Google-Smtp-Source: AHgI3Iab4WiBVWQjCWryVLZMggg/bdsKhbca0N4kBJwIuFEHiUOhV/W+VLkFOtzZEpN+EfCSygZMPQ==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr3791652wmb.80.1549470405956; 
	Wed, 06 Feb 2019 08:26:45 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	b18sm22295447wrw.83.2019.02.06.08.26.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Feb 2019 08:26:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2019 17:26:36 +0100
Message-Id: <20190206162636.72755-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190206162636.72755-1-alex.kanavin@gmail.com>
References: <20190206162636.72755-1-alex.kanavin@gmail.com>
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
X-List-Received-Date: Wed, 06 Feb 2019 16:26:46 -0000

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


