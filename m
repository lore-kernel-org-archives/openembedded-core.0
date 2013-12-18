Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3059960D27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 16:20:16 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id z2so879378wiv.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 08:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mJyMmSk0taFoedO01qtLUi/Mxny5oEi6QeKMcELova8=;
	b=e6+j6Wk31N409XPM0lu9pygsmlpeXD+Bqdf11c0qKiZQ2nSwGMRIIuFNVifzICri7c
	bweYQMTPvGiikFlWNlcefRy/MDmEpE7K15xHscyZBWMSAP29OJ/4bsWgKTzWE6O315J4
	0PstS+WQ6+HaBCgDLnVhFfEomaUq1jt6fCLHHmgs5LzR0uKzswvb2PuTo1o94jcmWT/P
	HfWYnxeyP7bCOCgVD7jnLsUvIUeHYDFD8WdvArQCmLB3MrvpvCyoSQbtNYqQqbH4obqd
	L9Ls+gDzTUmgdzpXjA2NxA0F9RYvqDWhQbbW89RLOcHsmglFVEeKef70WfSS5c8mbsX6
	U7Qg==
X-Gm-Message-State: ALoCoQmLKgxC9jx/lVPcSsJdUz0Ao6me38YKaP2BnSzChNKw4dmpzneEKDJk4hevL83mWdJSyK/K
X-Received: by 10.180.100.70 with SMTP id ew6mr8962598wib.9.1387383616731;
	Wed, 18 Dec 2013 08:20:16 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm2179947wij.7.2013.12.18.08.20.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Dec 2013 08:20:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2013 16:20:04 +0000
Message-Id: <1387383607-4005-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1387383607-4005-1-git-send-email-ross.burton@intel.com>
References: <1387383607-4005-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/6] dbus: upgrade to 1.6.18
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
X-List-Received-Date: Wed, 18 Dec 2013 16:20:18 -0000

Drop PR and INC_PR.

Move patches into a non-versioned directory, and update dbus-ptest to match.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../dbus/{dbus-ptest_1.6.10.bb => dbus-ptest_1.6.18.bb}          |    2 +-
 meta/recipes-core/dbus/dbus.inc                                  |    2 --
 meta/recipes-core/dbus/{dbus-1.6.10 => dbus}/dbus-1.init         |    0
 meta/recipes-core/dbus/{dbus-1.6.10 => dbus}/os-test.patch       |    0
 meta/recipes-core/dbus/{dbus-1.6.10 => dbus}/ptest.patch         |    0
 meta/recipes-core/dbus/{dbus-1.6.10 => dbus}/python-config.patch |    0
 meta/recipes-core/dbus/{dbus-1.6.10 => dbus}/run-ptest           |    0
 meta/recipes-core/dbus/{dbus-1.6.10 => dbus}/tmpdir.patch        |    0
 meta/recipes-core/dbus/dbus_1.6.10.bb                            |    6 ------
 meta/recipes-core/dbus/dbus_1.6.18.bb                            |    4 ++++
 10 files changed, 5 insertions(+), 9 deletions(-)
 rename meta/recipes-core/dbus/{dbus-ptest_1.6.10.bb => dbus-ptest_1.6.18.bb} (97%)
 rename meta/recipes-core/dbus/{dbus-1.6.10 => dbus}/dbus-1.init (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.10 => dbus}/os-test.patch (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.10 => dbus}/ptest.patch (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.10 => dbus}/python-config.patch (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.10 => dbus}/run-ptest (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.10 => dbus}/tmpdir.patch (100%)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.6.10.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.6.18.bb

diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
similarity index 97%
rename from meta/recipes-core/dbus/dbus-ptest_1.6.10.bb
rename to meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
index 84ed287..6dab751 100644
--- a/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
@@ -22,7 +22,7 @@ SRC_URI[md5sum] = "de4970c20629aeb958a12132415b3630"
 SRC_URI[sha256sum] = "1f3d6f4a53a7121328f6cd685fc14440d72e6c0006ecb3312cc779c495915e86"
 
 S="${WORKDIR}/dbus-${PV}"
-FILESPATH = "${FILE_DIRNAME}/dbus-${PV}"
+FILESPATH = "${FILE_DIRNAME}/dbus"
 
 inherit autotools pkgconfig gettext ptest
 
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 5b99034..343079c 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -13,8 +13,6 @@ RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest'
 RDEPENDS_dbus_class-native = ""
 RDEPENDS_dbus_class-nativesdk = ""
 
-INC_PR = "r6"
-
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
            file://dbus-1.init \
diff --git a/meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init b/meta/recipes-core/dbus/dbus/dbus-1.init
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init
rename to meta/recipes-core/dbus/dbus/dbus-1.init
diff --git a/meta/recipes-core/dbus/dbus-1.6.10/os-test.patch b/meta/recipes-core/dbus/dbus/os-test.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.10/os-test.patch
rename to meta/recipes-core/dbus/dbus/os-test.patch
diff --git a/meta/recipes-core/dbus/dbus-1.6.10/ptest.patch b/meta/recipes-core/dbus/dbus/ptest.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.10/ptest.patch
rename to meta/recipes-core/dbus/dbus/ptest.patch
diff --git a/meta/recipes-core/dbus/dbus-1.6.10/python-config.patch b/meta/recipes-core/dbus/dbus/python-config.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.10/python-config.patch
rename to meta/recipes-core/dbus/dbus/python-config.patch
diff --git a/meta/recipes-core/dbus/dbus-1.6.10/run-ptest b/meta/recipes-core/dbus/dbus/run-ptest
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.10/run-ptest
rename to meta/recipes-core/dbus/dbus/run-ptest
diff --git a/meta/recipes-core/dbus/dbus-1.6.10/tmpdir.patch b/meta/recipes-core/dbus/dbus/tmpdir.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.6.10/tmpdir.patch
rename to meta/recipes-core/dbus/dbus/tmpdir.patch
diff --git a/meta/recipes-core/dbus/dbus_1.6.10.bb b/meta/recipes-core/dbus/dbus_1.6.10.bb
deleted file mode 100644
index 5b8220c..0000000
--- a/meta/recipes-core/dbus/dbus_1.6.10.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include dbus.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "de4970c20629aeb958a12132415b3630"
-SRC_URI[sha256sum] = "1f3d6f4a53a7121328f6cd685fc14440d72e6c0006ecb3312cc779c495915e86"
diff --git a/meta/recipes-core/dbus/dbus_1.6.18.bb b/meta/recipes-core/dbus/dbus_1.6.18.bb
new file mode 100644
index 0000000..7270c36
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.6.18.bb
@@ -0,0 +1,4 @@
+include dbus.inc
+
+SRC_URI[md5sum] = "b02e9c95027a416987b81f9893831061"
+SRC_URI[sha256sum] = "7085a0895a9eb11a952394cdbea6d8b4358e17cb991fed0e8fb85e2b9e686dcd"
-- 
1.7.10.4


