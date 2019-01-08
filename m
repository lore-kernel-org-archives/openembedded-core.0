Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 527977BD20
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 15:25:37 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id j2so4487035wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 07:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a8tzWBA0Y/6Ou4baZ1C4CAtEuq/87l7oaeqJhQ3xpok=;
	b=TH432BDWKdD6Eap+t8koGjw4/XLPYEl0+/sGSKaJlTzdxx1N1ExlnVKC3XXC5FoA2T
	hbwiH8yH6SFL3Dtav+fNjOSiJ9tR07mT7Gvm5fcg/cSIgbYHbaWq88gRBb+R4cWhFrhr
	CNQQFTvXu1frFnygFrBmyrRQRiBiJBw/gXGcYb/hZyFDANMcXB1ICxG24GLQLbrXYIkH
	VxIdcGd+PS7yxhLF2Pn8AtkfFfAcFVd3hm2I2LzSPpU7y4QQ1f1xAl5k2Nb+8XnVpWxm
	gOrBlg+2GzBV02wY/1YjmfvnGBts3lsb0TIbSRxLKpUhkjgTYjtKK5BSjlsTl6atu2Op
	H+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=a8tzWBA0Y/6Ou4baZ1C4CAtEuq/87l7oaeqJhQ3xpok=;
	b=hhAMryMrUoRZq15Ff+03Ab5J6rNOd7QcwAaEb01/TnLzfkVJHrk8SIIT9GAj5g6tSU
	WkLJIMs1qtxsjb0axapdSOJd87gaEikam9PNF0y7u037OLg9kuLB2jTuDQ1GyvlEGbOw
	aHcz/No0UTikZDAZ0TvKtbg+U1fwGPP8bINj6ulVUKFya0b9uf092O/73+umRCNcCG6x
	KfrbGYsFpUi4KzAQIqWMBfuSIoVPugRXjSJnu7OGvIFFv10QkGvt9Np2ZEEJZqzpuhKy
	KGtydSL9KmwsqfLVI3qdPyGkqSsl/MEtkaHRzDQYbzmso+9aMspkfhSvV7vflwoHCsxZ
	WHrA==
X-Gm-Message-State: AJcUukc5plQaPQIucOyv3qN3W96RXmixXb7IZAdGEnGuFgFej5ATwsFi
	HWngrBvecY3v4xZc9AK5AhRrKFO+rFE=
X-Google-Smtp-Source: ALg8bN7HG5B7fBeeVg+STc05n0F+8VPPQTzFM/CC1UACkXumEWnIzFVH5bnQoV+4WKcBfPlaiJPRbw==
X-Received: by 2002:adf:b3c3:: with SMTP id x3mr1791825wrd.294.1546961137731; 
	Tue, 08 Jan 2019 07:25:37 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id v4sm10316825wme.6.2019.01.08.07.25.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 07:25:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2019 16:25:28 +0100
Message-Id: <20190108152529.55111-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190108152529.55111-1-alex.kanavin@gmail.com>
References: <20190108152529.55111-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/3] selftest/distrodata: un-break the upstream version check test
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
X-List-Received-Date: Tue, 08 Jan 2019 15:25:37 -0000

And fix the reported upstream check failures.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb | 1 -
 meta/lib/oeqa/selftest/cases/distrodata.py                    | 2 +-
 meta/recipes-extended/libtirpc/libtirpc_1.0.3.bb              | 3 ++-
 meta/recipes-support/libatomic-ops/libatomic-ops_7.6.8.bb     | 1 +
 meta/recipes-support/libpsl/libpsl_0.20.2.bb                  | 2 ++
 5 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb b/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
index b377cb76051..6bfc557060a 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
@@ -9,7 +9,6 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/syslinux-${PV}.tar.x
 
 SRC_URI[md5sum] = "92a253df9211e9c20172796ecf388f13"
 SRC_URI[sha256sum] = "26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e"
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/syslinux-${PV}"
 
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index 248bc7c6a21..0b454714e95 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -16,7 +16,7 @@ class Distrodata(OESelftestTestCase):
         Product:     oe-core
         Author:      Alexander Kanavin <alex.kanavin@gmail.com>
         """
-        feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
+        feature = 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
         self.write_config(feature)
 
         pkgs = oe.recipeutils.get_recipe_upgrade_status()
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.3.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.3.bb
index 17bc038d671..f978c8c8ab0 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.3.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.3.bb
@@ -13,7 +13,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://libtirpc-1.0.4-rc1.patch \
            file://musl.patch \
            "
-
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 SRC_URI[md5sum] = "f8403a10695348854e71d525c4db5931"
 SRC_URI[sha256sum] = "86c3a78fc1bddefa96111dd233124c703b22a78884203c55c3e06b3be6a0fd5e"
 
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.8.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.8.bb
index b40e5671426..8292c3b3120 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.8.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.8.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
 SRC_URI = "https://github.com/ivmai/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
+UPSTREAM_CHECK_URI = "https://github.com/ivmai/libatomic_ops/releases"
 
 SRC_URI[md5sum] = "99128f05e3e3f4e0cd39aa23f23bbe0c"
 SRC_URI[sha256sum] = "1d6a279edf81767e74d2ad2c9fce09459bc65f12c6525a40b0cb3e53c089f665"
diff --git a/meta/recipes-support/libpsl/libpsl_0.20.2.bb b/meta/recipes-support/libpsl/libpsl_0.20.2.bb
index b3b0d78a8e3..89a87b67c74 100644
--- a/meta/recipes-support/libpsl/libpsl_0.20.2.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.20.2.bb
@@ -8,6 +8,8 @@ SRC_URI = "https://github.com/rockdaboot/${BPN}/releases/download/${BP}/${BP}.ta
 SRC_URI[md5sum] = "f604f7d30d64bc673870ecf84b860a1e"
 SRC_URI[sha256sum] = "f8fd0aeb66252dfcc638f14d9be1e2362fdaf2ca86bde0444ff4d5cc961b560f"
 
+UPSTREAM_CHECK_URI = "https://github.com/rockdaboot/libpsl/releases"
+
 DEPENDS = "libidn2"
 
 inherit autotools gettext gtk-doc manpages pkgconfig lib_package
-- 
2.17.1


