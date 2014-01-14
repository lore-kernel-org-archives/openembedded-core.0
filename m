Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id B5F0F6E3B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 15:19:44 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id l18so512527wgh.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 07:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=j/rjrnQ4pIgyVPvBlX7PiNlbC/uxmWty0cgzM/bmhC8=;
	b=AQUewS7ujkRZsG8YwjC01J8EYaMXF2QEcZh4CdjBlH28Q4IMUYmNdc9vpO4CUTzrsi
	2luxL11S7FYFElhVDYAwfcCpeLgKzKRbBTiIxgfhnRh+hTtOz+rc3b78qITierBVcngZ
	38TVlD4XIALGW0Ldv5xLxDUQcSmPQcDIc2gHubkh+N48kmAvAqU1gsJ350d5+DcYkxE1
	5B7qNtluCewv3k8RJAHbrbDXOq1UCnluBvETYHdryUa5Z2x8AYdLGTvWcD1OO1xNmZ6z
	XGDHUjcWaU/F/u8GYEqcbiqRYPviRcYeoef2NqvIRmMz7yAH4to4urw1tBFk3JgrxWWu
	Ow1w==
X-Gm-Message-State: ALoCoQlpc4mOVpCyuvJDNsJZgR3rY/bwMj8MJwXwZwpzLGdt/OZRr4KBBiIFqhP3+hGeGpFt4zjL
X-Received: by 10.180.188.100 with SMTP id fz4mr20923269wic.57.1389712784973; 
	Tue, 14 Jan 2014 07:19:44 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm1923314wij.7.2014.01.14.07.19.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 07:19:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 15:19:28 +0000
Message-Id: <2a5f827ca6437e238a6cc37026e325ef9d38baa0.1389712683.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1389712683.git.ross.burton@intel.com>
References: <cover.1389712683.git.ross.burton@intel.com>
In-Reply-To: <cover.1389712683.git.ross.burton@intel.com>
References: <cover.1389712683.git.ross.burton@intel.com>
Subject: [PATCH][V3 3/7] python-nose: add (from meta-oe)
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
X-List-Received-Date: Tue, 14 Jan 2014 15:19:45 -0000

python-nose is a build dependecy for python-numpy, needed for Piglit.  This
recipe is taken directly from meta-oe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-nose_1.2.1.bb |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-nose_1.2.1.bb

diff --git a/meta/recipes-devtools/python/python-nose_1.2.1.bb b/meta/recipes-devtools/python/python-nose_1.2.1.bb
new file mode 100644
index 0000000..083d052
--- /dev/null
+++ b/meta/recipes-devtools/python/python-nose_1.2.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "nose extends the test loading and running features of unittest, \
+making it easier to write, find and run tests."
+SECTION = "devel/python"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+SRC_URI = "http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "735e3f1ce8b07e70ee1b742a8a53585a"
+SRC_URI[sha256sum] = "2171e9202d118d302d5db1decb52dd862b79e2a626ca19653a6914574a6ca7d9"
+
+S = "${WORKDIR}/nose-${PV}"
+
+inherit distutils
-- 
1.7.10.4


