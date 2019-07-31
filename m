Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id B8E0F7F4CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 17:42:58 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z1so70594338wru.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jqTcvfl/HBEtw0VasPHYewIi2mxAhDxxPei7/XBPr4Q=;
	b=UjUtxwl7QyGuUAXrvO82IKQEg/zUrJhJDFjUYJnd3up1PaR6fmpZropN3U0s0Rntg2
	MYHQI517+EuyLvSGzeOyIjmPBPD+0NN+sCvXRj/orMDwcp3aixiK6Brr5yNPi1MFOtrg
	4e3RkCuqgpM1Eb/j5wQ0THF79jAQcWjBT0PlPg8C+1czEjdzz8h9PyElMyyUSRvtBl/U
	NbAo2HwYYWUO7OKN1gxFFm3O/hKJ7Ktz3mJcE7wdfCWvIBLP1E1U7o7LCm1Epz93TmrH
	fzgYrfR6UI62fL3JUQOCRjGa5oq860wKEztpICyyb5TpStlrylnfdFzfFC0fm1cvhtDP
	aXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jqTcvfl/HBEtw0VasPHYewIi2mxAhDxxPei7/XBPr4Q=;
	b=CHgzSg0Hy7XFokf6FNGuusaE+WprY+s0QnzapfzL1ljVrE4TMdlGqvM3+ZtNUhJxDC
	ffDL9GOKu8hWkVYcew9aThVwWedH3Hvr8536pr8MxgnZzNnR60Stj8334daQGMzC3NaH
	KYArAyycuSNnPBqZ4uRi6Cm3S9Ix/Hnl95YlnOzUs3E6b8II6oIcqSn5zdjIY2MYc4rs
	lvdZItJNppxiQhQ/UVWsaDBdcNszrF9xOqf4sKviVh7MKLo2+U3n5w/b+7X8Aw45Ah0s
	f/2xvxY4vle7CJdAZSIQbRBpB746FNue32CaSx6OyXpnEAiFIh1AU4OTlddJ0TceDE83
	7CCA==
X-Gm-Message-State: APjAAAVxFh5t1lVWTu8kiZcf4jZh83yCHct0yRyINLmebpgU3O7rk/5D
	drQjHtcJ3v+exfep2nbLD/lyB41zEnk=
X-Google-Smtp-Source: APXvYqyAY05nmnVHhncK2PY6W/scuuePII75RB4Kd6kYxB6XGqYKnHPztMdDCRooMpdzNICwsjriBQ==
X-Received: by 2002:adf:8183:: with SMTP id 3mr136433116wra.181.1564594979055; 
	Wed, 31 Jul 2019 10:42:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t63sm62973454wmt.6.2019.07.31.10.42.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 31 Jul 2019 10:42:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2019 18:42:52 +0100
Message-Id: <20190731174254.11340-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] python3: remove empty python3-distutils-staticdev
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
X-List-Received-Date: Wed, 31 Jul 2019 17:42:58 -0000
Content-Transfer-Encoding: 8bit

distutils doesn't ship any static libraries, and the files this should pick up
do not exist.  Copy/paste gone wrong maybe?

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python3/python3-manifest.json             | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 0803ac00334..b179215838a 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -512,18 +512,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
         ]
     },
-    "distutils-staticdev": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/config/__pycache__/lib*.a"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/config/lib*.a"
-        ],
-        "rdepends": [
-            "distutils"
-        ],
-        "summary": "Python distribution utilities (static libraries)"
-    },
     "distutils": {
         "summary": "Python Distribution Utilities",
         "rdepends": [
-- 
2.20.1


