Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id E6C7578659
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 11:59:01 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id e71so7666023wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 04:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=wFdjGs0rqTIBuGpKUxrw0HdZBOTAuvlqHk4z8DiClu0=;
	b=nzzs5bWhK9B8fkZzFDaqh22NNY/h/MUsbjkm+9tsLvG3xpzY2uwgFyISdLIFSoIKno
	Y57hppjf7p/sDSZsHYDnRBWfcOpjzobMHXIRztAD3loAx6GTLzFQuiP7FAFi9KrNYqtg
	ntD1StYPQ7fPWGxtQ+UwcmlcYPNlNsBn+R7ymf5qzH/biHbcmWP+kg/Wp62MOBx/zeyV
	wXTthEokZX5HcPf51mK2x3tvWVj4QeaJ3oM+0dTKkmdhPii4xWHPZyeDBVpduFQ8q+X7
	XXevVLZnQv84Jak1oFobbCSjsozKXiEHUKXnU6yL7KsIrgPDjVVoq+Bdo81LSc/fyr2s
	k4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wFdjGs0rqTIBuGpKUxrw0HdZBOTAuvlqHk4z8DiClu0=;
	b=mFkJAQsCMVM5ggyqQkGCmslLPNjFC2tMS3iGAQP+twz0UJny14oUDoX50ATOteiBNs
	QnKhslKKWCxo3rqewkNTkhzEK56rB0i00ZTinpUlWmh45EfSwdYoYcXqm2cBIj5JLwKL
	TY96dHMQwcAnF5KVfQZBlb2PuhvdQRkHcSHZxpDXQ14XYxDCD55KYpvmhR/RsS24OJSz
	JBmV/Ji2gqDtMmJjDSFYCagsfhYdmou/iI3FpeSwEL/s+6lM42LU+R2vfbtT9mH4aFT8
	LDwpWIFkGReaz5G8h3ssEzqGeqpfS1SFirCRskl0cL9ngbiwpoZbth9g+FbFyJ6TxB3X
	ejiA==
X-Gm-Message-State: AHPjjUjJONfGLKuKXT4ZZJ9yFRoGrDCYcPml2gyXyJeuHTn8hJdgUVZr
	h4XrhLA4YtbxhFNRo9y05NTCs5DN
X-Google-Smtp-Source: AOwi7QCMpa3QNJExsZTCf/MuXK41bDZqwE14DeE8Aze4lgfl3gV3AXwCK0TibsmMDPygZMqaCGQNFA==
X-Received: by 10.28.211.145 with SMTP id k139mr2782654wmg.85.1505476742518;
	Fri, 15 Sep 2017 04:59:02 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id c1sm662039wre.84.2017.09.15.04.59.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Sep 2017 04:59:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 12:58:59 +0100
Message-Id: <20170915115859.5041-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] logrotate: use stable download URL
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
X-List-Received-Date: Fri, 15 Sep 2017 11:59:02 -0000

GitHub automatically-generated tarballs from tags can and do change over time,
so change logrotate to use the uploaded tarball.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/logrotate/logrotate_3.12.3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.12.3.bb b/meta/recipes-extended/logrotate/logrotate_3.12.3.bb
index 05c2ef1c288..620b2087cc8 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.12.3.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.12.3.bb
@@ -19,14 +19,14 @@ S = "${WORKDIR}/${BPN}-${PV}"
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "logrotate-(?P<pver>\d+(\.\d+)+).tar"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/archive/${PV}.tar.gz \
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
             file://act-as-mv-when-rotate.patch \
             file://update-the-manual.patch \
             file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[md5sum] = "d1c41bdf63b9993c8e4e8b48a7bd5b8b"
-SRC_URI[sha256sum] = "683ccb7fff74082471aa6bd9e962ae7a3f4d55eea7df41fd97aa12ec6f55e657"
+SRC_URI[md5sum] = "a560c57fac87c45b2fc17406cdf79288"
+SRC_URI[sha256sum] = "2e6a401cac9024db2288297e3be1a8ab60e7401ba8e91225218aaf4a27e82a07"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
-- 
2.11.0


