Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 240AF71C07
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 11:00:17 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x12-v6so1306843wru.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2018 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xD3H3Rvv7YIFTYQa5wHJUyzwLZq1rqEqQdkM8BU9teA=;
	b=M40yXrLQT/o50GhxNiXL6lXMPKo1skZr+Tn1Jzwezz9lQY/XTgh6Ui7CcnXfFkAdjH
	OmQV+aInZA2QOL+h55QZy7sCjh8HVfIfdivg+FXfYFc66wI8WiUunOLc7LdBui4dY5BA
	sZ2CA9v1y1mtAvPr2oQiWx0EgtfDT+OrznC1dGoyUYVRFCT5seNwJ93i6cRwKMsPiOzz
	Q1s5uSqecTyJI/d/vO7s++Iv1RQ5U9JOc6X0QbbFxwDJtIMTeL3oEo5KHww/GPw6KDAN
	BpLP17p/PkI1tWcPkK3d7VzydPzdmT97P4G2yBD90Lh17FiIizHnv2mKmJNYHaHrhOIO
	jwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xD3H3Rvv7YIFTYQa5wHJUyzwLZq1rqEqQdkM8BU9teA=;
	b=lysVi/JCzQ0Wx3/42/tg0S4/7yBkx2pOGfMXv6pdCqi1pGrhgu0PS+6HjbRSQqORat
	jmW7hONSVWXfYzbekNQxWWzBVPPW++WBxNtU5HeVcvisHY4hHarxv5+sYSGyr+V/E7mI
	voYbnsI1zlj8aJiB/t+1wTPHXT7jOqHhHOPd9CvAM3Dupd8sxuXIdkxW7zkP9Bh+rYza
	BqVKnkbQXotw68LYubojt2r3jlnyljjGZTSVJl/CfvV4O5A56FKt4eqFMGriEJfjozeJ
	XolNEhBceuFait4GQROBFWkr3oYRA6rDeIYEV2prUTMFNwkJOuxsKV+C5z8XzmzM4x85
	xaIw==
X-Gm-Message-State: ABuFfog7a8+wety6ll1PGo43GxeyaP3M+LAxRbSNpsHy58DIGU+6Pzto
	uzKBKW/3EPAJxnsvrm8Yhd+3Q6JWj6Y=
X-Google-Smtp-Source: ACcGV63fD0k1wjf0qAhktmANU5vPzy0DKSbx8X2s2RVhRa9kvcUsfGLDnAKKbOExy10sKGAuT0wOVw==
X-Received: by 2002:a5d:60c3:: with SMTP id
	x3-v6mr20329914wrt.193.1539082817265; 
	Tue, 09 Oct 2018 04:00:17 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h64-v6sm11525542wmh.27.2018.10.09.04.00.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Oct 2018 04:00:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 12:00:13 +0100
Message-Id: <20181009110013.31510-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] glib: fix Lithuanian strings in GDate test suite
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
X-List-Received-Date: Tue, 09 Oct 2018 11:00:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This test suite has hard-coded strings which don't match the new translations in
glibc 2.28, so update the test suite.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/date-lt.patch | 20 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb     |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/date-lt.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/date-lt.patch b/meta/recipes-core/glib-2.0/glib-2.0/date-lt.patch
new file mode 100644
index 00000000000..dd0aff72813
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/date-lt.patch
@@ -0,0 +1,20 @@
+Update Lithuanian month names in the test suite as glibc changed the translations.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/merge_requests/373]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/glib/tests/date.c b/glib/tests/date.c
+index b801ca704..6646c227c 100644
+--- a/glib/tests/date.c
++++ b/glib/tests/date.c
+@@ -365,8 +365,8 @@ test_month_names (void)
+       TEST_DATE ( 1,  4, 2018,      "%Y m. %OB",      "2018 m. balandis");
+       TEST_DATE ( 1,  5, 2018,      "%Y m. %OB",        "2018 m. gegužė");
+       TEST_DATE ( 1,  6, 2018,      "%Y m. %OB",      "2018 m. birželis");
+-      TEST_DATE (17,  7, 2018, "%Y m. %b %e d.",     "2018 m. Lie 17 d.");
+-      TEST_DATE ( 1,  8, 2018,      "%Y m. %Ob",           "2018 m. Rgp");
++      TEST_DATE (17,  7, 2018, "%Y m. %b %e d.",   "2018 m. Liep. 17 d.");
++      TEST_DATE ( 1,  8, 2018,      "%Y m. %Ob",         "2018 m. rugp.");
+     }
+   else
+     g_test_skip ("locale lt_LT not available, skipping Lithuanian month names test");
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
index 6ebf1d25994..1271a7c269b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
            file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
+           file://date-lt.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.11.0


