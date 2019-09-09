Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3D22C7E45D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 12:24:16 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id d17so860149wrq.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 05:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oP8F9EptOuKAMN/M6Aql4Zv/oqtDUwTJxb7lAily0hQ=;
	b=visGo4PNIgT4iDIBDYzMhhDl67Wdt5os3ok3WuKEUc3lX4Xq1Yn80aGyLMw+7OsTlQ
	OmmSUV9IRRH46Pb5PyCS4F/SqVSdLZj2vWyFsHGtfrncyXmX6dWh1eW8CqGHfuMtS0PN
	lRPSPq3GvGY8IB5URylyB5aODPMyKv1b7cZcrSSg2XXRJe8rnEE4/n4/Bo1j6l20VWTE
	ey/DYr4YUST2MCVrmQ+1bbtUnKvtUc94gQW+clQSepOGnrhCP7aZMbknKD5y40l5+Y25
	CDs0UMtk6zO4mWcCixNqb32jQbGtsI4OPT7DG0R9MnFhAMTIXsYFkbmW1THxp9lwyruP
	y1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oP8F9EptOuKAMN/M6Aql4Zv/oqtDUwTJxb7lAily0hQ=;
	b=GgP54xdUS/OW/9+Ca64dBNvSzKQ1N9UP7HqO4S7OmVM5rgVTC8oX/cNlnlhzXG4oaJ
	FRft4Bhwsep8HlyN0scG31XO/lRlXmky4vXLT4lx7MZXV7wTPt4mvQjIUb8JCQ0bAgV9
	3XkOv1iF7Tnhff1lxR7IXBXFVXA9Lb9Nfju4+ucxc7kLDInSTJ+2Kf+58+Sqf4JT2IXu
	OGEmH9KW9hK7gVPDUIkAuSZIW6aX6yqmfU+IBkIudMfZSm2rY0X1lXnqghw5nLKnaO8l
	Sl/9+rVc6i7BlZBc/k5kPhRC3eAIBkqwW/uli7/b7aao/xWRoQJpSXMoOzJqSpvvchnx
	0+pQ==
X-Gm-Message-State: APjAAAXLorubhVaDj5drKZ5h+uVdyoF4Gu89dxc+7sNglRkPF2Qq24px
	Ioj6H4Oem2hazVJxR2U1HT7lGP35TM4=
X-Google-Smtp-Source: APXvYqwEdlJn2A9up6DQWo+jkNoYAxpJU/ehhCsdYIhQs1QinVOrVfiTWKyFkbWs7S99XN2VXRgnpQ==
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr18533471wrn.40.1568031856563; 
	Mon, 09 Sep 2019 05:24:16 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n1sm18227474wrg.67.2019.09.09.05.24.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 05:24:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2019 13:24:12 +0100
Message-Id: <20190909122412.2161-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libtasn1: fix build with api-documentation enabled
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
X-List-Received-Date: Mon, 09 Sep 2019 12:24:16 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gnutls/libtasn1/fix-gtkdoc.patch          | 38 +++++++++++++++++++
 meta/recipes-support/gnutls/libtasn1_4.14.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch

diff --git a/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch b/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
new file mode 100644
index 00000000000..a8327faef6f
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Submitted [https://gitlab.com/gnutls/libtasn1/merge_requests/49]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From ebd4f871b5241809f6a5b461444a6d331e15c949 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 9 Sep 2019 13:11:39 +0100
+Subject: [PATCH] doc/reference: don't add empty object hierarchy chapter
+
+The object hierarchy section is empty because there are no GObjects in the
+libtasn1 API.  With gtk-doc 1.30 onwards if there are no objects then the object
+hierarchy file won't exist, resulting in a failure when building the
+documentation:
+
+| ../libtasn1-docs.xml:39: element include: XInclude error : could not load ../xml/tree_index.sgml, and no fallback was found
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ doc/reference/libtasn1-docs.xml | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/doc/reference/libtasn1-docs.xml b/doc/reference/libtasn1-docs.xml
+index accdb85..f88b888 100644
+--- a/doc/reference/libtasn1-docs.xml
++++ b/doc/reference/libtasn1-docs.xml
+@@ -34,10 +34,6 @@
+         <xi:include href="xml/libtasn1.xml"/>
+ 
+   </chapter>
+-  <chapter id="object-tree">
+-    <title>Object Hierarchy</title>
+-    <xi:include href="xml/tree_index.sgml"/>
+-  </chapter>
+   <index id="api-index-full">
+     <title>API Index</title>
+     <xi:include href="xml/api-index-full.xml"><xi:fallback /></xi:include>
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/gnutls/libtasn1_4.14.bb b/meta/recipes-support/gnutls/libtasn1_4.14.bb
index 7158e483e98..ef2c1956a24 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.14.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.14.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            file://fix-ldflags.patch \
+           file://fix-gtkdoc.patch \
            "
 
 DEPENDS = "bison-native"
-- 
2.20.1


