Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9DEEC701CA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 21:33:17 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id fp1so5914969pdb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jul 2014 14:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=W/iubMW3xP4r4tIG/w9FZc1n+eqfMK96uydpwucQ43g=;
	b=NpPMbbFjsyg0zGNy+3FAD+8SgXXZ9tpTpXPdcwTYn8CGEFX+0o34BQP+KNww2Mpn4a
	3SFoW6bBMu6zn8BGNqBsvbKny3FrgzxW182Wiu/EoIV6OeUc4NnZF6ycel6xF5rvqxl0
	cvp4n7X2NwtIinvCnMT/02vshvvStlHbnVOHdRE5NQ8H1AwsrUJm/tUVXm6Xwntk8RWu
	G64fWc8CC7D35VwESwfLy9YQn3wbZ8qG5G6WVdjSBq0UUfHu8vLnC5OIpNWnbb/Gh2qw
	ZUSWEw+fZsAQiISmZWBuMhqmjwREu9uqt7UN9x45Fyiix3p9GzfemyUNnL8yPEpnVOpG
	UnMw==
X-Gm-Message-State: ALoCoQloq/WAWmPX2J4F1C9OvQWJl3xzU568+CozJVg/I1qoKPS/UYAKkg/aXPhD3762AuKJTWsU
X-Received: by 10.66.232.68 with SMTP id tm4mr5336644pac.114.1404768798084;
	Mon, 07 Jul 2014 14:33:18 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	oa17sm21571189pdb.46.2014.07.07.14.33.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Jul 2014 14:33:17 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jul 2014 14:33:04 -0700
Message-Id: <1404768785-24026-2-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1404768785-24026-1-git-send-email-akuster@mvista.com>
References: <1404768785-24026-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 1/2] lz4: update to latest version 119
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
X-List-Received-Date: Mon, 07 Jul 2014 21:33:24 -0000

Update SRC_URI to github as googlecode does not have this version
Minor clean to reflect non-svn fetch

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/lz4/{lz4_svn.bb => lz4_r119.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/lz4/{lz4_svn.bb => lz4_r119.bb} (63%)

diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/lz4/lz4_r119.bb
similarity index 63%
rename from meta/recipes-support/lz4/lz4_svn.bb
rename to meta/recipes-support/lz4/lz4_r119.bb
index 38e36d8..dfc155e 100644
--- a/meta/recipes-support/lz4/lz4_svn.bb
+++ b/meta/recipes-support/lz4/lz4_r119.bb
@@ -2,15 +2,15 @@ SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2008d2325e11691e17fcaa3a6046f850"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
 
-# Upstream names releases after SVN revs
-SRCREV = "112"
-PV = "r${SRCREV}"
 
-SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
+SRC_URI = "https://github.com/Cyan4973/lz4/archive/${PV}.tar.gz"
 
-S = "${WORKDIR}/trunk"
+SRC_URI[md5sum] = "3fc4ed20cb98dba909896f485b25d0f1"
+SRC_URI[sha256sum] = "1deb77e5cc7b41422c02dd3d56e7e0f0deb20723a54cad4ad5a65fb1f4805b1c"
+
+S = "${WORKDIR}/${BPN}-${PV}"
 
 EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
 
-- 
1.9.1


